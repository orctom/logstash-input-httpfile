# encoding: utf-8
require "logstash/inputs/base"
require "logstash/namespace"
require 'uri'
require 'net/http'

# Stream events from files via http url (such as a log file via Apache dir).
class LogStash::Inputs::HttpFile < LogStash::Inputs::Base
  config_name "httpfile"
  milestone 1

  default :codec, "multiline"

  config :url, :validate => :string, :required => true

  config :interval, :validate => :number, :default => 3

  public
  def register
    if !url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      raise ArgumentError.new("URL is not valid: #{url}")
    end
  end # def register

  public
  def run(queue)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)

    offset = 0
    while true
      begin
        contentLength = http.head(uri.path).content_length

        if (contentLength != offset)
          if (contentLength < offset)
            offset = 0
          end

          http.get(uri.path, {"accept-encoding" => "chunked", 'Range' => "bytes=#{offset}-"}) do |chunk|
            @codec.decode(chunk) do |event|
              decorate(event)
              queue << event
            end
          end

          offset = contentLength
        end

        sleep(interval)
      rescue LogStash::ShutdownSignal
        break
      rescue => e
        sleep(interval)
        next
      end
    end
    finished
  end # def run

end # class LogStash::Inputs::HttpFile
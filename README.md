# logstash-input-httpfile

Watch log files exposed such as by Apache alias, the content of the file will be read in an interval for the chunks the changed since last read.

## Requirement
>= logstash 2.0

## Installation
```
mkdir -p $LOGSTASH_HOME/plugins
curl -fL https://github.com/orctom/logstash-input-httpfile/files/100602/logstash-input-httpfile-0.2.0.gem.zip -o /tmp/logstash-input-httpfile-0.2.0.gem.zip
unzip /tmp/logstash-input-httpfile-0.2.0.gem.zip -d $LOGSTASH_HOME/plugins
$LOGSTASH_HOME/bin/plugin install $LOGSTASH_HOME/plugins/logstash-input-httpfile-0.2.0.gem
```

## Usage
```
input {
  httpfile { 
    url => "http://10.95.145.40/app1/SystemOut.log"
    interval => 3
    codec => multiline {
      pattern => "^[^\[]"
      what => "previous"
    }
  }
}
 
output {
  stdout {
    codec => rubydebug
  }
}

```
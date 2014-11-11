# logstash-input-httpfile

# Sample
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
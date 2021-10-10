#! /usr/local/bin/ruby

require 'webrick'

httpd = WEBrick::HTTPServer.new(:DocumentRoot=>".", :Port=>10080)
trap(:INT) do
  httpd.shutdown
end
httpd.start

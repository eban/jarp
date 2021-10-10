#! /usr/local/bin/ruby

require 'webrick'
require 'lily'
require 'thread'

class LCGI
  attr_reader :params

  def initialize(req)
    @req = req
    @params = {}
    req.query.each do |key, value|
      @params[key] = Array(value)
    end
  end

  def path_info
    @req.path_info
  end

  def [](name)
    @params[name]
  end

  def server_name
#    format "%s%s", @req.host, @req.port == 80 ? "" : ":" + @req.port.to_s
    @req.host
  end

  def server_port
    @req.port
  end

  def script_name
    @req.script_name
  end
end

module Stdout
  @@mutex = Mutex.new
  def redirect
    @@mutex.synchronize do
      stdout = $stdout.dup
      $stdout = self
      yield
      $stdout = stdout
    end
  end
  def write(*s)
    self << s.join("") unless s[0] =~ /Content-type:/
  end
end

class Lilylet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(req, res)
    res["content-type"] = "text/html"
    lily = Lily.new(LCGI.new(req), load_config(@options[0]))
    (res.body.extend Stdout).redirect do
      lily.disp
    end
  end

  alias do_POST do_GET

  def load_config(dir)
    config = {}
    open(File.join(dir, "lily.cfg")) do |f|
      f.grep(/^([a-z_:]+)\s+(.*)/) do
        key, val = $1, $2 || ""
        val = File.join(dir, val) if /dir$/ =~ key && /^\// !~ val
        config[key] =  val
      end
    end
    config
  end
end

if __FILE__ == $0
  httpd = WEBrick::HTTPServer.new(:DocumentRoot=>Dir.pwd, :Port=>10080)
  httpd.mount("/foo/lily", Lilylet, "foo")
  httpd.mount("/bar/lily", Lilylet, "bar")
  trap(:INT) do
    httpd.shutdown
  end
  httpd.start
end

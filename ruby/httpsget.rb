#!/usr/local/bin/ruby

require 'net/https'
require 'getopts'

module Net
  class HTTP
    module ProxyMod
      alias orig_edit_path edit_path
      def edit_path( path )
	if use_ssl
	  if /^enter\.nifty\.com/ =~ addr_port
	    path
	  else
	    'https://' + addr_port + path
	  end
	else
	  'http://' + addr_port + path
	end
      end
    end
  end
end

module Netrc
  def self.[](m)
    if not defined? @netrc
      @netrc = {}
      File::foreach("#{ENV['HOME']}/.netrc") do |line|
	line.chomp!
	if /^\s*machine\s+(?:"(.+?)"|(\S+))\s+
	    login\s+(?:"(.+?)"|(\S+))\s+
	    password\s+(?:"(.+?)"|(\S+))/x =~ line
	  @netrc[$1 || $2] = [($3 || $4), ($5 || $6)]
	elsif /^\s*default\s+
	       login\s+(?:"(.+?)"|(\S+))\s+
	       password\s+(?:"(.+?)"|(\S+))/x =~ line
	  @netrc.default = [($1 || $2), ($3 || $4)]
	end
      end
    end
    @netrc[m]
  end
end

SERVICES = {'https'=>443, 'http'=>80}

getopts('av', "o:")

uri = ARGV.shift
if %r!(https?)://(.*?)(?::(\d+))?(/.*)! =~ uri
  scheme = $1
  host   = $2
  port   = $3 ? $3.to_i : SERVICES[scheme]
  path   = $4 || "/"
else
  STDERR.print "Invalid URI.\n"
  exit 2
end

# parse HTTP_PROXY environment variable.
if proxy = ENV['http_proxy']
  if %r!(http)://(.*?)(?::(\d+))?(/.*)! =~ proxy
    p_host   = $2
    p_port   = $3 ? $3.to_i : SERVICES[$1]
  else
    STDERR.print "Invalid HTTP_PROXY.\n"
    exit 2
  end
end

h = Net::HTTP.new(host, port, p_host, p_port)

header = {}

if scheme == "https"
  h.use_ssl = true
end

h.set_pipe($stderr) if $OPT_v

if ARGV.empty?
  meth = Net::HTTP::Get
  arg = []
else
  meth = Net::HTTP::Post
  arg = [ARGV.join('&')]
  header['Content-Type'] = 'application/x-www-form-urlencoded'
end

req = meth.new(path, header)
req.basic_auth(*Netrc[host]) if scheme == "https"
recv = h.request *arg.unshift(req)

if $OPT_o
  $>.reopen(Time.now.strftime($OPT_o), $OPT_a ? "a" : "w") if $OPT_o != '-'
else
  file = File::basename(path)
  file = 'index.html' if file == ""
  $>.reopen(file, $OPT_a ? "a" : "w")
end

$>.binmode.print recv.body

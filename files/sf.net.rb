require 'webrick'
require 'webrick/httpproxy'
require 'cgi'
require 'zlib'
require 'stringio'

def gzip_filter(res)
  if res['Content-Encoding'] == 'gzip'
    body = ''
    Zlib::GzipReader.wrap(StringIO.new(res.body)) do |r|
      body = r.read
      yield body if body
    end
    Zlib::GzipWriter.wrap(StringIO.new(res.body, "w")) do |w|
      w.write body
    end
  else
    yield res.body if res.body
  end
end

http_proxy = ENV['http_proxy']
s = WEBrick::HTTPProxyServer.new({
  :Port => 8080,
  :BindAddress => '0.0.0.0',
  :ProxyVia => false,
  :ProxyURI => http_proxy ? URI.parse(http_proxy) : nil,
  :ProxyContentHandler => Proc.new do |req, res|
    gzip_filter(res) do |body|
      body.gsub!(/\e\$B(.+?)\e\(B/) do
        CGI::unescapeHTML($&)
      end
      body.gsub!(/<meta http-equiv="Content-Type" content="text\/html; charset=iso-8859-1">/,
        '<meta http-equiv="Content-Type" content="text/html; charset=iso-2022-jp">')
      body.gsub!(/=\?ISO-2022-JP\?[QB]\?.+?\?=/i) do
        NKF.nkf('', $&)
      end
    end
  end
})

trap('INT') do
  s.shutdown
end

s.start

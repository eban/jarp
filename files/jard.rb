#! /usr/local/bin/ruby

require "rss/dublincore"
require "rss/content"
require "pathname"
require "iconv"
require "cgi"

DIARY = "http://jarp.jin.gr.jp/diary/"

def nsmm(file)
  file.open do |f|
    n = 0
    while line = f.gets
      line = Iconv::iconv("EUC-JP", "ISO-2022-JP", line).join
      break if line == "<!-- PiloWeb_End -->\n"
      if line =~ /^<h3>.+href="(.+)"/
        n += 1
        link = DIARY + $1
        line = Iconv::iconv("EUC-JP", "ISO-2022-JP", f.gets).join
        line =~ /^(.*">)?(.+?)(<\/a>)?<\/h3>/
        title = $2
        title_link = line[/<a href="(.+?)">/, 1]
        title = CGI.unescapeHTML(title.gsub(/<[\w\/].+?>/, ""))
        subject = title[/\[(.+?)\]/, 1]
        title.gsub!(/\[\w.+?\]\s+/e, "") while title =~ /^\[\w.+\]/
        date = link[/#(\d{8})/, 1].sub(/(....)(..)(..)/, '\1-\2-\3-')
        title = "[" + date + n.to_s + "] " + title
        full = Iconv::iconv("EUC-JP", "ISO-2022-JP",
          f.gets("<!-- section end -->\n")).join
        full.sub!(/^<blockquote>\n/, "")
        full.sub!(/^<!-- section end -->\n/, "")
        full.sub!(/(href=")(?!http:)/, '\1' + DIARY)
        full += "<!-- " + title_link + " -->\n" if title_link
        full.sub!(/<p>\n\n/, "<p>\n")
        desc = full.split(/\n/)[1]
        if full.count("\n") > 3
          desc += "..."
        end
        yield title, link, subject, desc.gsub(/<[\w\/].+?>/, ""), full
      end
    end
  end
end

index_html = Pathname.new(ARGV[0] || "~/jarp/diary/index.html").expand_path
index_rdf = index_html.dirname.join("index.rdf")

if index_rdf.exist?
  rss = RSS::Parser.parse(index_rdf.read)
  channel = rss.channel
  rss.items.each do |item| item.dc_date.localtime end
else
  rss = RSS::RDF.new
  rss.channel = RSS::RDF::Channel.new
  channel = rss.channel
  channel.items = RSS::RDF::Channel::Items.new
end

channel.about = DIARY + "index.rdf"
channel.dc_creator = "わたなべひろふみ"
channel.dc_language = "ja"
channel.title = "Just another Ruby porter,"
channel.link = DIARY
channel.description = "たぶんRubyに関する日誌"

rss.image = RSS::RDF::Image.new(DIARY + "JARP.png")
rss.image.title = channel.title
rss.image.url = DIARY + "JARP.png"
rss.image.link = DIARY

nsmm(index_html) do |title, link, subject, desc, full|
  channel.items.Seq.lis.delete_if do |x|
    x.resource == link
  end
  rss.items.delete_if do |x|
    x.about == link
  end
  channel.items.Seq.lis << RSS::RDF::Li.new(link)

  item = RSS::RDF::Item.new(link)
  item.title = title
  item.link = link
  item.description = desc
  item.dc_creator = channel.dc_creator
  item.dc_date = Time.now
  item.dc_subject = subject
  item.content_encoded = full
  rss.items << item
end

rss.items.sort! do |a, b|
  b.link <=> a.link
end

channel.items.Seq.lis.sort! do |a, b|
  b.resource <=> a.resource
end

last = nil
max = 5
rss.items.each do |x|
  x = x.about[/#(\d{8})/, 1]
  max -= 1 if last != x
  last = x
  if max < 0
    rss.items.pop
    channel.items.Seq.lis.pop
  end
end

rss.output_encoding = 'euc-jp'

out = rss.to_s.gsub(/(\t<rdf:li.+?\/>)\t/, '\1' + "\n\t")
if /<\?xml-stylesheet href="/ !~ out
  out.sub!(/<rdf:RDF/,
  '<?xml-stylesheet href="diary.xsl" type="text/xsl"?>' + "\n" + '\&')
end
out.gsub!(/\s+$/, "")
out.squeeze!("\n")
#out.gsub!(/\t/, "  ")
out.gsub!(/version='(.+)' encoding='(.+)'/, 'version="\1" encoding="\2"')
out.gsub!(/(<content:encoded>)(.+?)(<\/content:encoded>)/m) do |x|
  a, b, c = $1, $2, $3
  a + "<![CDATA[" + CGI.unescapeHTML(b) + "]]>" + c + "\n"
end
if /<image rdf:resource=/ !~ out
  out.gsub!(/<items>/) do
    '<image rdf:resource="' + DIARY + "JARP.png" + '" />' + "\n    " + $&
  end
end

print out, "\n"

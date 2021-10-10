<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
 xmlns="http://www.w3.org/1999/xhtml"
 xmlns:content="http://purl.org/rss/1.0/modules/content/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:rss="http://purl.org/rss/1.0/"
 exclude-result-prefixes="rss rdf dc">

 <xsl:output method="xml" encoding="utf-8" indent="yes" />

 <xsl:template match="/">
  <xsl:apply-templates select="rdf:RDF" />
 </xsl:template>

 <xsl:template match="rdf:RDF">
  <html xml:lang="ja" lang="ja">
   <head>
    <title>
     <xsl:value-of select="rss:channel/rss:title" />
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="WATANABE, Hirofumi" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <style type="text/css">
     pre { 
       white-space:  pre;
       padding:      0.2em;
       border-color: #0;
       border-style: solid;
       border-width: 2px
     }
     .lead {
       padding: 1em;
       border: outset thin #fefef9;
       background-color: #ffffe9;
     }
     div.item1 {
       background-color: #e9e9e9;
     }
     div.item0 { }
     body { padding: 10px 3em 10px 3em; }
    </style>
    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="alternate" type="application/rss+xml" title="RSS" href="index.rdf" />
    <link rev="made" href="&#109;&#x61;&#x69;&#108;&#116;&#111;&#x3A;&#101;&#98;&#x61;&#110;&#64;&#x6F;&#x73;&#x2E;&#x72;&#105;&#109;&#46;&#x6F;&#x72;&#x2E;&#106;&#x70;" />
    <link rel="index" href="./" />
   </head>

   <body>
    <h1>
     <a href="{rss:channel/rss:link}">
      <xsl:value-of select="rss:channel/rss:title" />
     </a>
    </h1>
    <p class="lead">
     <xsl:value-of select="rss:channel/rss:description"/>
    </p>
    <div class="items">
     <xsl:apply-templates select="rss:item" />
    </div>
   </body>
  </html>
 </xsl:template>

 <xsl:template match="rss:item">
  <div class="item{position() mod 2}">
   <xsl:call-template name="item" />
  </div>
 </xsl:template>

 <xsl:template name="item">
  <h2>
   <a href="{rss:link}">■</a>
   <xsl:value-of select="rss:title" disable-output-escaping="yes" />
  </h2>
  <p>
   <xsl:value-of select="rss:description" disable-output-escaping="yes" />
  </p>
 </xsl:template>
</xsl:stylesheet>
<!-- vi:set sw=1: 美 -->

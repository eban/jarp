// ==UserScript==
// @name		RD-Style iEPG
// @namespace		http://jarp.does.notwork.org/
// @description		substitute with http://rd-h1/@@@@@@
// @include		http://tv.*
// ==/UserScript==
(function () {
  var links = document.links;
  for (var i in links){
    var link = links[i];
    var href = link.href;
    if (href && href.indexOf("tvpi.epg") != -1) {
      link.href = href.replace(/http:\/\//, "http://rd-h1/@@@@@@");
      link.target = "_blank";
    }
  }
})();

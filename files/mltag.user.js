// ==UserScript==
// @name           mltag
// @namespace      http://youngpup.net/userscripts
// @description    Looks for things in the page that look like ML-tags but aren't hyperlinked, and converts them to clickable links.
// @include        *
// ==/UserScript==

(function () {
    const urlRegex = /\[(ruby[\w\-]+):(\d+)\]/ig;

    // tags we will scan looking for un-hyperlinked urls
    var allowedParents = [
        "abbr", "acronym", "address", "applet", "b", "bdo", "big", "blockquote", "body", 
        "caption", "center", "cite", "code", "dd", "del", "div", "dfn", "dt", "em", 
        "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6", "i", "iframe",
        "ins", "kdb", "li", "object", "pre", "p", "q", "samp", "small", "span", "strike", 
        "s", "strong", "sub", "sup", "td", "th", "tt", "u", "var"
        ];
    
    var xpath = "//text()[(parent::" + allowedParents.join(" or parent::") + ") and " +
                "contains(., 'ruby')]";
//                "contains(translate(., 'HTTP', 'http'), 'http')]";

    var candidates = document.evaluate(xpath, document, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);

    var t0 = new Date().getTime();
    for (var cand = null, i = 0; (cand = candidates.snapshotItem(i)); i++) {
        if (urlRegex.test(cand.nodeValue)) {
            var span = document.createElement("span");
            var source = cand.nodeValue;
            
            cand.parentNode.replaceChild(span, cand);

            urlRegex.lastIndex = 0;
            for (var match = null, lastLastIndex = 0; (match = urlRegex.exec(source)); ) {
                span.appendChild(document.createTextNode(source.substring(lastLastIndex, match.index)));
                
                var a = document.createElement("a");
                a.setAttribute("href", "http://blade.nagaokaut.ac.jp" +
                    "/cgi-bin/scat.rb/ruby/" + match[1] + "/" + match[2]);
                a.setAttribute("target", "_blank");
                a.appendChild(document.createTextNode(match[0]));
                span.appendChild(a);

                lastLastIndex = urlRegex.lastIndex;
            }

            span.appendChild(document.createTextNode(source.substring(lastLastIndex)));
            span.normalize();
        }
    }
    var t1 = new Date().getTime();
    //alert((t1 - t0) / 1000);

})();

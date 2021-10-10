// ==UserScript==
// @name          Bloglines Tweaks
// @namespace     http://persistent.info/greasemonkey
// @description	  Integrates Bloglines with del.icio.us and makes the "Extras"
//                section toggleable (with more to come).

// Subscriptions page
// @include       http://bloglines.com/myblogs_subs*
// @include       http://www.bloglines.com/myblogs_subs*

// Items page
// @include       http://www.bloglines.com/myblogs_display*
// @include       http://bloglines.com/myblogs_display*

// ==/UserScript==

(function() {
  function tweakSubscriptions() {
    // Get the "Extras" header    
    var divs = document.getElementsByTagName("div");
    var extrasHeader = null;
    
    for (var i=0; i < divs.length; i++) {
      if (divs[i].className == "account") {
        extrasHeader = divs[i];
        break;
      }
    }
    
    if (!extrasHeader) {
      fail("Could not find the 'Extras' header.");
      return;
    }
    
    // And all of the links underneath
    var tables = document.getElementsByTagName("table");
    
    for (var i=0; i < tables.length; i++) {
      var t = tables[i];
      
      if (t.getAttribute("cellspacing") == 0 &&
          t.getAttribute("cellpadding") == 0 &&
          t.innerHTML.indexOf("Recommendations") != -1) {
        extrasHeader.linksTable = t;
        break;
      }
    }
    
    if (!extrasHeader.linksTable) {
      fail("Could not find the links table.");
      return;
    }
    
    extrasHeader.hideLinks = function() {
      extrasHeader.linksTable.style.display = "none";
      extrasHeader.onclick = extrasHeader.showLinks;
    }
    
    extrasHeader.showLinks = function() {
      extrasHeader.linksTable.style.display = "";
      extrasHeader.onclick = extrasHeader.hideLinks;
    }
    
    extrasHeader.style.cursor = "pointer";
    extrasHeader.hideLinks();
  }
  
  function tweakItems() {
    var links = document.getElementsByTagName("a");
    
    for (var i=0; i < links.length; i++) {
      var l = links[i];
      if (l.innerHTML.indexOf("Clip/Blog This") != -1) {
        l.innerHTML = "Post to del.icio.us";
        
        // links is inside a list item which is inside an unordered list
        // whic is inside a div. this div is a sibling of the header that
        // serves as a title link
        var titleLink = l.parentNode.parentNode.parentNode;
        
        while (titleLink && titleLink.tagName.toLowerCase() != "h3") {
          titleLink = titleLink.previousSibling;
        }
        
        if (!titleLink) {
//          fail("Could not find the title link.");
          return;
        }
        
        // the header has a link tag inside of it
        titleLink = titleLink.getElementsByTagName("a")[0];
        
        l.onclick = getDeliciousPostClosure(titleLink.innerHTML,
                                            titleLink.getAttribute("href"));
        l.setAttribute("href", "http://del.icio.us/post"); // symbolic
      }
    }
  }
  
  function getDeliciousPostClosure(title, href) {
    return function() {
      postToDelicious(title, href);
      return false;
    }
  }
  
  function postToDelicious(title, href) {
    var username = getCookie("deliciousUsername");
    
    if (!username) {
      username = prompt("Please enter your del.icio.us username", "");
      if (!username) {
        return;
      }
      setCookie("deliciousUsername", username);
    }
  
    // adapted from the popup post bookmarklet
    open('http://del.icio.us/' + username +
         '?v=2&noui=yes&jump=close&url=' + encodeURIComponent(href) +
         '&title=' + encodeURIComponent(title),
         'delicious',
         'toolbar=no,width=700,height=250');
  }
  
  function getCookie(name) {
    var re = new RegExp(name + "=([^;]+)");
    var value = re.exec(document.cookie);
    return (value != null) ? unescape(value[1]) : null;
  }
  
  function setCookie(name, value) {
    var today = new Date();
    // plus 28 years
    var expiry = new Date(today.getTime() + 28 * 365.24 * 24 * 60 * 60 * 1000);   
    
    document.cookie = name + "=" + escape(value) +
              "; expires=" + expiry.toGMTString() +
              "; path=/";
  }
  
  function fail(reason) {
    alert(reason + "\nPlease look for an updated version of this script");
  }

  var href = window.location.href;
  
  if (href.indexOf("myblogs_subs") != -1) {
    tweakSubscriptions();
  } else if (href.indexOf("myblogs_display") != -1) {
    tweakItems();
  } else {
    fail("Unknown URL: " + href);
  }
})();

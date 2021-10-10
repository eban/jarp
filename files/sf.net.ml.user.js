// ==UserScript==
// @name           sf.net ml hacks
// @namespace      http://jarp.does.notwork.org/userscripts
// @description    fix japanese charactar
// @include        http://sourceforge.net/mailarchive/*
// ==/UserScript==

(function () {
    var head = window._content.document.getElementsByTagName('head')[0];
    head.innerHTML = head.innerHTML.replace(/iso-8859-1/g, 'iso-2022-jp');
})();

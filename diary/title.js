function anchorElement(n){if(anchorElem=getAnchorElement(n),anchorElem&&"H3"==anchorElem.tagName){var e=3,r=anchorElem.innerHTML.replace(/<.+?>/g,"").substr(e),r=r.replace(/\[.+?\]|^ +/g,"");document.title=r+" - jarp,"}}function getAnchorElement(n){var e;for(e in document.anchors){var r=document.anchors[e];if(r.name==n){var t;return r.parentElement?t=r.parentElement:r.parentNode&&(t=r.parentNode),t}}return null}function handleLinkClick(){anchorElement(this.hash.substr(1))}var anchorElem=null;location.hash&&anchorElement(location.hash.substr(1)),hereURL=document.location.href.split(/#/)[0];var i;for(i in document.links){var href=document.links[i].href;href&&hereURL==href.split(/#/)[0]&&(document.links[i].onclick=handleLinkClick)}
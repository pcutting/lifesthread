  /*Kentaromiura 1.0 version: http://mykenta.blogspot.com/2007/10/getelementbyclass-revisited.html */
  document.getElementsByClassName=function(searchClass,tag,node){var p=function(){if([].push)return function(a,b){a.push(b)};return function(a,b){a[a.length]=b}}();node=node||document;tag=tag||'*';if(document.evaluate){var xpr=document.evaluate([".//",tag,"[contains(concat(' ',@class,' '),' ",searchClass," ')]"].join(''),node,null,0,null),t=true,els=new Array();while(t=xpr.iterateNext()){p(els,t)}return els}var els=node.getElementsByTagName(tag),pattern=new RegExp(["(^|\\s)",searchClass,"(\\s|$)"].join('')),ce=new Array();for(var i=0,max=els.length;i<max;i++){if(pattern.test(els[i].className))p(ce,els[i])}return ce}

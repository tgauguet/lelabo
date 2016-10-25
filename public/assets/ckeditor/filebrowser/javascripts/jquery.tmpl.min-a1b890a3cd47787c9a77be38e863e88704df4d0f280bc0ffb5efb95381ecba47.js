/*
 * jQuery Templates Plugin 1.0.0pre
 * http://github.com/jquery/jquery-tmpl
 * Requires jQuery 1.4.2
 *
 * Copyright Software Freedom Conservancy, Inc.
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 */
!function(e){function t(t,n,i,o){var s={data:o||0===o||o===!1?o:n?n.data:{},_wrap:n?n._wrap:null,tmpl:null,parent:n||null,nodes:[],calls:c,nest:u,wrap:d,html:h,update:f};return t&&e.extend(s,t,{nodes:[],parent:n}),i&&(s.tmpl=i,s._ctnt=s._ctnt||s.tmpl(e,s),s.key=++b,(y.length?T:E)[b]=s),s}function n(t,o,s){var a,r=s?e.map(s,function(e){return"string"==typeof e?t.key?e.replace(/(<\w+)(?=[\s>])(?![^>]*_tmplitem)([^>]*)/g,"$1 "+g+'="'+t.key+'" $2'):e:n(e,t,e._ctnt)}):t;return o?r:(r=r.join(""),r.replace(/^\s*([^<\s][^<]*)?(<[\w\W]+>)([^>]*[^>\s])?\s*$/,function(t,n,o,s){a=e(o).get(),l(a),n&&(a=i(n).concat(a)),s&&(a=a.concat(i(s)))}),a?a:i(r))}function i(t){var n=document.createElement("div");return n.innerHTML=t,e.makeArray(n.childNodes)}function o(t){return new Function("jQuery","$item","var $=jQuery,call,__=[],$data=$item.data;with($data){__.push('"+e.trim(t).replace(/([\\'])/g,"\\$1").replace(/[\r\t\n]/g," ").replace(/\$\{([^\}]*)\}/g,"{{= $1}}").replace(/\{\{(\/?)(\w+|.)(?:\(((?:[^\}]|\}(?!\}))*?)?\))?(?:\s+(.*?)?)?(\(((?:[^\}]|\}(?!\}))*?)\))?\s*\}\}/g,function(t,n,i,o,s,r,l){var c,u,d,h=e.tmpl.tag[i];if(!h)throw"Unknown template tag: "+i;return c=h._default||[],r&&!/\w$/.test(s)&&(s+=r,r=""),s?(s=a(s),l=l?","+a(l)+")":r?")":"",u=r?s.indexOf(".")>-1?s+a(r):"("+s+").call($item"+l:s,d=r?u:"(typeof("+s+")==='function'?("+s+").call($item):("+s+"))"):d=u=c.$1||"null",o=a(o),"');"+h[n?"close":"open"].split("$notnull_1").join(s?"typeof("+s+")!=='undefined' && ("+s+")!=null":"true").split("$1a").join(d).split("$1").join(u).split("$2").join(o||c.$2||"")+"__.push('"})+"');}return __;")}function s(t,i){t._wrap=n(t,!0,e.isArray(i)?i:[v.test(i)?i:e(i).html()]).join("")}function a(e){return e?e.replace(/\\'/g,"'").replace(/\\\\/g,"\\"):null}function r(e){var t=document.createElement("div");return t.appendChild(e.cloneNode(!0)),t.innerHTML}function l(n){function i(n){function i(e){e+=c,a=u[e]=u[e]||t(a,E[a.parent.key+c]||a.parent)}var o,s,a,r,l=n;if(r=n.getAttribute(g)){for(;l.parentNode&&1===(l=l.parentNode).nodeType&&!(o=l.getAttribute(g)););o!==r&&(l=l.parentNode?11===l.nodeType?0:l.getAttribute(g)||0:0,(a=E[r])||(a=T[r],a=t(a,E[l]||T[l]),a.key=++b,E[b]=a),_&&i(r)),n.removeAttribute(g)}else _&&(a=e.data(n,"tmplItem"))&&(i(a.key),E[a.key]=a,l=e.data(n.parentNode,"tmplItem"),l=l?l.key:0);if(a){for(s=a;s&&s.key!=l;)s.nodes.push(n),s=s.parent;delete a._ctnt,delete a._wrap,e.data(n,"tmplItem",a)}}var o,s,a,r,l,c="_"+_,u={};for(a=0,r=n.length;r>a;a++)if(1===(o=n[a]).nodeType){for(s=o.getElementsByTagName("*"),l=s.length-1;l>=0;l--)i(s[l]);i(o)}}function c(e,t,n,i){return e?void y.push({_:e,tmpl:t,item:this,data:n,options:i}):y.pop()}function u(t,n,i){return e.tmpl(e.template(t),n,i,this)}function d(t,n){var i=t.options||{};return i.wrapped=n,e.tmpl(e.template(t.tmpl),t.data,i,t.item)}function h(t,n){var i=this._wrap;return e.map(e(e.isArray(i)?i.join(""):i).filter(t||"*"),function(e){return n?e.innerText||e.textContent:e.outerHTML||r(e)})}function f(){var t=this.nodes;e.tmpl(null,null,null,this).insertBefore(t[0]),e(t).remove()}var p,m=e.fn.domManip,g="_tmplitem",v=/^[^<]*(<[\w\W]+>)[^>]*$|\{\{\! /,E={},T={},C={key:0,data:{}},b=0,_=0,y=[];e.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(t,n){e.fn[t]=function(i){var o,s,a,r,l=[],c=e(i),u=1===this.length&&this[0].parentNode;if(p=E||{},u&&11===u.nodeType&&1===u.childNodes.length&&1===c.length)c[n](this[0]),l=this;else{for(s=0,a=c.length;a>s;s++)_=s,o=(s>0?this.clone(!0):this).get(),e(c[s])[n](o),l=l.concat(o);_=0,l=this.pushStack(l,t,c.selector)}return r=p,p=null,e.tmpl.complete(r),l}}),e.fn.extend({tmpl:function(t,n,i){return e.tmpl(this[0],t,n,i)},tmplItem:function(){return e.tmplItem(this[0])},template:function(t){return e.template(t,this[0])},domManip:function(t,n,i){if(t[0]&&e.isArray(t[0])){for(var o,s=e.makeArray(arguments),a=t[0],r=a.length,l=0;r>l&&!(o=e.data(a[l++],"tmplItem")););o&&_&&(s[2]=function(t){e.tmpl.afterManip(this,t,i)}),m.apply(this,s)}else m.apply(this,arguments);return _=0,!p&&e.tmpl.complete(E),this}}),e.extend({tmpl:function(i,o,a,r){var l,c=!r;if(c)r=C,i=e.template[i]||e.template(null,i),T={};else if(!i)return i=r.tmpl,E[r.key]=r,r.nodes=[],r.wrapped&&s(r,r.wrapped),e(n(r,null,r.tmpl(e,r)));return i?("function"==typeof o&&(o=o.call(r||{})),a&&a.wrapped&&s(a,a.wrapped),l=e.isArray(o)?e.map(o,function(e){return e?t(a,r,i,e):null}):[t(a,r,i,o)],c?e(n(r,null,l)):l):[]},tmplItem:function(t){var n;for(t instanceof e&&(t=t[0]);t&&1===t.nodeType&&!(n=e.data(t,"tmplItem"))&&(t=t.parentNode););return n||C},template:function(t,n){return n?("string"==typeof n?n=o(n):n instanceof e&&(n=n[0]||{}),n.nodeType&&(n=e.data(n,"tmpl")||e.data(n,"tmpl",o(n.innerHTML))),"string"==typeof t?e.template[t]=n:n):t?"string"!=typeof t?e.template(null,t):e.template[t]||e.template(null,v.test(t)?t:e(t)):null},encode:function(e){return(""+e).split("<").join("&lt;").split(">").join("&gt;").split('"').join("&#34;").split("'").join("&#39;")}}),e.extend(e.tmpl,{tag:{tmpl:{_default:{$2:"null"},open:"if($notnull_1){__=__.concat($item.nest($1,$2));}"},wrap:{_default:{$2:"null"},open:"$item.calls(__,$1,$2);__=[];",close:"call=$item.calls();__=call._.concat($item.wrap(call,__));"},each:{_default:{$2:"$index, $value"},open:"if($notnull_1){$.each($1a,function($2){with(this){",close:"}});}"},"if":{open:"if(($notnull_1) && $1a){",close:"}"},"else":{_default:{$1:"true"},open:"}else if(($notnull_1) && $1a){"},html:{open:"if($notnull_1){__.push($1a);}"},"=":{_default:{$1:"$data"},open:"if($notnull_1){__.push($.encode($1a));}"},"!":{open:""}},complete:function(){E={}},afterManip:function(t,n,i){var o=11===n.nodeType?e.makeArray(n.childNodes):1===n.nodeType?[n]:[];i.call(t,n),l(o),_++}})}(jQuery);
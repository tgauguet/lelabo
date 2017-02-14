/*
 Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
!function(){function e(e){e=e.toUpperCase();for(var t=s.length,n=0,i=0;t>i;++i)for(var o=s[i],a=o[1].length;e.substr(0,a)==o[1];e=e.substr(a))n+=o[0];return n}function t(e){e=e.toUpperCase();for(var t=1,n=1;0<e.length;n*=26)t+="ABCDEFGHIJKLMNOPQRSTUVWXYZ".indexOf(e.charAt(e.length-1))*n,e=e.substr(0,e.length-1);return t}var n=CKEDITOR.htmlParser.fragment.prototype,i=CKEDITOR.htmlParser.element.prototype;n.onlyChild=i.onlyChild=function(){var e=this.children;return 1==e.length&&e[0]||null},i.removeAnyChildWithName=function(e){for(var t,n=this.children,i=[],o=0;o<n.length;o++)t=n[o],t.name&&(t.name==e&&(i.push(t),n.splice(o--,1)),i=i.concat(t.removeAnyChildWithName(e)));return i},i.getAncestor=function(e){for(var t=this.parent;t&&(!t.name||!t.name.match(e));)t=t.parent;return t},n.firstChild=i.firstChild=function(e){for(var t,n=0;n<this.children.length;n++)if(t=this.children[n],e(t)||t.name&&(t=t.firstChild(e)))return t;return null},i.addStyle=function(e,t,n){var i="";if("string"==typeof t)i+=e+":"+t+";";else{if("object"==typeof e)for(var o in e)e.hasOwnProperty(o)&&(i+=o+":"+e[o]+";");else i+=e;n=t}this.attributes||(this.attributes={}),e=this.attributes.style||"",e=(n?[i,e]:[e,i]).join(";"),this.attributes.style=e.replace(/^;+|;(?=;)/g,"")},i.getStyle=function(e){var t=this.attributes.style;return t?(t=CKEDITOR.tools.parseCssText(t,1),t[e]):void 0},CKEDITOR.dtd.parentOf=function(e){var t,n={};for(t in this)-1==t.indexOf("$")&&this[t][e]&&(n[t]=1);return n};var o,a=/^(?:\b0[^\s]*\s*){1,4}$/,r={ol:{decimal:/\d+/,"lower-roman":/^m{0,4}(cm|cd|d?c{0,3})(xc|xl|l?x{0,3})(ix|iv|v?i{0,3})$/,"upper-roman":/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/,"lower-alpha":/^[a-z]+$/,"upper-alpha":/^[A-Z]+$/},ul:{disc:/[l\u00B7\u2002]/,circle:/[\u006F\u00D8]/,square:/[\u006E\u25C6]/}},s=[[1e3,"M"],[900,"CM"],[500,"D"],[400,"CD"],[100,"C"],[90,"XC"],[50,"L"],[40,"XL"],[10,"X"],[9,"IX"],[5,"V"],[4,"IV"],[1,"I"]],l=0,c=null,u=CKEDITOR.plugins.pastefromword={utils:{createListBulletMarker:function(e,t){var n=new CKEDITOR.htmlParser.element("cke:listbullet");return n.attributes={"cke:listsymbol":e[0]},n.add(new CKEDITOR.htmlParser.text(t)),n},isListBulletIndicator:function(e){return/mso-list\s*:\s*Ignore/i.test(e.attributes&&e.attributes.style)?!0:void 0},isContainingOnlySpaces:function(e){var t;return(t=e.onlyChild())&&/^(:?\s|&nbsp;)+$/.test(t.value)},resolveList:function(e){var t,n=e.attributes;return(t=e.removeAnyChildWithName("cke:listbullet"))&&t.length&&(t=t[0])?(e.name="cke:li",n.style&&(n.style=u.filters.stylesFilter([["text-indent"],["line-height"],[/^margin(:?-left)?$/,null,function(e){e=e.split(" "),e=CKEDITOR.tools.convertToPx(e[3]||e[1]||e[0]),!l&&null!==c&&e>c&&(l=e-c),c=e,n["cke:indent"]=l&&Math.ceil(e/l)+1||1}],[/^mso-list$/,null,function(e){if(e=e.split(" "),!(2>e.length)){var t=Number(e[0].match(/\d+/));e=Number(e[1].match(/\d+/)),1==e&&(t!==o&&(n["cke:reset"]=1),o=t),n["cke:indent"]=e}}]])(n.style,e)||""),n["cke:indent"]||(c=0,n["cke:indent"]=1),CKEDITOR.tools.extend(n,t.attributes),!0):(o=c=l=null,!1)},getStyleComponents:function(){var e=CKEDITOR.dom.element.createFromHtml('<div style="position:absolute;left:-9999px;top:-9999px;"></div>',CKEDITOR.document);return CKEDITOR.document.getBody().append(e),function(t,n,i){e.setStyle(t,n),t={},n=i.length;for(var o=0;n>o;o++)t[i[o]]=e.getStyle(i[o]);return t}}(),listDtdParents:CKEDITOR.dtd.parentOf("ol")},filters:{flattenList:function(e,t){t="number"==typeof t?t:1;var n,i=e.attributes;switch(i.type){case"a":n="lower-alpha";break;case"1":n="decimal"}for(var a,r=e.children,s=0;s<r.length;s++)if(a=r[s],a.name in CKEDITOR.dtd.$listItem){var l=a.attributes,d=a.children,h=d[0],f=d[d.length-1];h.attributes&&h.attributes.style&&-1<h.attributes.style.indexOf("mso-list")&&(a.attributes.style=h.attributes.style,h.replaceWithChildren()),f.name in CKEDITOR.dtd.$list&&(e.add(f,s+1),--d.length||r.splice(s--,1)),a.name="cke:li",i.start&&!s&&(l.value=i.start),u.filters.stylesFilter([["tab-stops",null,function(e){(e=e.match(/0$|\d+\.?\d*\w+/))&&(c=CKEDITOR.tools.convertToPx(e[0]))}],1==t?["mso-list",null,function(e){e=e.split(" "),e=Number(e[0].match(/\d+/)),e!==o&&(l["cke:reset"]=1),o=e}]:null])(l.style),l["cke:indent"]=t,l["cke:listtype"]=e.name,l["cke:list-style-type"]=n}else if(a.name in CKEDITOR.dtd.$list){for(arguments.callee.apply(this,[a,t+1]),r=r.slice(0,s).concat(a.children).concat(r.slice(s+1)),e.children=[],a=0,d=r.length;d>a;a++)e.add(r[a]);r=e.children}delete e.name,i["cke:list"]=1},assembleList:function(n){var i,a,s,u,d,h,f=n.children;n=[];for(var m,p,g,E,v,T,C=0;C<f.length;C++)if(i=f[C],"cke:li"==i.name)if(i.name="li",a=i.attributes,g=(g=a["cke:listsymbol"])&&g.match(/^(?:[(]?)([^\s]+?)([.)]?)$/),E=v=T=null,a["cke:ignored"])f.splice(C--,1);else{if(a["cke:reset"]&&(h=u=d=null),s=Number(a["cke:indent"]),s!=u&&(p=m=null),g){if(p&&r[p][m].test(g[1]))E=p,v=m;else for(var b in r)for(var y in r[b])if(r[b][y].test(g[1])){if("ol"!=b||!/alpha|roman/.test(y)){E=b,v=y;break}m=/roman/.test(y)?e(g[1]):t(g[1]),(!T||T>m)&&(T=m,E=b,v=y)}!E&&(E=g[2]?"ol":"ul")}else E=a["cke:listtype"]||"ol",v=a["cke:list-style-type"];if(p=E,m=v||("ol"==E?"decimal":"disc"),v&&v!=("ol"==E?"decimal":"disc")&&i.addStyle("list-style-type",v),"ol"==E&&g){switch(v){case"decimal":T=Number(g[1]);break;case"lower-roman":case"upper-roman":T=e(g[1]);break;case"lower-alpha":case"upper-alpha":T=t(g[1])}i.attributes.value=T}if(h){if(s>u)n.push(h=new CKEDITOR.htmlParser.element(E)),h.add(i),d.add(h);else{if(u>s){u-=s;for(var I;u--&&(I=h.parent);)h=I.parent}h.add(i)}f.splice(C--,1)}else n.push(h=new CKEDITOR.htmlParser.element(E)),h.add(i),f[C]=h;d=i,u=s}else h&&(h=u=d=null);for(C=0;C<n.length;C++)if(h=n[C],b=h.children,m=m=void 0,y=h.children.length,I=m=void 0,f=/list-style-type:(.*?)(?:;|$)/,u=CKEDITOR.plugins.pastefromword.filters.stylesFilter,m=h.attributes,!f.exec(m.style)){for(d=0;y>d;d++)if(m=b[d],m.attributes.value&&Number(m.attributes.value)==d+1&&delete m.attributes.value,m=f.exec(m.attributes.style)){if(m[1]!=I&&I){I=null;break}I=m[1]}if(I){for(d=0;y>d;d++)m=b[d].attributes,m.style&&(m.style=u([["list-style-type"]])(m.style)||"");h.addStyle("list-style-type",I)}}o=c=l=null},falsyFilter:function(){return!1},stylesFilter:function(e,t){return function(n,i){var o=[];(n||"").replace(/&quot;/g,'"').replace(/\s*([^ :;]+)\s*:\s*([^;]+)\s*(?=;|$)/g,function(n,a,r){a=a.toLowerCase(),"font-family"==a&&(r=r.replace(/["']/g,""));for(var s,l,c,u=0;u<e.length;u++)if(e[u]&&(n=e[u][0],s=e[u][1],l=e[u][2],c=e[u][3],a.match(n)&&(!s||r.match(s))))return a=c||a,t&&(l=l||r),"function"==typeof l&&(l=l(r,i,a)),l&&l.push&&(a=l[0],l=l[1]),void("string"==typeof l&&o.push([a,l]));!t&&o.push([a,r])});for(var a=0;a<o.length;a++)o[a]=o[a].join(":");return o.length?o.join(";")+";":!1}},elementMigrateFilter:function(e,t){return e?function(n){var i=t?new CKEDITOR.style(e,t)._.definition:e;n.name=i.element,CKEDITOR.tools.extend(n.attributes,CKEDITOR.tools.clone(i.attributes)),n.addStyle(CKEDITOR.style.getStyleText(i)),i.attributes&&i.attributes["class"]&&(n.classWhiteList=" "+i.attributes["class"]+" ")}:function(){}},styleMigrateFilter:function(e,t){var n=this.elementMigrateFilter;return e?function(i,o){var a=new CKEDITOR.htmlParser.element(null),r={};r[t]=i,n(e,r)(a),a.children=o.children,o.children=[a],a.filter=function(){},a.parent=o}:function(){}},bogusAttrFilter:function(e,t){return-1==t.name.indexOf("cke:")?!1:void 0},applyStyleFilter:null},getRules:function(e,t){var n=CKEDITOR.dtd,i=CKEDITOR.tools.extend({},n.$block,n.$listItem,n.$tableContent),o=e.config,r=this.filters,s=r.falsyFilter,l=r.stylesFilter,c=r.elementMigrateFilter,u=CKEDITOR.tools.bind(this.filters.styleMigrateFilter,this.filters),d=this.utils.createListBulletMarker,h=r.flattenList,f=r.assembleList,m=this.utils.isListBulletIndicator,p=this.utils.isContainingOnlySpaces,g=this.utils.resolveList,E=function(e){return e=CKEDITOR.tools.convertToPx(e),isNaN(e)?e:e+"px"},v=this.utils.getStyleComponents,T=this.utils.listDtdParents,C=!1!==o.pasteFromWordRemoveFontStyles,b=!1!==o.pasteFromWordRemoveStyles;return{elementNames:[[/meta|link|script/,""]],root:function(e){e.filterChildren(t),f(e)},elements:{"^":function(e){var t;CKEDITOR.env.gecko&&(t=r.applyStyleFilter)&&t(e)},$:function(e){var a=e.name||"",r=e.attributes;if(a in i&&r.style&&(r.style=l([[/^(:?width|height)$/,null,E]])(r.style)||""),a.match(/h\d/)){if(e.filterChildren(t),g(e))return;c(o["format_"+a])(e)}else if(a in n.$inline)e.filterChildren(t),p(e)&&delete e.name;else if(-1!=a.indexOf(":")&&-1==a.indexOf("cke")){if(e.filterChildren(t),"v:imagedata"==a)return(a=e.attributes["o:href"])&&(e.attributes.src=a),void(e.name="img");delete e.name}a in T&&(e.filterChildren(t),f(e))},style:function(e){if(CKEDITOR.env.gecko){e=(e=e.onlyChild().value.match(/\/\* Style Definitions \*\/([\s\S]*?)\/\*/))&&e[1];var t={};e&&(e.replace(/[\n\r]/g,"").replace(/(.+?)\{(.+?)\}/g,function(e,n,i){n=n.split(","),e=n.length;for(var o=0;e>o;o++)CKEDITOR.tools.trim(n[o]).replace(/^(\w+)(\.[\w-]+)?$/g,function(e,n,o){n=n||"*",o=o.substring(1,o.length),o.match(/MsoNormal/)||(t[n]||(t[n]={}),o?t[n][o]=i:t[n]=i)})}),r.applyStyleFilter=function(e){var n=t["*"]?"*":e.name,i=e.attributes&&e.attributes["class"];n in t&&(n=t[n],"object"==typeof n&&(n=n[i]),n&&e.addStyle(n,!0))})}return!1},p:function(e){if(/MsoListParagraph/i.exec(e.attributes["class"])||e.getStyle("mso-list")&&!e.getStyle("mso-list").match(/^(none|skip)$/i)){var n=e.firstChild(function(e){return e.type==CKEDITOR.NODE_TEXT&&!p(e.parent)});(n=n&&n.parent)&&n.addStyle("mso-list","Ignore")}e.filterChildren(t),g(e)||(o.enterMode==CKEDITOR.ENTER_BR?(delete e.name,e.add(new CKEDITOR.htmlParser.element("br"))):c(o["format_"+(o.enterMode==CKEDITOR.ENTER_P?"p":"div")])(e))},div:function(e){var t=e.onlyChild();if(t&&"table"==t.name){var n=e.attributes;t.attributes=CKEDITOR.tools.extend(t.attributes,n),n.style&&t.addStyle(n.style),t=new CKEDITOR.htmlParser.element("div"),t.addStyle("clear","both"),e.add(t),delete e.name}},td:function(e){e.getAncestor("thead")&&(e.name="th")},ol:h,ul:h,dl:h,font:function(e){if(m(e.parent))delete e.name;else{e.filterChildren(t);var n=e.attributes,i=n.style,o=e.parent;"font"==o.name?(CKEDITOR.tools.extend(o.attributes,e.attributes),i&&o.addStyle(i),delete e.name):(i=(i||"").split(";"),n.color&&("#000000"!=n.color&&i.push("color:"+n.color),delete n.color),n.face&&(i.push("font-family:"+n.face),delete n.face),n.size&&(i.push("font-size:"+(3<n.size?"large":3>n.size?"small":"medium")),delete n.size),e.name="span",e.addStyle(i.join(";")))}},span:function(e){if(m(e.parent))return!1;if(e.filterChildren(t),p(e))return delete e.name,null;if(m(e)){var n=e.firstChild(function(e){return e.value||"img"==e.name}),i=(n=n&&(n.value||"l."))&&n.match(/^(?:[(]?)([^\s]+?)([.)]?)$/);if(i)return n=d(i,n),(e=e.getAncestor("span"))&&/ mso-hide:\s*all|display:\s*none /.test(e.attributes.style)&&(n.attributes["cke:ignored"]=1),n}return(i=(n=e.attributes)&&n.style)&&(n.style=l([["line-height"],[/^font-family$/,null,C?null:u(o.font_style,"family")],[/^font-size$/,null,C?null:u(o.fontSize_style,"size")],[/^color$/,null,C?null:u(o.colorButton_foreStyle,"color")],[/^background-color$/,null,C?null:u(o.colorButton_backStyle,"color")]])(i,e)||""),n.style||delete n.style,CKEDITOR.tools.isEmpty(n)&&delete e.name,null},b:c(o.coreStyles_bold),i:c(o.coreStyles_italic),u:c(o.coreStyles_underline),s:c(o.coreStyles_strike),sup:c(o.coreStyles_superscript),sub:c(o.coreStyles_subscript),a:function(e){var t=e.attributes;t.name&&t.name.match(/ole_link\d+/i)?delete e.name:t.href&&t.href.match(/^file:\/\/\/[\S]+#/i)&&(t.href=t.href.replace(/^file:\/\/\/[^#]+/i,""))},"cke:listbullet":function(e){e.getAncestor(/h\d/)&&!o.pasteFromWordNumberedHeadingToList&&delete e.name}},attributeNames:[[/^onmouse(:?out|over)/,""],[/^onload$/,""],[/(?:v|o):\w+/,""],[/^lang/,""]],attributes:{style:l(b?[[/^list-style-type$/,null],[/^margin$|^margin-(?!bottom|top)/,null,function(e,t,n){if(t.name in{p:1,div:1}){if(t="ltr"==o.contentsLangDirection?"margin-left":"margin-right","margin"==n)e=v(n,e,[t])[t];else if(n!=t)return null;if(e&&!a.test(e))return[t,e]}return null}],[/^clear$/],[/^border.*|margin.*|vertical-align|float$/,null,function(e,t){return"img"==t.name?e:void 0}],[/^width|height$/,null,function(e,t){return t.name in{table:1,td:1,th:1,img:1}?e:void 0}]]:[[/^mso-/],[/-color$/,null,function(e){return"transparent"==e?!1:CKEDITOR.env.gecko?e.replace(/-moz-use-text-color/g,"transparent"):void 0}],[/^margin$/,a],["text-indent","0cm"],["page-break-before"],["tab-stops"],["display","none"],C?[/font-?/]:null],b),width:function(e,t){return t.name in n.$tableContent?!1:void 0},border:function(e,t){return t.name in n.$tableContent?!1:void 0},"class":function(e,t){return t.classWhiteList&&-1!=t.classWhiteList.indexOf(" "+e+" ")?e:!1},bgcolor:s,valign:b?s:function(e,t){return t.addStyle("vertical-align",e),!1}},comment:CKEDITOR.env.ie?s:function(e,t){var n=e.match(/<img.*?>/),i=e.match(/^\[if !supportLists\]([\s\S]*?)\[endif\]$/);return i?(i=(n=i[1]||n&&"l.")&&n.match(/>(?:[(]?)([^\s]+?)([.)]?)</),d(i,n)):CKEDITOR.env.gecko&&n?(n=CKEDITOR.htmlParser.fragment.fromHtml(n[0]).children[0],(i=(i=(i=t.previous)&&i.value.match(/<v:imagedata[^>]*o:href=['"](.*?)['"]/))&&i[1])&&(n.attributes.src=i),n):!1}}}},d=function(){this.dataFilter=new CKEDITOR.htmlParser.filter};d.prototype={toHtml:function(e){e=CKEDITOR.htmlParser.fragment.fromHtml(e);var t=new CKEDITOR.htmlParser.basicWriter;return e.writeHtml(t,this.dataFilter),t.getHtml(!0)}},CKEDITOR.cleanWord=function(e,t){e=e.replace(/<!\[([^\]]*?)\]>/g,"<!--[$1]-->"),CKEDITOR.env.gecko&&(e=e.replace(/(\x3c!--\[if[^<]*?\])--\x3e([\S\s]*?)\x3c!--(\[endif\]--\x3e)/gi,"$1$2$3")),CKEDITOR.env.webkit&&(e=e.replace(/(class="MsoListParagraph[^>]+>\x3c!--\[if !supportLists\]--\x3e)([^<]+<span[^<]+<\/span>)(\x3c!--\[endif\]--\x3e)/gi,"$1<span>$2</span>$3"));var n=new d,i=n.dataFilter;i.addRules(CKEDITOR.plugins.pastefromword.getRules(t,i)),t.fire("beforeCleanWord",{filter:i});try{e=n.toHtml(e)}catch(o){t.showNotification(t.lang.pastefromword.error)}return e=e.replace(/cke:.*?".*?"/g,""),e=e.replace(/style=""/g,""),e=e.replace(/<span>/g,"")}}();
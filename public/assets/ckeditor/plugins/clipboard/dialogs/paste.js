/*
 Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("paste",function(e){function t(t){var i=new CKEDITOR.dom.document(t.document),a=i.getBody(),r=i.getById("cke_actscrpt");r&&r.remove(),a.setAttribute("contenteditable",!0),a.on(o.mainPasteEvent,function(e){e=o.initPasteDataTransfer(e),n?e!=n&&(n=o.initPasteDataTransfer()):n=e}),CKEDITOR.env.ie&&8>CKEDITOR.env.version&&i.getWindow().on("blur",function(){i.$.selection.empty()}),i.on("keydown",function(e){e=e.data;var t;switch(e.getKeystroke()){case 27:this.hide(),t=1;break;case 9:case CKEDITOR.SHIFT+9:this.changeFocus(1),t=1}t&&e.preventDefault()},this),e.fire("ariaWidget",new CKEDITOR.dom.element(t.frameElement)),i.getWindow().getFrame().removeCustomData("pendingFocus")&&a.focus()}var n,i=e.lang.clipboard,o=CKEDITOR.plugins.clipboard;return e.on("pasteDialogCommit",function(t){t.data&&e.fire("paste",{type:"auto",dataValue:t.data.dataValue,method:"paste",dataTransfer:t.data.dataTransfer||o.initPasteDataTransfer()})},null,null,1e3),{title:i.title,minWidth:CKEDITOR.env.ie&&CKEDITOR.env.quirks?370:350,minHeight:CKEDITOR.env.quirks?250:245,onShow:function(){this.parts.dialog.$.offsetHeight,this.setupContent(),this.parts.title.setHtml(this.customTitle||i.title),this.customTitle=null},onLoad:function(){(CKEDITOR.env.ie7Compat||CKEDITOR.env.ie6Compat)&&"rtl"==e.lang.dir&&this.parts.contents.setStyle("overflow","hidden")},onOk:function(){this.commitContent()},contents:[{id:"general",label:e.lang.common.generalTab,elements:[{type:"html",id:"securityMsg",html:'<div style="white-space:normal;width:340px">'+i.securityMsg+"</div>"},{type:"html",id:"pasteMsg",html:'<div style="white-space:normal;width:340px">'+i.pasteMsg+"</div>"},{type:"html",id:"editing_area",style:"width:100%;height:100%",html:"",focus:function(){var e=this.getInputElement(),t=e.getFrameDocument().getBody();!t||t.isReadOnly()?e.setCustomData("pendingFocus",1):t.focus()},setup:function(){var o=this.getDialog(),a='<html dir="'+e.config.contentsLangDirection+'" lang="'+(e.config.contentsLanguage||e.langCode)+'"><head><style>body{margin:3px;height:95%;word-break:break-all;}</style></head><body><script id="cke_actscrpt" type="text/javascript">window.parent.CKEDITOR.tools.callFunction('+CKEDITOR.tools.addFunction(t,o)+",this);</script></body></html>",r=CKEDITOR.env.air?"javascript:void(0)":CKEDITOR.env.ie&&!CKEDITOR.env.edge?"javascript:void((function(){"+encodeURIComponent("document.open();("+CKEDITOR.tools.fixDomain+")();document.close();")+'})())"':"",s=CKEDITOR.dom.element.createFromHtml('<iframe class="cke_pasteframe" frameborder="0"  allowTransparency="true" src="'+r+'" aria-label="'+i.pasteArea+'" aria-describedby="'+o.getContentElement("general","pasteMsg").domId+'"></iframe>');if(n=null,s.on("load",function(n){n.removeListener(),n=s.getFrameDocument(),n.write(a),e.focusManager.add(n.getBody()),CKEDITOR.env.air&&t.call(this,n.getWindow().$)},o),s.setCustomData("dialog",o),o=this.getElement(),o.setHtml(""),o.append(s),CKEDITOR.env.ie&&!CKEDITOR.env.edge){var l=CKEDITOR.dom.element.createFromHtml('<span tabindex="-1" style="position:absolute" role="presentation"></span>');l.on("focus",function(){setTimeout(function(){s.$.contentWindow.focus()})}),o.append(l),this.focus=function(){l.focus(),this.fire("focus")}}this.getInputElement=function(){return s},CKEDITOR.env.ie&&(o.setStyle("display","block"),o.setStyle("height",s.$.offsetHeight+2+"px"))},commit:function(){var e,t=this.getDialog().getParentEditor(),i=this.getInputElement().getFrameDocument().getBody(),a=i.getBogus();a&&a.remove(),e=i.getHtml(),setTimeout(function(){t.fire("pasteDialogCommit",{dataValue:e,dataTransfer:n||o.initPasteDataTransfer()})},0)}}]}]}});
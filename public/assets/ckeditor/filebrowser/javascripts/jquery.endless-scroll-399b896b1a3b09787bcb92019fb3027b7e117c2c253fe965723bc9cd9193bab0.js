!function(e){"use strict";e.support.pushState=window.history&&window.history.pushState&&window.history.replaceState&&!navigator.userAgent.match(/((iPod|iPhone|iPad).+\bOS\s+[1-4]|WebApps\/.+CFNetwork)/);var t={init:function(t,n){n.options=e.extend({scrollContainer:window,scrollPadding:100,scrollEventDelay:300},t),this.options=n.options,this.container=n.container,n.scrollModule=this,this._toplock=!0,this._bottomlock=!0,this.scrollContainer=e(this.options.scrollContainer),this.updateEntities(),this.sortMarkers(),this.currentPage=null,this.container.on("jes:afterPageLoad",e.proxy(function(e,t,n){if(this.updateEntities(),this.sortMarkers(),this.checkMarker(),"top"==n){var i=this.markers[1].top,o=this.scrollContainer.scrollTop();this.scrollContainer.scrollTop(o+i)}},this)),this.bind()},updateEntities:function(){this.entities=e(this.options.entity,this.container)},sortMarkers:function(){var t=[];e(".jes-marker",this.container).each(function(){t.push({top:e(this).position().top,url:e(this).data("jesUrl")})}),this.markers=t},checkMarker:function(){for(var t=this.markers[0],n=this.scrollContainer.scrollTop(),i=1;i<this.markers.length&&n>this.markers[i].top;i++)t=this.markers[i];t.url!=this.currentPage&&(this.currentPage=t.url,e(this.container).trigger("jes:scrollToPage",t.url))},bind:function(){this.scrollContainer.on("scroll.jes",e.proxy(function(t){this._tId||(this.scrollHandler(t),this._tId=setTimeout(e.proxy(function(){this._tId=null},this),this.options.scrollEventDelay))},this))},unbind:function(){e(this.options.scrollContainer).off("scroll.jes")},scrollHandler:function(){var t=this.scrollContainer,n=this.entities,i=n.first(),o=n.last(),a=t.scrollTop(),s=t.height(),r=a+s,l=i.position().top,c=l+this.options.scrollPadding,u=o.outerHeight()+o.position().top,d=u-this.options.scrollPadding;c>a?this._toplock||(e(this.container).trigger("jes:topThreshold"),this._toplock=!0):this._toplock=!1,r>d?this._bottomlock||(e(this.container).trigger("jes:bottomThreshold"),this._bottomlock=!0):this._bottomlock=!1,this.checkMarker()}},n={init:function(t,n){n.options=e.extend({},t),this.options=n.options,this.container=n.container,this.setMarker(e(this.options.entity,this.container).first(),location.href),n.ajaxModule=this},loadPage:function(t,n,i){var o={top:{find:"first",inject:"insertBefore"},bottom:{find:"last",inject:"insertAfter"}},a=o[n];this.container.trigger("jes:beforePageLoad",[t,n]),e.get(t,null,e.proxy(function(o){var s=e("<div>").html(o),r=this.options.container,l=e(r,s).first();if(l.length){var c=l.find(this.options.entity);"bottom"==n&&c.each(function(){var t=e(this).attr("id");t&&e("#"+t,this.container).remove()});var u=e(this.options.entity,r)[a.find]();c[a.inject](u),this.setMarker(c.first(),t)}e.isFunction(i)&&i(s),this.container.trigger("jes:afterPageLoad",[t,n,s,c])},this),"html")},setMarker:function(e,t){e.addClass("jes-marker").data("jesUrl",t)}},i={init:function(t,n){n.options=e.extend({nextPage:".pagination a[rel=next]",previousPage:".pagination a[rel=previous]"},t),this.options=n.options,this.container=n.container,e.each([{selector:this.options.nextPage,event:"jes:bottomThreshold.navigation",placement:"bottom"},{selector:this.options.previousPage,event:"jes:topThreshold.navigation",placement:"top"}],e.proxy(function(t,i){if(i.element=e(i.selector),i.element.length){var o=i.element.prop("href"),a=!1,s=function(){!a&&o&&(a=!0,n.ajaxModule.loadPage(o,i.placement,e.proxy(function(t){var n=e(i.selector,e(t));n.length?(a=!1,o=n.prop("href"),i.element.attr("href",o)):(e(this).off(i.event),i.element.remove())},this)))};e(this.container).on(i.event,s),e(i.element).on("click",e.proxy(function(e){e.preventDefault(),s.apply(this.container)},this))}},this))}},o={init:function(t,n){e.support.pushState&&n.container.on("jes:scrollToPage",function(e,t){history.replaceState({},null,t)})}};e.endlessScroll=function(a){if(this.options=e.extend(!0,{container:"#container",entity:".entity",_modules:[n,t,i,o],modules:[]},a),this.container=e(this.options.container),!this.container.length)throw"Container for endless scroll isn't available on the page";return e.merge(this.options.modules,this.options._modules),this.options.modules.forEach(e.proxy(function(e){e.init(this.options,this)},this)),this}}(jQuery);
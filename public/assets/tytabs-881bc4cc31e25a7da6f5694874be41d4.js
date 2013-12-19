/*
 * jQuery plugin "tytabs" by Tyler ( Gregory Jacob )
 * http://blog.carefordesign.com
 *
 * Copyright 2010, Gregory Jacob
 * Data : 31 decembre 2010
 */
(function(e){function t(e,t){t=t?t:window.location.search;var n=new RegExp("&"+e+"=([^&]*)","i");return(t=t.replace(/^\?/,"&").match(n))?t=t[1]:t=""}e.fn.tytabs=function(n){var r={prefixtabs:"tab",prefixcontent:"content",classcontent:"tabscontent",tabinit:"1",catchget:"tab",fadespeed:"normal"},i=e.extend({},r,n);return this.each(function(){function r(t){e(i.classcontent,n).stop(!0,!0);var r=e(i.classcontent+":visible",n);r.length>0?r.fadeOut(i.fadespeed,function(){s(t)}):s(t),e("#"+i.prefixtabs+i.tabinit).removeAttr("class"),e("#"+i.prefixtabs+t).attr("class","current"),i.tabinit=t}function s(t){e(i.prefixcontent+t,n).fadeIn(i.fadespeed)}var n=e(this);i.classcontent="."+i.classcontent,i.prefixcontent="#"+i.prefixcontent,e("ul.tabs li",n).click(function(){return r(e(this).attr("id").replace(i.prefixtabs,"")),!1});var o=t(i.catchget);r(o&&e(i.prefixcontent+o).length==1?o:e(i.prefixcontent+i.tabinit).length==1?i.tabinit:"1")})}})(jQuery);
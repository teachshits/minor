/*
 * Copyright (c) 2010 Lyconic, LLC. 
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
// http://lyconic.com/blog/2010/08/03/dry-up-your-ajax-code-with-the-jquery-rest-plugin
(function(e){function r(t,r,s,o){n={dataType:"json"},arguments.length===1&&typeof arguments[0]!="string"?(n=e.extend(n,t),"url"in n&&"data"in n&&i(n.url,n.data)):(e.isFunction(r)&&(o=s,s=r,r=null),t=i(t,r),n=e.extend(n,{url:t,data:r,success:s,error:o}))}function i(e,t){var n,r,i;for(n in t)i=t[n],r=e.replace("{"+n+"}",i),r!=e&&(e=r,delete t[n]);return e}function s(n){return n.type=n.type||"GET",typeof n.data!="string"&&n.data!=null&&(n.data=e.param(n.data)),n.data=n.data||"",e.restSetup.csrf&&!e.isEmptyObject(e.restSetup.csrf)&&(/^(get)$/i.test(n.type)||/(authenticity_token=)/i.test(n.data)||(n.data+=(n.data?"&":"")+e.restSetup.csrfParam+"="+e.restSetup.csrfToken)),/^(get|post)$/i.test(n.type)||(n.data+=(n.data?"&":"")+e.restSetup.methodParam+"="+n.type.toLowerCase(),n.type="POST"),t.call(this,n)}function o(){return r.apply(this,arguments),e.extend(n,{type:"GET"}),e.ajax(n)}function u(){return r.apply(this,arguments),e.extend(n,{type:"POST"}),e.ajax(n)}function a(){return r.apply(this,arguments),e.extend(n,{type:"PUT"}),e.ajax(n)}function f(){return r.apply(this,arguments),e.extend(n,{type:"DELETE"}),e.ajax(n)}e.restSetup={methodParam:"_method"},e(document).ready(function(){e.extend(e.restSetup,{csrfParam:e("meta[name=csrf-param]").attr("content"),csrfToken:e("meta[name=csrf-token]").attr("content")})});var t=e.ajax,n;e.extend({ajax:s,read:o,create:u,update:a,destroy:f})})(jQuery);
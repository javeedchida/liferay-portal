<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/portlet/sites_admin/init.jsp" %>

<%
Group liveGroup = (Group)request.getAttribute("site.liveGroup");
Long liveGroupId = (Long)request.getAttribute("site.liveGroupId");

String host = PortalUtil.getHost(request);

String sitemapUrl = PortalUtil.getPortalURL(request) + themeDisplay.getPathContext() + "/sitemap.xml";

String publicSitemapUrl = sitemapUrl;

LayoutSet publicLayoutSet = LayoutSetLocalServiceUtil.getLayoutSet(liveGroupId, false);

if (!host.equals(publicLayoutSet.getVirtualHostname())) {
	publicSitemapUrl += "?groupId=" + liveGroup.getGroupId() + "&privateLayout=" + false;
}

String privateSitemapUrl = sitemapUrl;

LayoutSet privateLayoutSet = LayoutSetLocalServiceUtil.getLayoutSet(liveGroupId, true);

if (!host.equals(privateLayoutSet.getVirtualHostname())) {
	privateSitemapUrl += "?groupId=" + liveGroup.getGroupId() + "&privateLayout=" + true;
}
%>

<liferay-ui:error-marker key="errorSection" value="siteMap" />

<h3><liferay-ui:message key="sitemap" /></h3>

<liferay-util:buffer var="linkContent">
	<aui:a href="http://www.sitemaps.org" target="_blank">http://www.sitemaps.org</aui:a>
</liferay-util:buffer>

<liferay-ui:message key="the-sitemap-protocol-notifies-search-engines-of-the-structure-of-the-website" /> <liferay-ui:message arguments="<%= linkContent %>" key="see-x-for-more-information" translateArguments="<%= false %>" />

<br /><br />

<script language="javascript">
/* 
    Provide a simple confirmation dialog to the user. Clicking OK loads the 
    URL in a new browser window. 
*/
function confirmSitemapSubmission(url){
    var sitemapConfirmationMessage = "<liferay-ui:message key='send-sitemap-confirmation'/>";
	if(confirm(sitemapConfirmationMessage)){
		window.open(url);
	}
}
</script>

<aui:fieldset label="public-pages">
	<%= LanguageUtil.format(request, "send-sitemap-information-to-preview", new Object[] {"<a target=\"_blank\" href=\"" + HtmlUtil.escapeAttribute(publicSitemapUrl) + "\">", "</a>"}, false) %>

	<ul>
		<li>
			<a href="#" onclick='javascript:confirmSitemapSubmission("http://www.google.com/webmasters/sitemaps/ping?sitemap=" + "<%=HtmlUtil.escapeURL(publicSitemapUrl)%>");return false;' target="_blank" title='<liferay-ui:message key="opens-new-window" />'>Google<span class="opens-new-window-accessible"/></a>
		</li>
		<li>
			<a href="#" onclick='javascript:confirmSitemapSubmission("https://siteexplorer.search.yahoo.com/submit/ping?sitemap=" + "<%=HtmlUtil.escapeURL(publicSitemapUrl)%>");return false;' target="_blank" title='<liferay-ui:message key="opens-new-window" />'>Yahoo!<span class="opens-new-window-accessible"/></a> (<liferay-ui:message key="requires-login" />)
		</li>
	</ul>
</aui:fieldset>

<aui:fieldset label="private-pages">
	<%= LanguageUtil.format(request, "send-sitemap-information-to-preview", new Object[] {"<a target=\"_blank\" href=\"" + HtmlUtil.escapeAttribute(privateSitemapUrl) + "\">", "</a>"}, false) %>

	<ul>
		<li>
			<a href="#" onclick='javascript:confirmSitemapSubmission("http://www.google.com/webmasters/sitemaps/ping?sitemap=" + "<%=HtmlUtil.escapeURL(privateSitemapUrl)%>");return false;' target="_blank" title='<liferay-ui:message key="opens-new-window" />'>Google<span class="opens-new-window-accessible"/></a>
		</li>
		<li>
			<a href="#" onclick='javascript:confirmSitemapSubmission("https://siteexplorer.search.yahoo.com/submit/ping?sitemap=" + "<%=HtmlUtil.escapeURL(privateSitemapUrl)%>");return false;' target="_blank" title='<liferay-ui:message key="opens-new-window" />'>Yahoo!<span class="opens-new-window-accessible"/></a> (<liferay-ui:message key="requires-login" />)
		</li>
	</ul>
</aui:fieldset>
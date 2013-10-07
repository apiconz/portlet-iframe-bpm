<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page import="javax.portlet.*"%>
<portlet:defineObjects />
<%
	//Portlet namespace
	String portletNS = renderResponse.getNamespace(); 
	String urlJS = renderResponse.encodeURL(renderRequest.getContextPath()+"/js/portletiframe.js"); 
	String taskID = request.getParameter("taskID");
	String srcIFrame = "about:blank";
	if(request.getParameter("taskID") != null && !request.getParameter("taskID").isEmpty()){
		srcIFrame = "http://wp8.onp.gob.pe:80/teamworks/process.lsw?zWorkflowState=1&amp;zTaskId=" + taskID;
	}

%>
 
<script type="text/javascript" src="<%=urlJS%>">
<!--
//-->
</script>
<iframe id="iframeX"
	src="<%=srcIFrame %>"
	name="lombardicoach" style="width: 100%; height: 500px;" onload="javascript:detectHumanServiceHasFinished(this, humanServiceHasFinished)"
	 frameborder="0"></iframe>
	 
<form id="formIframe" action="<portlet:actionURL/>" method="post">
	<input type="hidden" name="h545j" value="ndh56" >
</form>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page import="javax.portlet.*"%>
<portlet:defineObjects />
<%
	//Portlet namespace
	String portletNS = renderResponse.getNamespace(); 
String url = renderResponse.encodeURL(renderRequest.getContextPath()+"/WEB-INF/js/portletiframe.js"); 
%>


<script  type="text/JavaScript" src="<%=request.getContextPath()%>/js/portletiframe.js"></script>

<iframe
	src="http://wp8.onp.gob.pe/teamworks/process.lsw?zWorkflowState=1&amp;zTaskId=<%=request.getParameter("taskID") %>"
	name="lombardicoach" style="width: 100%; height: 500px;" onload="javascript:detectHumanServiceHasFinished(this, humanServiceHasFinished)"
	 frameborder="0"></iframe>
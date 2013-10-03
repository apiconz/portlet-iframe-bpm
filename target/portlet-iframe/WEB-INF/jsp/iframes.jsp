<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ page import="javax.portlet.*"%>
<portlet:defineObjects />
<%
	//Portlet namespace
	String portletNS = renderResponse.getNamespace();
%>
<script type="text/javascript">
<!--
function humanServiceHasFinished(iframe) {
    //setting the iframe src attribute does not survive a full page refresh
    //but is enough to prove the concept
    iframe.src = 'about:blank';
    alert("Human service has finished");
}

function detectHumanServiceHasFinished(iframe, callback) {
    alert("Human service has finished");
    //get the embedded document's body
    var cw = iframe.contentWindow;

    var y=(cw.contentWindow || cw.contentDocument);
    var body = y.document.body;

    
    var p = null;
    var hasScript = false;
    var hasOtherTag = false; 
    
    //iterate over all child nodes of the body node
    for (var i=0; i<body.childNodes.length; i++) {
        var node = body.childNodes[i];
        
        //we're only interested in element nodes
        if (node.nodeType == 1) { 
            if (p == null && node.nodeName.toUpperCase() == 'P') {
                //if this is the first <p> tag, store its reference
                p = node;
            } else if (p != null && !hasScript 
                                 && node.nodeName.toUpperCase() == 'SCRIPT') {
                //if this is the first script tag, set a flag
                hasScript = true;
            } else {
                //in any other case (second p or script tag, other tags, ...), set a flag
                hasOtherTag = true;
            }
        }
    }

    //if the body contents themselves seem legit,
    //let's look at the content of the paragraph
    if (p != null && hasScript && ! hasOtherTag) {
        var b = null;
        for (var i=0; i<p.childNodes.length; i++) {
            var node = p.childNodes[i];

            //once again, we're only interested in element nodes
            if (node.nodeType == 1) {
                if (b == null && node.nodeName.toUpperCase() == 'B') {
                //if this is the first occurrence of <b>
                    b = node;
                } else {
                    hasOtherTag = true;
                }
            }
        }

        //if both the body and the p tag have the right contents,
        //invoke the provided callback function 
        if (b != null && ! hasOtherTag) {
            callback(iframe);
        }
    }
      
    return true;
}			

var coachFrame = document.getElementsByName("lombardicoach");
coachFrame.setAttribute('onLoad','detectHumanServiceHasFinished(this, humanServiceHasFinished)');
//-->
</script>


<iframe
	src="http://bpm8.onp.gob.pe:9080/teamworks/process.lsw?zWorkflowState=1&amp;zTaskId=307"
	name="lombardicoach" style="width: 100%; height: 500px;" onload="javascript:detectHumanServiceHasFinished(this, humanServiceHasFinished)"
	 frameborder="0"></iframe>
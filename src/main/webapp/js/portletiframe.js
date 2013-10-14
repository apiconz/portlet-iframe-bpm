
function detectHumanServiceHasFinished(iframe, callback) {
 console.log("SE EJECUTA DETECCION DE HUMAN SERVICE FINALIZADO");	
 
 var inter = window.setInterval(function() {
    if (iframe.contentWindow.document.readyState === "complete") {
	 //get the embedded document's body
    var body = iframe.contentWindow.document.body;
	console.log("BODY:: "+body);	
    var p = null;
    var hasScript = false;
    var hasOtherTag = false; 
    
    //iterate over all child nodes of the body node
    for (var i=0; i<body.childNodes.length; i++) {
        var node = body.childNodes[i];
        console.log("node.nodeName.toUpperCase()"+node.nodeName.toUpperCase());
        //we're only interested in element nodes
        if (node.nodeType == 1) { 
            if (p == null && node.nodeName.toUpperCase() == 'P') {
                //if this is the first <p> tag, store its reference
                p = node;
				console.log("value p:"+p.value);
            } else if (p != null  
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
					console.log("value:"+b.value);
					console.log("value:"+b);
                } else {
                    hasOtherTag = true;
                }
            }
        }

        //if both the body and the p tag have the right contents,
        //invoke the provided callback function 
		console.log("b: "+b);
		console.log("hasOtherTag"+hasOtherTag);
        if (b != null && ! hasOtherTag) {
            callback(iframe);
        }
    }
      window.clearInterval(inter);
      // grab the content of the iframe here
    }
}, 100);
   
      
    return true;
}	



				
function humanServiceHasFinished(iframe) {
	console.log("HUMAN SERVICE FINALIZADO");	
    iframe.src = 'about:blank';
    document.getElementById("formIframe").submit();
}

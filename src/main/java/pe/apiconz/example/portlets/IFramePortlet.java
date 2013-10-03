package pe.apiconz.example.portlets;

import java.io.IOException;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

public class IFramePortlet extends GenericPortlet {
	private static final String JSP_ACTIONS = "/WEB-INF/jsp/iframes.jsp";

	@Override
	protected void doView(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		
			getPortletContext().getRequestDispatcher(JSP_ACTIONS).include(
					request, response);

	}
}

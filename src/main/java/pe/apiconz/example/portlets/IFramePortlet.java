package pe.apiconz.example.portlets;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Event;
import javax.portlet.EventRequest;
import javax.portlet.EventResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.json.JSONException;
import org.json.JSONObject;

public class IFramePortlet extends GenericPortlet {
	private static final String JSP_ACTIONS = "/WEB-INF/jsp/iframes.jsp";

	@Override
	protected void doView(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {

		getPortletContext().getRequestDispatcher(JSP_ACTIONS).include(request,
				response);

	}

	@Override
	public void processAction(ActionRequest request, ActionResponse response)
			throws PortletException, IOException {

		response.setEvent("refresh", "refresh");
	}

	@Override
	public void processEvent(EventRequest request, EventResponse response)
			throws PortletException, IOException {
		Event event = request.getEvent();
		if (event.getName().equals("TaskSelection")) {
			System.out.println("recibio el evento requestEvent:"
					+ event.getName());
			String requestEventData = event.getValue().toString();

			// Tratar dato recibido
			// {"TaskID":"358","ProviderID":"tpi1378833781728"}
			String taskID = "";
			try {
				JSONObject jsonObject = new JSONObject(requestEventData);
				taskID = jsonObject.getString("TaskID");
			} catch (JSONException e) {
				System.out
						.println("Se produjo un error obteniendo el taskID del evento recibido");
			}

			response.setRenderParameter("taskID", taskID);
		}

	}
}

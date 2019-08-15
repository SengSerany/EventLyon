module EventsHelper
		def current_event
		Event.find(params[:id])
	end
end

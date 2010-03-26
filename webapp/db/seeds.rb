%w( manage_entities
		merge_people
		merge_places
		manage_locales
		create_event
		view_event
		update_event
		route_event_to_any_lhd
		accept_event_for_lhd
		route_event_to_investigator
		accept_event_for_investigation
		investigate_event
		approve_event_at_lhd
		approve_event_at_state
		administer
		assign_task_to_user
		add_form_to_event
		remove_form_from_event
		access_avr
		manage_staged_message
		write_staged_message
).each do |p|
  Privilege.create(:priv_name => p)
end
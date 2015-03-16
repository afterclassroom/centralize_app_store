class RegistrationsController < Devise::RegistrationsController
	layout :resolve_layout

	def update
		self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
		prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

		resource_updated = update_resource(resource, account_update_params)
		yield resource if block_given?
		if resource_updated
			if is_flashing_format?
				flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
				:update_needs_confirmation : :updated
				set_flash_message :notice, flash_key
			end
			sign_in resource_name, resource, bypass: true
			redirect_to edit_user_registration_path, :alert => "Change password successfull"
		else
			clean_up_passwords resource
			redirect_to edit_user_registration_path, :alert => "Change password failed"
		end
	end

	private

	def resolve_layout
		case action_name
		when "edit", "update"
			"developer"
		else
			"application"
		end
	end
end

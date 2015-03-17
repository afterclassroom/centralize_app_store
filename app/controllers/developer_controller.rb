class DeveloperController < ApplicationController
	layout "developer"

	before_filter :authenticate_user!, except: [:index, :document, :blog, :partners]

	def index

	end

	def document

	end

	def app_list
		@apps = Application.where(:user_id => current_user.id)
	end

	def app_new

	end

	def app_create
		@application = Application.new
		@application.user_id = current_user.id
		@application.name = params[:application][:name]
		@application.description = params[:application][:description]
		@application.website = params[:application][:website]
		@application.callback_url = params[:application][:callback_url]
		@application.state = 'waiting'

		@application.app_key   = Application.generate_unique_app_key
    	@application.app_secret = SecureRandom.hex(16)

		@application.save

		redirect_to action: 'app_list'
	end

	def app_edit
		if params[:id]
			@application = Application.where(:user_id => current_user.id, :id => params[:id]).first

			if !@application
				redirect_to action: 'app_list'
			end
		else
			redirect_to action: 'app_list'
		end
	end

	def app_update
		if params[:application][:id]
			@application = Application.where(:user_id => current_user.id, :id => params[:application][:id]).first

			if @application
				@application.name = params[:application][:name]
				@application.description = params[:application][:description]
				@application.website = params[:application][:website]
				@application.callback_url = params[:application][:callback_url]
				@application.save

				if params[:application][:image]
					at_file = AttachFile.create(user: current_user)
					at_file.file = params[:application][:image]

					if at_file.save
						@application.make_icon(at_file)
					end
				end
			end
			redirect_to action: 'app_edit', :id => params[:application][:id], :callback => params[:callback]
		else
			redirect_to action: 'app_list'
		end
	end

	def app_update_slide
		if params[:application][:id]
			@application = Application.where(:user_id => current_user.id, :opro_client_app_id => params[:application][:id]).first

			if @application
				if params[:application][:slide]
					slide = AttachFile.create(user: current_user)
					slide.file = params[:application][:slide]

					if slide.save
						@application.make_slide(slide.file.url, 'image')
					end
				end

				if params[:application][:youtube]
					@application.make_slide(params[:application][:youtube], 'link', params[:application][:youtube_image])
				end
			end
			redirect_to action: 'app_edit', :id => params[:application][:id], :callback => params[:callback]
		else
			redirect_to action: 'app_list'
		end
	end

	def app_delete
		if params[:id]
			@application = Application.where(:user_id => current_user.id, :id => params[:id]).first
			@application.destroy
		end

		if params[:callback]
			redirect_to action: 'app_edit', :id => params[:id], :callback => params[:callback]
		else
			redirect_to action: 'app_list'
		end
	end

	def app_publish
		if params[:id]
			@application = Application.where(:user_id => current_user.id, :id => params[:id]).first

			@selected_category = []
			if @application.app_categories
				@application.app_categories.each do |c|
					@selected_category << c.category_id
				end
			end

			if !@application
				redirect_to action: 'app_list'
			end
		else
			redirect_to action: 'app_list'
		end
	end

	def app_update_publish
		if params[:application][:id]
			@application = Application.where(:user_id => current_user.id, :id => params[:application][:id]).first

			if @application
				@application.name = params[:application][:name]
				@application.description = params[:application][:description]
				@application.design_for = params[:application][:designed]
				@application.teacher_url = params[:application][:teacher_url]
				@application.student_url = params[:application][:student_url]
				@application.parent_url = params[:application][:parent_url]
				@application.help_url = params[:application][:help_url]
				@application.tem_url = params[:application][:tem_url]
				@application.privacy_url = params[:application][:privacy_url]
				@application.state = 'published'

				if params[:application][:price] != "" && params[:application][:price] != 0
					@application.price = params[:application][:price]
					@application.is_free = false
				end

				if @application.save
					cats = []
					if params[:application][:category]
						params[:application][:category].each do |c|
							cats << {:application_id => @application.id, :category_id => c}
						end
						@application.app_categories.delete_all
						AppCategory.create(cats)
					end

					notification = AppNotification.new
					notification.application_id = @application.id
					notification.state = 'published'
					notification.save
				end
			end
			redirect_to action: 'app_list'
		else
			redirect_to action: 'app_list'
		end
	end

	def app_unpublish
		if params[:id]
			@application = Application.where(:user_id => current_user.id, :id => params[:id]).first

			if !@application
				redirect_to action: 'app_list'
			end
		else
			redirect_to action: 'app_list'
		end
	end

	def app_update_unpublish
		if params[:application][:id]
			@application = Application.where(:user_id => current_user.id, :id => params[:application][:id]).first
			if @application
				@application.state = 'unpublished'

				if @application.save
					notification = AppNotification.new
					notification.application_id = @application.id
					notification.state = 'unpublished'
					notification.description = params[:application][:description]
					notification.save
				end
			end
		end
		redirect_to action: 'app_list'
	end

	def blog

	end

	def partners

	end

end

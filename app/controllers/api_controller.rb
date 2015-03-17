class ApiController < ApplicationController

	def classrooms

		render json: 'classrooms ok'
	end

	def classrooms_students

		render json: 'classrooms students ok'
	end

	def classrooms_parents

		render json: 'classrooms parents ok'
	end

	def users
		access_token = params[:access_token]
		lms = get_lms(access_token)
		if lms
			lms_domain = lms.domain
			url = "http://" + lms_domain + CENTRALIZE_APP_URL + "me"
			response = HTTParty.get(url,
				body: {
					user_id: params[:user_id],
					access_token: access_token
					},
					headers: {
						"Host" => DOMAIN
						},
						timeout: 600
						)
			render json: response
		else
			render :json => {
				:meta => {
					message: 'Could not find this lms.'
				}
			}
		end
	end

	def users_search
		render json: 'users search ok'
	end

	def users_my_classrooms

		render json: 'users my_classrooms ok'
	end

	def users_my_yearbooks

		render json: 'users my_yearbooks ok'
	end

	private
	def get_lms(access_token)
		Lm.find_by_access_token(access_token)
	end
end

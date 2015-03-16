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
		url = CENTRALIZE_APP_URL + "me"
		response = HTTParty.get(url,
			body: {
				access_token: access_token
				},
			headers: {
				"Host" => DOMAIN
			},
			timeout: 600
		)
		render json: response
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
end

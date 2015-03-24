class ApiController < ApplicationController
	rescue_from Exception, :with => :error_response

	def classrooms
		lm_id = params[:lms_id]
		lms = get_lms(lm_id)
		if lms
			lms_domain = lms.domain
			url = "http://" + lms_domain + CENTRALIZE_APP_URL + "classrooms"
			response = HTTParty.get(url,
				body: {
					page: params[:page],
					per_page: params[:per_page],
					id: params[:id],
					access_token: lms.access_token
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

	def classrooms_students
		lm_id = params[:lms_id]
		lms = get_lms(lm_id)
		if lms
			lms_domain = lms.domain
			url = "http://" + lms_domain + CENTRALIZE_APP_URL + "classrooms_students"
			response = HTTParty.get(url,
				body: {
					page: params[:page],
					per_page: params[:per_page],
					id: params[:id],
					access_token: lms.access_token
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

	def classrooms_parents
		lm_id = params[:lms_id]
		lms = get_lms(lm_id)
		if lms
			lms_domain = lms.domain
			url = "http://" + lms_domain + CENTRALIZE_APP_URL + "classrooms_parents"
			response = HTTParty.get(url,
				body: {
					page: params[:page],
					per_page: params[:per_page],
					id: params[:id],
					access_token: lms.access_token
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

	def users
		lm_id = params[:lms_id]
		lms = get_lms(lm_id)
		if lms
			lms_domain = lms.domain
			url = "http://" + lms_domain + CENTRALIZE_APP_URL + "me"
			response = HTTParty.get(url,
				body: {
					user_id: params[:user_id],
					access_token: lms.access_token
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
		lm_id = params[:lms_id]
		lms = get_lms(lm_id)
		if lms
			lms_domain = lms.domain
			url = "http://" + lms_domain + CENTRALIZE_APP_URL + "users_search"
			response = HTTParty.get(url,
				body: {
					key_word: params[:key_word],
					access_token: lms.access_token
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

	def users_my_classrooms
		lm_id = params[:lms_id]
		lms = get_lms(lm_id)
		if lms
			lms_domain = lms.domain
			url = "http://" + lms_domain + CENTRALIZE_APP_URL + "my_classrooms"
			response = HTTParty.get(url,
				body: {
					user_id: params[:user_id],
					access_token: lms.access_token
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

	def users_my_yearbooks
		lm_id = params[:lms_id]
		lms = get_lms(lm_id)
		if lms
			lms_domain = lms.domain
			url = "http://" + lms_domain + CENTRALIZE_APP_URL + "my_yearbooks"
			response = HTTParty.get(url,
				body: {
					user_id: params[:user_id],
					access_token: lms.access_token
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

	protected
	def error_response(exception)
		render :json => {
			:meta => {
				message: exception.message
			}
		}
	end

	private
	def get_lms(lm_id)
		Lm.find(lm_id)
	end
end

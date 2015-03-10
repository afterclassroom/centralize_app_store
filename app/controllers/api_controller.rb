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

		render json: 'users me ok'
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

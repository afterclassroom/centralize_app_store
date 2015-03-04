class CreateLms < ActiveRecord::Migration
	def change
		create_table :lms do |t|
			t.string :name
			t.string :domain
			t.string :access_token
			t.timestamps
		end
	end
end

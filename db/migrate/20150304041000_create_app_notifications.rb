class CreateAppNotifications < ActiveRecord::Migration
	def change
		create_table :app_notifications do |t|
			t.belongs_to :application
			t.text   :description
			t.string :state
			t.timestamps
		end
	end
end

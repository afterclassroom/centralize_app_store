class CreateUserNotifications < ActiveRecord::Migration
	def change
		create_table :user_notifications do |t|
			t.belongs_to :paypal_notification
			t.belongs_to :user
			t.belongs_to :application
			t.timestamps
		end
	end
end

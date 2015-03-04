class CreateUserPaypalLogs < ActiveRecord::Migration
	def change
		create_table :user_paypal_logs do |t|
			t.belongs_to :user_paypal
			t.decimal   :amount
			t.text   :description
			t.timestamps
		end
	end
end

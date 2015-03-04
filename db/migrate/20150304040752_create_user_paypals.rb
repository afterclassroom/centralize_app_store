class CreateUserPaypals < ActiveRecord::Migration
	def change
		create_table :user_paypals do |t|
			t.belongs_to :user
			t.decimal   :balance
			t.string   :email_paypal
			t.timestamps
		end
	end
end

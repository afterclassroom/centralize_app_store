class CreatePaypalNotifications < ActiveRecord::Migration
	def change
		create_table :paypal_notifications do |t|
			t.string   :txn_id
			t.string   :txn_type
			t.text   :params
			t.string   :payer_id
			t.timestamps
		end
	end
end

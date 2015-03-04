class CreateApplications < ActiveRecord::Migration
	def change
		create_table :applications do |t|
			t.belongs_to :user
			t.string   :name
			t.text     :description
			t.integer  :design_for
			t.integer  :type
			t.string   :teacher_url
			t.string   :student_url
			t.string   :parent_url
			t.string   :help_url
			t.string   :tem_url
			t.string   :privacy_url
			t.boolean  :is_free, :default => true
			t.decimal  :price, :default => 0
			t.string   :website
			t.string   :callback_url
			t.string   :state
			t.timestamps
		end
	end
end

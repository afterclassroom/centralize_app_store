class CreateAppInstalleds < ActiveRecord::Migration
	def change
		create_table :app_installeds do |t|
			t.belongs_to :user
			t.belongs_to :application
			t.integer   :classroom_id, :default => 0
			t.timestamps
		end
	end
end

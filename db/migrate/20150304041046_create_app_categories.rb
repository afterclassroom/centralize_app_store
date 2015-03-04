class CreateAppCategories < ActiveRecord::Migration
	def change
		create_table 'app_categories', :id => false do |t|
			t.belongs_to :application
			t.column :category_id, :integer
		end
	end
end

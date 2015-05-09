class AddUserIdToLms < ActiveRecord::Migration
  def change
  	add_column :lms, :user_id, :integer
  end
end

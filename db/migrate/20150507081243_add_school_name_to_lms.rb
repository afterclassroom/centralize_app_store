class AddSchoolNameToLms < ActiveRecord::Migration
  def change
  	add_column :lms, :school_name, :string
  end
end

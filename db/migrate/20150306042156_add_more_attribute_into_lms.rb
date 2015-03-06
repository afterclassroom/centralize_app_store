class AddMoreAttributeIntoLms < ActiveRecord::Migration
  def change
  	add_column :lms, :school_address, :string
  	add_column :lms, :school_telephone, :string
  	add_column :lms, :school_email, :string
  	add_column :lms, :admin_email, :string
  	add_column :lms, :admin_name, :string
  	add_column :lms, :principle_name, :string
  end
end

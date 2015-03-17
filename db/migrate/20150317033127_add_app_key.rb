class AddAppKey < ActiveRecord::Migration
  def change
  	add_column :applications, :app_key, :string
  	add_column :applications, :app_secret, :string
  end
end

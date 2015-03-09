class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.string :address
      t.string :domain
      t.string :slug
      t.belongs_to :user
      t.timestamps
    end
    add_index :user_profiles, :slug, unique: true
  end
end

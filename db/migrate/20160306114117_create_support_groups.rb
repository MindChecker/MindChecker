class CreateSupportGroups < ActiveRecord::Migration
  def change
    create_table :support_groups do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :website
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end

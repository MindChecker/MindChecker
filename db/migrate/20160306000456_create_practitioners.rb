class CreatePractitioners < ActiveRecord::Migration
  def change
    create_table :practitioners do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :website

      t.timestamps null: false
    end
  end
end

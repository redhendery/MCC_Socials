class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :bats
      t.string :bowls
      t.boolean :paid, default: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end

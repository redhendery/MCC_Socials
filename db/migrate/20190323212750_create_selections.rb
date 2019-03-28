class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.belongs_to :user, index: true
      t.belongs_to :schedule, index: true

      t.timestamps
    end
  end
end

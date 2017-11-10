class CreateAlarms < ActiveRecord::Migration[5.1]
  def change
    create_table :alarm do |t|
      t.string :name
      t.boolean :enabled
      t.time :time
      t.text :days

      t.timestamps
    end
  end
end

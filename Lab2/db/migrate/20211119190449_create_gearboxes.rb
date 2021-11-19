class CreateGearboxes < ActiveRecord::Migration[6.1]
  def change
    create_table :gearboxes do |t|
      t.string :name

      t.timestamps
    end
  end
end

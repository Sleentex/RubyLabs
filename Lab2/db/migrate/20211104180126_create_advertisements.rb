class CreateAdvertisements < ActiveRecord::Migration[6.1]
  def change
    create_table :advertisements do |t|
      t.references :gearbox, null: false, foreign_key: true
      t.string :name
      t.integer :year
      t.string :price
      t.string :distance
      t.string :fuel
      t.string :volume
      t.string :img_url

      t.timestamps
    end
  end
end

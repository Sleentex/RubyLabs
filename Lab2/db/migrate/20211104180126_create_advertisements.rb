class CreateAdvertisements < ActiveRecord::Migration[6.1]
  def change
    create_table :advertisements do |t|
      t.references :car_model, null: false, foreign_key: true
      t.integer :year
      t.float :price
      t.float :distance
      t.references :city, null: false, foreign_key: true
      t.boolean :was_in_accident
      t.string :img_url

      t.timestamps
    end
  end
end

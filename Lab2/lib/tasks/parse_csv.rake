require 'csv'

task parse_csv: :environment do
  csv_content = File.read('items.csv')
  csv         = CSV.parse(csv_content, :headers => true)
  csv.each do |row|
    city          = City.where(:name => row['location']).first_or_create
    brand         = Brand.where(:name => row['brand']).first_or_create
    model         = CarModel.where(:brand_id => brand.id, :name => row['model']).first_or_create
    Advertisement.create(
      :city_id         => city.id,
      :car_model_id    => model.id,
      :year            => row['year'],
      :price           => row['price'],
      :distance        => row['distance'],
      :img_url         => row['img_url'],
      :was_in_accident => row['was_in_accident'],
    )
  end
end

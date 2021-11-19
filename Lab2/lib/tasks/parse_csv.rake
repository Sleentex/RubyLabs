require 'csv'

task parse_csv: :environment do
  csv_content = File.read('items.csv')
  csv         = CSV.parse(csv_content, headers: true)
  csv.each do |row|
    gearbox = Gearbox.where(name: row['gearbox']).first_or_create

    Advertisement.create(
      gearbox_id: gearbox.id,
      name: row['name'],
      year: row['year'],
      price: row['price'],
      distance: row['distance'],
      fuel: row['fuel'],
      volume: row['volume'],
      img_url: row['img_url']
    )
  end
end

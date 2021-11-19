class Advertisement < ApplicationRecord
  belongs_to :car_model
  belongs_to :city
end

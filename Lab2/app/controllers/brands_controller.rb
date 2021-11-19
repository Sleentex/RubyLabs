class BrandsController < ApplicationController
  def get_models
    render json: CarModel.where(:brand_id => params[:brand_id])
  end
end

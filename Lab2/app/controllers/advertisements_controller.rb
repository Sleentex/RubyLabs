class AdvertisementsController < ApplicationController
  def index
    @gearboxes = Gearbox.all
    advertisements = Advertisement.joins(:gearbox)

    @search = request.params[:search]
    unless @search.blank?
      advertisements.where!("advertisements.name like ?", "%#{@search}%")
    end

    @gearboxes_params = request.params[:gearboxes]
    unless @gearboxes_params.blank?
      advertisements.where!(:gearbox => { :id => @gearboxes_params })
    end

    @advertisements = advertisements
  end

  def show
  end

  def new

  end

  def edit
  end
end

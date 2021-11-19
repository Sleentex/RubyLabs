class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def getAll

  end
end


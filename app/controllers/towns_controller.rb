class TownsController < ApplicationController
  def create
    town = town_facade.create_town(params)

    redirect_to user_campaign_towns_path(user_id: params[:user_id], id: params[:id])
  end

  def index
    @towns = town_facade.get_towns(params)
  end

  private 
  def town_facade
    TownFacade.new(params[:id])
  end
end
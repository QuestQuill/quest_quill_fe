class CampaignsController < ApplicationController
  def new
    @themes = %i[sci-fi fantasy high_magic low_magic space_opera slice_of_life gods_and_monsters lovecraftian survival_situation]
  end

  def create
    campaign = facade.create_campaign(campaign_params) 
  end

  def campaign_params
    params.permit(:name, :player_num, themes: [])
  end

  def facade
    CampaignFacade.new(params[:id])
  end
end


class CampaignsController < ApplicationController
  def new
    @themes = %i[sci-fi fantasy high_magic low_magic space_opera slice_of_life gods_and_monsters lovecraftian survival_situation]
  end

  def create
    campaign = facade.create_campaign(campaign_params) 
    if !campaign.nil?
      redirect_to user_path(user.id)
    else
      flash[:error] = "Your campaign could not be created, please try again."
      redirect_to new_user_campaign_path
    end
  end

  def campaign_params
    params.permit(:name, :player_num, themes: [])
  end

  def facade
    CampaignFacade.new(params[:id])
  end
end


class CampaignsController < ApplicationController
  def new
    @themes = %i[sci_fi fantasy high_magic low_magic space_opera slice_of_life gods_and_monsters lovecraftian survival_situation]
  end

  def create
    campaign = facade.create_campaign(campaign_params) 
    if !campaign.nil?
      redirect_to user_path(params[:user_id])
    else
      flash[:error] = "Your campaign could not be created, please try again."
      redirect_to new_user_campaign_path
    end
  end

  def show
    @campaign =  facade.campaign(campaign_params)
    @user_id = campaign_params[:user_id]
  end

  def campaign_params
    params.permit(:id, :name, :player_num, :user_id, themes: [])
  end

  def facade
    CampaignFacade.new(params[:id])
  end
end


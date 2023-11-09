class QuestsController < ApplicationController
  def create
    quest = quest_facade.create_quest(params)

    redirect_to user_campaign_quests_path(user_id: params[:user_id], id: params[:id])
  end

  def index
    @quests = quest_facade.get_quests(params)
  end

  private

  def quest_facade
    QuestFacade.new(params[:id])
  end
end
class NpcsController < ApplicationController
  def create
    npc = npc_facade.create_npc(params)

    redirect_to user_campaign_npcs_path(user_id: params[:user_id], id: params[:id])
  end

  def index
    @npcs = npc_facade.get_npcs(params)
  end

  private

  def npc_facade
    NpcFacade.new(params[:id])
  end
end
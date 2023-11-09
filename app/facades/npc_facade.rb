class NpcFacade
  def initialize(npc)
    @npc = npc
  end

  def create_npc(params)
    json = service.post_npc(params)

    Npc.new(json[:data])
  end

  def get_npcs(params)
    json = service.get_npcs(params)

    npcs = json[:data].map do |npc_data|
      Npc.new(npc_data)
    end
  end

  private

  def service
    DndService.new
  end
end
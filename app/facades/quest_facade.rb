class QuestFacade
  def initialize(quest)
    @quest = quest
  end

  def create_quest(params)
    json = service.post_quest(params)

    Npc.new(json[:data])
  end

  def get_quests(params)
    json = service.get_quests(params)

    quests = json[:data].map do |quest_data|
      Quest.new(quest_data)
    end
  end

  private

  def service
    DndService.new
  end
end
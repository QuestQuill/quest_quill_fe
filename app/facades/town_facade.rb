class TownFacade
  def initialize(town)
    @town = town
  end

  def create_town(params)
    json = service.post_town(params)
    Town.new(json[:data])
  end

  def get_towns(params)
    json = service.get_towns(params)

    towns = json[:data].map do |town_data|
      Town.new(town_data)
    end
  end

  private 
  def service 
    DndService.new
  end
end
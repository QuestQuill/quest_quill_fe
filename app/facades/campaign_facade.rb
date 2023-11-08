class CampaignFacade
  def initialize(campaign)
    @campaign = campaign
  end
  
  def create_campaign(params)
    json = service.post_campaign(params)
    
    if !json.nil?
     Campaign.new(json[:data])
    else
      nil
    end
  end

  def campaign(campaign)
    json = service.get_campaign(campaign)
    Campaign.new(json[:data])
  end

  def service
    DndService.new
  end
end
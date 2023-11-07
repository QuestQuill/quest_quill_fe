class CampaignFacade
  def initialize(campaign)
    @campaign = campaign
  end
  
  def create_campaign(params)
    json = service.post_campaign(params)
    
    if !json.nil?
     Campaign.new(json)
    else
      nil
    end
  end


  def service
    DndService.new
  end
end
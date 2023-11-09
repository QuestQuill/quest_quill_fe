require "rails_helper"

RSpec.describe NpcFacade do
  describe "instance methods" do
    describe "#create_npc" do
      it "returns npc object from creating a new npc" do
        VCR.use_cassette("DO_NO_DELETE_npc_create_facade_boo") do
          params = {
            user_id: "22",
            campaign_id: "4"
          }

          npc = NpcFacade.new(nil).create_npc(params)

          expect(npc).to be_a(Npc)
          expect(npc.id).to be_a(String)
          expect(npc.name).to be_a(String)
          expect(npc.description).to be_a(String)
          expect(npc.gender).to be_a(String)
          expect(npc.race).to be_a(String)
          expect(npc.klass).to be_a(String)
          expect(npc.attitude).to be_a(String)
          expect(npc.campaign_id).to be_a(Integer)
        end
      end
    end

    describe "#get_npcs" do
      it "returns all npcs objects from a campaign" do
        VCR.use_cassette("get_npcs_bob_facade") do
          params = {
            user_id: "1",
            campaign_id: "2"
          }

          npcs = NpcFacade.new(nil).get_npcs(params)

          expect(npcs).to be_an(Array)

          npc = npcs.first

          expect(npc).to be_a(Npc)
          expect(npc.id).to be_a(String)
          expect(npc.name).to be_a(String)
          expect(npc.description).to be_a(String)
          expect(npc.gender).to be_a(String)
          expect(npc.race).to be_a(String)
          expect(npc.klass).to be_a(String)
          expect(npc.attitude).to be_a(String)
          expect(npc.campaign_id).to be_a(Integer)
        end
      end
    end
  end
end
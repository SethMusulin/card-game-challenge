module Api
  class HandsController < ApplicationController
    def deal
    deal = Deal.where(winner:nil).sample
    deal.determine_winner
    render json: DealSerializer.new(deal).serialized_json
    end

    def deals
      deals = Deal.where.not(winner:nil)
      render json: DealSerializer.new(deals).serialized_json
    end
  end
end

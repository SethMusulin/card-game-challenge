module Api
  class DealsController < ApplicationController
    def deals
      deals = Deal.all
      render json: DealSerializer.new(deals).serialized_json
    end

    def deal
      count = Deal.count
      random_offset = rand(count)
      deal  = Deal.offset(random_offset).first
      render json: DealSerializer.new(deal).serialized_json
    end
  end
end

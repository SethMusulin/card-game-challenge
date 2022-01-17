module Api
  class HandsController < ApplicationController
    def index
    deal = Deal.all.sample
    deal.determine_winner
      render json: DealSerializer.new(deal).serialized_json
    end

    def show
    end
  end
end

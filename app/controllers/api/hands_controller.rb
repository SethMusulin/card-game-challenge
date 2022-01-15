module Api
  class HandsController < ApplicationController
    def index
    hand = Hand.all.sample
      render json: HandSerializer.new(hand).serialized_json
    end

    def show
    end
  end
end

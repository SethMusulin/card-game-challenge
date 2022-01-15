class TablesController < ApplicationController
  def home
    @hands = Hand.all
  end
end

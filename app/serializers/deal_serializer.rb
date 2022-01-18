class DealSerializer
  include FastJsonapi::ObjectSerializer
  attributes :winner, :player_1, :player_2
end

class DealsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :winner, :player_1, :player_2
end
class HandSerializer
  include FastJsonapi::ObjectSerializer
  attributes :winner, :player_1, :player_2
end

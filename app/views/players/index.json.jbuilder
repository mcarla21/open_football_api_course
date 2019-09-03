# frozen_string_literal: true

json.array! @players do |player|
  json.partial! 'player', player: player
end
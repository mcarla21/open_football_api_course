# frozen_string_literal: true

json.extract! player, :id, :name, :age
json.set! :team do
  json.set! :id, player.team&.id
  json.set! :name, player.team&.name
end
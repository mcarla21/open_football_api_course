# frozen_string_literal: true

json.extract! manager, :id, :first_name, :last_name, :age, :description
json.set! :team do
  json.set! :id, manager.team&.id
  json.set! :name, manager.team&.name
end

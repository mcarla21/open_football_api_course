# frozen_string_literal: true

json.array! @teams do |team|
  json.partial! 'team', team: team
end

# frozen_string_literal: true

namespace :fancy do
  desc 'Short but fancy description of what this tasks does'

  task do_some_fancy_things: :environment do
    puts '========== do_some_fancy_things task has just started =========='

    created = 0
    1000.times do
      team_name = Faker::Sports::Football.team
      team = Team.new(name: team_name)
      if team.save
        created += 1
      else
        puts "#{team.errors.full_messages}. Team name: #{team_name}"
      end
    end

    puts '========== task ended successfully ==========='
    puts "Teams created: #{created}"
  end
end

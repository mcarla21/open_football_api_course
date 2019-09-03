# frozen_string_literal: true

class ImportTeamsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Do something later
    # import records from CSV

    puts 'job started'
    sleep 2
    puts 'job ended'
  end
end

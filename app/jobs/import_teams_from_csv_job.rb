require 'csv'
class ImportTeamsFromCsvJob < ApplicationJob
  queue_as :default

  def perform(data)
    puts 'job started'
    csv = CSV.new(data, headers: true, header_converters: :symbol, converters: :all)
    data = csv.to_a.map(&:to_hash)
    bulk_create(data)
    puts 'job done'
    CsvMailer.send_report(@created, @updated).deliver_later
  end

  private

  def bulk_create(json_data)
    @created = 0
    @updated = 0
    json_data.each do |entry|
      manager = construct_manager(entry)
      entry.except!(:manager_first_name, :manager_last_name, :manager_age)
      entry[:manager_attributes] = manager
      team = Team.find_by(name: entry[:name])
      if team.blank?
        team = Team.new(entry)
        @created += 1 if team.save
      elsif team.update(entry)
        @updated += 1
      end
    end
  end

  def construct_manager(entry)
    { "first_name": entry[:manager_first_name],
      "last_name": entry[:manager_last_name],
      "age": entry[:manager_age] }
  end
end
# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :set_team, only: %i[update show destroy download_logo multiple_sizes_of_logos]

  def index
    @teams = Team.all
    ImportTeamsJob.perform_later
    TeamMailer.send_report.deliver_later
  end

  def show
    head :not_found unless @team.present?
  end

  def download_logo
    # send_data(@team.logo.download, filename: 'logo.jpg')
    redirect_to rails_blob_url(@team.logos.first)
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      render :show, status: :created
    else
      handle_error(@team.errors)
    end
  end

  def update
    if @team.update(team_params)
      render :show
    else
      handle_error(@team.errors)
    end
  end

  def destroy
    if @team.destroy
      render :head
    else
      handle_error(@team.errors)
    end
  end

  def bulk_action
    data = File.read(bulk_params[:csv_file].path)
    ImportTeamsFromCsvJob.perform_later(data)
  end

  def multiple_sizes_of_logos
    @modified_logos = []
    @team.logos.each do |logo|
      @modified_logos << { logo_100: logo.variant(resize: '100x100'),
                           logo_600: logo.variant(resize: '600x600'),
                           logo_1024_768: logo.variant(resize: '1024x768') }
    end
  end

  private

  def permitted_params
    params.permit(:id)
  end

  def team_params
    params.require(:team).permit(:name,
                                 :abbreviation,
                                 logos: [],
                                 players_attributes: [:name, :age],
                                 manager_attributes: [:first_name, :last_name, :age])
  end

  def bulk_params
    params.permit(:csv_file)
  end

  def set_team
    @team = Team.find(permitted_params[:id])
  end
end

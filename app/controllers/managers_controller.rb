# frozen_string_literal: true

class ManagersController < ApplicationController
  before_action :set_manager, only: %i[show update]

  def index
    ImportTeamsJob.perform_later
    @managers = Manager.all
  end

  def show
    head :not_found if @manager.blank?
  end

  def create
    @manager = Manager.new(manager_params)

    if @manager.save
      render :show, status: :created
    else
      handle_error(@manager.errors)
    end
  end

  def update
    if @manager.update(manager_params)
      render :show, status: :created
    else
      handle_error(@manager.errors)
    end
  end

  private

  def manager_params
    params.require(:manager).permit(:first_name, :last_name, :age, :description, :team_id)
  end

  def set_manager
    @manager = Manager.find(params[:id])
  end
end

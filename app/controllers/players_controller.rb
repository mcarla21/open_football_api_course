# frozen_string_literal: true

class PlayersController < ApplicationController
  before_action :set_player, only: %i[show update destroy]
  def index
    @players = Player.all
  end

  def show
    head :not_found if @player.blank?
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      render :show, status: :created
    else
      handle_error(@player.errors)
    end
  end

  def update
    if @player.update(player_params)
      render :show, status: :created
    else
      handle_error(@player.errors)
    end
  end

  def destroy
    if @player.destroy
      render :head
    else
      handle_error(@player.errors)
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end
  
  def player_params
    params.require(:player).permit(:name, :age, :team_id)
  end
end

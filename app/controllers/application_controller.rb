# frozen_string_literal: true

class ApplicationController < ActionController::API
  def handle_error(errors)
    message = 'Record is not valid'
    render json: { message: message, errors: errors.full_messages }, status: :unprocessable_entity
  end
end

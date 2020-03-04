# frozen_string_literal: true

class Api::V1::AvatarsController < Api::V1::BaseController
  skip_before_action :doorkeeper_authorize!, only: :create

  def create
    avatar = Avatar.create!(avatar_params)

    render json: avatar
  end

  private

    def avatar_params
      params.permit(:image)
    end
end

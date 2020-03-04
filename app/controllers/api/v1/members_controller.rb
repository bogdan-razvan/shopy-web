# frozen_string_literal: true

class Api::V1::MembersController < Api::V1::BaseController
  # include Api::V1::UsersControllerDoc

  skip_before_action :doorkeeper_authorize!, only: :create

  def create
    member = Member.create!(member_params)

    render json: member, with_auth_tokens: true
  end

  private

    def member_params
      params.permit(
        :email, :password, :username,
        :fullname, :address, :phone, :birth_date
      )
    end
end

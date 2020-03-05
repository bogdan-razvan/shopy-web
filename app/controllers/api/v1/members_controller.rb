# frozen_string_literal: true

class Api::V1::MembersController < Api::V1::BaseController
  # include Api::V1::UsersControllerDoc

  skip_before_action :doorkeeper_authorize!, only: :create

  def current
    render json: current_member
  end

  def create
    member = Member.create!(member_params)

    render json: member, with_auth_tokens: true
  end

  def update
    current_member.update(member_params.except(:email, :username))

    render json: current_member
  end

  private

    def member_params
      params.permit(
        :email, :password, :username,
        :fullname, :address, :phone,
        :birth_date, :avatar_id
      )
    end
end

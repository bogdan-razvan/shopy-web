# frozen_string_literal: true

class Api::V1::SessionsController < Api::V1::BaseController
  # include Api::V1::SessionsControllerDoc

  skip_before_action :doorkeeper_authorize!, only: :create

  def index
    render json: current_user
  end

  def create
    member = Member.find_by(email: params[:email].downcase)

    if member&.authenticate(params[:password])
      render json: member, with_auth_tokens: true
    else
      render_error_message(I18n.t('errors.login'))
    end
  end

  def destroy
    doorkeeper_token.revoke

    head :ok
  end
end

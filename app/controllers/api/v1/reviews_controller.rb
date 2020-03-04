# frozen_string_literal: true

class Api::V1::ReviewsController < Api::V1::BaseController
  def create
    review = Review.create!(review_params.merge(member_id: current_member.id))

    render json: review
  end

  private

    def review_params
      params.permit(:product_id, :value, :comment)
    end
end

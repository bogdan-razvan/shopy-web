# frozen_string_literal: true

class Api::V1::ProductsController < Api::V1::BaseController
  def index
    render json: Product.includes(reviews: :members).all
  end

  def show
    render json: Product.find(params[:id])
  end
end

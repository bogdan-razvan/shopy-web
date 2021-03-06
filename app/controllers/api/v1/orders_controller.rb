# frozen_string_literal: true

class Api::V1::OrdersController < Api::V1::BaseController
  def index
    render current_member.orders
  end

  def create
    order_items = current_member.order_items.pending

    order = Order.create!(member: current_member)

    # rubocop:disable Rails/SkipsModelValidations
    order_items.update_all(status: :complete, order_id: order.id)
    # rubocop:enable Rails/SkipsModelValidations

    render json: order
  end
end

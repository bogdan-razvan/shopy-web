# frozen_string_literal: true

class Api::V1::OrderItemsController < Api::V1::BaseController
  def index
    order_items = current_member.order_items.pending

    serialized_items = ActiveModel::Serializer::CollectionSerializer.new(
      order_items,
      serializer: OrderItemSerializer,
      include: %w[accounting_notes bound_policies]
    )

    render json: {
      order_items: serialized_items,
      meta: { grand_total: order_items.sum(&:price) }
    }
  end

  def create
    order_item = OrderItem.create!(order_item_params.merge(member_id: current_member.id))

    render json: order_item
  end

  def update
    order_item = current_member.order_items.find(params[:id])
    order_item.update!(quantity: params[:quantity])

    render json: order_item
  end

  def destroy
    current_member.order_items.find(params[:id]).destroy!

    head :ok
  end

  private

    def order_item_params
      params.permit(:product_id, :quantity)
    end
end

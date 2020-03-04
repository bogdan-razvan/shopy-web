# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/show', type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
                                  name: 'Name',
                                  product_type: 'Product Type',
                                  description: 'MyText',
                                  stock: 2,
                                  price: 3.5
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Product Type/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
  end
end

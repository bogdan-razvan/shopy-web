# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    assign(:products, [
             Product.create!(
               name: 'Name',
               product_type: 'Product Type',
               description: 'MyText',
               stock: 2,
               price: 3.5
             ),
             Product.create!(
               name: 'Name',
               product_type: 'Product Type',
               description: 'MyText',
               stock: 2,
               price: 3.5
             )
           ])
  end

  it 'renders a list of products' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Product Type'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.5.to_s, count: 2
  end
end

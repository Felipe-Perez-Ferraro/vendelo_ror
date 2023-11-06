require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'List of products' do 
    get products_path
    
    assert_response :success
    assert_select '.product', 2
  end

  test 'Product details page' do
    get product_path(products(:ps4))

    assert_response :success
    assert_select '.title', 'ps4 slim'
    assert_select '.description' , 'ps4 slim buy now'
    assert_select '.price', '1500$'
  end

  test 'Product form page' do
    get new_product_path

    assert_response :success
    assert_select 'form'
  end

  test 'Create a new product' do
    post products_path, params: {
      product: {
        title: 'prod',
        description: 'prod desc',
        price: 1000
      }
    }

    assert_redirected_to products_path
  end
end

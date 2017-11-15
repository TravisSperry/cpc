# frozen_string_literal: true

require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  setup do
    @quote = quotes(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotes)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create quote' do
    assert_difference('Quote.count') do
      post :create, quote: { address_1: @quote.address_1, address_2: @quote.address_2, city: @quote.city, coating_requirements: @quote.coating_requirements, company_name: @quote.company_name, email: @quote.email, fax: @quote.fax, first_name: @quote.first_name, job_title: @quote.job_title, last_name: @quote.last_name, masking_requirements: @quote.masking_requirements, note: @quote.note, packaging_requirements: @quote.packaging_requirements, paint_specs: @quote.paint_specs, part_description: @quote.part_description, part_number: @quote.part_number, part_size: @quote.part_size, powder_color: @quote.powder_color, powder_product_code: @quote.powder_product_code, powder_product_manufacturer: @quote.powder_product_manufacturer, quantity_run: @quote.quantity_run, quantity_year: @quote.quantity_year, state: @quote.state, substrate: @quote.substrate, telephone: @quote.telephone, zip: @quote.zip }
    end

    assert_redirected_to quote_path(assigns(:quote))
  end

  test 'should show quote' do
    get :show, id: @quote
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @quote
    assert_response :success
  end

  test 'should update quote' do
    put :update, id: @quote, quote: { address_1: @quote.address_1, address_2: @quote.address_2, city: @quote.city, coating_requirements: @quote.coating_requirements, company_name: @quote.company_name, email: @quote.email, fax: @quote.fax, first_name: @quote.first_name, job_title: @quote.job_title, last_name: @quote.last_name, masking_requirements: @quote.masking_requirements, note: @quote.note, packaging_requirements: @quote.packaging_requirements, paint_specs: @quote.paint_specs, part_description: @quote.part_description, part_number: @quote.part_number, part_size: @quote.part_size, powder_color: @quote.powder_color, powder_product_code: @quote.powder_product_code, powder_product_manufacturer: @quote.powder_product_manufacturer, quantity_run: @quote.quantity_run, quantity_year: @quote.quantity_year, state: @quote.state, substrate: @quote.substrate, telephone: @quote.telephone, zip: @quote.zip }
    assert_redirected_to quote_path(assigns(:quote))
  end

  test 'should destroy quote' do
    assert_difference('Quote.count', -1) do
      delete :destroy, id: @quote
    end

    assert_redirected_to quotes_path
  end
end

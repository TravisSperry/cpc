require 'test_helper'

class QuoteRequestAttachmentsControllerTest < ActionController::TestCase
  setup do
    @quote_request_attachment = quote_request_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quote_request_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quote_request_attachment" do
    assert_difference('QuoteRequestAttachment.count') do
      post :create, quote_request_attachment: { attachment: @quote_request_attachment.attachment, quote_request_id: @quote_request_attachment.quote_request_id }
    end

    assert_redirected_to quote_request_attachment_path(assigns(:quote_request_attachment))
  end

  test "should show quote_request_attachment" do
    get :show, id: @quote_request_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quote_request_attachment
    assert_response :success
  end

  test "should update quote_request_attachment" do
    patch :update, id: @quote_request_attachment, quote_request_attachment: { attachment: @quote_request_attachment.attachment, quote_request_id: @quote_request_attachment.quote_request_id }
    assert_redirected_to quote_request_attachment_path(assigns(:quote_request_attachment))
  end

  test "should destroy quote_request_attachment" do
    assert_difference('QuoteRequestAttachment.count', -1) do
      delete :destroy, id: @quote_request_attachment
    end

    assert_redirected_to quote_request_attachments_path
  end
end

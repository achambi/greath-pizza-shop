require 'test_helper'

class Api::V1::TypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_type = api_v1_types(:one)
  end

  test "should get index" do
    get api_v1_types_url, as: :json
    assert_response :success
  end

  test "should create api_v1_type" do
    assert_difference('Api::V1::Type.count') do
      post api_v1_types_url, params: { api_v1_type: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_type" do
    get api_v1_type_url(@api_v1_type), as: :json
    assert_response :success
  end

  test "should update api_v1_type" do
    patch api_v1_type_url(@api_v1_type), params: { api_v1_type: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_type" do
    assert_difference('Api::V1::Type.count', -1) do
      delete api_v1_type_url(@api_v1_type), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class ObrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @obra = obras(:one)
  end

  test "should get index" do
    get obras_url
    assert_response :success
  end

  test "should get new" do
    get new_obra_url
    assert_response :success
  end

  test "should create obra" do
    assert_difference('Obra.count') do
      post obras_url, params: { obra: { descricao: @obra.descricao, local: @obra.local } }
    end

    assert_redirected_to obra_url(Obra.last)
  end

  test "should show obra" do
    get obra_url(@obra)
    assert_response :success
  end

  test "should get edit" do
    get edit_obra_url(@obra)
    assert_response :success
  end

  test "should update obra" do
    patch obra_url(@obra), params: { obra: { descricao: @obra.descricao, local: @obra.local } }
    assert_redirected_to obra_url(@obra)
  end

  test "should destroy obra" do
    assert_difference('Obra.count', -1) do
      delete obra_url(@obra)
    end

    assert_redirected_to obras_url
  end
end

require 'test_helper'

class AssociationsControllerTest < ActionController::TestCase
  setup do
    @association = associations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create association" do
    assert_difference('Association.count') do
      post :create, association: { address: @association.address, city: @association.city, email: @association.email, name: @association.name, phone: @association.phone, postal3: @association.postal3, postal4: @association.postal4, president: @association.president, short_name: @association.short_name, url: @association.url, user_id: @association.user_id }
    end

    assert_redirected_to association_path(assigns(:association))
  end

  test "should show association" do
    get :show, id: @association
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @association
    assert_response :success
  end

  test "should update association" do
    patch :update, id: @association, association: { address: @association.address, city: @association.city, email: @association.email, name: @association.name, phone: @association.phone, postal3: @association.postal3, postal4: @association.postal4, president: @association.president, short_name: @association.short_name, url: @association.url, user_id: @association.user_id }
    assert_redirected_to association_path(assigns(:association))
  end

  test "should destroy association" do
    assert_difference('Association.count', -1) do
      delete :destroy, id: @association
    end

    assert_redirected_to associations_path
  end
end

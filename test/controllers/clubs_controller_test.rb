require 'test_helper'

class ClubsControllerTest < ActionController::TestCase
  setup do
    @club = clubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create club" do
    assert_difference('Club.count') do
      post :create, club: { address: @club.address, association_id: @club.association_id, city: @club.city, email: @club.email, name: @club.name, phone: @club.phone, postal3: @club.postal3, postal4: @club.postal4, president: @club.president, short_name: @club.short_name, url: @club.url, user_id: @club.user_id }
    end

    assert_redirected_to club_path(assigns(:club))
  end

  test "should show club" do
    get :show, id: @club
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @club
    assert_response :success
  end

  test "should update club" do
    patch :update, id: @club, club: { address: @club.address, association_id: @club.association_id, city: @club.city, email: @club.email, name: @club.name, phone: @club.phone, postal3: @club.postal3, postal4: @club.postal4, president: @club.president, short_name: @club.short_name, url: @club.url, user_id: @club.user_id }
    assert_redirected_to club_path(assigns(:club))
  end

  test "should destroy club" do
    assert_difference('Club.count', -1) do
      delete :destroy, id: @club
    end

    assert_redirected_to clubs_path
  end
end

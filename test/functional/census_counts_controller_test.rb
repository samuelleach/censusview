require 'test_helper'

class CensusCountsControllerTest < ActionController::TestCase
  setup do
    @census_count = census_counts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:census_counts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create census_count" do
    assert_difference('CensusCount.count') do
      post :create, census_count: { area_id: @census_count.area_id, female: @census_count.female, male: @census_count.male, tot16to74: @census_count.tot16to74, totadult: @census_count.totadult, totemploy: @census_count.totemploy, totpop: @census_count.totpop }
    end

    assert_redirected_to census_count_path(assigns(:census_count))
  end

  test "should show census_count" do
    get :show, id: @census_count
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @census_count
    assert_response :success
  end

  test "should update census_count" do
    put :update, id: @census_count, census_count: { area_id: @census_count.area_id, female: @census_count.female, male: @census_count.male, tot16to74: @census_count.tot16to74, totadult: @census_count.totadult, totemploy: @census_count.totemploy, totpop: @census_count.totpop }
    assert_redirected_to census_count_path(assigns(:census_count))
  end

  test "should destroy census_count" do
    assert_difference('CensusCount.count', -1) do
      delete :destroy, id: @census_count
    end

    assert_redirected_to census_counts_path
  end
end

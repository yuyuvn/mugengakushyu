require 'test_helper'

class WrongKanjisControllerTest < ActionController::TestCase
  setup do
    @wrong_kanji = wrong_kanjis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wrong_kanjis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wrong_kanji" do
    assert_difference('WrongKanji.count') do
      post :create, wrong_kanji: { kanji_id: @wrong_kanji.kanji_id, times: @wrong_kanji.times, user_id: @wrong_kanji.user_id }
    end

    assert_redirected_to wrong_kanji_path(assigns(:wrong_kanji))
  end

  test "should show wrong_kanji" do
    get :show, id: @wrong_kanji
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wrong_kanji
    assert_response :success
  end

  test "should update wrong_kanji" do
    patch :update, id: @wrong_kanji, wrong_kanji: { kanji_id: @wrong_kanji.kanji_id, times: @wrong_kanji.times, user_id: @wrong_kanji.user_id }
    assert_redirected_to wrong_kanji_path(assigns(:wrong_kanji))
  end

  test "should destroy wrong_kanji" do
    assert_difference('WrongKanji.count', -1) do
      delete :destroy, id: @wrong_kanji
    end

    assert_redirected_to wrong_kanjis_path
  end
end

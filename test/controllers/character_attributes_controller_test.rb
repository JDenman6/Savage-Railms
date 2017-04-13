require 'test_helper'

class CharacterAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_attribute = character_attributes(:one)
  end

  test "should get index" do
    get character_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_character_attribute_url
    assert_response :success
  end

  test "should create character_attribute" do
    assert_difference('CharacterAttribute.count') do
      post character_attributes_url, params: { character_attribute: { description: @character_attribute.description, name: @character_attribute.name } }
    end

    assert_redirected_to character_attribute_url(CharacterAttribute.last)
  end

  test "should show character_attribute" do
    get character_attribute_url(@character_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_attribute_url(@character_attribute)
    assert_response :success
  end

  test "should update character_attribute" do
    patch character_attribute_url(@character_attribute), params: { character_attribute: { description: @character_attribute.description, name: @character_attribute.name } }
    assert_redirected_to character_attribute_url(@character_attribute)
  end

  test "should destroy character_attribute" do
    assert_difference('CharacterAttribute.count', -1) do
      delete character_attribute_url(@character_attribute)
    end

    assert_redirected_to character_attributes_url
  end
end

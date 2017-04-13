require 'test_helper'

class CharacterSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_skill = character_skills(:one)
  end

  test "should get index" do
    get character_skills_url
    assert_response :success
  end

  test "should get new" do
    get new_character_skill_url
    assert_response :success
  end

  test "should create character_skill" do
    assert_difference('CharacterSkill.count') do
      post character_skills_url, params: { character_skill: { character_attribute_id: @character_skill.character_attribute_id, description: @character_skill.description, name: @character_skill.name } }
    end

    assert_redirected_to character_skill_url(CharacterSkill.last)
  end

  test "should show character_skill" do
    get character_skill_url(@character_skill)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_skill_url(@character_skill)
    assert_response :success
  end

  test "should update character_skill" do
    patch character_skill_url(@character_skill), params: { character_skill: { character_attribute_id: @character_skill.character_attribute_id, description: @character_skill.description, name: @character_skill.name } }
    assert_redirected_to character_skill_url(@character_skill)
  end

  test "should destroy character_skill" do
    assert_difference('CharacterSkill.count', -1) do
      delete character_skill_url(@character_skill)
    end

    assert_redirected_to character_skills_url
  end
end

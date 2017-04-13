require 'dicebag'

class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy, :roll]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.js   {}
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: "Character was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def roll
    ability = params[:roll_type]
    if ability.is_a? Integer
      this_roll = @character.roll_message(@character.attributes[ability])
    else
      skill = params[:skill_type]
      this_roll = @character.roll_message(@character.attributes[ability][skill.to_sym])
    end
    respond_to do |format|
        format.html { redirect_to @character, notice: this_roll }
        format.json { render :show, status: :ok, location: @character }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name, :agility, :smarts, :spirit,
      :strength, :vigor, :roll_type, :skill_type, :skills => all_skills)
    end

    # returns the names of all character_skills in an array
    def all_skills
      skills = []
      CharacterSkill.all.each {|skill| skills << skill.name}
      return skills
    end
    helper_method :all_skills
end

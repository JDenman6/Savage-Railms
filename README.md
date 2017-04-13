# README

This is for prototyping and such only. As such, I'm not doing a git repo or TDD.
But, I will keep notes in the readme about what I did and how it's working.

Step one, new rails project with scaffolding for characters
  - [x] name:string and ability:integer * 5 abilities.
  - [ ] In future, start with users. Characters should belong to a user.
  - [x] In future, plan to add some skills such as fight, drive, notice, shoot, etc.
Step two, add UI restrictions on ability values
  - [x] also add default ability values to \_form.html.erb in characters view
  - [x] use `@character.ability || 4` to create defaults that defer to existing values
Step three, add one click rolling.
  - [x] implement my own dice rolling methods (housed for now in the character model)
  - [x] find and add dicebag gem to help with rolling
  - [x] abandon the dicebag gem and go back to my dice rolling methods
    - (dicebag uses objects and have some clever mechanisms to make some aspects of rolling many dice easier. I want to roll one die at a time [for now])
  - [x] figure out a DRY way to write a controller that can accept and handle any single skill or attribute roll.
  - [x] my way uses a second parameter for skills which are saved as a serialized hash. The show page works.
Step four, add skills to the create/update form.
  - [x] add new field to \_form. Use `fields_for :skills do |s| {s.number_field ...}...end`.  
  - [x] add skills and hash parameters to permitted section of strong params.
    - use `:skills => [:skill1, :skill2, ...]`
Step five, add models, etc for "character_skills" and "character_attributes".
  - [x] rails g scaffold CharacterAttribute name:string description:text
  - [x] rails g scaffold CharacterSkill name:string character_attribute_id:integer description:text
  - [x] link skills/attributes. attribute has_many skills; skill belongs_to attribute
  - [x] change character_attribute_id to character attribute name in show, index, and \_form.
~~Step Six, link the skills on the character \_form and show page to the character_skills
  - [x] There's probably a better way to do this, but for now I'll do it this way
  - [o] enter the full array of skills using the character_skill create action.
  - [o] add the same array to the list on the form and show page (replacing the current :drive and :notice)~~

Better step Six, linking skills to characters:
  - [x] define "all_skills" using this snippit: `CharacterSkill.all.each {|skill| all_skills << skill.name } `
    - defined all_skills as a private method in the character controller and made it a helper_method, so it's available in the views.
    - ~~[x] adjust the views to not show zero values.~~
    - [x] use a before_save method on the character model to remove skills with values lower than 4.
      - This prevents skills the character hasn't trained in from appearing on the show view.
      - It also means that \@character.skills.keys returns an array of all skills the character has trained at least one point in.
Step Seven, rework the form with Javascript.
  - [x] add creation_points to the character model
  - [x] add creation_points to the character \_form partial
  - [ ] use `form_for(character, remote: true)` to add ajax to the form. (emphasis on `remote: true`)
  - [ ] use javascript buttons to increment input values and alter other values accordingly
  - [ ] when the form is submitted it should take the values from input fields which can only be adjusted via javascript buttons
  - [ ] add logic that subtracts creation_points as the player adds abilities and skills.  
      - [ ] each step up for an ability costs two points
      - [ ] the cost of a step up for a skill depends on the value of the associated ability.
        - [ ] up to (and including) the die value of the associated ability, it costs one point
        - [ ] beyond that, it costs two points.
  - [ ] figure out how to do a custom set of values for the skills input such that skills can have either zero or nil values (and only even values from 4-12).
# Savage-Railms

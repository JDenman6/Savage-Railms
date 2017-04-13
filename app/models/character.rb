class Character < ApplicationRecord
  serialize :skills, Hash

  before_save :erase_empty_skills

  def roll(die)
    return 1+rand(die)
  end

  def roll_with_aces(die)
    result = 1+rand(die)
    if result == die
      result += roll_with_aces(die)
    end
    return result
  end

  def roll_message(die)
    die = die.to_i
    result = roll_with_aces(die)
    ace_count = result / die
    if ace_count > 1
      return "You aced #{ace_count} times and got a total of #{result}."
    elsif ace_count == 1
      return "You aced and got a total of #{result}"
    else
      return "You rolled #{result}."
    end
  end

private
  def erase_empty_skills
    self.skills.delete_if {|skill, value| value.to_i < 4 }
  end
end

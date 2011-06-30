class Clue < ActiveRecord::Base
  belongs_to :question
  has_and_belongs_to_many :solutions

  def to_s; %(#{name} (-#{point_cost})); end

  def as_json(*args)
    {
      :question => question[:name],
      :question_id => question_id,
      :possible_points => question.possible_points,
      :text => text,
      :id => id,
      :point_cost => point_cost
    }
  end
end

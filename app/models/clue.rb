class Clue < ActiveRecord::Base
  belongs_to :question
  has_and_belongs_to_many :solutions

  def to_s; name; end
end

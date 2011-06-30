class Question < ActiveRecord::Base
  has_many :solutions, :dependent => :destroy
  has_many :clues, :dependent => :destroy

  def email_subject
    self[:id].to_s
  end


  def to_s
    name
  end
end

class Question < ActiveRecord::Base
  has_many :solutions, :dependent => :destroy
  has_many :clues, :dependent => :destroy
end

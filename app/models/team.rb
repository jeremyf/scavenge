class Team < ActiveRecord::Base
  has_many :solutions, :dependent => :destroy
end

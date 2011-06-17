desc "Load some test data for everyone's edification"
task 'load_data' => [:environment] do
  AdminUser.create!(:email => 'jeremy.n.friesen@gmail.com', :password => 'password', :password_confirmation => 'password')
  ["Leahy", "Rockne", "Holtz"].each do |name|
    Team.create(:name => name).tap do |team|
      team.team_members.build(:email => "#{team}@nd.edu", :password => 'password', :password_confirmation => 'password')
    end.save!
  end

  Question.new(:possible_points => 10, :name => "What is your name?", :answer => 'Sir Lancelot').tap do |question|
    question.clues.build(:point_cost => 2, :name => 'I am not', :text => "Sir Robin" )
    question.clues.build(:point_cost => 4, :name => 'I am...', :text => "The Greatest Knight")
  end.save!
  Question.new(:possible_points => 10, :name => "What is your quest?", :answer => 'To Seek the Holy Grail').tap do |question|
    question.clues.build(:point_cost => 2, :name => 'It is not', :text => 'To recover the Holy Hand Grenade')
    question.clues.build(:point_cost => 4, :name => 'It is...', :text => 'A mission from God')
  end.save!
  Question.new(:possible_points => 10, :name => "What is your favorite colour?", :answer => 'Blue').tap do |question|
    question.clues.build(:point_cost => 2, :name => 'It is not', :text => 'Yellow')
    question.clues.build(:point_cost => 4, :name => 'It is...', :text => 'Is the color of the sky')
  end.save!

  Team.all.each do |team|
    Question.all.each do |question|
      team.solutions.create(:question => question)
    end
  end
end
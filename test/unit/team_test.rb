require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  fixtures :all

  setup do
    @team = teams(:one)
  end

  test 'points available should be delegated to the question' do
    assert_equal 18, @team.score.possible
  end

  test 'should have points_awarded' do
    assert_equal 18, @team.score.current
  end

  test 'should have points_spent_on_clues' do
    assert_equal 2, @team.score.clues_purchased
  end
end

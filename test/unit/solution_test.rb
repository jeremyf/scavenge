require 'test_helper'

class SolutionTest < ActiveSupport::TestCase
  fixtures :all

  setup do
    @solution = solutions(:one)
  end

  test 'points available should be delegated to the question' do
    assert_equal @solution.possible_points, @solution.question.possible_points
  end

  test 'should have points_awarded' do
    assert @solution.solved?
    assert_equal 9, @solution.points_awarded
  end

  test 'should have points_spent_on_clues' do
    assert_equal 1, @solution.points_spent_on_clues
  end

  test 'should have #possible_points_still_available' do
    assert_equal 9, @solution.possible_points_still_available
  end
end

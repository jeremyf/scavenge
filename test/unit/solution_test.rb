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
    assert_equal 9, @solution.points_awarded
  end
end

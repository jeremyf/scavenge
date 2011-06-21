require 'test_helper'

class SolutionHandlerTest < ActionMailer::TestCase
  setup do
    @solution = solutions(:open)
    @team_member = @solution.team.team_members.first
    @question = @solution.question

    @message = Mail.new.tap do |mail|
      mail.from = @team_member.email
      mail.subject = @question.to_param
      mail.attachments[File.basename(__FILE__)] = File.read(__FILE__)
    end
  end

  test 'should be awesome' do
    assert_equal 'open', @solution.state
    SolutionHandler.receive(@message)
    assert_equal 'pending', @solution.reload.state
  end
end

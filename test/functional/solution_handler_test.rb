require 'test_helper'

class SolutionHandlerTest < ActionMailer::TestCase
  setup do
    @team_member = users(:one)
    @question = questions(:one)
    @message = Mail.new.tap do |mail|
      mail.from = @team_member.email
      mail.subject = @question.email_subject
      mail.attachments[File.basename(__FILE__)] = File.read(__FILE__)
    end
  end

  test 'should be awesome' do
    puts @team_member.inspect
    SolutionHandler.receive(@message)
  end
end

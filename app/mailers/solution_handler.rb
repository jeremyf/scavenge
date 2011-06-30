class SolutionHandler < ActionMailer::Base

  def receive(mail)
    return false unless attachment  = mail.attachments.first
    return false unless team_member = TeamMember.where(:email => mail.from).includes(:team).first

    Solution.propose(team_member, mail.subject, attachment)
  end
end

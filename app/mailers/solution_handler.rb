class SolutionHandler < ActionMailer::Base

  def receive(mail)
    if attachment = mail.attachments.first
      team_member = TeamMember.where(:email => mail.from).includes(:team).first
      Solution.propose(team_member, mail.subject, attachment)
    else
      # Maybe we should send them a response?
    end
    # # process the attached file
    # #  ensure an author with that mail-address already exists.
    # sender = mail.from
    # author = Author.find_by_email(mail.from)
    # #raise "Couldn't find author with address #{sender}" if author.nil?
    # # create a new post for this author (from received mail).
    # #Post.create!(
    # author.posts.create!(
    # :title => mail.subject,
    # :body => mail.body
    # )
    # # :author => author
    # puts 'posted Email as message'
  end



end

class Emailer < ActionMailer::Base

  def receive(mail)
    if attachment = mail.attachments[0]
      user = User.find_by_email(mail.from)
      # The subject is going to need to be parsed
      subject = mail.subject
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

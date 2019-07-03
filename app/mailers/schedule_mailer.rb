class ScheduleMailer < ApplicationMailer
  default bcc: -> { User.pluck(:email) },
          from: 'noreply@marincricketclub.com'

  def upcoming_game(user, schedule)
    @user = user
    @schedule = Schedule.where(date: Date.current..(Date.current + 7))
    mail(subject: 'Socials Game This Weekend!')
  end

end

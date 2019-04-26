# Preview all emails at http://localhost:3000/rails/mailers/schedule_mailer
class ScheduleMailerPreview < ActionMailer::Preview
  def upcoming_game
    user = User.first
    schedule = Schedule.fifth
    ScheduleMailer.upcoming_game(schedule, user)
  end
end

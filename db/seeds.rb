users = User.create([{
  name: 'Mike Michaelson',
  email: 'mike@email.com',
  password: 'iammike',
  password_confirmation: 'iammike',
  admin: true,
  activated: true,
  activated_at: Time.zone.now
}, {
  name: 'Steve Stevenson',
  email: 'steve@email.com',
  password: 'iamsteve',
  password_confirmation: 'iamsteve',
  admin: false,
  activated: true,
  activated_at: Time.zone.now
}])

p "Added #{User.count} Players."

schedules = Schedule.create([{
  date: DateTime.strptime('05/04/2019', '%m/%d/%Y'),
  opponent: 'Intraclub',
  series_game: 1,
  location: 'Piper Park, Larkspur'
}, {
  date: DateTime.strptime('05/11/2019', '%m/%d/%Y'),
  opponent: 'Intraclub',
  series_game: 2,
  location: 'Piper Park, Larkspur'
}, {
  date: DateTime.strptime('05/18/2019', '%m/%d/%Y'),
  opponent: 'Napa Valley Cricket Club',
  series_game: 1,
  location: 'Piper Park, Larkspur'
}, {
  date: DateTime.strptime('05/25/2019', '%m/%d/%Y'),
  opponent: 'Marin 2',
  series_game: 1,
  location: 'Piper Park, Larkspur'
}])

p "Added #{Schedule.count} games."

users = User.create([{
  name: 'Mike Michaelson',
  email: 'mike@email.com',
  password: 'iammike',
  password_confirmation: 'iammike',
  role: 'All Rounder',
  bats: 'Left',
  bowls: 'Right',
  admin: true,
  paid: true,
  activated: true,
  activated_at: Time.zone.now
}, {
  name: 'Steve Stevenson',
  email: 'steve@email.com',
  password: 'iamsteve',
  password_confirmation: 'iamsteve',
  role: 'Bowler',
  bats: 'Left',
  bowls: 'Right',
  admin: false,
  paid: false,
  activated: true,
  activated_at: Time.zone.now
}])

5.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = 'password'
  password_confirmation = 'password'
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    role: 'Bowler',
    bats: 'Right',
    bowls: 'Right',
    admin: false,
    paid: false,
    activated: true,
    activated_at: Time.zone.now
  )
end

5.times do |n|
  name = Faker::Name.name
  email = "donkey-#{n+1}@example.com"
  password = 'password'
  password_confirmation = 'password'
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    role: 'Batsmen',
    bats: 'Right',
    bowls: 'Right',
    admin: false,
    paid: true,
    activated: true,
    activated_at: Time.zone.now
  )
end

p "Added #{User.count} Players and #{PlayerStat.count} player stats."

schedules = Schedule.create([{
  date: DateTime.strptime('05/04/2019', '%m/%d/%Y'),
  opponent: 'Intraclub',
  series_game: 1
}, {
  date: DateTime.strptime('05/11/2019', '%m/%d/%Y'),
  opponent: 'Intraclub',
  series_game: 2
}, {
  date: DateTime.strptime('05/18/2019', '%m/%d/%Y'),
  opponent: 'Napa Valley Cricket Club',
  series_game: 1
}, {
  date: DateTime.strptime('05/19/2019', '%m/%d/%Y'),
  opponent: 'Intraclub',
  series_game: 3
},{
  date: DateTime.strptime('05/25/2019', '%m/%d/%Y'),
  opponent: 'Marin 2',
  series_game: 1
}, {
  date: DateTime.strptime('05/26/2019', '%m/%d/%Y'),
  opponent: 'Intraclub',
  series_game: 4
}, {
  date: DateTime.strptime('06/01/2019', '%m/%d/%Y'),
  opponent: 'Sri Lanka',
  series_game: 1
}, {
  date: DateTime.strptime('06/08/2019', '%m/%d/%Y'),
  opponent: 'Sonoma Gullies',
  series_game: 1
}, {
  date: DateTime.strptime('06/15/2019', '%m/%d/%Y'),
  opponent: 'Haddar XI',
  series_game: 1
}, {
  date: DateTime.strptime('06/22/2019', '%m/%d/%Y'),
  opponent: 'Sri Lanka',
  series_game: 2
}, {
  date: DateTime.strptime('06/29/2019', '%m/%d/%Y'),
  opponent: 'Marin Titans',
  series_game: 1
}, {
  date: DateTime.strptime('07/06/2019', '%m/%d/%Y'),
  opponent: 'Intraclub',
  series_game: 5
}, {
  date: DateTime.strptime('07/20/2019', '%m/%d/%Y'),
  opponent: 'Sri Lanka',
  series_game: 3
}, {
  date: DateTime.strptime('07/27/2019', '%m/%d/%Y'),
  opponent: 'Autodesk',
  series_game: 1
}, {
  date: DateTime.strptime('08/03/2019', '%m/%d/%Y'),
  opponent: 'Napa Valley Cricket Club',
  series_game: 2
}, {
  date: DateTime.strptime('08/10/2019', '%m/%d/%Y'),
  opponent: 'San Francisco Seals',
  series_game: 1
}, {
  date: DateTime.strptime('08/24/2019', '%m/%d/%Y'),
  opponent: 'Nanaji XI',
  series_game: 1
}, {
  date: DateTime.strptime('08/31/2019', '%m/%d/%Y'),
  opponent: 'Sonoma Gullies',
  series_game: 2
}, {
  date: DateTime.strptime('09/01/2019', '%m/%d/%Y'),
  opponent: 'Autodesk',
  series_game: 2
}, {
  date: DateTime.strptime('09/07/2019', '%m/%d/%Y'),
  opponent: 'Chairmans XI',
  series_game: 1
}, {
  date: DateTime.strptime('09/14/2019', '%m/%d/%Y'),
  opponent: 'Sri Lanka',
  series_game: 4
}, {
  date: DateTime.strptime('09/15/2019', '%m/%d/%Y'),
  opponent: 'Autodesk',
  series_game: 3
}, {
  date: DateTime.strptime('09/21/2019', '%m/%d/%Y'),
  opponent: 'Napa Valley Cricket Club',
  series_game: 3
}, {
  date: DateTime.strptime('09/22/2019', '%m/%d/%Y'),
  opponent: 'San Francisco Seals',
  series_game: 2
}, {
  date: DateTime.strptime('10/05/2019', '%m/%d/%Y'),
  opponent: 'Meraloma Cricket Club',
  series_game: 1
}, {
  date: DateTime.strptime('10/12/2019', '%m/%d/%Y'),
  opponent: 'Nanaji XI',
  series_game: 2
}, {
  date: DateTime.strptime('10/19/2019', '%m/%d/%Y'),
  opponent: 'Sonoma Gullies',
  series_game: 3
}, {
  date: DateTime.strptime('10/20/2019', '%m/%d/%Y'),
  opponent: 'Intraclub',
  series_game: 6
}, {
  date: DateTime.strptime('10/26/2019', '%m/%d/%Y'),
  opponent: 'Intraclub',
  series_game: 7
}, {
  date: DateTime.strptime('10/27/2019', '%m/%d/%Y'),
  opponent: 'Intraclub',
  series_game: 8
}])

p "Added #{Schedule.count} games and #{GameStat.count} game stats."

selections = Selection.create([{
  user_id: 1,
  schedule_id: 1
}, {
  user_id: 2,
  schedule_id: 1
}, {
  user_id: 3,
  schedule_id: 1
}, {
  user_id: 4,
  schedule_id: 1
}, {
  user_id: 5,
  schedule_id: 1
}, {
  user_id: 6,
  schedule_id: 1
}, {
  user_id: 7,
  schedule_id: 1
}, {
  user_id: 8,
  schedule_id: 1
}, {
  user_id: 9,
  schedule_id: 1
}, {
  user_id: 10,
  schedule_id: 1
}, {
  user_id: 11,
  schedule_id: 1
}, {
  user_id: 1,
  schedule_id: 2
}, {
  user_id: 2,
  schedule_id: 2
}, {
  user_id: 3,
  schedule_id: 2
}, {
  user_id: 4,
  schedule_id: 2
}, {
  user_id: 5,
  schedule_id: 2
}, {
  user_id: 6,
  schedule_id: 2
}, {
  user_id: 7,
  schedule_id: 2
}, {
  user_id: 8,
  schedule_id: 2
}, {
  user_id: 9,
  schedule_id: 2
}, {
  user_id: 10,
  schedule_id: 2
}, {
  user_id: 11,
  schedule_id: 2
}])

p "Added #{Selection.count} Selections"

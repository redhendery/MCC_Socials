
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

p "Added #{User.count} Players"

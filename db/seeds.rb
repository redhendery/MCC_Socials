
users = User.create([{
  name: 'Mike Michaelson',
  email: 'mike@email.com',
  password: 'iammike',
  password_confirmation: 'iammike',
  admin: true,
}, {
  name: 'Steve Stevenson',
  email: 'steve@email.com',
  password: 'iamsteve',
  password_confirmation: 'iamsteve',
  admin: false,
}])

p "Added #{User.count} Players"

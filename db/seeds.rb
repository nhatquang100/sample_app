User.create!(name: "Quang dep trai",
  email: "vonhatquang100@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

99.times do |n|
  name  = Faker::Name.name
  email = "quangdeptrai-#{n+ Settings.number.one}@gmail.com"
  password = "123456"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end

# User.create!(
#   username: 'christiano',
#   password: 'password',
#   email: 'chris@home.com',
#   name: 'christian'
# )


4.times do |i|
  Car.create!(
    user_id: 1,
    brand: "Mercedes #{1}",
    model: 'benz',
    release_year: 2009,
    color: 'black',
    transmission: 'manual',
    seats: 6,
    wheel_drive: 'four-wheel',
    price: 30000
  )
end
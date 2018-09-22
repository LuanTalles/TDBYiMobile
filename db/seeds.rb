
  if Rails.env.development?
    [User, Event].each(&:delete_all)

     spinner = TTY::Spinner.new("[:spinner] Populate User ...")
     spinner.auto_spin
     sleep(1)

     5.times do
       User.create!(
         name: Faker::Name.name,
         email: Faker::Internet.email,
         password: Faker::Internet.password
       )
     end

     spinner.success("")

     spinner = TTY::Spinner.new("[:spinner] Populate Event ...")
     spinner.auto_spin
     sleep(1)

     5.times do
       Event.create!(
         name: Faker::Name.name,
         description: Populator.sentences(2..3),
         lat: Faker::Address.latitude,
         lng: Faker::Address.longitude,
       )
     end

     spinner.success("")

  else
    puts "Você não está em ambiente de desenvolvimento!"
  end

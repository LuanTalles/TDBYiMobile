
  if Rails.env.development?
    [Report, Comment, User, Event].each(&:delete_all)

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

    spinner = TTY::Spinner.new("[:spinner] Populate Comments ...")
    spinner.auto_spin
    sleep(1)

    users = User.all.pluck(:id)
    events = Event.all.pluck(:id)

    5.times do
      Comment.create!(
        text: Populator.sentences(1..3),
        user_id: users[rand(users.size)],
        event_id: events[rand(events.size)]
      )
    end

    spinner.success("")

    spinner = TTY::Spinner.new("[:spinner] Populate Reports ...")
    spinner.auto_spin
    sleep(1)

    users = User.all.pluck(:id)
    comments = Comment.all.pluck(:id)

    5.times do
      Report.create!(
        user_id: users[rand(users.size)],
        comment_id: comments[rand(comments.size)]
      )
    end

    spinner.success("")

  else
    puts "Você não está em ambiente de desenvolvimento!"
  end

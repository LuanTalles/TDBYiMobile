
  if Rails.env.development?
    [User].each(&:delete_all)

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

  else
    puts "Você não está em ambiente de desenvolvimento!"
  end

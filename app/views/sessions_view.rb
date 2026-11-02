class SessionsView
  def ask_username
    puts "Username>"
    gets.chomp
  end

  def ask_password
    puts "Password>"
    gets.chomp
  end

  def wrong_credentials
    puts "Username or Password incorrect... try again"
  end

  def welcome(employee)
    puts "Welcome #{employee.username}!"
  end
end

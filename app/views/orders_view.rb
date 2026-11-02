class OrdersView
  def display_riders(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1} - #{rider.username}"
    end
  end

  def ask_rider_index
    puts "Enter rider index:"
    gets.chomp.to_i - 1
  end

  def ask_index
    puts "Enter order index:"
    gets.chomp.to_i - 1
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - Meal: #{order.meal.name} | Customer: #{order.customer.name} | Rider: #{order.employee.username} "
    end
  end
end

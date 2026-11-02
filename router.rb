class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run

    @employee = @sessions_controller.login

    loop do
      if @employee.manager?
        print_actions_manager
        option = gets.chomp.to_i
        dispatch_manager(option)
      else
        print_actions_rider
        option = gets.chomp.to_i
        dispatch_rider(option)
      end
    end
  end

  private

  def print_actions_manager
    puts "------- MANAGER ACTIONS -------"
    puts "1. Create meal"
    puts "2. List all meals"
    puts "-------------------------------"
    puts "3. Create customer"
    puts "4. List all customers"
    puts "-------------------------------"
    puts "5. Create order"
    puts "6. List undelivered orders"
    puts "-------------------------------"
    puts "Enter you action:"
  end

  def dispatch_manager(option)
    case option
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    end
  end

  def print_actions_rider
    puts "------- RIDER ACTIONS ---------"
    puts "1. List my undelivered orders"
    puts "2. Mark order as delivered"
    puts "-------------------------------"
    puts "Enter you action:"
  end

  def dispatch_rider(option)
    case option
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    end
  end
end

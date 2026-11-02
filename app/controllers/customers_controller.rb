require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    name = @view.ask_name
    address = @view.ask_address

    customer = Customer.new(name:, address:)

    @customer_repository.create(customer)

  end

  def list
    customers = @customer_repository.all
    @view.display(customers)
  end
end

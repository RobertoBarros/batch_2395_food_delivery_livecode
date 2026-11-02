class CustomerRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @customers = []
    load_csv if File.exist?(csv_path)
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def create(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  def all
    @customers
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      @customers << Customer.new(id: row[:id].to_i, name: row[:name], address: row[:address])
    end
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << %i[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end

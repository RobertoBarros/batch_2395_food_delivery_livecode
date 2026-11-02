class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @meals = []
    load_csv if File.exist?(csv_path)
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      @meals << Meal.new(id: row[:id].to_i, name: row[:name], price: row[:price].to_i)
    end
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << %i[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end

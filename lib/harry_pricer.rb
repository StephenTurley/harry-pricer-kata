class HarryPricer
  def calculate(shopping_bag, total = 0)
    shopping_bag.delete_if &:zero?
    unique_books = shopping_bag.length

    return total if unique_books == 0
    calculate(remaining_books(shopping_bag), total + price(unique_books))
  end

  private

  def price(unique_books)
    case unique_books
    when 5 then 30
    when 4 then 25.6
    when 3 then 21.6
    when 1..2 then unique_books * 8
    end
  end

  def remaining_books(shopping_bag)
    shopping_bag.map { |count| count -=1 }
  end
end

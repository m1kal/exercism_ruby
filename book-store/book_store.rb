class BookStore
  def self.calculate_price(books)
    prices(books).min
  end


  def self.prices(books)
    return [0] if books.empty?
    discounts(books)
    .map {|dist| prices(books.diff(dist[1])).map { |elem| dist[0] + elem } }
    .flatten
  end


  def self.discounts(books)
    return [discount(books).flatten(1)] if books.count < 6
    (2..books.count)
    .map { |limit| discount(books, limit) }
    .map { |distr| distr[1].map { |elements| [distr[0],elements] } }
    .flatten(1).uniq
  end

  def self.discount(books, limit = 5)
    limited_count = [books.uniq.count, limit].min
    [case limited_count
     when 2 then 0.95 * 2
     when 3 then 0.9 * 3
     when 4 then 0.8 * 4
     when 5 then 0.75 * 5
     else books.uniq.count
     end * 8.0, books.uniq.combination(limited_count).to_a]
  end
end


class Array
  def diff(other)
    new_array = self - other
    other.each do |to_be_removed|
      (self.select { |element| element == to_be_removed }.count - 1).times do
        new_array.push(to_be_removed)
      end
    end
    new_array
  end
end


module BookKeeping
  VERSION = 0
end

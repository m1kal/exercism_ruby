class Triplet < Array
  def initialize(*args)
    raise ArgumentError, '' unless [2, 3].include?(args.size)
    super(args.sort)
    self << longest_side.round if size == 2
  end

  def pythagorean?
    self if longest_side == last
  end

  def sum
    reduce(&:+)
  end

  def product
    reduce(&:*)
  end

  def longest_side
    (self[0]**2 + self[1]**2)**0.5
  end

  def self.match_triangle(*args, **hash)
    triplet = Triplet.new(*args).pythagorean?
    if !triplet.nil? && triplet.last <= hash[:max_factor] &&
       (hash[:sum].nil? || hash[:sum] == triplet.sum)
      triplet
    end
  end

  def self.where(**hash)
    (hash[:min_factor] || 1).upto(hash[:max_factor] || hash[:sum]).collect do |number1|
      (hash[:min_factor] || 1).upto(number1).collect do |number2|
        Triplet.match_triangle(number1, number2, **hash)
      end
    end.flatten(1).compact
  end
end

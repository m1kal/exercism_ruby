class Change
  def self.generate(coins, amount)
    return brute_force(coins, amount) if nontrivial?(coins)
    generate_simple_case(coins, amount) || brute_force(coins, amount)
  end

  def self.generate_simple_case(coins, amount)
    return -1 if amount < 0
    remainder = amount
    used_coins = []
    coins.sort.reverse.each do |coin|
      number = (remainder / coin).floor
      remainder -= number * coin
      used_coins += [coin] * number
    end
    return false unless remainder.zero?
    used_coins.sort
  end

  def self.nontrivial?(coins)
    coins.any? do |coin|
      coins.any? do |another_coin|
        another_coin < coin && 2 * another_coin > coin
      end
    end
  end

  def self.brute_force(coins, amount)
    all_distributions = [[[], amount]]
    coins.sort.reverse.each do |coin|
      temp = []
      all_distributions.each { |path| temp += division(coin, path) }
      all_distributions = temp
    end
    parse_result(all_distributions)
  end

  def self.parse_result(all_distributions)
    matching = all_distributions.select { |item| item[1].zero? }
    return -1 if matching.empty?
    matching.sort_by { |item| item[0].size }.first.first.reverse
  end

  def self.division(coin, path)
    coins_used = path[0]
    amount = path[1]
    max = (amount / coin).floor
    (0..max).to_a.map do |number|
      [coins_used + [coin] * number, amount - number * coin]
    end
  end
end

module BookKeeping
  VERSION = 2
end

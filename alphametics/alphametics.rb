class Alphametics
  def self.solve(input)
    solve_permutations(parse(input))
  end

  def self.parse(input)
    equation = {}
    sign = 1
    input.split(/[\s\+]/).each do |expr|
      if expr == '=='
        sign = -1
      else
        get_coefficients(equation, expr, sign)
      end
    end
    equation.sort_by{ |key, value| -value[:coefficient].abs}.to_h
  end

  def self.get_coefficients(equation, expr, sign)
    expr.each_char.with_index do |char, idx|
      equation[char] ||= {}
      get_coefficient(equation[char], idx, expr.length - idx - 1, sign)
    end
  end

  def self.get_coefficient(equation, idx, position, sign)
    equation[:coefficient] = 10**position * sign + (equation[:coefficient] || 0)
    equation[:can_be_zero] = true if equation[:can_be_zero].nil?
    equation[:can_be_zero] = false if idx.zero?
  end

  def self.solve_permutations(equation)
    (0..9).to_a.permutation(equation.size).to_a.each do |candidate|
      return arrange(equation, candidate) if check_solution(equation, candidate)
    end
    {}
  end

  def self.check_solution(equation, candidate)
    sum = 0
    equation.keys.each_with_index do |key, idx|
      return false if candidate[idx].zero? && !equation[key][:can_be_zero]
      sum += equation[key][:coefficient] * candidate[idx]
    end
    sum.zero?
  end

  def self.arrange(equation, array)
    hash = {}
    equation.keys.each_with_index do |key, idx|
      hash[key] = array[idx]
    end
    hash
  end
end

module BookKeeping
  VERSION = 4
end

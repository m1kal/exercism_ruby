class Dominoes
  def self.chain(input)
    @chain = nil
    return input if input.size.zero?
    create_chain(input.dup, [])
    @chain
  end

  def self.create_chain(input, chain, value = nil)
    if input.size.zero?
      if chain[0][0] == value
        @chain = chain
        return true
      else
        return false
      end
    end
    input.each_with_index do |pair, index|
      if value.nil?
        create_chain(input_without_current(input, index),
                     chain + [pair], pair[1]) ||
          create_chain(input_without_current(input, index),
                       chain + [pair.reverse], pair[0])
      else
        (value == pair[0] && create_chain(input_without_current(input, index),
                                          chain + [pair], pair[1])) ||
          (value == pair[1] && create_chain(input_without_current(input, index),
                                            chain + [pair.reverse], pair[0]))
      end
    end
  end

  def self.input_without_current(input, index)
    input[0, index] + input[index + 1..-1]
  end
end

module BookKeeping
  VERSION = 1
end

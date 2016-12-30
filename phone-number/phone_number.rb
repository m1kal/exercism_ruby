class PhoneNumber
  attr_reader :number
  def initialize(input)
    @number = format_number(input.gsub(/\W/, ''))
  end

  def format_number(input)
    input =~ /^1?\d{10}$/ ? input[-10..-1] : '0' * 10
  end

  def area_code
    @number[0..2]
  end

  def to_s
    @number.gsub(/(...)(...)(....)/, '(\1) \2-\3')
  end
end

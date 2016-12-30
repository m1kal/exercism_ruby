class Robot
  attr_reader :name
  @@names = []

  def initialize
    reset
  end

  def reset
    @@names.delete(@name)
    begin
      set_name
    end while @@names.include? @name
    @@names << @name
  end

  def set_name
    @name = ''
    2.times { @name << random_val('A', 'Z') }
    3.times { @name << random_val('0', '9') }
  end

  def random_val(start, limit)
    (start..limit).to_a[rand(limit.ord - start.ord)]
  end
end

module BookKeeping
  VERSION = 2
end

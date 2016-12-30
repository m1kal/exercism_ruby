module Strain
  def keep
    output = self.class.new
    each { |k| output << k if yield k }
    output
  end

  def discard(&block)
    self - keep(&block)
  end
end

class Array
  include Strain
end

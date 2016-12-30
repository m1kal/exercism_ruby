class Raindrops
  DROPS = {
    3=>"Pling",
    5=>"Plang",
    7=>"Plong"
  }

  def self.convert(input)
    if !input.is_a?(Fixnum)
      raise ArgumentError, "Not an integer"
    end
    pass check_modulo(input),input
  end

  def self.check_modulo(input)
    DROPS.keys.select{|index| input%index==0}.reduce("") do |buffer,divisor|
     buffer+DROPS[divisor]
    end
  end

  def self.pass(raindrops,input)
    raindrops=="" ? input.to_s : raindrops
  end

end


module BookKeeping
  VERSION = 3
end

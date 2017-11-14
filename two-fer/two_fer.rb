class TwoFer
  def self.two_fer(who='you')
    [who,'me'].map{ |who| one_fer(who) }.join(', ').gsub(/^./,&:upcase) + '.'
  end

  def self.one_fer(who)
    'one for ' + who
  end
end

module BookKeeping
  VERSION = 1
end

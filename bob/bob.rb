class Bob

  ANSWER_QUESTION = 'Sure.'
  ANSWER_YELL = 'Whoa, chill out!'
  ANSWER_BOB = 'Fine. Be that way!'
  ANSWER = 'Whatever.'

  def self.hey(remark)
    return ANSWER_YELL if yell?(remark)
    return ANSWER_QUESTION if question?(remark)
    return ANSWER_BOB if empty?(remark)
    ANSWER
  end

  def self.question?(remark)
    remark[-1] == '?'
  end

  def self.yell?(remark)
    remark == remark.upcase && remark =~ /[A-Z]/
  end

  def self.empty?(remark)
    !(remark =~ /\S/)
  end
end

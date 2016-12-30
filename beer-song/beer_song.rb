class BeerSong
  def verse(num)
    first_line(num) + second_line(num)
  end

  def first_line(num)
    format_line(count_bottles_on_the_wall(num), count_bottles(num))
  end

  def second_line(num)
    format_line(to_do(num), count_bottles_on_the_wall(num - 1))
  end

  def format_line(str1, str2)
    str1 + ", " + str2.downcase + ".\n"
  end

  def to_do(num)
    if num.zero?
      "Go to the store and buy some more"
    else
      "Take " + one(num) + " down and pass it around"
    end
  end

  def count_bottles_on_the_wall(num)
    count_bottles(num) + " on the wall"
  end

  def count_bottles(num)
    count(num) + " bottle" + (num == 1 ? "" : "s") + " of beer"
  end

  def count(num)
    num.to_s.gsub(/^0/, "No more").gsub("-1", "99")
  end

  def one(num)
    num == 1 ? "it" : "one"
  end

  def verses(first, last)
    first.downto(last).collect { |k| verse(k) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

module BookKeeping
  VERSION = 2
end

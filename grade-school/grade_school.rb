class School
  def initialize
    @school = {}
  end

  def add(name, grade)
    @school[grade] = students(grade) + [name]
  end

  def students(grade)
    @school[grade].nil? ? [] : @school[grade].sort
  end

  def students_by_grade
    @school.keys.sort.collect do |grade|
      { grade: grade, students: students(grade) }
    end
  end
end

module BookKeeping
  VERSION = 3
end

require_relative 'person'

class Student < Person
  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

amen = Student.new(28, '4A', name: 'Amen', parent_permission: false)
puts amen.name
puts amen.parent_permission

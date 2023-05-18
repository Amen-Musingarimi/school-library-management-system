require_relative 'person'

class Student < Person
  attr_accessor :id, :classroom

  def initialize(age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = nil
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end

require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'capitalize'
require_relative 'trim'

person = Person.new(22, name: 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

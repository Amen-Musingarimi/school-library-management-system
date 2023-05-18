require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'Listing all books:'
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    puts 'Listing all people:'
    @people.each do |person|
      person_type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "[#{person_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_people_with_numbers
    puts 'Listing all people:'
    @people.each_with_index do |person, index|
      person_type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "#{index + 1}. #{person_type}: #{person.name}"
    end
  end

  def create_person(type, name = nil, age = nil, parent_permission = nil)
    case type
    when 'student'
      if name.nil?
        print 'Enter name: '
        name = gets.chomp
      end

      if age.nil?
        print 'Enter age: '
        age = gets.chomp.to_i
      end

      if parent_permission.nil?
        print 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp.upcase == 'Y'
      end

      @people << Student.new(age, name: name, parent_permission: parent_permission)
    when 'teacher'
      if age.nil?
        print 'Enter age: '
        age = gets.chomp.to_i
      end

      if name.nil?
        print 'Enter name: '
        name = gets.chomp
      end

      print 'Enter specialization: '
      specialization = gets.chomp

      teacher = Teacher.new(age, specialization, name: name)
      @people << teacher
      puts 'Teacher successfully created.'
    else
      puts 'Invalid person type.'
    end
  end

  def create_book
    puts 'Creating a book:'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
  end

  def create_rental
    puts 'Creating a rental:'

    puts 'List of books:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
    end

    print 'Select a book by number: '
    book_number = gets.chomp.to_i

    if book_number.between?(1, @books.length)
      book = @books[book_number - 1]

      puts 'List of people:'
      list_people_with_numbers

      print 'Select a person by number: '
      person_number = gets.chomp.to_i

      if person_number.between?(1, @people.length)
        person = @people[person_number - 1]

        print 'Enter date: '
        date = gets.chomp

        rental = Rental.new(date, book, person)
        @rentals << rental
        puts 'Rental created successfully.'
      else
        puts 'Invalid person number.'
      end
    else
      puts 'Invalid book number.'
    end
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }

    if person
      puts "Listing rentals for person with ID #{person_id}:"
      rentals = @rentals.select { |r| r.person == person }
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}"
      end
    else
      puts 'Person not found.'
    end
  end
end

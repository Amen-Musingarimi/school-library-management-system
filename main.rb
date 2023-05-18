require_relative 'app'

def main
  app = App.new

  loop do
    puts 'What would you like to do?'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '0. Quit'

    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
      person_type = gets.chomp.to_i

      case person_type
      when 1
        app.create_person('student')
      when 2
        app.create_person('teacher')
      else
        puts 'Invalid person type.'
      end
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      print 'Enter person ID: '
      person_id = gets.chomp.to_i
      app.list_rentals_for_person(person_id)
    when 0
      break
    else
      puts 'Invalid choice.'
    end

    puts "\n"
  end
end

main

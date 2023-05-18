require_relative 'app'

MENU_OPTIONS = {
  1 => { label: 'List all books', method: :handle_list_books },
  2 => { label: 'List all people', method: :handle_list_people },
  3 => { label: 'Create a person', method: :handle_create_person },
  4 => { label: 'Create a book', method: :handle_create_book },
  5 => { label: 'Create a rental', method: :handle_create_rental },
  6 => { label: 'List rentals for a person', method: :handle_list_rentals },
  0 => { label: 'Quit', method: nil }
}.freeze

def main
  app = App.new

  loop do
    display_menu

    choice = gets.chomp.to_i

    break if choice.zero?

    handle_choice(app, choice)
    puts "\n"
  end
end

def display_menu
  puts 'What would you like to do?'
  MENU_OPTIONS.each { |key, option| puts "#{key}. #{option[:label]}" }
end

def handle_choice(app, choice)
  if MENU_OPTIONS.key?(choice)
    method_name = MENU_OPTIONS[choice][:method]
    send(method_name, app) if method_name
  else
    puts 'Invalid choice.'
  end
end

def handle_list_books(app)
  app.list_books
end

def handle_list_people(app)
  app.list_people
end

def handle_create_person(app)
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
end

def handle_create_book(app)
  app.create_book
end

def handle_create_rental(app)
  app.create_rental
end

def handle_list_rentals(app)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  app.list_rentals_for_person(person_id)
end

main

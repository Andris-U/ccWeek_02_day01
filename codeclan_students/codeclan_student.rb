

class Student
	attr_accessor :name, :cohort

	def initialize(studentName, cohort, language)
		@name = studentName
		@cohort = cohort
		@favourite_language = language
	end

	def change_name_and_cohort(new_name, new_cohort)
		@name = new_name
		@cohort = new_cohort
	end

	def student_favourite_language
		p "My favourite language is #{@favourite_language}!"
	end
end

class Team
	attr_accessor :name, :players, :coach, :points

	def initialize(name, players, coach)
		@name = name 
		@players = players
		@coach = coach
		@points = 0
	end

	def player_in_team?(player)
		@players.include? player 
	end

	def add_point_on_victory(result)
		@points += 1 if result == 'won'
	end
end

class Library
	attr_accessor :books

	def initialize books
		@books = books
	end

	def book_information(title)
		@books.each do |book|
			return book if book[:title] == title
		end
		return 'Book not found'
	end

	def book_rental_details(title)
		@books.each do |book|
			return book[:rental_details] if book[:title] == title
		end
		return "Book not found"
	end

	def add_title(title)
		newTitle = {title: title,
					rental_details: {
					student_name: '',
					date: ""
					}
				}
		@books.push(newTitle)
	end

	def update_rental_information title, student, date

		@books.each do |book|
			if book[:title] == title
				book[:rental_details][:student_name] = student 
				book[:rental_details][:date] = date
			end
		end
		p "Book not found"		 
	end

end













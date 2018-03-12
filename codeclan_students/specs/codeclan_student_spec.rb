require_relative('../codeclan_student')
require('minitest/autorun')

class TestClasses < Minitest::Test 

	def setup
		@student = Student.new('John', 20, 'JS')

		@team1 = Team.new('Slackers', ['John Peters', 'Sam Smith', 'James Little'], 'Ewan Grant')

		@library = Library.new([
			{title: 'Steppenwolf',
				rental_details: {
					student_name: 'John',
					date: "09/04/2018"
					}
				},
			{title: 'Foundation',
				rental_details: {
					student_name: 'John',
					date: "12/04/2018"
					}
				}
			])
	end

	def test_getName
		assert_equal('John', @student.name)
	end

	def test_getCohort
		assert_equal(20, @student.cohort)
	end

	def test_change_name_and_cohort
		@student.change_name_and_cohort('Sam', 19)
		assert_equal('Sam', @student.name)
		assert_equal(19, @student.cohort)
	end

	def test_student_favourite_language
		assert_equal('My favourite language is JS!', @student.student_favourite_language)
	end

	################
	###Team tests###
	################ 


	def test_player_in_team?
		assert_equal(true, @team1.player_in_team?('Sam Smith'))
		# assert_equal(false, @team1.player_in_team?('Freddie Mercury'))
	end

	def test_add_point_on_victory
		assert_equal(1, @team1.add_point_on_victory('won'))
	end

	################
	#Libreary tests#
	################

	def test_book_information
		assert_equal({title: 'Steppenwolf',
				rental_details: {
					student_name: 'John',
					date: "09/04/2018"
					}
				}, @library.book_information('Steppenwolf'))
	end

	def test_get_books
		assert_equal([
			{title: 'Steppenwolf',
				rental_details: {
					student_name: 'John',
					date: "09/04/2018"
					}
				},
			{title: 'Foundation',
				rental_details: {
					student_name: 'John',
					date: "12/04/2018"
					}
				}
			], @library.books)
	end

	def test_book_rental_details
		assert_equal({
					student_name: 'John',
					date: "09/04/2018"
					}, @library.book_rental_details('Steppenwolf'))
	end

	def test_add_title
		@library.add_title('Canto General')
		assert_equal(true, @library.books.include?({title: 'Canto General', rental_details: { student_name: '', date: "" }}))
	end

	def test_update_rental_information
		@library.add_title('Canto General')
		@library.update_rental_information('Canto General', 'John', "24/04/2018")
		assert_equal(@library.book_information('Canto General')[:rental_details][:student_name], 'John')
		assert_equal(@library.book_information('Canto General')[:rental_details][:date], '24/04/2018')
	end

end















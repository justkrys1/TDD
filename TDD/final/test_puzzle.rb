require 'minitest/autorun'
require_relative 'puzzle'

class TestPuzzle < Minitest::Test

  def setup
    @puzzle = PuzzleClass.new( 4, 4 )
  end

  def test_init
    assert_equal( 4, @puzzle.width, 'Width not correct.')
    @puzzle.width = 5
    assert_equal( 5, @puzzle.width, 'Width did not set.')
    assert_equal( 4, @puzzle.height, 'Height not correct.')
    @puzzle.height = 6
    assert_equal( 6, @puzzle.height, 'Height did not set.')
    @puzzle.width = 4
    @puzzle.height = 4
    assert_raises( NoMethodError ) { @puzzle.initial_config = false }
  end

  def test_class
    assert_equal(Fixnum, @puzzle.width.class, 'Width is not an integer.')
    assert_equal(Fixnum, @puzzle.height.class, 'Height is not an integer.')
    assert_equal(PuzzleClass, @puzzle.class, 'Puzzle is not a Puzzle.')
    assert_equal(Array, @puzzle.puzzle_array.class, 'Puzzle_array is not an Array.')
  end

  def test_set_puzzle
    assert_respond_to( @puzzle, :set_puzzle, 'No method set_puzzle.')
    assert( @puzzle.set_puzzle(''), false )
    assert( @puzzle.set_puzzle('ABCDEFGH'), false )
    @puzzle.set_puzzle( 'ABCDEFGH')
    assert( @puzzle.set_puzzle('ABCDEFGH'), true )
    assert_equal('ABCDEFGH', @puzzle.initial_config, 'Initial Config')
    assert_equal( 'ABCDEFGH', @puzzle.set_puzzle( 'ABCDEFGH' ), 'Did not set correctly.')
  end

 def test_get_puzzle
    assert_respond_to( @puzzle, :get_puzzle, 'No method get_puzzle.')
    assert_equal('ABCDEFGH', @puzzle.get_puzzle('ABCDEFGH'), 'Get Puzzle')
 end


  def test_to_s
    assert_equal( "Width: #{@puzzle.width}, Height: #{@puzzle.height}", @puzzle.to_s, 'to_s method is incorrect.' )
  end

  def test_direction
    assert_equal(3, @puzzle.move_down(1, 2), 'Did not move down.')
    assert_equal(3, @puzzle.move_down(3, 2), 'Outside bottom bounds.')
    @puzzle.height = 4
    assert_equal(2, @puzzle.move_up(4, 2), 'Did not move up.')
    assert_equal(2, @puzzle.move_up(2, 3), 'Outside top bounds.')

    assert_equal(2, @puzzle.move_left(4, 2), 'Did not move left.')
    assert_equal(2, @puzzle.move_left(2, 3), 'Outside left bounds.')
    @puzzle.width = 4
    assert_equal(3, @puzzle.move_right(2, 1), 'Did not move right.')
    assert_equal(3, @puzzle.move_right(3, 2), 'Outside right bounds.')
  end

  def test_scramble
    @puzzle.set_puzzle('ABCDEFGH')
    assert( @puzzle.scramble('ABCDEFGH'), false )
    @puzzle.set_puzzle('12345678')
    assert( @puzzle.scramble('12345678'), false )
  end

  def test_solve
    @puzzle.set_puzzle('12345678')
    assert( @puzzle.solve, false )
    assert_equal('12345678', @puzzle.solve, 'Did not solve.')
  end

  def test_run
    puts 'Enter puzzle size: '
    user_input = gets.to_i
    assert_equal(user_input, @puzzle.run_puzzle(user_input), 'Did not run.')
  end
end

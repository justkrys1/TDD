class PuzzleClass
   attr_accessor :width, :height
   attr_reader :initial_config, :puzzle_array
  def initialize (width, height)
    @width = width
    @height = height
    @puzzle_array = Array.new( 3 )
  end

  def set_puzzle( config )
    @initial_config = config
    # take an initial configuration setup for a puzzle
  end

   def get_puzzle(config)
      @initial_config = config
   end

  def move_up(h1, h2)
    if h1 - h2 > 0; @height = h1 - h2
    else @height = h1
    end
  end

  def move_down(h1, h2)
    if h1 + h2 > @height; @height = height
    else @height = h1 + h2
    end
  end

  def move_right(w1, w2)
    if w1 + w2 > @width; @width = width
    else @width = w1 + w2
    end
  end

  def move_left(w1, w2)
    if w1 - w2 > 0; @width = w1 - w2
    else @width = w1
    end
  end

  def solve
    @width.times do|x|
      x.times do
        return initial_config
      end
    end
  end

  def scramble( config )
    @initial_config = ''
    config.length.times do|config|
      @initial_config += rand(config).to_s
    end
    return initial_config
  end

  def to_s
    "Width: #{@width}, Height: #{@height}"
  end

  def run_puzzle( user_input )
    @width = user_input
    @height = user_input
  end
end

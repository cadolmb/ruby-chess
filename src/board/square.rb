require_relative 'board'

class Square

  WHITE_SQUARE_COLOR = Gosu::Color.new(200, 200, 180)
  BLACK_SQUARE_COLOR = Gosu::Color.new(100, 80, 60)

  attr_reader :file
  attr_reader :rank
  attr_reader :x
  attr_reader :y
  attr_accessor :highlighted
  
  def initialize(file, rank)
    @file = file
    @rank = rank

    if (@file + @rank) % 2 == 1
      @color = WHITE_SQUARE_COLOR
    else
      @color = BLACK_SQUARE_COLOR
    end
    
    @highlighted = false

    @x = Board::BOARD_OFFSET + (@file - 1) * Board::TILE_SIZE
    @y = Board::BOARD_OFFSET + (8 - @rank) * Board::TILE_SIZE
  end

  def draw
    Gosu.draw_rect(@x, @y, Board::TILE_SIZE, Board::TILE_SIZE, @color, ZOrder::BOARD)
    
    if @highlighted
      Gosu.draw_rect(@x + Board::TILE_SIZE/2.0 - 5, @y + Board::TILE_SIZE/2.0 - 5, 10, 10, Gosu::Color::RED, ZOrder::HUD)
    end
  end

end
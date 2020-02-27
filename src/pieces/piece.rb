require './src/board/board.rb'

class Piece

  attr_reader :color
  attr_reader :file
  attr_reader :rank
  
  def initialize(color, file, rank)
    @color = color
    @file = file
    @rank = rank

    @x = Board::BOARD_OFFSET + (@file - 1) * Board::TILE_SIZE
    @y = Board::BOARD_OFFSET + (8 - @rank) * Board::TILE_SIZE
  end

  def move(file, rank)
    @file = file
    @rank = rank
    @x = Board::BOARD_OFFSET + (@file - 1) * Board::TILE_SIZE
    @y = Board::BOARD_OFFSET + (8 - @rank) * Board::TILE_SIZE
  end

  def draw
    scl = Board::TILE_SIZE / @img.width.to_f
    @img.draw(@x, @y, ZOrder::PIECE, scl, scl)
  end

  def move_is_possible(file, rank, board)
  end
  
end
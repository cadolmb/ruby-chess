require_relative 'piece'

class King < Piece

  def initialize(color, file, rank)
    super(color, file, rank)

    @img = Gosu::Image.new('./src/resources/simple/WK.gif') if @color == :white
    @img = Gosu::Image.new('./src/resources/simple/BK.gif') if @color == :black
  end
  
  def move_is_possible(file, rank, board)
    return false if (file - @file).abs > 1 or (rank - @rank).abs > 1
    return false if board.piece(file, rank)&.color == @color
    return true
  end

end
require_relative 'piece'

class Knight < Piece

  def initialize(color, file, rank)
    super(color, file, rank)

    @img = Gosu::Image.new('./src/resources/simple/WN.gif') if @color == :white
    @img = Gosu::Image.new('./src/resources/simple/BN.gif') if @color == :black
  end
  
  def move_is_possible(file, rank, board)
    return false if @file == file or @rank == rank
    return false unless (file - @file).abs + (rank - @rank).abs == 3
    return false if board.piece(file, rank)&.color == @color
    return true
  end

end
require_relative 'piece'

class Pawn < Piece

  def initialize(color, file, rank)
    super(color, file, rank)

    @first_move = true

    @img = Gosu::Image.new('./src/resources/simple/WP.gif') if @color == :white
    @img = Gosu::Image.new('./src/resources/simple/BP.gif') if @color == :black
  end

  def move(file, rank)
    super(file, rank)
    @first_move = false
  end
  
  def move_is_possible(file, rank, board)

    if @color == :white
      return false if rank - @rank > 2 or rank - @rank <= 0
      return false if (file - @file).abs > 1
      return false if rank - @rank > 1 unless @first_move
      return false if @file != file and rank - @rank == 2
      if board.piece(file, rank)
        return false if @file == file
        return false if board.piece(file, rank).color == :white
      else
        return false if @file != file
      end
    end

    if @color == :black
      return false if @rank - rank > 2 or @rank - rank <= 0
      return false if (file - @file).abs > 1
      return false if @rank - rank > 1 unless @first_move
      return false if @file != file and @rank - rank == 2
      if board.piece(file, rank)
        return false if @file == file
        return false if board.piece(file, rank).color == :black
      else
        return false if @file != file
      end
    end

    return true
  end

end
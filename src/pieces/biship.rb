require_relative 'piece'

class Bishop < Piece

  def initialize(color, file, rank)
    super(color, file, rank)

    @img = Gosu::Image.new('./resources/simple/WB.gif') if @color == :white
    @img = Gosu::Image.new('./resources/simple/BB.gif') if @color == :black
  end
  
  def move_is_possible(file, rank, board)
    return false unless (file - @file).abs == (rank - @rank).abs
    return false if board.piece(file, rank)&.color == @color

    #up-left
    stop_file = @file - 1
    stop_rank = @rank + 1
    until board.piece(stop_file, stop_rank) or board.square(stop_file, stop_rank) == nil
      stop_rank += 1
      stop_file -= 1
    end
    return false if file < @file and rank > @rank and file < stop_file and rank > stop_rank

    #up-right
    stop_file = @file + 1
    stop_rank = @rank + 1
    until board.piece(stop_file, stop_rank) or board.square(stop_file, stop_rank) == nil
      stop_rank += 1
      stop_file += 1
    end
    return false if file > @file and rank > @rank and file > stop_file and rank > stop_rank

    #down-left
    stop_file = @file - 1
    stop_rank = @rank - 1
    until board.piece(stop_file, stop_rank) or board.square(stop_file, stop_rank) == nil
      stop_rank -= 1
      stop_file -= 1
    end
    return false if file < @file and rank < @rank and file < stop_file and rank < stop_rank

    #down-right
    stop_file = @file + 1
    stop_rank = @rank - 1
    until board.piece(stop_file, stop_rank) or board.square(stop_file, stop_rank) == nil
      stop_rank -= 1
      stop_file += 1
    end
    return false if file > @file and rank < @rank and file > stop_file and rank < stop_rank

    return true
  end

end
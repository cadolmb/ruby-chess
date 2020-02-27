require_relative 'piece'

class Queen < Piece

  def initialize(color, file, rank)
    super(color, file, rank)

    @img = Gosu::Image.new('./src/resources/simple/WQ.gif') if @color == :white
    @img = Gosu::Image.new('./src/resources/simple/BQ.gif') if @color == :black
  end
  
  def move_is_possible(file, rank, board)
    return false unless (file - @file).abs == (rank - @rank).abs or @file == file or @rank == rank
    return false if board.piece(file, rank)&.color == @color

    #up
    stop_file = @file
    stop_rank = @rank + 1
    until board.piece(stop_file, stop_rank) or board.square(stop_file, stop_rank) == nil
      stop_rank += 1
    end
    return false if file == @file and rank > @rank and rank > stop_rank

    #down
    stop_file = @file
    stop_rank = @rank - 1
    until board.piece(stop_file, stop_rank) or board.square(stop_file, stop_rank) == nil
      stop_rank -= 1
    end
    return false if file == @file and rank < @rank and rank < stop_rank

    #left
    stop_file = @file - 1
    stop_rank = @rank
    until board.piece(stop_file, stop_rank) or board.square(stop_file, stop_rank) == nil
      stop_file -= 1
    end
    return false if rank == @rank and file < @file and file < stop_file

    #right
    stop_file = @file + 1
    stop_rank = @rank
    until board.piece(stop_file, stop_rank) or board.square(stop_file, stop_rank) == nil
      stop_file += 1
    end
    return false if rank == @rank and file > @file and file > stop_file
    
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
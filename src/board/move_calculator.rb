module MoveCalculator

  def move_is_legal(piece, file, rank, board)
    return false unless piece.move_is_possible(file, rank, board)
    return true
  end
  
end
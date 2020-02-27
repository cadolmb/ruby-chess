require_relative 'square'
require_relative 'move_calculator'
require_all 'src/pieces'

class Board
  include MoveCalculator

  WIDTH = 640
  BOARD_OFFSET = WIDTH / 40.0
  TILE_SIZE = (WIDTH - BOARD_OFFSET*2) / 8.0

  WHITE_PIECE_COLOR = Gosu::Color.new(250, 240, 240)
  BLACK_PIECE_COLOR = Gosu::Color.new(80, 50, 50)

  def initialize
    @squares = []
    @pieces = []
    @turn = :white
    create_squares
    setup_pieces
  end

  def create_squares
    (1..8).each do |file|
      (1..8).each do |rank|
        @squares << Square.new(file, rank)
      end
    end
  end
  
  def setup_pieces
    @pieces << Rook.new(:white, 1, 1)
    @pieces << Knight.new(:white, 2, 1)
    @pieces << Bishop.new(:white, 3, 1)
    @pieces << Queen.new(:white, 4, 1)
    @pieces << King.new(:white, 5, 1)
    @pieces << Bishop.new(:white, 6, 1)
    @pieces << Knight.new(:white, 7, 1)
    @pieces << Rook.new(:white, 8, 1)

    @pieces << Rook.new(:black, 1, 8)
    @pieces << Knight.new(:black, 2, 8)
    @pieces << Bishop.new(:black, 3, 8) 
    @pieces << Queen.new(:black, 4, 8)
    @pieces << King.new(:black, 5, 8)
    @pieces << Bishop.new(:black, 6, 8)
    @pieces << Knight.new(:black, 7, 8)
    @pieces << Rook.new(:black, 8, 8)

    (1..8).each do |file|
      @pieces << Pawn.new(:white, file, 2)
      @pieces << Pawn.new(:black, file, 7)
    end
  end

  def square(file, rank)
    @squares.find { |square| square.file == file && square.rank == rank }
  end

  def piece(file, rank)
    @pieces.find { |piece| piece.file == file && piece.rank == rank }
  end

  def draw
    @squares.each { |square| square.draw }
    @pieces.each { |piece| piece.draw }
  end

  def button_down(id)
    if id == Gosu::MS_LEFT
      x = $window.mouse_x
      y = $window.mouse_y

      @squares.each do |square|
        if x > square.x && x < square.x + TILE_SIZE
          if y > square.y && y < square.y + TILE_SIZE
            click(square)
          end
        end
      end
    end
  end

  def click(square)
    if !@selecting
      if piece(square.file, square.rank)&.color == @turn
        @selecting = true
        @selected_piece = piece(square.file, square.rank)
        show_move_options
      end
    else
      if move_is_legal(@selected_piece, square.file, square.rank, self)
        move_piece(@selected_piece, square.file, square.rank) 
        switch_turns
      end
      @selecting = false
      @selected_piece = nil
      clear_move_options
    end
  end
  
  def show_move_options
    @squares.each { |square| square.highlighted = true if move_is_legal(@selected_piece, square.file, square.rank, self) }
  end

  def clear_move_options
    @squares.each { |square| square.highlighted = false }
  end

  def switch_turns
    if @turn == :white
      @turn = :black
    else
      @turn = :white
    end
  end

  def move_piece(piece, file, rank)
    @pieces.delete(piece(file, rank)) if piece(file, rank)
    piece.move(file, rank)
  end

end
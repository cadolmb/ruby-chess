require_relative 'game_state'
require './src/board/board.rb'

class PlayState < GameState

  MOUSE_IMG = Gosu::Image.new('./resources/mouse_icon.png')
  BG_COLOR = Gosu::Color.new(120, 100, 80)
  OUTLINE = Board::WIDTH / 90.0
  OUTLINE_COLOR = Gosu::Color.new(50, 30, 25)

  def initialize
    @board = Board.new
  end

  def enter
  end

  def leave
  end

  def update
  end

  def draw
    # BACKGROUND
    Gosu.draw_rect(0, 0, Window::WIDTH, Window::WIDTH, BG_COLOR, ZOrder::BG)
    Gosu.draw_rect(Board::BOARD_OFFSET - OUTLINE, Board::BOARD_OFFSET - OUTLINE,
      Window::WIDTH - Board::BOARD_OFFSET*2 + OUTLINE * 2, Window::WIDTH - Board::BOARD_OFFSET*2 + OUTLINE * 2,
      OUTLINE_COLOR, ZOrder::BG)

    @board.draw

    MOUSE_IMG.draw($window.mouse_x, $window.mouse_y, ZOrder::MOUSE, 0.5, 0.5)
  end

  def button_down(id)
    @board.button_down(id)
  end

end
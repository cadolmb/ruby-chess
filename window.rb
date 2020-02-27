class Window < Gosu::Window

  attr_accessor :state
  
  WIDTH = 640
  HEIGHT = 640
  CAPTION = 'Chess'
  
  def initialize
    super WIDTH, HEIGHT, false
    self.caption = CAPTION
  end

  def update
    @state.update
  end

  def draw
    @state.draw
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      exit
    end
    @state.button_down(id)
  end

end

module ZOrder
  BG, BOARD, PIECE, HUD, MOUSE = *0..4
end
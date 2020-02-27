require 'singleton'

class GameState
  include Singleton

  def self.switch(new_state)
    $window.state&.leave
    $window.state = new_state
    new_state.enter
  end

  def enter
  end

  def leave
  end

  def update
  end

  def draw
  end

  def button_down(id)
  end

end

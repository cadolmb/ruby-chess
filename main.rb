require 'gosu'
require 'require_all'

require_rel 'window'
require_all 'src/states'

# # # # # # # # #
# CREATE WINDOW #
# # # # # # # # #
$window = Window.new
GameState.switch PlayState.instance
$window.show

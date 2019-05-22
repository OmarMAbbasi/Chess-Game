require_relative "cursor.rb"
require_relative "Board.rb"
require 'colorize'
require 'colorized_string'
# require_relative "Piece.rb"
# require_relative "NullPiece"



require "byebug"
class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)    
    @board = board
  end

  def render
    until false
      @board.rows.each do |row|
        row.each_with_index do |space,idx|
          
          ele = space
          print  " #{ele.inspect} "
        end
        puts
      end
    end
    
  end

end

b = Board.new
d = Display.new(b)
d.render
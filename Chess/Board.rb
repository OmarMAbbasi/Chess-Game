require_relative "Piece.rb"
require_relative "NullPiece.rb"
require "byebug"
class Board
  
  attr_reader :rows

  def initialize
    @sentinel = NullPiece.new
    @rows = Array.new(8){Array.new(8){@sentinel}}
    #debugger
    init_black
    init_white
  end

  def [](pos)
    row, col = pos
    return @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end
  # def move_piece(start_pos, end_pos)
  #   if start_pos.nil?
  #     raise "No piece here"
  #   elsif valid_pos?(end_pos)
  #      raise "Not a valid position"
  #   else
  #     self(end_pos)
  # end

  def init_black
    @rows[1].each_with_index do |space,idx|
      space = Pawn.new(:black,self,[1,idx])
    end
    @rows[0].each_with_index do |space,idx|
      case idx
      when 0 || 7
        space = Rook.new(:black,self,[0,idx])
      when 1 || 6
        space = Knight.new(:black,self,[0,idx])
      when 2 || 5
        space = Bishop.new(:black,self,[0,idx])
      when 3 
        space = Queen.new(:black,self,[0,idx])
      when 4
        space = King.new(:black,self,[0,idx])
      end
    end
  end

  def init_white
    @rows[1].each_with_index do |space,idx|
      space = Pawn.new(:white,self,[1,idx])
    end
    @rows[0].each_with_index do |space,idx|
      case idx
      when 0 || 7
        space = Rook.new(:white,self,[0,idx])
      when 1 || 6
        space = Knight.new(:white,self,[0,idx])
      when 2 || 5
        space = Bishop.new(:white,self,[0,idx])
      when 3 
        space = Queen.new(:white,self,[0,idx])
      when 4
        space = King.new(:white,self,[0,idx])
      end
    end
  end

  # def [](pos)
    
  # end
end






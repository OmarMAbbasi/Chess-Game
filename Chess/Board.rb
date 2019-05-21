require_relative "Piece.rb"
require_relative "NullPiece.rb"
require "byebug"
class Board
  
  attr_reader :rows

  def initialize
    @sentinel = NullPiece.instance
    @rows = Array.new(8){Array.new(8){@sentinel}}
    debugger
    @rows[1].each.with_index do |space,idx|
      @rows[1][idx] = Piece.new(:black,self,[1,idx])
    end
    @rows[0].each.with_index do |space,idx|
      case idx
      when 0 , 7
        @rows[0][idx]  = Piece.new(:black,self,[0,idx])
      when 1 , 6
        @rows[0][idx]  = Piece.new(:black,self,[0,idx])
      when 2 , 5
        @rows[0][idx]  = Piece.new(:black,self,[0,idx])
      when 3 
        @rows[0][idx]  = Piece.new(:black,self,[0,idx])
      when 4
        @rows[0][idx]  = Piece.new(:black,self,[0,idx])
      end
    end
    
    @rows[6].each.with_index do |space,idx|
      @rows[6][idx]  = Piece.new(:white,self,[6,idx])
    end
    @rows[7].each.with_index do |space,idx|
      case idx
      when 0 , 7
        @rows[7][idx] = Piece.new(:white,self,[7,idx])
      when 1 , 6
        @rows[7][idx] = Piece.new(:white,self,[7,idx])
      when 2 , 5
        @rows[7][idx] = Piece.new(:white,self,[7,idx])
      when 3 
        @rows[7][idx] = Piece.new(:white,self,[7,idx])
      when 4
        @rows[7][idx] = Piece.new(:white,self,[7,idx])
      end
    end
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end 

  def []=(pos, val)
    @rows[pos] = val
  end

  def move_piece(start_pos, end_pos)
    raise EmptySquareError if self[start_pos].is_a?(NullPiece)
    # raise IllegalMoveError unless valid_pos?(end_pos)
    self[end_pos] = self[start_pos]
    
    self[start_pos] = @sentinel
  end

  def valid_pos?(foo)

    puts "hi"

  end

  class EmptySquareError < ArgumentError; end
  class IllegalMoveError < ArgumentError; end


  def init_black

  end

  def init_white
 
  end



  # def init_black
  #   @rows[1].each_with_index do |space,idx|
  #     space = Pawn.new(:black,self,[1,idx])
  #   end
  #   @rows[0].each_with_index do |space,idx|
  #     case idx
  #     when 0 || 7
  #       space = Rook.new(:black,self,[0,idx])
  #     when 1 || 6
  #       space = Knight.new(:black,self,[0,idx])
  #     when 2 || 5
  #       space = Bishop.new(:black,self,[0,idx])
  #     when 3 
  #       space = Queen.new(:black,self,[0,idx])
  #     when 4
  #       space = King.new(:black,self,[0,idx])
  #     end
  #   end
  # end

  # def init_white
  #   @rows[1].each_with_index do |space,idx|
  #     space = Pawn.new(:white,self,[1,idx])
  #   end
  #   @rows[0].each_with_index do |space,idx|
  #     case idx
  #     when 0 || 7
  #       space = Rook.new(:white,self,[0,idx])
  #     when 1 || 6
  #       space = Knight.new(:white,self,[0,idx])
  #     when 2 || 5
  #       space = Bishop.new(:white,self,[0,idx])
  #     when 3 
  #       space = Queen.new(:white,self,[0,idx])
  #     when 4
  #       space = King.new(:white,self,[0,idx])
  #     end
  #   end
  # end


end

# require_relative "Board.rb"
a = Board.new
print a.rows
#a.move_piece([0,3],[1,2])





require_relative "Piece.rb"
require_relative "NullPiece.rb"
require "byebug"
class Board
  
  attr_reader :rows

  def initialize
    @sentinel = NullPiece.instance
    @rows = Array.new(8){Array.new(8){@sentinel}}
    # debugger
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

  #comment out the until loop when done with move_piece
  def move_piece(start_pos, end_pos)
    i = 0
    begin
      valid_pos?(start_pos)
      valid_pos?(end_pos)
      self[end_pos] = self[start_pos]
      self[start_pos] = @sentinel
    rescue EmptySquareError
      until i == 5
        i += 1
        puts "There is no piece there"
        retry
      end
    rescue IllegalMoveError
      until i == 5
        i += 1
      puts "Not a legal move"
      retry
      end
    end
    
  end

  def valid_pos?(pos)
    raise IllegalMoveError if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7 
    raise EmptySquareError if self[pos].is_a?(NullPiece)
    # raise IllegalMoveError unless valid_pos?(pos)

    return nil
  end

  class EmptySquareError < ArgumentError; end
  class IllegalMoveError < ArgumentError; end




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
# a = Board.new
# a.move_piece([3,3],[8,12])
# print a.rows





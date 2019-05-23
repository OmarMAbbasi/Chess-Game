require_relative "Piece.rb"
require "singleton"

class NullPiece < Piece
  include Singleton
  def initialize
    
  end
  def inspect
    "N"
  end

end
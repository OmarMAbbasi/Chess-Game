class Blah
  def initialize
    @a = 0
  end
  def get_in 
  begin
    a = gets.chomp
  rescue
    puts "oops"
    retry
  end

  def danger(b)
    raise TooHigh if b > 10
    return b*2
  end
end

class TooHigh < ArgumentError; end
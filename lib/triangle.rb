require "pry"

class Triangle
  def initialize(a, b, c)
    @side_1 = a
    @side_2 = b
    @side_3 = c
    @sides_list = [@side_1, @side_2, @side_3]
  end

  def kind
    # binding.pry
    if @sides_list.any?(nil) || @sides_list.any? {|side| side <= 0} || impossible_triangle?
      begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.message
      end
    else
      if @side_1 == @side_2 && @side_1 == @side_3
        :equilateral
      elsif @side_1 == @side_2 || @side_1 == @side_3 || @side_2 == @side_3
        :isosceles
      elsif @side_1 != @side_2 && @side_1 != @side_3 && @side_2 != @side_3
        :scalene
      end
    end

  end

  def impossible_triangle?

    
    # binding.pry
    if (@side_1 + @side_2) <= @side_3
      true
    elsif (@side_1 + @side_3) <= @side_2
      true
    elsif (@side_2 + @side_3) <= @side_1
      true
    else
      false
    end
    
  end

  class TriangleError < StandardError
  end
end

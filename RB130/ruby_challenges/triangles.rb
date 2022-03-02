class Triangle
  def initialize(side1, side2, side3)
    @triangle = [side1, side2, side3]
    validate_triangle            
  end

  def kind
    if @triangle.all? { |side| @triangle[0] == side }
      'equilateral'
    elsif @triangle[0] == @triangle[1] || @triangle[0] == @triangle[2] || 
          @triangle[1] == @triangle[2]
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def validate_triangle
    raise ArgumentError if @triangle.any? { |side| side <= 0 } || !valid_sides?
  end

  def valid_sides?
    @triangle[0] + @triangle[1] > @triangle[2] &&
    @triangle[0] + @triangle[2] > @triangle[1] &&
    @triangle[1] + @triangle[2] > @triangle[0]
  end
end

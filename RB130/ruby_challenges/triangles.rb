class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3].sort
    raise ArgumentError  if invalid? 
  end

  def kind
    return 'equilateral' if @sides.uniq.size == 1
    return 'isosceles' if @sides[0] == @sides[1] || @sides[1] == @sides[2]
    'scalene'
  end

  private

  def invalid?
     @sides.min <= 0 || unequal_sides
  end

  def unequal_sides
    @sides[0] + @sides[1] <= @sides[2] || 
    @sides[1] + @sides[2] <= @sides[0] || 
    @sides[2] + @sides[0] <= @sides[1]
  end
end

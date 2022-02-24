class Triangle
  # write code here
  attr_accessor :length_a, :length_b, :length_c

  def initialize(length_a, length_b, length_c)
    @length_a = length_a
    @length_b = length_b
    @length_c = length_c
  end

  def kind
    validate_triangle
    if length_a == length_b && length_b == length_c
      :equilateral
    elsif length_a == length_b || length_b == length_c || length_c == length_a
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [length_a, length_b, length_c].all?(&:positive?)
  end

  def valid_triangle_inequality?
    length_a + length_b > length_c && length_a + length_c > length_b && length_b + length_c > length_a
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end

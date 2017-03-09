class Format
  def initialize(object)
    @object = object
  end

  def to_s
    string = @object.map { |key, value| "#{key} #{value}, " }.join
    trail_with_newline(string)
  end

  private

  def trail_with_newline(order)
    trailing_chars = /(, $)/
    order.gsub(trailing_chars, " \n")
  end
end

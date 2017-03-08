class Format
  def initialize(object)
    @object = object
  end

  def to_s
    string = @object.map do |key, value|
      "#{key} #{value}, "
    end
    trail_with_newline(string.join)
  end

  private

  def trail_with_newline(order)
    trailing_chars = /(, $)/
    order.gsub(trailing_chars, " \n")
  end
end

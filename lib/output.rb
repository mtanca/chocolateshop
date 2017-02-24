class Output

  def to_s(order)
    # where c = chocolate, q = quantity
    order_string = order.map { |c, q| "#{c} #{q}, " }.join
    trail_with_newline(order_string)
  end

  private

  # replaces extra comma and space at end of each line with a new-line char
  def trail_with_newline(order)
    trailing_chars = /(, $)/
    order.gsub(trailing_chars, "\n")
  end
end

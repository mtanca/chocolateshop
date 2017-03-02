class Output
  class << self
    def to_s(cart)
      # where c = chocolate, q = quantity
      order_string = cart.map { |c, q| "#{c} #{q}, " }.join
      trail_with_newline(order_string)
    end

    private

    # replaces extra comma and space at end of each line with a new-line char
    def trail_with_newline(order)
      trailing_chars = /(, $)/
      order.gsub(trailing_chars, " \n")
    end
  end
end

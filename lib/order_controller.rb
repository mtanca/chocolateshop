class OrderController
  DEFAULT_INPUT_PATH = 'input/orders.csv'.freeze
  DEFAULT_OUTPUT_PATH = 'output/redemptions.csv'.freeze

  def create_order_batch(input_path = DEFAULT_INPUT_PATH, output_path = DEFAULT_OUTPUT_PATH)
    order_batch = OrderFileReader.new(input_path).read_orders
    redeemed_orders = order_batch.map(&:redeem_wrappers)
    orders = redeemed_orders.map { |order| Format.new(order).to_s }
    OrderFileWriter.new(output_path).write(orders.join)
  end
end

class OrderController
  DEFAULT_INPUT_PATH = 'input/orders.csv'.freeze
  DEFAULT_OUTPUT_PATH = 'output/redemptions.csv'.freeze

  def create_order_batch(input_path = DEFAULT_INPUT_PATH, output_path = DEFAULT_OUTPUT_PATH)
    raw_order_batch = OrderFileReader.new.read_csv(input_path)
    add_redemptions = raw_order_batch.map(&:redeem_wrappers)
    order_batch = add_redemptions.map { |order| Output.new.to_s(order) }
    OrderFileWriter.new.write(output_path, order_batch.join)
  end
end

class OrderController
  DEFAULT_INPUT_PATH = 'input/orders.csv'.freeze
  DEFAULT_OUTPUT_PATH = 'output/redemptions.csv'.freeze

  def create_order_batch(input_path = DEFAULT_INPUT_PATH, output_path = DEFAULT_OUTPUT_PATH)
    raw_order_batch = OrderFileReader.read_csv(input_path)
    final_order_batch = raw_order_batch.map(&:redeem_wrappers).join
    OrderFileWriter.write(output_path, final_order_batch)
  end
end

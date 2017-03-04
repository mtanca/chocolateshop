class OrderController
  DEFAULT_INPUT_PATH = 'input/orders.csv'.freeze
  DEFAULT_OUTPUT_PATH = 'output/redemptions.csv'.freeze

  def self.create_order_batch(input_path = DEFAULT_INPUT_PATH, output_path = DEFAULT_OUTPUT_PATH)
    initial_order_batch = OrderFileReader.new(input_path).read_csv
    final_order_batch = initial_order_batch.map(&:redeem_wrappers).join
    OrderFileWriter.write(output_path, final_order_batch)
  end
end

describe OrderController do
  context '.create_batch_order' do
    let(:input_path) { 'input/orders.csv' }
    let(:output_path) { Tempfile.new('temp_redemptions.cvs').path }
    let(:order_batch) { OrderController.create_order_batch(input_path, output_path) }

    it 'should create a new batch of orders' do
      expect(order_batch).to match(File.open(output_path).read)
    end
  end
end

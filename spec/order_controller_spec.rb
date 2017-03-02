describe OrderController do

  context '#create_batch_order' do
    let(:input_path) {'input/orders.csv'}
    let(:output_path) { Tempfile.new('temp_redemptions.cvs').path }

    it 'should create a new batch of orders' do
      expect(subject.create_order_batch(input_path, output_path)).to match(File.open(output_path).read)
    end
  end
end

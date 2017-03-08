describe OrderFileReader do
  let(:input_file_path) {'input/orders.csv'}
  let(:order_batch) {OrderFileReader.new(input_file_path).read_orders}
  let(:csv_options) { {headers: true, converters: :numeric, header_converters: :symbol} }

  context '#read_orders' do
    it 'reads a csv' do
      expect(CSV).to receive(:foreach).with(input_file_path, csv_options)
      OrderFileReader.new(input_file_path).read_orders
    end

    it 'returns an array of order objects' do
      order_batch.each do |order|
        expect(order).to respond_to(:redeem_wrappers)
      end
    end
  end
end

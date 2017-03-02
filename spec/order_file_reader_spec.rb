describe OrderFileReader do
  let(:input_file_path) {'input/orders.csv'}
  let(:order_batch) {OrderFileReader.read_csv(input_file_path)}
  let(:csv_options) { {headers: true, converters: :numeric, header_converters: :symbol} }

  context '.read_csv' do
    it 'reads a csv' do
      expect(CSV).to receive(:foreach).with(input_file_path, csv_options)
      OrderFileReader.read_csv(input_file_path)
    end

    it 'returns an array of order objects' do
      order_batch.each do |order|
        expect(order).to respond_to(:redeem_wrappers)
      end
    end
  end
end

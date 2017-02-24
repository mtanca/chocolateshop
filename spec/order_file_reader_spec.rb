describe OrderFileReader do
  let(:input_file_path) {'input/orders.csv'}
  let(:order_batch) {subject.read_csv(input_file_path)}
  let(:csv_options) { {headers: true, converters: :numeric, header_converters: :symbol} }

  context '#read_csv' do
    it 'reads a valid csv' do
      expect(CSV).to receive(:foreach).with(input_file_path, csv_options)
      subject.read_csv(input_file_path)
    end

    it 'returns an array of order objects' do
      expect(order_batch.map { |order| order.class == Order }).to_not include(false)
    end
  end
end

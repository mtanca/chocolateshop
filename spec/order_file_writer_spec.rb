describe OrderFileWriter do
  context '.write' do
    let(:path) { Tempfile.new('test_redemptions.cvs').path }
    let(:order_batch) { "order1 \n order2 \n order3 \n" }

    it 'should write order batch to file via path given' do
      OrderFileWriter.write(path, order_batch)
      expect(File.open(path).read).to match order_batch
    end
  end
end

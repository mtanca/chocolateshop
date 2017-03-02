describe OrderFileWriter do
  let(:path) { Tempfile.new('test_redemptions.cvs').path }
  let(:order_batch) { "order1 line 1 \n order2 line 2 \n order3 line 3 \n" }

  context '.write' do
    it 'should write order batch to file via path given' do
      OrderFileWriter.write(path, order_batch)
      expect(File.open(path).read).to match order_batch
    end
  end
end

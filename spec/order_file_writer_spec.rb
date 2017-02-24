describe OrderFileWriter do
  let(:path) { Tempfile.new('test_redemptions.cvs').path }
  let(:order_batch) { "order1 line 1 \n order2 line 2 \n order3 line 3 \n" }
  let(:file_writer) { OrderFileWriter.new}

  context 'when #write_order_to_file' do
    it 'should write order batch to file via path given' do
      file_writer.write(path, order_batch)
      expect(File.open(path).read).to match order_batch
    end
  end
end

class OrderFileWriter
  def self.write(output_file_path, order_batch)
    File.open(output_file_path, 'w') { |file| file.write(order_batch) }
    order_batch
  end
end

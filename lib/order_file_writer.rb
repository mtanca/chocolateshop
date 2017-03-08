class OrderFileWriter
  def initialize(output_file_path)
    @output_file_path = output_file_path
  end

  def write(order_batch)
    File.open(@output_file_path, 'w') { |file| file.write(order_batch) }
    order_batch
  end
end

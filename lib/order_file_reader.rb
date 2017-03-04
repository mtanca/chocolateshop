class OrderFileReader
  CSV_OPTIONS = {
    headers: true,
    converters: :numeric,
    header_converters: :symbol
  }.freeze

  def initialize(input_file_path)
    @input_file_path =  input_file_path
  end

  def read_csv
    order_batch = []
    CSV.foreach(@input_file_path, CSV_OPTIONS) do |order|
      order = Order.new({
        # removes single quotes and spacing from parsing csv file
        type: order[:type].delete("'").strip,
        cash: order[:cash],
        price: order[:price],
        wrappers_needed: order[:wrappers_needed]
      })
      order_batch << order
    end
    order_batch
  end
end

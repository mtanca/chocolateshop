describe Format do
  context '#to_s' do
    let (:order) { { 'milk': 7, 'dark': 0, 'white': 2, 'sugar free': 2 } }
    let (:correct_string) { "milk 7, dark 0, white 2, sugar free 2 \n" }

    it 'should format data as a string' do
      expect(Format.new(order).to_s).to match correct_string
    end
  end
end

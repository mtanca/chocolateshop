describe "Output" do

  context '.to_s' do
    let (:order) { { 'milk': 7, 'dark': 0, 'white': 2, 'sugar free': 2 } }
    let (:correct_string) { "milk 7, dark 0, white 2, sugar free 2 \n" }

    it 'should return hash data as a string' do
      expect(Output.to_s(order)).to match correct_string
    end
  end
end

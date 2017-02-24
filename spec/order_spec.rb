describe Order do
  describe '#redeem_wrappers' do
    let(:order_1) { Order.new({ cash: 12, price: 2, wrappers_needed: 5, type: 'milk' }) }
    let(:order_2) { Order.new({ cash: 12, price: 6, wrappers_needed: 4, type: 'dark' }) }
    let(:order_3) { Order.new({ cash: 6, price: 2, wrappers_needed: 2, type: 'sugar free' }) }
    let(:order_4) { Order.new({ cash: 6, price: 2, wrappers_needed: 2, type: 'white' }) }

    context 'when type is milk' do
      let(:correct_quantities) { { 'milk' => 7, 'dark' => 0, 'white' => 0, 'sugar free' => 1 } }
      it 'returns the correct chocolate quantities' do
        expect(order_1.redeem_wrappers).to eq(correct_quantities)
      end
    end

    context 'when type is dark' do
      let(:correct_quantities) { { 'milk' => 0, 'dark' => 2, 'sugar free' => 0, 'white' => 0 } }
      it 'returns the correct chocolate quantities' do
        expect(order_2.redeem_wrappers).to eq(correct_quantities)
      end
    end

    context 'when type is sugar free' do
      let(:correct_quantities) { { 'milk' => 0, 'dark' => 3, 'sugar free' => 5, 'white' => 0 } }
      it 'returns the correct chocolate quantities' do
        expect(order_3.redeem_wrappers).to eq(correct_quantities)
      end
    end

    context 'when type is milk' do
      let(:correct_quantities) { { 'milk' => 0, 'dark' => 1, 'sugar free' => 3, 'white' => 5 } }
      it 'returns the correct chocolate quantities' do
        expect(order_4.redeem_wrappers).to eq(correct_quantities)
      end
    end
  end
end

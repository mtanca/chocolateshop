describe Order do
  describe '#redeem_wrappers' do
    context 'when type is milk' do
      let(:order) { Order.new({ cash: 12, price: 2, wrappers_needed: 5, type: 'milk' }) }
      let(:correct_quantities) { {'milk'=>7, 'dark'=>0, 'white'=>0, 'sugar free'=>1} }

      it 'returns the correct chocolate quantities' do
        expect(order.redeem_wrappers).to eq(correct_quantities)
      end
    end

    context 'when type is dark' do
      let(:order) { Order.new({ cash: 12, price: 6, wrappers_needed: 4, type: 'dark' }) }
      let(:correct_quantities) { {'milk'=>0, 'dark'=>2, 'white'=>0, 'sugar free'=>0} }

      it 'returns the correct chocolate quantities' do
        expect(order.redeem_wrappers).to eq(correct_quantities)
      end
    end

    context 'when type is sugar free' do
      let(:order) { Order.new({ cash: 6, price: 2, wrappers_needed: 2, type: 'sugar free' }) }
      let(:correct_quantities) { {'milk'=>0, 'dark'=>3, 'white'=>0, 'sugar free'=>5} }

      it 'returns the correct chocolate quantities' do
        expect(order.redeem_wrappers).to eq(correct_quantities)
      end
    end

    context 'when type is white' do
      let(:order) { Order.new({ cash: 6, price: 2, wrappers_needed: 2, type: 'white' }) }
      let(:correct_quantities) { {'milk'=>0, 'dark'=>1, 'white'=>5, 'sugar free'=>3} }

      it 'returns the correct chocolate quantities' do
        expect(order.redeem_wrappers).to eq(correct_quantities)
      end
    end
  end
end

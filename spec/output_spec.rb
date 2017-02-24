describe Output do
  let (:order) { { milk: 7,dark: 0, white: 2, sugar_free: 2 } }

  context '#to_s' do
    it 'should return hash data as a string' do
      expect(Output.new.to_s(order)).to be_instance_of String
    end
  end
end

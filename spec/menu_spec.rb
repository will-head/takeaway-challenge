require 'menu'
require 'dish'

context Menu do
  let(:dish_number) { Integer.new }
  let(:dish_price) { Float.new }
  let(:dish_name) { String.new }

  before(:each) do
    @dish = Dish.new(:dish_number, :dish_price, :dish_name)
  end
  
  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }

    it 'returns dish added on success' do
      expect(subject.add(@dish)).to eq @dish
    end
    
    it 'raises error if dish number is not unique' do
      subject.add(Dish.new(1, :dish_price, :dish_name))
      expect { subject.add(Dish.new(1, :dish_price, :dish_name)) }.to raise_error "Error: that dish number already exists"
    end
    
  end

  describe '#get' do
    it { is_expected.to respond_to(:get).with(1).argument }
  end
  
end

class Order
  attr_reader :type, :wrappers_needed, :wrappers_used, :cart

  COMPLEMENTARY_CHOCOLATES = {
      'milk' => ['milk', 'sugar free'],
      'white' => ['white', 'sugar free'],
      'sugar free' => ['dark', 'sugar free'],
      'dark' => ['dark']
  }.freeze

  CHOCOLATES = {
    'milk' => 0,
    'dark' => 0,
    'white' => 0,
    'sugar free' => 0
  }.freeze

  def initialize(type:, cash:, price:, wrappers_needed:)
    @type = type
    @wrappers_needed = wrappers_needed
    @cart = CHOCOLATES.dup
    @wrappers_used = CHOCOLATES.dup
    # initial amount in cart before redemptions added
    @cart[@type] = cash / price
  end

  def redeem_wrappers
    cart.each do |chocolate, _quantity|
      redemptions = possible_redemptions(chocolate)
      if redemptions > 0
        update_wrappers(chocolate, redemptions)
        award_redemptions(chocolate, redemptions)
        redeem_wrappers
      end
    end
  end

  private

  def possible_redemptions(chocolate)
    (cart[chocolate] - wrappers_used[chocolate]) / wrappers_needed
  end

  def update_wrappers(chocolate, redemptions)
    wrappers_used[chocolate] += (redemptions * wrappers_needed)
  end

  def award_redemptions(chocolate, redemptions)
    COMPLEMENTARY_CHOCOLATES[chocolate].each do |c|
      cart[c] += redemptions
    end

    cart
  end
end
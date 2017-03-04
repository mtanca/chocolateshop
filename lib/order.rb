class Order
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
    @cart[@type] = cash / price
  end

  def redeem_wrappers
    cart.each do |chocolate, _quantity|
      redemption_amount = possible_redemptions(chocolate)
      if redemption_amount >= 1
        update_wrappers(chocolate, redemption_amount)
        award_redemptions(chocolate, redemption_amount)
        redeem_wrappers
      end
    end

    cart.to_s
  end

  private
  attr_reader :type, :wrappers_needed, :wrappers_used, :cart

  def possible_redemptions(chocolate)
    (cart[chocolate] - wrappers_used[chocolate]) / wrappers_needed
  end

  def update_wrappers(chocolate, redemption_amount)
    wrappers_used[chocolate] += (redemption_amount * wrappers_needed)
  end

  def award_redemptions(chocolate, redemption_amount)
    COMPLEMENTARY_CHOCOLATES[chocolate].each do |c|
      cart[c] += redemption_amount
    end

    cart
  end
end

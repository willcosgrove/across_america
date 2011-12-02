class Donation < ActiveRecord::Base
  attr_accessor :stripe_card_token, :amount
  
  def save_with_payment
    # binding.pry
    self.value_in_pennies = (amount.to_i * 100)
    if valid?
      charge = Stripe::Charge.create(amount: value_in_pennies, currency: "usd", card: stripe_card_token)
      self.stripe_charge = charge.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end

class HomeController < ApplicationController
  
  def index
    @donated = Donation.sum(:value_in_pennies)/100
    @donation = Donation.new
  end
  
end

class BlacklistedCustomersController < ApplicationController
  def index
    @customers = Customer.blacklisted
  end

  def blacklist_by_phone
    customer = Customer.find_by(phone_number: params[:phone_number])

    if customer&.blacklist
      redirect_back fallback_location: blacklisted_customers_path,
                    notice: 'Customer was blacklisted'
    else
      redirect_back fallback_location: blacklisted_customers_path,
                    alert: 'Customer was not blacklisted'
    end
  end

  def unblacklist
    if Customer.blacklisted.find(params[:id]).unblacklist
      redirect_back fallback_location: blacklisted_customers_path,
                    notice: 'Customer was unblacklisted'
    else
      redirect_back fallback_location: blacklisted_customers_path,
                    alert: 'Customer was not unblacklisted'
    end
  end
end

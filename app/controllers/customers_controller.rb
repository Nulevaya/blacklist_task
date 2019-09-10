class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :blacklist]

  def index
    @customers = Customer.not_blacklisted
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_back fallback_location: edit_customer_path(@customer),
                    notice: 'Customer was updated'
    else
      flash[:alert] = 'Customer was not updated'
      render :edit
    end
  end

  def blacklist
    if @customer.blacklist
      redirect_back fallback_location: customers_path,
                    notice: 'Customer was blacklisted'
    else
      redirect_back fallback_location: customers_path,
                    alert: 'Customer was not blacklisted'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :description, :phone_number)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end

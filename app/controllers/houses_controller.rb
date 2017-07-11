class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
  end

  def view
  end

  def edit
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new
    @house.address = params[:house][:address]
    @house.cost = params[:house][:cost]
    @house.down_payment = params[:house][:down_payment]
    @house.interest = params[:house][:interest]
    @house.period = params[:house][:period]
    @house.taxes = params[:house][:taxes]

    if @house.save
      flash[:notice] = "Post was saved."
      redirect_to @house
    else

      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

end

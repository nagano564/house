class CalculatorsController < ApplicationController

  def new
    @calculator = Calculator.new
  end

  def index
    @calculators = Calculator.all
  end

end

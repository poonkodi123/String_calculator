class CalculationsController < ApplicationController
  def new
  end

  def calculate
    begin
      input_string = params[:numbers]
      @result = StringCalculator.calculate(input_string)
      debugger
      flash[:notice] = "Calculation successful!"
    rescue => e
      flash[:alert] = e.message
      @result = nil
    end

    render :new
  end
end

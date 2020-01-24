class SimulationsController < ApplicationController
  def company_plans
  end

  def brl_params(value)
    {
      to: "Brazil",
      from: [
        { country: "Brazil", values: [value.to_f] }
      ]
    }
  end

  def mex_params(value)
    {
      to: "Mexico",
      from: [
        { country: "Brazil", values: [value.to_f] }
      ]
    }
  end

  def usd_params(value)
    {
      to: "United States",
      from: [
        { country: "Brazil", values: [value.to_f] }
      ]
    }
  end

  def ger_params(value)
    {
      to: "Germany",
      from: [
        { country: "Brazil", values: [value.to_f] }
      ]
    }
  end

  def company_plan
    countries = {
      br: ConverterFactory.new(brl_params(params[:value])).build,
      us: ConverterFactory.new(usd_params(params[:value])).build,
      mx: ConverterFactory.new(mex_params(params[:value])).build,
      ge: ConverterFactory.new(ger_params(params[:value])).build
    }

    @plan_name = params[:plan_name]

    @result = countries.map do |key, val|
      { country: key, val: ConverterService.convert!(val) }
    end
  end
end

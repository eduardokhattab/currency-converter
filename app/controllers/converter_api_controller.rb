class ConverterApiController < ApplicationController
  before_action :set_converter

  def convert
    render json: ConverterService.convert!(@converter).to_json
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def converter_params
      params.require(:converter).permit(:to, :from)
    end

    def set_converter
      @converter = ConverterFactory.new(params[:converter]).build
    end
end

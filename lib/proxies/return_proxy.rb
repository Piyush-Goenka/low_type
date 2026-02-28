# frozen_string_literal: true

require_relative '../interfaces/error_interface'
require_relative '../types/error_types'

class ::Lowkey::ReturnProxy
  include ::Low::ErrorInterface

  def error_type
    ::Low::ReturnTypeError
  end

  def error_message(value:)
    "Invalid return type '#{output(value:)}' for method '#{@name}'. Valid types: '#{@expression.valid_types}'"
  end
end

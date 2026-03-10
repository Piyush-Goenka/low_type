# frozen_string_literal: true

# A value expression presents a type as a value:
# 1. It is an instance
# 2. It has a class method
class ValueExpression
  attr_reader :value

  def initialize(value:)
    @value = value
  end

  def class
    @value
  end
end

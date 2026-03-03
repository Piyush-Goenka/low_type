# frozen_string_literal: true

require_relative 'sinatra_adapter'

module Low
  module Adapter
    class Loader
      class << self
        def load(klass:, **)
          ancestors = klass.ancestors.map(&:to_s)
          return SinatraAdapter.new if ancestors.include?('Sinatra::Base')
          nil
        end
      end
    end
  end
end

# frozen_string_literal: true

require_relative 'sinatra_adapter'

module Low
  module Adapter
    class Loader
      class << self
        def load(klass:, class_proxy:)
          ancestors = klass.ancestors.map(&:to_s)
          return SinatraAdapter.new(class_proxy:) if ancestors.include?('Sinatra::Base')
          nil
        end
      end
    end
  end
end

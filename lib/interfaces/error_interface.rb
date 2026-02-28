# frozen_string_literal: true

module Low
  # Used by proxies to output errors.
  module ErrorInterface
    def error_type
      raise NotImplementedError
    end

    def error_message(value:)
      raise NotImplementedError
    end

    def output(value:)
      case LowType.config.output_mode
      when :type
        # TODO: Show full type structure in error output instead of just the type of the supertype.
        value.class
      when :value
        value.inspect[0...LowType.config.output_size]
      else
        'REDACTED'
      end
    end

    def backtrace(backtrace:, hidden_paths:)
      # Remove LowType defined method file paths from the backtrace.
      filtered_backtrace = backtrace.reject { |line| hidden_paths.find { |file_path| line.include?(file_path) } }

      # Add the proxied entity to the backtrace.
      proxy_file_backtrace = "#{file_path}:#{start_line}:in '#{scope}'"
      from_prefix = filtered_backtrace.first.match(/\s+from /)
      proxy_file_backtrace = "#{from_prefix}#{proxy_file_backtrace}" if from_prefix

      [proxy_file_backtrace, *filtered_backtrace]
    end
  end
end

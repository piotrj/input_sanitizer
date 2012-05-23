module InputSanitizer
  class ConversionError < Exception
  end

  class IntegerConverter
    def call(value)
      cast = value.to_i
      if cast.to_s != value.to_s
        raise ConversionError.new
      end
      cast
    end
  end

  class StringConverter
    def call(value)
      value.to_s
    end
  end

  class DateConverter
    def call(value)
      begin
        Date.iso8601(value)
      rescue ArgumentError
        raise ConversionError.new
      end
    end
  end
end
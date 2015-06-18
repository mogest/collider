class Structy
  def initialize(attributes)
    @attributes = attributes
  end

  def method_missing(method, *args)
    if args.empty? && @attributes.key?(method)
      value = @attributes[method]
      case value
      when Hash
        Structy.new(value)
      when Array
        value.map do |element|
          element.is_a?(Hash) ? Structy.new(element) : element
        end
      else
        value
      end
    else
      super
    end
  end
end

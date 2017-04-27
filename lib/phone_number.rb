class Phone_number
  @@phone_numbers = []

  attr_accessor(:type,:extension,:area_code,:number)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @extension = attributes.fetch(:extension)
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
  end

  define_singleton_method(:all) do
    @@phone_numbers
  end

  define_method(:save) do
    @@phone_numbers.push(self)
  end

  define_singleton_method(:clear) do
    @@phone_numbers = []
  end
end

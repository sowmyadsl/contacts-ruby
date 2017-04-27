require "contacts"
require "address"
require "email"

class Phone_number
  @@phone_numbers = []

  attr_accessor(:type,:extension,:area_code,:number)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @extension = attributes.fetch(:extension)
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
    @id = "phone_number".+((@@phone_numbers.length().+(1)).to_s)
  end

  define_method(:id) do
    @id
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

  define_singleton_method(:find) do |id|
    found_phone_number = nil
    @@phone_numbers.each() do |phone_number|
      if phone_number.id().eql?(id)
        found_phone_number = phone_number
      end
    end
    found_phone_number
  end
end

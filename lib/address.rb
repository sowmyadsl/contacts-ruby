class Address
  @@addresses = []
  attr_accessor(:type,:street_address,:city,:state,:zip_code)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @street_address = attributes.fetch(:street_address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip_code = attributes.fetch(:zip_code)
    @id = "address".+((@@addresses.length().+(1)).to_s)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@addresses
  end

  define_method(:save) do
    @@addresses.push(self)
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end

  define_singleton_method(:find) do |id|
    found_address = nil
    @@addresses.each() do |address|
      if address.id().eql?(id)
        found_address = address
      end
    end
    found_address
  end

end

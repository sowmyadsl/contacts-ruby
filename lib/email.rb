class Email
  @@emails= []

  attr_accessor(:email_address,:type)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @email_address = attributes.fetch(:email_address)
  end

  define_singleton_method(:all) do
    @@emails
  end

  define_method(:save) do
    @@emails.push(self)
  end

  define_singleton_method(:clear) do
    @@emails = []
  end
end

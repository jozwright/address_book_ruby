require 'address'
require 'email'
require 'phone'

class Contact
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def initialize(contact_input)
    @name = name
  end

  def name
    @name
  end

end

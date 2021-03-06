class Contact
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@all_contacts = []
  end

  def Contact.search(search_name)
    Contact.all.each do |contact|
      if search_name == contact.name
       @result = contact
      end
    end
    return @result
  end

  def save
    @@all_contacts << self
  end

  def initialize(name)
    @name = name
    @addresses = []
    @emails = []
    @phones = []
  end

  def add_address(address_object)
    @addresses << address_object
  end

  def add_email(email_object)
    @emails << email_object
  end

  def add_phone(phone_object)
    @phones << phone_object
  end

  def addresses
    @addresses
  end

  def emails
    @emails
  end

  def phones
    @phones
  end

  def name
    @name
  end

  def edit_name(edited_name)
    @name = edited_name
  end

  def delete
    Contact.all.delete_if do |individual|
      self == individual
    end
  end
end

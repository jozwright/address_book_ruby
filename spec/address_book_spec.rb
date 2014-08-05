require 'rspec'
require 'address'
require 'email'
require 'phone'
require 'contact'

describe Contact do
  before do
    Contact.clear
  end

  it 'is initialized with a name' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.should be_an_instance_of Contact
  end

  it 'allows users to add multiple contacts' do
    new_contact = Contact.new 'John Doe'
    new_contact.save
    new_contact_two = Contact.new 'Jane Doe'
    new_contact_two.save
    Contact.all.should eq [new_contact, new_contact_two]
  end

  describe '.all' do
    it 'starts as an empty array' do
      Contact.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears all contacts' do
      Contact.clear.should eq []
    end
  end

  describe 'save' do
    it 'adds a contact to the array of contacts' do
      test_contact = Contact.new 'Jane Doe'
      test_contact.save
      Contact.all.should eq [test_contact]
    end
  end

  it 'adds an address to a contact' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.save
    test_address = Address.new '123 Main St.', 'Pleasantville', 'Oregon', '97102'
    test_address.save
    test_contact.add_address(test_address)
    test_contact.addresses.should eq [test_address]
  end

  it 'adds multiple addresses' do
    test_contact = Contact.new 'John Doe'
    test_contact.save
    test_address = Address.new '123 Main St.', 'Pleasantville', 'Oregon', '97102'
    test_address_two = Address.new '123 Main St.', 'Pleasantville', 'Oregon', '12345'
    test_contact.add_address(test_address)
    test_contact.add_address(test_address_two)
    test_contact.addresses.should eq [test_address, test_address_two]
  end

  it 'allows user to edit the street in a contact address' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.save
    test_address = Address.new '123 Maine St.', 'Pleasantville', 'Oregon', '98656'
    test_address.edit_street '234 Main St.'
    test_address.street.should eq '234 Main St.'
  end

  it 'adds an email address to a contact' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.save
    test_email = Email.new 'janedoe@gmail.com'
    test_email.save
    test_contact.add_email(test_email)
    test_contact.emails.should eq [test_email]
  end

  it 'adds multiple emails' do
    test_contact = Contact.new 'John Doe'
    test_contact.save
    test_email = Email.new 'janedoe@gmail.com'
    test_email_two = Email.new 'johndoe@gmail.com'
    test_contact.add_email(test_email)
    test_contact.add_email(test_email_two)
    test_contact.emails.should eq [test_email, test_email_two]
  end

  it 'adds a phone number to a contact' do
    test_contact = Contact.new 'Jane Doe'
    test_contact.save
    test_phone = Phone.new '503-333-3333', '222'
    test_phone.save
    test_contact.add_phone(test_phone)
    test_contact.phones.should eq [test_phone]
  end

  it 'adds multiple phone numbers' do
    test_contact = Contact.new 'John Doe'
    test_contact.save
    test_phone = Phone.new '313-123-5678', '123'
    test_phone_two = Phone.new '313-123-5678', '124'
    test_contact.add_phone(test_phone)
    test_contact.add_phone(test_phone_two)
    test_contact.phones.should eq [test_phone, test_phone_two]
  end
end


describe Address do
  before do
    Address.clear
  end

  it 'is initialized with an address' do
    test_address = Address.new '123 Main St.', 'Pleasantville', 'Oregon', '97102'
    test_address.should be_an_instance_of Address
  end

  describe '.all' do
    it 'starts as an empty array' do
      Address.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears all addresses' do
      Address.clear.should eq []
    end
  end

  describe 'save' do
    it 'adds an address to the array of addresses' do
      test_address = Address.new '123 Main St.', 'Pleasantville', 'Oregon', '97102'
      test_address.save
      Address.all.should eq [test_address]
    end
  end
end

describe Email do
  before do
    Email.clear
  end

  it 'is initialized with an email' do
    test_email = Email.new 'janedoe@gmail.com'
    test_email.should be_an_instance_of Email
  end

  describe '.all' do
    it 'starts as an empty array' do
      Email.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears all emails' do
      Email.clear.should eq []
    end
  end

  describe 'save' do
    it 'adds an email to the array of emails' do
      test_email = Email.new 'janedoe@gmail.com'
      test_email.save
      Email.all.should eq [test_email]
    end
  end
end

describe Phone do
  before do
    Phone.clear
  end

  it 'is initialized with a name' do
    test_phone = Phone.new '503-333-3333', '123'
    test_phone.should be_an_instance_of Phone
  end

  describe '.all' do
    it 'starts as an empty array' do
      Phone.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears all phone numbers' do
      Phone.clear.should eq []
    end
  end

  describe 'save' do
    it 'adds a phone number to the array of phone numbers' do
      test_phone = Phone.new '123-456-7891', '123'
      test_phone.save
      Phone.all.should eq [test_phone]
    end
  end
end


require './lib/yes_em_yes'
require './lib/errors'

describe 'YesEmYes' do
  before :each do
    @sender = YesEmYes::Sender.new(user_name: 'u', password: 'p')
  end

  it "has a class Sender that takes in two required parameters user_name and password." do
    expect{ 
      YesEmYes::Sender.new() 
          }.to raise_error( YesEmYes::Error::RequiredArgumentMissingError )
  end

  it "has an optional parameter 'service'" do
    expect{ 
      YesEmYes::Sender.new( 
                       user_name: '1234567892',
                        password: 'password',
                         service: :way2sms
                          ) 
          }.to_not raise_error
  end

  it "has a class SMS with accessible parameters: 'to' and 'message'" do
    expect{ YesEmYes::SMS.new.to = "1234567890" }.to_not raise_error
    expect{ YesEmYes::SMS.new.message = "Holla" }.to_not raise_error
  end

  it "has a draft method that accepts a block" do
    expect{
      @sender.draft do |s|
        s.to = '123'
        s.message = 'Hola'
      end
          }.to_not raise_error
  end

  it "has a draft message that returns the class itself" do
    expect(
    @sender.draft do |sms|
      sms.to = "97456"
      sms.message = "Hey, there"
    end
    ).to eq( @sender )
  end

  it "has a set_service method that links the object to the specific service to use" do
    expect{ 
      YesEmYes::Sender.new(user_name: 'u', password: 'p', service: :way2sms) 
    }.not_to raise_error
  end

  it "throws an error for unrecognized services" do
    expect{ 
      YesEmYes::Sender.new(user_name: 'u', password: 'p', service: :fake_service) 
    }.to raise_error( YesEmYes::Error::UnRecognizedServiceError )
  end

  it "lists all drafts through the method drafts" do
    @sender.draft do |s|
      s.to = '123'
      s.message = 'Hey, there!'
    end

    expect( @sender.drafts.first.message ).to eq( "Hey, there!" )
  end
end

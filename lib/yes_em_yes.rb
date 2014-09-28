require './lib/errors'
require './lib/services'

module YesEmYes
  SMS = Struct.new(:to, :message) do
    def valid?
      self.to.match( /\d{10}/ ) and self.message.is_a?( String )
    end
  end

  class Sender
    attr_accessor :messages

    def initialize user_name: nil, password: nil, service: self.class.services.first
      raise Error::RequiredArgumentMissingError unless user_name and password

      @messages = []
      @user_name, @password = user_name, password

      set_service service

      raise Error::AuthenticationError unless can_authenticate?
    end

    def draft &block
      sms = SMS.new
      yield( sms )

      raise Error::InvalidDataError unless sms.valid?

      @messages << sms
      self
    end

    def drafts
      @messages
    end

    def send!
      raise Error::MissingImplementationError
    end

    def self.services
      Service::List.keys
    end

    private 

    def set_service service
      @service = Service::List[service]
      raise Error::UnRecognizedServiceError unless @service

      self.extend @service
    end

    def can_authenticate?
      authenticate
    end
  end
end

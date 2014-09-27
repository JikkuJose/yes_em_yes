require './lib/errors'
require './lib/services'

module YesEmYes
  class SMS
    attr_accessor :message, :to
  end

  class Sender
    def initialize user_name: nil, password: nil, service: :way2sms
      raise RequiredArgumentMissingError unless user_name and password

      @messages = []
      @user_name, @password = user_name, password

      set_service service
    end

    def draft &block
      @messages << yield( SMS.new )
    end

    def send!
      @service.send!( @messages )
    end

    private 

    def set_service service
      @service = Service::List[service]
      raise UnRecognizedServiceError unless @service
    end
  end
end

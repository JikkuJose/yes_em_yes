module YesEmYes
  module Service
    module Way2SMS
      def send!
        @messages.each do |sms|
          sms.message
        end
      end
    end
  end
end

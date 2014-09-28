module YesEmYes
  module Service
    module Way2SMS
      def authenticate
        true
      end

      def send!
        @messages.each do |message|
          message
        end
      end
    end
  end
end

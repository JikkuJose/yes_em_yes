require 'unirest'

module YesEmYes
  module Service
    module Way2SMS
      def send!
        @messages.each do |sms|
          send_sms sms
        end
      end


      def send_sms sms
        Unirest.post(
          api_url,
          headers: headers,
          parameters: data(sms)
        )
      end

      def authenticate
        credentials = {
          "username" => @user_name,
          "password" => @password
        }

        response = Unirest.post(
          login_url,
          parameters: credentials
        )

        if response.headers[:set_cookie]
          @cookie = response.headers[:set_cookie].first.split(';').first
          @token = @cookie.split('~').last
          true
        else
          false
        end
      end

      def login_url
        'http://site25.way2sms.com/Login1.action'
      end

      def api_url
        "http://site25.way2sms.com/smstoss.action"
      end

      def data sms
        {
          "ssaction" => "ss",
          "Token"    => @token,
          "mobile"   => sms.to,
          "message"  => sms.message
        }
      end

      def headers
        {
          "Cookie"       => @cookie,
          "Referer"      => referer,
          "Content-Type" => html_form,
          "User-Agent"   => safari
        }
      end

      def html_form
        "application/x-www-form-urlencoded"
      end

      def safari
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.94 Safari/537.36"
      end

      def referer
        "http://site25.way2sms.com/sendSMS?Token=" + @token
      end

    end
  end
end

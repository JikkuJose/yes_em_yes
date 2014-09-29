# YesEmYes

Ruby gem to abstract web interfaces of various SMS services. A plugin architecture is used to add new services.

## Installation

    $ gem install yes_em_yes

## Usage

``` ruby
require 'yes_em_yes'

sender = YesEmYes::Sender.new(
  user_name: '1234567890',
   password: 'mypassword',
    service: :way2sms
)

sender.draft do |sms|
  sms.to      = "4561237890"
  sms.message = "Hello, from YesEmYes"
end

sender.send!
```

## Supported Services

* [Way2SMS][w]


## Todo

* Command-line executable
* Proper response codes
* Better documentation

## Development

* Running the tests depends on setting two environment variables: `w_user_name` and `w_password` with valid credentials.

## Credits

* Core portion of the [Way2SMS][w] plugin code is from [way2sms gem][wg]

[w]: http://way2sms.com
[wg]: https://github.com/nandaceg007/way2sms

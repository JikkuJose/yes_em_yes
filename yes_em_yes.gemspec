lib = File.expand_path( "../lib/", __FILE__ )
$LOAD_PATH.unshift( lib ) unless $LOAD_PATH.include?( lib )

Gem::Specification.new do |s|
  s.name          = "yes_em_yes"
  s.version       = "0.0.1"
  s.authors       = ["Jikku Jose"]
  s.email         = ["jikkujose@gmail.com"]
  s.summary       = "Gem to send SMS using few web services."
  s.description   = "Gem to send SMS using few web services."
  s.homepage      = "http://github.com/JikkuJose/yes-em-yes"

  s.files         = `git ls-files -z`.split("\x0")
  s.require_paths = ["lib"]

  s.add_dependency 'unirest', "~> 1.1"
  s.add_development_dependency 'bundler', "~> 1.6"
  s.add_development_dependency 'rake', "~> 10.3"
end

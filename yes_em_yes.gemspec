lib = File.expand_path( "../lib/", __FILE__ )
$LOAD_PATH.unshift( lib ) unless $LOAD_PATH.include?( lib )

Gem::Specification.new do |s|
  s.name          = "yes_em_yes"
  s.version       = "0.0.1"
  s.authors       = ["Jikku Jose"]
  s.email         = ["jikkujose@gmail.com"]
  s.summary       = "Ruby gem to abstract web interfaces of various SMS services."
  s.description   = "Ruby gem to abstract web interfaces of various SMS services. A plugin architecture is used to add new services."
  s.homepage      = "http://github.com/JikkuJose/yes_em_yes"

  s.files         = `git ls-files -z`.split("\x0")
  s.require_paths = ["lib"]

  s.add_dependency 'unirest', "~> 1.1"
  s.add_development_dependency 'bundler', "~> 1.6"
  s.add_development_dependency 'rake', "~> 10.3"
end

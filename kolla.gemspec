Gem::Specification.new do |s|
  s.name        = 'kolla'
  s.version     = '0.0.4'
  s.authors     = ["Antony Sastre"]
  s.email       = 'antony.sastre@gmail.com'
  s.summary     = "Simple CLI utility tool to parse rails schema file and list it's details."
  s.homepage    = 'https://rubygems.org/gems/kolla'
  s.files       = ["lib/kolla.rb", "lib/kolla/parser.rb"]
  s.required_ruby_version = ">= 3.0"
  s.executables = ["kolla"]
  s.licenses    = ['MIT']
  # s.metadata    = { "source_code_uri" => "https://github.com/antonysastre/kolla" }
end
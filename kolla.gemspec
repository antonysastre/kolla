Gem::Specification.new do |s|
  s.name        = 'kolla'
  s.version     = '0.0.2'
  s.authors     = ["Antony Sastre"]
  s.email       = 'antony.sastre@gmail.com'
  s.summary     = "Simple CLI utility tool to parse domain specific files and return reports."
  s.homepage    = 'https://rubygems.org/gems/kolla'
  s.files       = ["lib/kolla.rb", "lib/kolla/parser.rb"]
  s.required_ruby_version = ">= 3.0"
  s.executables = ["kolla"]
  s.licenses    = ['MIT']
  # s.metadata    = { "source_code_uri" => "https://github.com/antonysastre/kolla" }
end
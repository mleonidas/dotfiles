# turn color on
Pry.config.color = true
Pry.config.theme = "solarized"

# custom prompt to show ruby version, useful with RVM
Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

Pry.config.ls.separator = "\n" # new lines between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

# Plugins
require 'interactive_editor'
begin
  require 'collins_auth'
  require 'etc'
rescue => e
  puts "There was a promblem importing #{e.message}"
end


# setup collins
c = Collins::Authenticator.setup_client




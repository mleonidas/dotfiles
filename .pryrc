# turn color on
Pry.editor = 'vim'
Pry.config.color = true
Pry.config.theme = 'solarized'
# custom prompt to show ruby version, useful with RVM
Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, \
proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

Pry.config.ls.separator = "\n" # new lines between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black



# Polugins
require 'interactive_editor'




# setup collins biznatch
#begin
#  require 'collins_auth'
#  require 'etc'
#  c = Collins::Authenticator.setup_client
#rescue LoadError
#  require 'collins_client'
#  options = {
#  :collins_config_file => '/var/db/collins.yaml'
#  }
#  config = YAML.load_file(options[:collins_config_file]).reduce({}){|memo,(k,v)|memo[k.to_sym] = v; memo    }
#  config = config[:collins] if config.key? :collins
#  c = Collins::Client.new(collins)
#end
#


# just for fun

class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

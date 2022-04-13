Pry.color = true
Pry.config.theme = 'solarzied'

Pry.config.history_save
Pry.config.history_file = "~/.pry_history"

# == Pry-Nav - Using pry as a debugger ==
Pry.commands.alias_command 'c', 'continue' rescue nil
Pry.commands.alias_command 's', 'step' rescue nil
Pry.commands.alias_command 'n', 'next' rescue nil
Pry.commands.alias_command 'w', 'whereami' rescue nil
Pry.commands.alias_command '.clr', '.clear' rescue nil

Pry.config.commands.alias_command "h", "hist -T 20", desc: "Last 20 commands"
Pry.config.commands.alias_command "hg", "hist -T 20 -G", desc: "Up to 20 commands matching expression"
Pry.config.commands.alias_command "hG", "hist -G", desc: "Commands matching expression ever used"
Pry.config.commands.alias_command "hr", "hist -r", desc: "hist -r <command number> to run a command"

begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => err
  begin
    puts "no awesome_print :( #{err}"
    puts "trying amazing_print"
    require 'amazing_print'
    AmazingPrint.pry!
  rescue LoadError => err2
    puts "no awesome_print :( #{err2}"
  end
end

Pry::Prompt.add(
  :ipython,
  'IPython-like prompt', [':', '...:']
) do |_context, _nesting, pry_instance, sep|
  sep == ':' ? Pry::Helpers::Text.green("In [#{pry_instance.input_ring.count}]: ") : '   ...: '
end

Pry.config.prompt = Pry::Prompt[:ipython]



def a_array
  (1..6).to_a
end

def a_hash
  { hello: "world", free: "of charge" }
end
# vi: ft=ruby

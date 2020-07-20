if ENV['INSIDE_EMACS']
  Pry.config.correct_indent = false
  Pry.config.pager = false
end

Pry.config.theme = 'solarized'


if defined? AwesomePrint
  AwesomePrint.pry!
  ## The following line enables awesome_print for all pry output,
  # and enables paging using Pry's pager with awesome_print.
  Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai(indent: 2)}", output)}
  ## If you want awesome_print without automatic pagination, use below:
  # Pry.config.print = proc { |output, value| output.puts value.ai }


  ## Evaluated result display inline
  # Pry.config.print = lambda { |output, value| output.print "\e[1A\e[18C # => "; output.puts value.inspect }

  ## if in bundler, break out, so awesome print doesn't have to be in Gemfile
  if defined? Bundler
    Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r{/bundler/} }
    Gem::Specification.reset
    load 'rubygems/custom_require.rb'
  end

  ## awesome_print config for Minitest.
  if defined? Minitest
    module Minitest::Assertions
      def mu_pp(obj)
        obj.awesome_inspect
      end
    end
  end
end


Pry.config.prompt = Pry::Prompt.new(
  "custom",
  "my custom prompt",
  [
    ->(_obj, _nest_level, _) { "[#{RUBY_VERSION}][#{_obj}]#{_nest_level}✎ " },
    ->(*) { "  " }
  ]
)

# Exception
Pry.config.exception_handler = proc do |output, exception, _|
  puts ___.colorize "#{exception.class}: #{exception.message}", 31
  puts ___.colorize "from #{exception.backtrace.first}", 31
end


Pry.config.commands.alias_command 'w', 'whereami'
# Clear Screen
Pry.config.commands.alias_command '.clr', '.clear'


Pry.config.hooks.add_hook(:after_session, :farewell) do
  Pry.active_sessions -= 1
  if Pry.active_sessions.zero?
    if ___.true_true_or_false
      puts ___.farewell_messages
    else
      interpreted_time = ___.interpret_time(Time.now - pryrc_start_time)
      interpreted_time = 'ever' if interpreted_time == '0 second'
      puts "Hack with Ruby for #{interpreted_time}!"
    end
  end
end

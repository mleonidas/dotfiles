# == Pry-Nav - Using pry as a debugger ==
Pry.commands.alias_command 'c', 'continue' rescue nil
Pry.commands.alias_command 's', 'step' rescue nil
Pry.commands.alias_command 'n', 'next' rescue nil
Pry.commands.alias_command 'w', 'whereami' rescue nil
Pry.commands.alias_command '.clr', '.clear' rescue nil


Pry.color = true
Pry.config.pager = false if ENV["INSIDE_EMACS"]
Pry.config.correct_indent = false if ENV["INSIDE_EMACS"]
Pry.config.theme = 'solarzied'

Pry.config.history_ignorelist = [
  /proc { |expr, line|  require 'ostruct';  old_wp = defined?(Bond) && Bond.started? && Bond.agent.weapon;*/
]



def formatted_env
  case Rails.env
  when 'production'
    bold_upcased_env = Pry::Helpers::Text.bold(Rails.env.upcase)
    Pry::Helpers::Text.red(bold_upcased_env)
  when 'staging'
    Pry::Helpers::Text.yellow(Rails.env)
  when 'development'
    Pry::Helpers::Text.green(Rails.env)
  else
    Rails.env
  end
end

def ruby_version
  Pry::Helpers::Text.green(RUBY_VERSION)
end

def app_name
  Pry::Helpers::Text.magenta(File.basename(Rails.root))
end

def old_prompt_rails
  [
    ->(_obj, _nest_level, _) { "#{app_name} #{formatted_env} #{_obj}: " }
  ]
end

def new_prompt_rails
  Pry::Prompt.new(
    "custom",
    "my custom prompt",
    [
      ->(_obj, _nest_level, _) { "#{app_name} #{formatted_env} #{_obj}: " },
      ->(*) { "  " }
    ])
end

if defined?(Rails.root)
  Pry.config.prompt = Pry::VERSION.to_i >= 13 ? new_prompt_rails : old_prompt_rails
else
  Pry.config.prompt = Pry::Prompt.new(
    "custom",
    "my custom prompt",
    [
      ->(_obj, _nest_level, _) { "#{ruby_version} #{_obj}: " },
      ->(*) { "  " }
    ])
end

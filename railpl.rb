# frozen_string_literal: true

require "remote_ruby"

railpl = ::RemoteRuby::ExecutionContext.new(
  adapter: ::RemoteRuby::LocalStdinAdapter,
  working_dir: '/Users/mathisto/cloud/code/ruby/railpl/',
  rails: { environment: :development }
)

if ARGV.size != 1
  puts "You must send a single string containing your ruby code."
  exit
end

code = ARGV.join
response = railpl.execute { eval(code) }
puts response.inspect

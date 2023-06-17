require "remote_ruby"

railpl = ::RemoteRuby::ExecutionContext.new(
  adapter: ::RemoteRuby::LocalStdinAdapter,
  working_dir: '/Users/mathisto/cloud/code/ruby/railpl/',
  rails: { environment: :development }
)

response = nil
code = ARGV.join
puts "ARGV: " + ARGV.join

if code
   response = railpl.execute { eval(code) }
else
  puts "You must send a single string containing your ruby code."
end

puts response.inspect

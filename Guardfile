require 'active_support/inflector'

guard 'puma', :port => 4000 do
  watch('Gemfile.lock')
  watch(%r{^config|lib/.*})
end

guard :rspec, all_after_pass: false do
  watch('spec/spec_helper.rb')                        { "spec" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
end

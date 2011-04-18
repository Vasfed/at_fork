require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/at_fork'

Hoe.plugin :newgem

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'at_fork' do
  self.developer 'Vasily Fedoseyev', 'vasilyfedoseyev@gmail.com'
  self.rubyforge_name = self.name # TODO this is default value
  # self.extra_deps         = [['activesupport','>= 2.0.2']]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

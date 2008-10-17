require 'rbconfig'

# This generator bootstraps a Rails project for use with Cucumber
class InstallCucumberGenerator < RubiGen::Base
  DEFAULT_SHEBANG = File.join(Config::CONFIG['bindir'],
                              Config::CONFIG['ruby_install_name'])
  def manifest
    record do |m|
      script_options     = { :chmod => 0755, :shebang => options[:shebang] == DEFAULT_SHEBANG ? nil : options[:shebang] }

      m.directory 'features/steps'
      m.file      'env.rb', 'features/steps/env.rb'

      m.directory 'tasks'
      m.file      'cucumber.rake', 'tasks/cucumber.rake'
      
      m.directory 'script'
      m.file      'cucumber',      'script/cucumber',        script_options
    end
  end

protected

  def banner
    "Usage: #{$0} cucumber"
  end

end
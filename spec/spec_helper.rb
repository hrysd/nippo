# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

module FakeDirectory
  def fixtures_path
    File.join(Dir.pwd, 'spec', 'fixtures')
  end

  def fake_home
    File.join(fixtures_path, 'home')
  end


  def fake_congfiguration_file
    File.join(fixtures_path, 'config.yml')
  end
end

require 'timecop'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include FakeDirectory
end
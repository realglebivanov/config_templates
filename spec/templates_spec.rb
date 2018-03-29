require 'config_templates'
require 'spec_helper'

RSpec.describe ::ConfigTemplates do
  before(:all) { @output_mock = ::Mocks::Outputs::Test.new }
  before(:all) do
    ::ConfigTemplates.configure { |config| config.outputs test: @output_mock }
  end

  before(:all) do
    ::ConfigTemplates.configure do |config|
      config.templates_path = 'spec/fixtures/src'
      config.settings_path = 'spec/fixtures/settings'
      config.destination_path = 'spec/fixtures/dest'
      config.settings_file = 'settings'
      config.stage = :production
      config.stages = %i[production prerel staging]
    end
  end

  it 'Renders a template using configs and environment metadata' do
    compilation = ::ConfigTemplates::Models::Compilation.new
    compilation.select(/.*/).send_to(:test)
    expect(@output_mock.result.strip).to eq('true')
  end
end

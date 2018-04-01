require 'config_templates'
require 'spec_helper'

RSpec.describe ::ConfigTemplates do
  before(:all) { @output_mock = ::Mocks::Outputs::Test.new }
  before(:all) do
    ::ConfigTemplates.configure { |config| config.outputs test: @output_mock }
  end

  before(:each) { @output_mock.result = nil }

  it 'renders selected template using configs and environment metadata' do
    compilation = ::ConfigTemplates::Models::Compilation.new
    compilation.reject(/.*/).select(Regexp.new 'kapacitor/config.erb').send_to(:test)
    expect(@output_mock.result.strip).to eq('true')
  end

  it 'doesnt render not selected template' do
    compilation = ::ConfigTemplates::Models::Compilation.new
    compilation.reject(/.*/).send_to(:test)
    expect(@output_mock.result).to be_nil
  end

  it 'doesnt render anything without explicitly selected templates' do
    compilation = ::ConfigTemplates::Models::Compilation.new
    compilation.send_to(:test)
    expect(@output_mock.result).to be_nil
  end
end

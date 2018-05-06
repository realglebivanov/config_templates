require 'config_templates'
require 'spec_helper'

RSpec.describe ::ConfigTemplates::Models::Compilation do
  before(:all) do
    @output = ::Mocks::Outputs::Test.new
    @validator = ::Mocks::Validators::Test.new
  end

  before(:all) do
    ::ConfigTemplates.configure do |config|
      config.outputs test: @output
      config.validators config: @validator
    end
  end

  before(:each) do
    @output.result = nil
    @validator.valid = true
  end

  it 'renders selected template using configs and environment metadata' do
    compilation = ::ConfigTemplates::Models::Compilation.new
    compilation.reject(/.*/).select(Regexp.new 'config.erb')
    compilation.send_to(:test)
    expect(@output.result.strip).to eq('true')
  end

  it 'doesnt render not selected template' do
    compilation = ::ConfigTemplates::Models::Compilation.new
    compilation.reject(/.*/).send_to(:test)
    expect(@output.result).to be_nil
  end

  it 'doesnt render anything without explicitly selected templates' do
    compilation = ::ConfigTemplates::Models::Compilation.new
    compilation.send_to(:test)
    expect(@output.result).to be_nil
  end

  it 'fails if validation doesnt pass' do
    @validator.valid = false
    compilation = ::ConfigTemplates::Models::Compilation.new
    compilation.select(Regexp.new 'config.erb')
    expect { compilation.send_to(:test) }.to raise_error(::ConfigTemplates::Errors::InvalidTemplate, /config/)
  end
end

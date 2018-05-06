require_relative './mocks/outputs/test'
require_relative './mocks/validators/test'

RSpec.configure do |spec|
  spec.before(:all) do
    ::ConfigTemplates.configure do |config|
      config.templates_path = 'spec/fixtures/src'
      config.destination_path = 'spec/fixtures/dest'
      config.settings_path = 'spec/fixtures/settings'
      config.settings_file_basename = 'settings'
      config.stages = %i[production prerel staging]
      config.stage = :production
    end
  end
end

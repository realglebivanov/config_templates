module ConfigTemplates
  module Contexts; end
  module Criteria; end
  module Engines; end
  module Filesystem; end
  module Models; end
  module Outputs; end
  module Collections; end
  module Validators; end
  module Extensions; end
end

Dir[
  File.join(File.dirname(__FILE__), 'config_templates', '**', '*.rb')
].each { |path| require path }

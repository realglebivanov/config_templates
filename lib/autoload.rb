module ConfigTemplates
  module Contexts; end
  module Criteria; end
  module Engines; end
  module Filesystem; end
  module Models; end
  module Outputs; end
  module Repositories; end
  module Validators; end
end

Dir[
  File.join(File.dirname(__FILE__), 'config_templates', '**', '*.rb')
].each { |path| require path }

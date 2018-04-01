module ConfigTemplates::Models
  class Compilation
    include ::ConfigTemplates::Inject['repositories.outputs']

    def initialize(outputs)
      @outputs = outputs
      @context = ::ConfigTemplates::Contexts::Compilation.new
    end

    def select(expression)
      @context.criteria ::ConfigTemplates::Criteria::Name.new expression
      self
    end

    def reject(expression)
      @context.criteria ::ConfigTemplates::Criteria::Name.new expression, false
      self
    end

    def send_to(output_name)
      @context.components.tap do |components|
        output = outputs.find_by_name output_name
        components.each &:validate!
        components.each { |component| output.print component }
      end
    end
  end
end

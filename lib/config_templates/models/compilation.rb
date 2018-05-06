module ConfigTemplates::Models
  class Compilation
    include ::ConfigTemplates::Inject['collections.outputs']

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
      @context.components.tap do |collection|
        collection.find_all.each &:render
        collection.find_all.each &:validate!
        output = @outputs.find_by_name output_name
        collection.find_all.each { |component| output.write component }
      end
    end
  end
end

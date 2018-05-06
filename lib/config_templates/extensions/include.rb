module ConfigTemplates::Extensions
  class Include
    def call(context, invocation)
      component = context.components.find_by_path! invocation.args.first
      component.child!
      component.render
    end
  end
end

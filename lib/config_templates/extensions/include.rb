module ConfigTemplates::Extensions
  class Include
    def call(context, invocation)
      child_component = context.components.find_by_path!(
        invocation.args.first,
        context.component.source_path
      )
      child_component.child!
      child_component.render
    end
  end
end

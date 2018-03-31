module ConfigTemplates::Engines
  class ERB
    def evaluate(template, context)
      ::ERB.new(template).result(context.instance_eval { binding })
    end

    def output_file_name(file_name)
      file_name.sub '.erb', ''
    end
  end
end

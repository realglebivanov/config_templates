module ConfigTemplates::Engines
  class Text
    def evaluate(template, _)
      template
    end

    def prepare_file_name(file_name)
      file_name
    end
  end
end

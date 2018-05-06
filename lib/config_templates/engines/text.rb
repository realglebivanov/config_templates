module ConfigTemplates::Engines
  class Text
    def evaluate(template, _)
      template
    end

    def destination_path(path)
      path
    end
  end
end

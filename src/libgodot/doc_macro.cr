module Godot
  # Stores accumulated XML documentation generated at compile time
  class EditorDocRegistry
    class_getter xml_documents = Array(String).new

    def self.register(xml : String)
      @@xml_documents << xml
    end

    def self.load_all
      return if @@xml_documents.empty?
      @@xml_documents.each do |xml|
        Bridge.load_editor_help(xml)
      end
    end
  end
end

# Annotation for explicit documentation on methods, properties, or classes
annotation Doc
end

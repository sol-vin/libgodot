module Godot
  # Stores accumulated XML documentation generated at compile time
  class EditorDocRegistry
    class_getter xml_documents = Array(String).new

    def self.register(xml : String)
      @@xml_documents << xml
    end

    def self.load_all
      return if @@xml_documents.empty?
      combined = String.build do |io|
        io << "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n"
        io << "<doc_classes>\n"
        @@xml_documents.each do |xml|
          io << xml << "\n"
        end
        io << "</doc_classes>\n"
      end
      Bridge.load_editor_help(combined)
    end
  end
end

# Annotation for explicit documentation on methods, properties, or classes
annotation Doc
end

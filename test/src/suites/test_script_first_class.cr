# =============================================================================
# LibGodot Test Suite: First-Class Crystal Scripts (.cr)
# =============================================================================

macro test_script_first_class(name, &block)
  ::TestFramework::Registry.register("ScriptFirstClass", {{name}}) do |node|
	root = node
	{{block.body}}
  end
end

test_script_first_class "CrystalHighlighter pure-Crystal lexer tokenization" do
  # Test line with keywords, types, annotations, symbols, numbers, and comments
  line = "  @[Export(range: 1.0_f32..20.0_f32)] property speed : Float32 = 7.5_f32 # player speed"
  spans = Godot::CrystalHighlighter.highlight_line(line)
  TestFramework.assert_true spans.size > 0, "Highlighter should generate spans for annotated property"

  # Verify comment span exists at end
  comment_span = spans.find { |s| s.r == Godot::CrystalHighlighter::COLOR_COMMENT[0] && s.g == Godot::CrystalHighlighter::COLOR_COMMENT[1] }
  TestFramework.assert_true !comment_span.nil?, "Highlighter should detect and color line comments"

  # Test keyword line
  kw_line = "node Player < CharacterBody3D do"
  kw_spans = Godot::CrystalHighlighter.highlight_line(kw_line)
  TestFramework.assert_true kw_spans.size >= 2, "Highlighter should recognize 'node' and 'do' keywords"

  # Test string interpolation line
  str_line = %(  Godot.print("Hello \#{name}!"))
  str_spans = Godot::CrystalHighlighter.highlight_line(str_line)
  TestFramework.assert_true str_spans.size > 0, "Highlighter should color strings and string interpolation"
end

test_script_first_class "CrystalLanguage metadata, templates, and completions" do
  lang = Godot::CrystalLanguage.instance

  TestFramework.assert_eq lang.get_name, "Crystal"
  TestFramework.assert_eq lang.get_type, "CrystalScript"
  TestFramework.assert_eq lang.get_extension, "cr"
  TestFramework.assert_true lang.get_recognized_extensions.includes?("cr"), "Language recognized extensions should include 'cr'"

  res_words = lang.get_reserved_words
  TestFramework.assert_true res_words.includes?("node"), "Reserved words should include 'node'"
  TestFramework.assert_true res_words.includes?("property"), "Reserved words should include 'property'"
  TestFramework.assert_true res_words.includes?("signal"), "Reserved words should include 'signal'"
  TestFramework.assert_true res_words.includes?("def"), "Reserved words should include 'def'"
  TestFramework.assert_true res_words.includes?("end"), "Reserved words should include 'end'"

  TestFramework.assert_true lang.is_control_flow_keyword("if"), "'if' should be recognized as control flow"
  TestFramework.assert_true lang.is_control_flow_keyword("while"), "'while' should be recognized as control flow"
  TestFramework.assert_false lang.is_control_flow_keyword("node"), "'node' should not be control flow"

  # Test Template generation
  tmpl = lang.make_template("default", "EnemyBoss", "CharacterBody3D")
  TestFramework.assert_true tmpl.includes?("node EnemyBoss < CharacterBody3D do"), "Template should generate proper class header"
  TestFramework.assert_true tmpl.includes?("def _ready : Void"), "Template should contain _ready method"

  tool_tmpl = lang.make_template("tool", "LevelGenerator", "Node3D")
  TestFramework.assert_true tool_tmpl.includes?("@[Tool]"), "Tool template should have @[Tool] annotation"

  # Test Auto-indentation
  code_to_indent = "node Test do\ndef hello\nif true\n1\nend\nend\nend"
  indented = lang.auto_indent_code(code_to_indent, 0, 6)
  TestFramework.assert_true indented.includes?("  def hello"), "Auto-indent should indent inside 'do' block"
  TestFramework.assert_true indented.includes?("    if true"), "Auto-indent should indent inside 'def' block"

  # Test Completion proposals
  completions = lang.complete_code("", "res://test.cr")
  TestFramework.assert_true completions.any? { |c| c.display_text.includes?("node") }, "Completions should offer 'node' macro"
  TestFramework.assert_true completions.any? { |c| c.display_text.includes?("_ready") }, "Completions should offer '_ready' callback"
end

test_script_first_class "CrystalScript AST reflection and Inspector property extraction" do
  source = <<-CRYSTAL
	require "libgodot"

	# Hero player character
	node HeroPlayer < CharacterBody2D do
	  # Movement speed in px/s
	  @[Export(range: 50.0_f32..800.0_f32, step: 10.0_f32)]
	  property speed : Float32 = 250.0_f32

	  @[Export]
	  property player_name : String = "Hero"

	  signal leveled_up(new_level : Int32)
	  signal defeated

	  def _ready : Void
	  end

	  def attack : Void
	  end
	end
	CRYSTAL

  script = Godot::CrystalScript.new("res://hero_player.cr", source)

  TestFramework.assert_eq script.class_name, "HeroPlayer"
  TestFramework.assert_eq script.base_type, "CharacterBody2D"
  TestFramework.assert_eq script.signals.size, 2
  TestFramework.assert_true script.signals.includes?("leveled_up"), "Script should detect 'leveled_up' signal"
  TestFramework.assert_true script.signals.includes?("defeated"), "Script should detect 'defeated' signal"
  TestFramework.assert_true script.methods.includes?("_ready"), "Script should detect '_ready' method"
  TestFramework.assert_true script.methods.includes?("attack"), "Script should detect 'attack' method"

  # Inspector properties
  props = script.properties
  TestFramework.assert_true props.size >= 2, "Script should have at least 2 properties"

  speed_prop = props.find { |p| p.name == "speed" }
  TestFramework.assert_true !speed_prop.nil?, "Script should expose 'speed' property"
  if s = speed_prop
	TestFramework.assert_eq s.type_name, "Float32"
	TestFramework.assert_eq s.variant_type, 3 # TYPE_FLOAT
	TestFramework.assert_eq s.hint, 1_u32 # PROPERTY_HINT_RANGE
	TestFramework.assert_eq s.hint_string, "50.0,800.0,10.0"
  end

  name_prop = props.find { |p| p.name == "player_name" }
  TestFramework.assert_true !name_prop.nil?, "Script should expose 'player_name' property"
  if np = name_prop
	TestFramework.assert_eq np.type_name, "String"
	TestFramework.assert_eq np.variant_type, 4 # TYPE_STRING
  end
end

test_script_first_class "ResourceFormatLoader and ResourceFormatSaver for .cr files" do
  loader = Godot::ResourceFormatLoaderCrystal.instance
  saver = Godot::ResourceFormatSaverCrystal.instance

  TestFramework.assert_true loader.get_recognized_extensions.includes?("cr"), "Loader recognizes .cr"
  TestFramework.assert_true loader.handles_type("Script"), "Loader handles Script type"
  TestFramework.assert_true loader.handles_type("CrystalScript"), "Loader handles CrystalScript type"
  TestFramework.assert_eq loader.get_resource_type("res://test/sample_player.cr"), "CrystalScript"

  TestFramework.assert_true saver.recognize("CrystalScript"), "Saver recognizes CrystalScript"
  TestFramework.assert_true saver.get_recognized_extensions.includes?("cr"), "Saver recognizes .cr"

  # Load actual sample player script
  script = loader.load("sample_player.cr", "sample_player.cr")
  if script.nil? || script.source_code.empty?
	script = loader.load("test/sample_player.cr", "test/sample_player.cr")
  end
  TestFramework.assert_true !script.nil?, "Loader should load sample_player.cr successfully"
  if sc = script
	TestFramework.assert_eq sc.class_name, "SamplePlayer"
	TestFramework.assert_eq sc.base_type, "CharacterBody2D"
	TestFramework.assert_true sc.properties.any? { |p| p.name == "speed" }, "Loaded script has 'speed' property"
	TestFramework.assert_true sc.properties.any? { |p| p.name == "max_health" }, "Loaded script has 'max_health' property"
  end
end

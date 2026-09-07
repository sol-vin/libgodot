---
name: libgodot-api-generator
description: >-
  Dump Godot engine GDExtension API and generate typed Crystal classes, enums,
  singletons, and method bindings. Use when upgrading Godot versions or regenerating bindings.
---

# LibGodot API Generator Runbook

This skill outlines how to dump the Godot GDExtension specification and regenerate the complete typed Crystal API bindings.

---

## 1. Dumping `extension_api.json`

Whenever Godot is updated or new engine modules are added, dump the API definition:
```bash
make dump_api
```
Or directly:
```bash
./godot.exe --headless --dump-extension-api
```
This writes `extension_api.json` in the root repository directory (~12 MB).

---

## 2. Regenerating Crystal Bindings

To run the binding code generator:
```bash
make generate
```
Or directly:
```bash
crystal run scripts/generate_bindings.cr
```

This generates:
- `src/libgodot/generated/global_enums.cr`: Global engine enums (`Error`, `Key`, `MouseButton`, etc.).
- `src/libgodot/generated/singletons.cr`: Engine singletons (`Engine`, `Input`, `AudioServer`, etc.).
- `src/libgodot/generated/classes/*.cr`: Topologically sorted Godot engine class definitions with typed method bindings, doc comments, and properties.
- `src/libgodot/generated/classes/all_classes.cr`: Manifest requiring all generated classes in topological dependency order.

---

## 3. Customizing Mappings & Overrides (`scripts/overrides.yml`)

The generator reads `scripts/overrides.yml` to resolve keyword collisions and map native types:

```yaml
keywords:
  # Rename Godot parameter names that clash with Crystal reserved keywords
  type: type_id
  end: end_pos
  begin: begin_pos
  class: class_type
  default: default_val
  in: in_val
  out: out_val

type_map:
  # Map Godot primitives to Crystal types
  bool: Bool
  int: Int64
  float: Float64
  String: String
  Vector2: Godot::Vector2
  Vector3: Godot::Vector3
  Color: Godot::Color
  Rect2: Godot::Rect2
  Transform3D: Godot::Transform3D
```

If a newly generated Godot class causes a Crystal compilation error due to a reserved keyword or parameter name collision, add the mapping to `scripts/overrides.yml` and run `make generate` again.

---

## 4. Post-Generation Verification

After regenerating bindings:
1. Run `make all` to ensure all generated classes compile cleanly.
2. Run `make test` to verify that method binds and singletons function properly.

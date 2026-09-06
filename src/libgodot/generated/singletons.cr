# Generated Singletons for Godot 4.8+
module Godot
  module Performance
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("Performance")
      end
      @@instance
    end
  end
  module Engine
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("Engine")
      end
      @@instance
    end
  end
  module ProjectSettings
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("ProjectSettings")
      end
      @@instance
    end
  end
  module OS
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("OS")
      end
      @@instance
    end
  end
  module Time
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("Time")
      end
      @@instance
    end
  end
  module ClassDB
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("ClassDB")
      end
      @@instance
    end
  end
  module TextServerManager
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("TextServerManager")
      end
      @@instance
    end
  end
  module NavigationServer2DManager
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("NavigationServer2DManager")
      end
      @@instance
    end
  end
  module PhysicsServer2DManager
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("PhysicsServer2DManager")
      end
      @@instance
    end
  end
  module NavigationServer3DManager
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("NavigationServer3DManager")
      end
      @@instance
    end
  end
  module PhysicsServer3DManager
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("PhysicsServer3DManager")
      end
      @@instance
    end
  end
  module NavigationMeshGenerator
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("NavigationMeshGenerator")
      end
      @@instance
    end
  end
  module IP
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("IP")
      end
      @@instance
    end
  end
  module Geometry2D
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("Geometry2D")
      end
      @@instance
    end
  end
  module Geometry3D
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("Geometry3D")
      end
      @@instance
    end
  end
  module ResourceLoader
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("ResourceLoader")
      end
      @@instance
    end
  end
  module ResourceSaver
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("ResourceSaver")
      end
      @@instance
    end
  end
  module Marshalls
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("Marshalls")
      end
      @@instance
    end
  end
  module TranslationServer
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("TranslationServer")
      end
      @@instance
    end
  end
  module Input
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("Input")
      end
      @@instance
    end
  end
  module InputMap
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("InputMap")
      end
      @@instance
    end
  end
  module EngineDebugger
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("EngineDebugger")
      end
      @@instance
    end
  end
  module GDExtensionManager
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("GDExtensionManager")
      end
      @@instance
    end
  end
  module ResourceUID
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("ResourceUID")
      end
      @@instance
    end
  end
  module WorkerThreadPool
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("WorkerThreadPool")
      end
      @@instance
    end
  end
  module ThemeDB
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("ThemeDB")
      end
      @@instance
    end
  end
  module EditorInterface
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("EditorInterface")
      end
      @@instance
    end
  end
  module GDScriptLanguageProtocol
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("GDScriptLanguageProtocol")
      end
      @@instance
    end
  end
  module JavaClassWrapper
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("JavaClassWrapper")
      end
      @@instance
    end
  end
  module JavaScriptBridge
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("JavaScriptBridge")
      end
      @@instance
    end
  end
  module AccessibilityServer
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("AccessibilityServer")
      end
      @@instance
    end
  end
  module AudioServer
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("AudioServer")
      end
      @@instance
    end
  end
  module CameraServer
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("CameraServer")
      end
      @@instance
    end
  end
  module DisplayServer
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("DisplayServer")
      end
      @@instance
    end
  end
  module NativeMenu
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("NativeMenu")
      end
      @@instance
    end
  end
  module RenderingServer
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("RenderingServer")
      end
      @@instance
    end
  end
  module NavigationServer2D
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("NavigationServer2D")
      end
      @@instance
    end
  end
  module NavigationServer3D
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("NavigationServer3D")
      end
      @@instance
    end
  end
  module PhysicsServer2D
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("PhysicsServer2D")
      end
      @@instance
    end
  end
  module PhysicsServer3D
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("PhysicsServer3D")
      end
      @@instance
    end
  end
  module XRServer
    @@instance : Void* = Pointer(Void).null
    def self.singleton_ptr : Void*
      if @@instance.null?
        @@instance = Bridge.get_singleton("XRServer")
      end
      @@instance
    end
  end
end

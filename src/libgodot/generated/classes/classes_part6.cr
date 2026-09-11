# Generated classes part 6 (in topological order)
module Godot
  # A Unix Domain Socket (UDS) server.
  #
  # A Unix Domain Socket (UDS) server. Listens to connections on a socket path and returns a `StreamPeerUDS` when it gets an incoming connection. Unix Domain Sockets provide inter-process communication on the same machine using the filesystem namespace.
  # **Note:** Unix Domain Sockets are only available on Unix-like systems (Linux, macOS, etc.) and are not supported on Windows.
  class UDSServer < Godot::SocketServer
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_listen : Void* = Pointer(Void).null
    # Listens on the socket at `path`. The socket file will be created at the specified path.
    # **Note:** The socket file must not already exist at the specified path. You may need to remove any existing socket file before calling this method.
    def listen(path : String) : Int64
      if @@mb_listen.null?
        @@mb_listen = Bridge.get_method_bind("UDSServer", "listen", 166001499_i64)
      end
      str_0 = Bridge.make_string(path)
      arg_0 = str_0
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_listen, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_take_connection : Void* = Pointer(Void).null
    # If a connection is available, returns a StreamPeerUDS with the connection.
    def take_connection() : StreamPeerUDS
      if @@mb_take_connection.null?
        @@mb_take_connection = Bridge.get_method_bind("UDSServer", "take_connection", 1623851112_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_take_connection, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      StreamPeerUDS.new(ret_ptr)
    end
  end
  # Universal Plug and Play (UPnP) functions for network device discovery, querying and port forwarding.
  #
  # This class can be used to discover compatible `UPNPDevice`s on the local network and execute commands on them, like managing port mappings (for port forwarding/NAT traversal) and querying the local and remote network IP address. Note that methods on this class are synchronous and block the calling thread.
  # To forward a specific port (here `7777`, note both `#discover` and `#add_port_mapping` can return errors that should be checked):
  # ```gdscript
  #
  # var upnp = UPNP.new()
  # upnp.discover()
  # upnp.add_port_mapping(7777)
  #
  # ```
  # To close a specific port (e.g. after you have finished using it):
  # ```gdscript
  #
  # upnp.delete_port_mapping(port)
  #
  # ```
  # **Note:** UPnP discovery blocks the current thread. To perform discovery without blocking the main thread, use `Thread`s like this:
  # ```gdscript
  #
  # # Emitted when UPnP port mapping setup is completed (regardless of success or failure).
  # signal upnp_completed(error)
  #
  # # Replace this with your own server port number between 1024 and 65535.
  # const SERVER_PORT = 3928
  # var thread = null
  #
  # func _upnp_setup(server_port):
  # 	# UPNP queries take some time.
  # 	var upnp = UPNP.new()
  # 	var err = upnp.discover()
  #
  # 	if err != UPNP.UPNP_RESULT_SUCCESS:
  # 		push_error(str(err))
  # 		upnp_completed.emit(err)
  # 		return
  #
  # 	if upnp.get_gateway() and upnp.get_gateway().is_valid_gateway():
  # 		upnp.add_port_mapping(server_port, server_port, ProjectSettings.get_setting("application/config/name"), "UDP")
  # 		upnp.add_port_mapping(server_port, server_port, ProjectSettings.get_setting("application/config/name"), "TCP")
  # 		upnp_completed.emit(UPNP.UPNP_RESULT_SUCCESS)
  #
  # func _ready():
  # 	thread = Thread.new()
  # 	thread.start(_upnp_setup.bind(SERVER_PORT))
  #
  # func _exit_tree():
  # 	# Wait for thread finish here to handle game exit while the thread is running.
  # 	thread.wait_to_finish()
  #
  # ```
  # **Terminology:** In the context of UPnP networking, "gateway" (or "internet gateway device", short IGD) refers to network devices that allow computers in the local network to access the internet ("wide area network", WAN). These gateways are often also called "routers".
  # **Pitfalls:**
  # - As explained above, these calls are blocking and shouldn't be run on the main thread, especially as they can block for multiple seconds at a time. Use threading!
  # - Networking is physical and messy. Packets get lost in transit or get filtered, addresses, free ports and assigned mappings change, and devices may leave or join the network at any time. Be mindful of this, be diligent when checking and handling errors, and handle these gracefully if you can: add clear error UI, timeouts and re-try handling.
  # - Port mappings may change (and be removed) at any time, and the remote/external IP address of the gateway can change likewise. You should consider re-querying the external IP and try to update/refresh the port mapping periodically (for example, every 5 minutes and on networking failures).
  # - Not all devices support UPnP, and some users disable UPnP support. You need to handle this (e.g. documenting and requiring the user to manually forward ports, or adding alternative methods of NAT traversal, like a relay/mirror server, or NAT hole punching, STUN/TURN, etc.).
  # - Consider what happens on mapping conflicts. Maybe multiple users on the same network would like to play your game at the same time, or maybe another application uses the same port. Make the port configurable, and optimally choose a port automatically (re-trying with a different port on failure).
  # **Further reading:** If you want to know more about UPnP (and the Internet Gateway Device (IGD) and Port Control Protocol (PCP) specifically), [$2]($1) is a good first stop, the specification can be found at the [$2]($1) and Godot's implementation is based on the [$2]($1).
  class UPNP < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum UPNPResult : Int64
      UpnpResultSuccess = 0_i64
      UpnpResultNotAuthorized = 1_i64
      UpnpResultPortMappingNotFound = 2_i64
      UpnpResultInconsistentParameters = 3_i64
      UpnpResultNoSuchEntryInArray = 4_i64
      UpnpResultActionFailed = 5_i64
      UpnpResultSrcIpWildcardNotPermitted = 6_i64
      UpnpResultExtPortWildcardNotPermitted = 7_i64
      UpnpResultIntPortWildcardNotPermitted = 8_i64
      UpnpResultRemoteHostMustBeWildcard = 9_i64
      UpnpResultExtPortMustBeWildcard = 10_i64
      UpnpResultNoPortMapsAvailable = 11_i64
      UpnpResultConflictWithOtherMechanism = 12_i64
      UpnpResultConflictWithOtherMapping = 13_i64
      UpnpResultSamePortValuesRequired = 14_i64
      UpnpResultOnlyPermanentLeaseSupported = 15_i64
      UpnpResultInvalidGateway = 16_i64
      UpnpResultInvalidPort = 17_i64
      UpnpResultInvalidProtocol = 18_i64
      UpnpResultInvalidDuration = 19_i64
      UpnpResultInvalidArgs = 20_i64
      UpnpResultInvalidResponse = 21_i64
      UpnpResultInvalidParam = 22_i64
      UpnpResultHttpError = 23_i64
      UpnpResultSocketError = 24_i64
      UpnpResultMemAllocError = 25_i64
      UpnpResultNoGateway = 26_i64
      UpnpResultNoDevices = 27_i64
      UpnpResultUnknownError = 28_i64
    end
    @@mb_get_device_count : Void* = Pointer(Void).null
    # Returns the number of discovered `UPNPDevice`s.
    def get_device_count() : Int64
      if @@mb_get_device_count.null?
        @@mb_get_device_count = Bridge.get_method_bind("UPNP", "get_device_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_device_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_device : Void* = Pointer(Void).null
    # Returns the `UPNPDevice` at the given `index`.
    def get_device(index : Int64) : UPNPDevice
      if @@mb_get_device.null?
        @@mb_get_device = Bridge.get_method_bind("UPNP", "get_device", 2193290270_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_device, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      UPNPDevice.new(ret_ptr)
    end
    @@mb_add_device : Void* = Pointer(Void).null
    # Adds the given `UPNPDevice` to the list of discovered devices.
    def add_device(device : UPNPDevice) : Void
      if @@mb_add_device.null?
        @@mb_add_device = Bridge.get_method_bind("UPNP", "add_device", 986715920_i64)
      end
      arg_ptr_0 = device ? device.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_device, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_device : Void* = Pointer(Void).null
    # Sets the device at `index` from the list of discovered devices to `device`.
    def set_device(index : Int64, device : UPNPDevice) : Void
      if @@mb_set_device.null?
        @@mb_set_device = Bridge.get_method_bind("UPNP", "set_device", 3015133723_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = device ? device.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_device, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_device : Void* = Pointer(Void).null
    # Removes the device at `index` from the list of discovered devices.
    def remove_device(index : Int64) : Void
      if @@mb_remove_device.null?
        @@mb_remove_device = Bridge.get_method_bind("UPNP", "remove_device", 1286410249_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_device, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear_devices : Void* = Pointer(Void).null
    # Clears the list of discovered devices.
    def clear_devices() : Void
      if @@mb_clear_devices.null?
        @@mb_clear_devices = Bridge.get_method_bind("UPNP", "clear_devices", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_devices, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_gateway : Void* = Pointer(Void).null
    # Returns the default gateway. That is the first discovered `UPNPDevice` that is also a valid IGD (InternetGatewayDevice).
    def get_gateway() : UPNPDevice
      if @@mb_get_gateway.null?
        @@mb_get_gateway = Bridge.get_method_bind("UPNP", "get_gateway", 2276800779_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_gateway, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      UPNPDevice.new(ret_ptr)
    end
    @@mb_discover : Void* = Pointer(Void).null
    # Discovers local `UPNPDevice`s. Clears the list of previously discovered devices.
    # Filters for IGD (InternetGatewayDevice) type devices by default, as those manage port forwarding. `timeout` is the time to wait for responses in milliseconds. `ttl` is the time-to-live; only touch this if you know what you're doing.
    # See `UPNPResult` for possible return values.
    def discover(timeout : Int64, ttl : Int64, device_filter : String) : Int64
      if @@mb_discover.null?
        @@mb_discover = Bridge.get_method_bind("UPNP", "discover", 1575334765_i64)
      end
      val_0 = timeout
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = ttl
      arg_1 = pointerof(val_1).as(Void*)
      str_2 = Bridge.make_string(device_filter)
      arg_2 = str_2
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_discover, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_2)
    end
    @@mb_query_external_address : Void* = Pointer(Void).null
    # Returns the external `IP` address of the default gateway (see `#get_gateway`) as string. Returns an empty string on error.
    def query_external_address() : String
      if @@mb_query_external_address.null?
        @@mb_query_external_address = Bridge.get_method_bind("UPNP", "query_external_address", 201670096_i64)
      end
      ""
    end
    @@mb_add_port_mapping : Void* = Pointer(Void).null
    # Adds a mapping to forward the external `port` (between 1 and 65535, although recommended to use port 1024 or above) on the default gateway (see `#get_gateway`) to the `port_internal` on the local machine for the given protocol `proto` (either `"TCP"` or `"UDP"`, with UDP being the default). If a port mapping for the given port and protocol combination already exists on that gateway device, this method tries to overwrite it. If that is not desired, you can retrieve the gateway manually with `#get_gateway` and call `#add_port_mapping` on it, if any. Note that forwarding a well-known port (below 1024) with UPnP may fail depending on the device.
    # Depending on the gateway device, if a mapping for that port already exists, it will either be updated or it will refuse this command due to that conflict, especially if the existing mapping for that port wasn't created via UPnP or points to a different network address (or device) than this one.
    # If `port_internal` is `0` (the default), the same port number is used for both the external and the internal port (the `port` value).
    # The description (`desc`) is shown in some routers management UIs and can be used to point out which application added the mapping.
    # The mapping's lease `duration` can be limited by specifying a duration in seconds. The default of `0` means no duration, i.e. a permanent lease and notably some devices only support these permanent leases. Note that whether permanent or not, this is only a request and the gateway may still decide at any point to remove the mapping (which usually happens on a reboot of the gateway, when its external IP address changes, or on some models when it detects a port mapping has become inactive, i.e. had no traffic for multiple minutes). If not `0` (permanent), the allowed range according to spec is between `120` (2 minutes) and `86400` seconds (24 hours).
    # See `UPNPResult` for possible return values.
    def add_port_mapping(port : Int64, port_internal : Int64, desc : String, proto : String, duration : Int64) : Int64
      if @@mb_add_port_mapping.null?
        @@mb_add_port_mapping = Bridge.get_method_bind("UPNP", "add_port_mapping", 818314583_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = port_internal
      arg_1 = pointerof(val_1).as(Void*)
      str_2 = Bridge.make_string(desc)
      arg_2 = str_2
      str_3 = Bridge.make_string(proto)
      arg_3 = str_3
      val_4 = duration
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_i64
      Bridge.ptrcall(@@mb_add_port_mapping, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_2)
      Bridge.free_string(str_3)
    end
    @@mb_delete_port_mapping : Void* = Pointer(Void).null
    # Deletes the port mapping for the given port and protocol combination on the default gateway (see `#get_gateway`) if one exists. `port` must be a valid port between 1 and 65535, `proto` can be either `"TCP"` or `"UDP"`. May be refused for mappings pointing to addresses other than this one, for well-known ports (below 1024), or for mappings not added via UPnP. See `UPNPResult` for possible return values.
    def delete_port_mapping(port : Int64, proto : String) : Int64
      if @@mb_delete_port_mapping.null?
        @@mb_delete_port_mapping = Bridge.get_method_bind("UPNP", "delete_port_mapping", 3444187325_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      str_1 = Bridge.make_string(proto)
      arg_1 = str_1
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_delete_port_mapping, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_1)
    end
    @@mb_set_discover_multicast_if : Void* = Pointer(Void).null
    def set_discover_multicast_if(m_if : String) : Void
      if @@mb_set_discover_multicast_if.null?
        @@mb_set_discover_multicast_if = Bridge.get_method_bind("UPNP", "set_discover_multicast_if", 83702148_i64)
      end
      str_0 = Bridge.make_string(m_if)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_discover_multicast_if, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_discover_multicast_if : Void* = Pointer(Void).null
    def get_discover_multicast_if() : String
      if @@mb_get_discover_multicast_if.null?
        @@mb_get_discover_multicast_if = Bridge.get_method_bind("UPNP", "get_discover_multicast_if", 201670096_i64)
      end
      ""
    end
    @@mb_set_discover_local_port : Void* = Pointer(Void).null
    def set_discover_local_port(port : Int64) : Void
      if @@mb_set_discover_local_port.null?
        @@mb_set_discover_local_port = Bridge.get_method_bind("UPNP", "set_discover_local_port", 1286410249_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_discover_local_port, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_discover_local_port : Void* = Pointer(Void).null
    def get_discover_local_port() : Int64
      if @@mb_get_discover_local_port.null?
        @@mb_get_discover_local_port = Bridge.get_method_bind("UPNP", "get_discover_local_port", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_discover_local_port, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_discover_ipv6 : Void* = Pointer(Void).null
    def set_discover_ipv6(ipv6 : Bool) : Void
      if @@mb_set_discover_ipv6.null?
        @@mb_set_discover_ipv6 = Bridge.get_method_bind("UPNP", "set_discover_ipv6", 2586408642_i64)
      end
      val_0 = ipv6
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_discover_ipv6, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_discover_ipv6 : Void* = Pointer(Void).null
    def is_discover_ipv6() : Bool
      if @@mb_is_discover_ipv6.null?
        @@mb_is_discover_ipv6 = Bridge.get_method_bind("UPNP", "is_discover_ipv6", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_discover_ipv6, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # Universal Plug and Play (UPnP) device.
  #
  # Universal Plug and Play (UPnP) device. See `UPNP` for UPnP discovery and utility functions. Provides low-level access to UPNP control commands. Allows to manage port mappings (port forwarding) and to query network information of the device (like local and external IP address and status). Note that methods on this class are synchronous and block the calling thread.
  class UPNPDevice < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum IGDStatus : Int64
      IgdStatusOk = 0_i64
      IgdStatusHttpError = 1_i64
      IgdStatusHttpEmpty = 2_i64
      IgdStatusNoUrls = 3_i64
      IgdStatusNoIgd = 4_i64
      IgdStatusDisconnected = 5_i64
      IgdStatusUnknownDevice = 6_i64
      IgdStatusInvalidControl = 7_i64
      IgdStatusMallocError = 8_i64
      IgdStatusUnknownError = 9_i64
    end
    @@mb_is_valid_gateway : Void* = Pointer(Void).null
    # Returns `true` if this is a valid IGD (InternetGatewayDevice) which potentially supports port forwarding.
    def is_valid_gateway() : Bool
      if @@mb_is_valid_gateway.null?
        @@mb_is_valid_gateway = Bridge.get_method_bind("UPNPDevice", "is_valid_gateway", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_valid_gateway, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_query_external_address : Void* = Pointer(Void).null
    # Returns the external IP address of this `UPNPDevice` or an empty string.
    def query_external_address() : String
      if @@mb_query_external_address.null?
        @@mb_query_external_address = Bridge.get_method_bind("UPNPDevice", "query_external_address", 201670096_i64)
      end
      ""
    end
    @@mb_add_port_mapping : Void* = Pointer(Void).null
    # Adds a port mapping to forward the given external port on this `UPNPDevice` for the given protocol to the local machine. See `#UPNP.add_port_mapping`.
    def add_port_mapping(port : Int64, port_internal : Int64, desc : String, proto : String, duration : Int64) : Int64
      if @@mb_add_port_mapping.null?
        @@mb_add_port_mapping = Bridge.get_method_bind("UPNPDevice", "add_port_mapping", 818314583_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = port_internal
      arg_1 = pointerof(val_1).as(Void*)
      str_2 = Bridge.make_string(desc)
      arg_2 = str_2
      str_3 = Bridge.make_string(proto)
      arg_3 = str_3
      val_4 = duration
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_i64
      Bridge.ptrcall(@@mb_add_port_mapping, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_2)
      Bridge.free_string(str_3)
    end
    @@mb_delete_port_mapping : Void* = Pointer(Void).null
    # Deletes the port mapping identified by the given port and protocol combination on this device. See `#UPNP.delete_port_mapping`.
    def delete_port_mapping(port : Int64, proto : String) : Int64
      if @@mb_delete_port_mapping.null?
        @@mb_delete_port_mapping = Bridge.get_method_bind("UPNPDevice", "delete_port_mapping", 3444187325_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      str_1 = Bridge.make_string(proto)
      arg_1 = str_1
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_delete_port_mapping, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_1)
    end
    @@mb_set_description_url : Void* = Pointer(Void).null
    def set_description_url(url : String) : Void
      if @@mb_set_description_url.null?
        @@mb_set_description_url = Bridge.get_method_bind("UPNPDevice", "set_description_url", 83702148_i64)
      end
      str_0 = Bridge.make_string(url)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_description_url, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_description_url : Void* = Pointer(Void).null
    def get_description_url() : String
      if @@mb_get_description_url.null?
        @@mb_get_description_url = Bridge.get_method_bind("UPNPDevice", "get_description_url", 201670096_i64)
      end
      ""
    end
    @@mb_set_service_type : Void* = Pointer(Void).null
    def set_service_type(get_type : String) : Void
      if @@mb_set_service_type.null?
        @@mb_set_service_type = Bridge.get_method_bind("UPNPDevice", "set_service_type", 83702148_i64)
      end
      str_0 = Bridge.make_string(get_type)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_service_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_service_type : Void* = Pointer(Void).null
    def get_service_type() : String
      if @@mb_get_service_type.null?
        @@mb_get_service_type = Bridge.get_method_bind("UPNPDevice", "get_service_type", 201670096_i64)
      end
      ""
    end
    @@mb_set_igd_control_url : Void* = Pointer(Void).null
    def set_igd_control_url(url : String) : Void
      if @@mb_set_igd_control_url.null?
        @@mb_set_igd_control_url = Bridge.get_method_bind("UPNPDevice", "set_igd_control_url", 83702148_i64)
      end
      str_0 = Bridge.make_string(url)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_igd_control_url, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_igd_control_url : Void* = Pointer(Void).null
    def get_igd_control_url() : String
      if @@mb_get_igd_control_url.null?
        @@mb_get_igd_control_url = Bridge.get_method_bind("UPNPDevice", "get_igd_control_url", 201670096_i64)
      end
      ""
    end
    @@mb_set_igd_service_type : Void* = Pointer(Void).null
    def set_igd_service_type(get_type : String) : Void
      if @@mb_set_igd_service_type.null?
        @@mb_set_igd_service_type = Bridge.get_method_bind("UPNPDevice", "set_igd_service_type", 83702148_i64)
      end
      str_0 = Bridge.make_string(get_type)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_igd_service_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_igd_service_type : Void* = Pointer(Void).null
    def get_igd_service_type() : String
      if @@mb_get_igd_service_type.null?
        @@mb_get_igd_service_type = Bridge.get_method_bind("UPNPDevice", "get_igd_service_type", 201670096_i64)
      end
      ""
    end
    @@mb_set_igd_our_addr : Void* = Pointer(Void).null
    def set_igd_our_addr(addr : String) : Void
      if @@mb_set_igd_our_addr.null?
        @@mb_set_igd_our_addr = Bridge.get_method_bind("UPNPDevice", "set_igd_our_addr", 83702148_i64)
      end
      str_0 = Bridge.make_string(addr)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_igd_our_addr, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_igd_our_addr : Void* = Pointer(Void).null
    def get_igd_our_addr() : String
      if @@mb_get_igd_our_addr.null?
        @@mb_get_igd_our_addr = Bridge.get_method_bind("UPNPDevice", "get_igd_our_addr", 201670096_i64)
      end
      ""
    end
    @@mb_set_igd_status : Void* = Pointer(Void).null
    def set_igd_status(status : Int64) : Void
      if @@mb_set_igd_status.null?
        @@mb_set_igd_status = Bridge.get_method_bind("UPNPDevice", "set_igd_status", 519504122_i64)
      end
      val_0 = status
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_igd_status, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_igd_status : Void* = Pointer(Void).null
    def get_igd_status() : Int64
      if @@mb_get_igd_status.null?
        @@mb_get_igd_status = Bridge.get_method_bind("UPNPDevice", "get_igd_status", 180887011_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_igd_status, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Provides a high-level interface for implementing undo and redo operations.
  #
  # UndoRedo works by registering methods and property changes inside "actions". You can create an action, then provide ways to do and undo this action using function calls and property changes, then commit the action.
  # When an action is committed, all of the `do_*` methods will run. If the `#undo` method is used, the `undo_*` methods will run. If the `#redo` method is used, once again, all of the `do_*` methods will run.
  # Here's an example on how to add an action:
  #
  # ```gdscript
  #
  # var undo_redo = UndoRedo.new()
  #
  # func do_something():
  # 	pass # Put your code here.
  #
  # func undo_something():
  # 	pass # Put here the code that reverts what's done by "do_something()".
  #
  # func _on_my_button_pressed():
  # 	var node = get_node("MyNode2D")
  # 	undo_redo.create_action("Move the node")
  # 	undo_redo.add_do_method(do_something)
  # 	undo_redo.add_undo_method(undo_something)
  # 	undo_redo.add_do_property(node, "position", Vector2(100, 100))
  # 	undo_redo.add_undo_property(node, "position", node.position)
  # 	undo_redo.commit_action()
  #
  # ```
  # ```csharp
  #
  # private UndoRedo _undoRedo;
  #
  # public override void _Ready()
  # {
  # 	_undoRedo = new UndoRedo();
  # }
  #
  # public void DoSomething()
  # {
  # 	// Put your code here.
  # }
  #
  # public void UndoSomething()
  # {
  # 	// Put here the code that reverts what's done by "DoSomething()".
  # }
  #
  # private void OnMyButtonPressed()
  # {
  # 	var node = GetNode<Node2D>("MyNode2D");
  # 	_undoRedo.CreateAction("Move the node");
  # 	_undoRedo.AddDoMethod(new Callable(this, MethodName.DoSomething));
  # 	_undoRedo.AddUndoMethod(new Callable(this, MethodName.UndoSomething));
  # 	_undoRedo.AddDoProperty(node, "position", new Vector2(100, 100));
  # 	_undoRedo.AddUndoProperty(node, "position", node.Position);
  # 	_undoRedo.CommitAction();
  # }
  #
  # ```
  #
  # Before calling any of the `add_(un)do_*` methods, you need to first call `#create_action`. Afterwards you need to call `#commit_action`.
  # If you don't need to register a method, you can leave `#add_do_method` and `#add_undo_method` out; the same goes for properties. You can also register more than one method/property.
  # If you are making an `EditorPlugin` and want to integrate into the editor's undo history, use `EditorUndoRedoManager` instead.
  # If you are registering multiple properties/method which depend on one another, be aware that by default undo operation are called in the same order they have been added. Therefore instead of grouping do operation with their undo operations it is better to group do on one side and undo on the other as shown below.
  #
  # ```gdscript
  #
  # undo_redo.create_action("Add object")
  #
  # # DO
  # undo_redo.add_do_method(_create_object)
  # undo_redo.add_do_method(_add_object_to_singleton)
  #
  # # UNDO
  # undo_redo.add_undo_method(_remove_object_from_singleton)
  # undo_redo.add_undo_method(_destroy_that_object)
  #
  # undo_redo.commit_action()
  #
  # ```
  # ```csharp
  #
  # _undo_redo.CreateAction("Add object");
  #
  # // DO
  # _undo_redo.AddDoMethod(new Callable(this, MethodName.CreateObject));
  # _undo_redo.AddDoMethod(new Callable(this, MethodName.AddObjectToSingleton));
  #
  # // UNDO
  # _undo_redo.AddUndoMethod(new Callable(this, MethodName.RemoveObjectFromSingleton));
  # _undo_redo.AddUndoMethod(new Callable(this, MethodName.DestroyThatObject));
  #
  # _undo_redo.CommitAction();
  #
  # ```
  class UndoRedo < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum MergeMode : Int64
      MergeDisable = 0_i64
      MergeEnds = 1_i64
      MergeAll = 2_i64
    end
    @@mb_create_action : Void* = Pointer(Void).null
    # Create a new action. After this is called, do all your calls to `#add_do_method`, `#add_undo_method`, `#add_do_property`, and `#add_undo_property`, then commit the action with `#commit_action`.
    # The way actions are merged is dictated by `merge_mode`.
    # The way undo operation are ordered in actions is dictated by `backward_undo_ops`. When `backward_undo_ops` is `false` undo option are ordered in the same order they were added. Which means the first operation to be added will be the first to be undone.
    def create_action(name : String, merge_mode : Int64, backward_undo_ops : Bool) : Void
      if @@mb_create_action.null?
        @@mb_create_action = Bridge.get_method_bind("UndoRedo", "create_action", 3171901514_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      val_1 = merge_mode
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = backward_undo_ops
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_create_action, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_commit_action : Void* = Pointer(Void).null
    # Commit the action. If `execute` is `true` (which it is by default), all "do" methods/properties are called/set when this function is called.
    def commit_action(execute : Bool) : Void
      if @@mb_commit_action.null?
        @@mb_commit_action = Bridge.get_method_bind("UndoRedo", "commit_action", 3216645846_i64)
      end
      val_0 = execute
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_commit_action, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_committing_action : Void* = Pointer(Void).null
    # Returns `true` if the `UndoRedo` is currently committing the action, i.e. running its "do" method or property change (see `#commit_action`).
    def is_committing_action() : Bool
      if @@mb_is_committing_action.null?
        @@mb_is_committing_action = Bridge.get_method_bind("UndoRedo", "is_committing_action", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_committing_action, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_add_do_method : Void* = Pointer(Void).null
    # Register a `Callable` that will be called when the action is committed.
    def add_do_method(callable : Void*) : Void
      if @@mb_add_do_method.null?
        @@mb_add_do_method = Bridge.get_method_bind("UndoRedo", "add_do_method", 1611583062_i64)
      end
      val_0 = callable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_do_method, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_undo_method : Void* = Pointer(Void).null
    # Register a `Callable` that will be called when the action is undone.
    def add_undo_method(callable : Void*) : Void
      if @@mb_add_undo_method.null?
        @@mb_add_undo_method = Bridge.get_method_bind("UndoRedo", "add_undo_method", 1611583062_i64)
      end
      val_0 = callable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_undo_method, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_do_property : Void* = Pointer(Void).null
    # Register a `property` that would change its value to `value` when the action is committed.
    def add_do_property(object : Godot::Object, property : String, value : Void*) : Void
      if @@mb_add_do_property.null?
        @@mb_add_do_property = Bridge.get_method_bind("UndoRedo", "add_do_property", 1017172818_i64)
      end
      arg_ptr_0 = object ? object.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      sn_1 = Bridge.make_string_name(property)
      arg_1 = sn_1
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_add_do_property, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_1)
    end
    @@mb_add_undo_property : Void* = Pointer(Void).null
    # Register a `property` that would change its value to `value` when the action is undone.
    def add_undo_property(object : Godot::Object, property : String, value : Void*) : Void
      if @@mb_add_undo_property.null?
        @@mb_add_undo_property = Bridge.get_method_bind("UndoRedo", "add_undo_property", 1017172818_i64)
      end
      arg_ptr_0 = object ? object.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      sn_1 = Bridge.make_string_name(property)
      arg_1 = sn_1
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_add_undo_property, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_1)
    end
    @@mb_add_do_reference : Void* = Pointer(Void).null
    # Register a reference to an object that will be erased if the "do" history is deleted. This is useful for objects added by the "do" action and removed by the "undo" action.
    # When the "do" history is deleted, if the object is a `RefCounted`, it will be unreferenced. Otherwise, it will be freed. Do not use for resources.
    # ```gdscript
    #
    # var node = Node2D.new()
    # undo_redo.create_action("Add node")
    # undo_redo.add_do_method(add_child.bind(node))
    # undo_redo.add_do_reference(node)
    # undo_redo.add_undo_method(remove_child.bind(node))
    # undo_redo.commit_action()
    #
    # ```
    def add_do_reference(object : Godot::Object) : Void
      if @@mb_add_do_reference.null?
        @@mb_add_do_reference = Bridge.get_method_bind("UndoRedo", "add_do_reference", 3975164845_i64)
      end
      arg_ptr_0 = object ? object.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_do_reference, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_undo_reference : Void* = Pointer(Void).null
    # Register a reference to an object that will be erased if the "undo" history is deleted. This is useful for objects added by the "undo" action and removed by the "do" action.
    # When the "undo" history is deleted, if the object is a `RefCounted`, it will be unreferenced. Otherwise, it will be freed. Do not use for resources.
    # ```gdscript
    #
    # var node = $Node2D
    # undo_redo.create_action("Remove node")
    # undo_redo.add_do_method(remove_child.bind(node))
    # undo_redo.add_undo_method(add_child.bind(node))
    # undo_redo.add_undo_reference(node)
    # undo_redo.commit_action()
    #
    # ```
    def add_undo_reference(object : Godot::Object) : Void
      if @@mb_add_undo_reference.null?
        @@mb_add_undo_reference = Bridge.get_method_bind("UndoRedo", "add_undo_reference", 3975164845_i64)
      end
      arg_ptr_0 = object ? object.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_undo_reference, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_start_force_keep_in_merge_ends : Void* = Pointer(Void).null
    # Marks the next "do" and "undo" operations to be processed even if the action gets merged with another in the `MERGE_ENDS` mode. Return to normal operation using `#end_force_keep_in_merge_ends`.
    def start_force_keep_in_merge_ends() : Void
      if @@mb_start_force_keep_in_merge_ends.null?
        @@mb_start_force_keep_in_merge_ends = Bridge.get_method_bind("UndoRedo", "start_force_keep_in_merge_ends", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_start_force_keep_in_merge_ends, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_end_force_keep_in_merge_ends : Void* = Pointer(Void).null
    # Stops marking operations as to be processed even if the action gets merged with another in the `MERGE_ENDS` mode. See `#start_force_keep_in_merge_ends`.
    def end_force_keep_in_merge_ends() : Void
      if @@mb_end_force_keep_in_merge_ends.null?
        @@mb_end_force_keep_in_merge_ends = Bridge.get_method_bind("UndoRedo", "end_force_keep_in_merge_ends", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_end_force_keep_in_merge_ends, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_history_count : Void* = Pointer(Void).null
    # Returns how many elements are in the history.
    def get_history_count() : Int64
      if @@mb_get_history_count.null?
        @@mb_get_history_count = Bridge.get_method_bind("UndoRedo", "get_history_count", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_history_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_current_action : Void* = Pointer(Void).null
    # Gets the index of the current action.
    def get_current_action() : Int64
      if @@mb_get_current_action.null?
        @@mb_get_current_action = Bridge.get_method_bind("UndoRedo", "get_current_action", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_current_action, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_action_name : Void* = Pointer(Void).null
    # Gets the action name from its index.
    def get_action_name(id : Int64) : String
      if @@mb_get_action_name.null?
        @@mb_get_action_name = Bridge.get_method_bind("UndoRedo", "get_action_name", 990163283_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_clear_history : Void* = Pointer(Void).null
    # Clear the undo/redo history and associated references.
    # Passing `false` to `increase_version` will prevent the version number from increasing when the history is cleared.
    def clear_history(increase_version : Bool) : Void
      if @@mb_clear_history.null?
        @@mb_clear_history = Bridge.get_method_bind("UndoRedo", "clear_history", 3216645846_i64)
      end
      val_0 = increase_version
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_clear_history, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_current_action_name : Void* = Pointer(Void).null
    # Gets the name of the current action, equivalent to `get_action_name(get_current_action())`.
    def get_current_action_name() : String
      if @@mb_get_current_action_name.null?
        @@mb_get_current_action_name = Bridge.get_method_bind("UndoRedo", "get_current_action_name", 201670096_i64)
      end
      ""
    end
    @@mb_has_undo : Void* = Pointer(Void).null
    # Returns `true` if an "undo" action is available.
    def has_undo() : Bool
      if @@mb_has_undo.null?
        @@mb_has_undo = Bridge.get_method_bind("UndoRedo", "has_undo", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_undo, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_redo : Void* = Pointer(Void).null
    # Returns `true` if a "redo" action is available.
    def has_redo() : Bool
      if @@mb_has_redo.null?
        @@mb_has_redo = Bridge.get_method_bind("UndoRedo", "has_redo", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_redo, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_version : Void* = Pointer(Void).null
    # Gets the version. Every time a new action is committed, the `UndoRedo`'s version number is increased automatically.
    # This is useful mostly to check if something changed from a saved version.
    def get_version() : Int64
      if @@mb_get_version.null?
        @@mb_get_version = Bridge.get_method_bind("UndoRedo", "get_version", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_version, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_steps : Void* = Pointer(Void).null
    def set_max_steps(max_steps : Int64) : Void
      if @@mb_set_max_steps.null?
        @@mb_set_max_steps = Bridge.get_method_bind("UndoRedo", "set_max_steps", 1286410249_i64)
      end
      val_0 = max_steps
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_steps, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_steps : Void* = Pointer(Void).null
    def get_max_steps() : Int64
      if @@mb_get_max_steps.null?
        @@mb_get_max_steps = Bridge.get_method_bind("UndoRedo", "get_max_steps", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_steps, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_redo : Void* = Pointer(Void).null
    # Redo the last action. Returns `false` if there was no action to redo.
    def redo_val() : Bool
      if @@mb_redo.null?
        @@mb_redo = Bridge.get_method_bind("UndoRedo", "redo", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_redo, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_undo : Void* = Pointer(Void).null
    # Undo the last action. Returns `false` if there was no action to undo.
    def undo() : Bool
      if @@mb_undo.null?
        @@mb_undo = Bridge.get_method_bind("UndoRedo", "undo", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_undo, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # Uniform set cache manager for Rendering Device based renderers.
  #
  # Uniform set cache manager for `RenderingDevice`-based renderers. Provides a way to create a uniform set and reuse it in subsequent calls for as long as the uniform set exists. Uniform set will automatically be cleaned up when dependent objects are freed.
  class UniformSetCacheRD < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_cache : Void* = Pointer(Void).null
    # Creates/returns a cached uniform set based on the provided uniforms for a given shader.
    def get_cache(shader : Int64, set : Int64, uniforms : Godot::Array) : Int64
      if @@mb_get_cache.null?
        @@mb_get_cache = Bridge.get_method_bind("UniformSetCacheRD", "get_cache", 658571723_i64)
      end
      val_0 = shader
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = set
      arg_1 = pointerof(val_1).as(Void*)
      arg_ptr_2 = uniforms ? uniforms.pointer : Pointer(Void).null
      arg_2 = pointerof(arg_ptr_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_cache, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  # A container that arranges its child controls vertically and wraps them around at the borders.
  #
  # A variant of `FlowContainer` that can only arrange its child controls vertically, wrapping them around at the borders. This is similar to how text in a book wraps around when no more words can fit on a line, except vertically.
  class VFlowContainer < Godot::FlowContainer
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A vertical scrollbar that goes from top (min) to bottom (max).
  #
  # A vertical scrollbar, typically used to navigate through content that extends beyond the visible height of a control. It is a `Range`-based control and goes from top (min) to bottom (max). Note that this direction is the opposite of `VSlider`'s.
  class VScrollBar < Godot::ScrollBar
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A vertical line used for separating other controls.
  #
  # A vertical separator used for separating other controls that are arranged **horizontally**. `VSeparator` is purely visual and normally drawn as a `StyleBoxLine`.
  class VSeparator < Godot::Separator
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A vertical slider that goes from bottom (min) to top (max).
  #
  # A vertical slider, used to adjust a value by moving a grabber along a vertical axis. It is a `Range`-based control and goes from bottom (min) to top (max). Note that this direction is the opposite of `VScrollBar`'s.
  class VSlider < Godot::Slider
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A container that splits two child controls vertically and provides a grabber for adjusting the split ratio.
  #
  # A container that accepts only two child controls, then arranges them vertically and creates a divisor between them. The divisor can be dragged around to change the size relation between the child controls.
  class VSplitContainer < Godot::SplitContainer
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A 3D physics body that simulates the behavior of a car.
  #
  # This physics body implements all the physics logic needed to simulate a car. It is based on the raycast vehicle system commonly found in physics engines. Aside from a `CollisionShape3D` for the main body of the vehicle, you must also add a `VehicleWheel3D` node for each wheel. You should also add a `MeshInstance3D` to this node for the 3D model of the vehicle, but this model should generally not include meshes for the wheels. You can control the vehicle by using the `brake`, `engine_force`, and `steering` properties. The position or orientation of this node shouldn't be changed directly.
  # **Note:** The local forward for this node is `Vector3.MODEL_FRONT`.
  # **Note:** The origin point of your VehicleBody3D will determine the center of gravity of your vehicle. To make the vehicle more grounded, the origin point is usually kept low, moving the `CollisionShape3D` and `MeshInstance3D` upwards.
  # **Note:** This class has known issues and isn't designed to provide realistic 3D vehicle physics. If you want advanced vehicle physics, you may have to write your own physics integration using `CharacterBody3D` or `RigidBody3D`.
  class VehicleBody3D < Godot::RigidBody3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_engine_force : Void* = Pointer(Void).null
    def set_engine_force(engine_force : Float64) : Void
      if @@mb_set_engine_force.null?
        @@mb_set_engine_force = Bridge.get_method_bind("VehicleBody3D", "set_engine_force", 373806689_i64)
      end
      val_0 = engine_force
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_engine_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_engine_force : Void* = Pointer(Void).null
    def get_engine_force() : Float64
      if @@mb_get_engine_force.null?
        @@mb_get_engine_force = Bridge.get_method_bind("VehicleBody3D", "get_engine_force", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_engine_force, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_brake : Void* = Pointer(Void).null
    def set_brake(brake : Float64) : Void
      if @@mb_set_brake.null?
        @@mb_set_brake = Bridge.get_method_bind("VehicleBody3D", "set_brake", 373806689_i64)
      end
      val_0 = brake
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_brake, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_brake : Void* = Pointer(Void).null
    def get_brake() : Float64
      if @@mb_get_brake.null?
        @@mb_get_brake = Bridge.get_method_bind("VehicleBody3D", "get_brake", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_brake, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_steering : Void* = Pointer(Void).null
    def set_steering(steering : Float64) : Void
      if @@mb_set_steering.null?
        @@mb_set_steering = Bridge.get_method_bind("VehicleBody3D", "set_steering", 373806689_i64)
      end
      val_0 = steering
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_steering, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_steering : Void* = Pointer(Void).null
    def get_steering() : Float64
      if @@mb_get_steering.null?
        @@mb_get_steering = Bridge.get_method_bind("VehicleBody3D", "get_steering", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_steering, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A 3D physics body for a `VehicleBody3D` that simulates the behavior of a wheel.
  #
  # A node used as a child of a `VehicleBody3D` parent to simulate the behavior of one of its wheels. This node also acts as a collider to detect if the wheel is touching a surface.
  # **Note:** This class has known issues and isn't designed to provide realistic 3D vehicle physics. If you want advanced vehicle physics, you may need to write your own physics integration using another `PhysicsBody3D` class.
  class VehicleWheel3D < Godot::Node3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_radius : Void* = Pointer(Void).null
    def set_radius(length : Float64) : Void
      if @@mb_set_radius.null?
        @@mb_set_radius = Bridge.get_method_bind("VehicleWheel3D", "set_radius", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_radius : Void* = Pointer(Void).null
    def get_radius() : Float64
      if @@mb_get_radius.null?
        @@mb_get_radius = Bridge.get_method_bind("VehicleWheel3D", "get_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_suspension_rest_length : Void* = Pointer(Void).null
    def set_suspension_rest_length(length : Float64) : Void
      if @@mb_set_suspension_rest_length.null?
        @@mb_set_suspension_rest_length = Bridge.get_method_bind("VehicleWheel3D", "set_suspension_rest_length", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_suspension_rest_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_suspension_rest_length : Void* = Pointer(Void).null
    def get_suspension_rest_length() : Float64
      if @@mb_get_suspension_rest_length.null?
        @@mb_get_suspension_rest_length = Bridge.get_method_bind("VehicleWheel3D", "get_suspension_rest_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_suspension_rest_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_suspension_travel : Void* = Pointer(Void).null
    def set_suspension_travel(length : Float64) : Void
      if @@mb_set_suspension_travel.null?
        @@mb_set_suspension_travel = Bridge.get_method_bind("VehicleWheel3D", "set_suspension_travel", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_suspension_travel, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_suspension_travel : Void* = Pointer(Void).null
    def get_suspension_travel() : Float64
      if @@mb_get_suspension_travel.null?
        @@mb_get_suspension_travel = Bridge.get_method_bind("VehicleWheel3D", "get_suspension_travel", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_suspension_travel, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_suspension_stiffness : Void* = Pointer(Void).null
    def set_suspension_stiffness(length : Float64) : Void
      if @@mb_set_suspension_stiffness.null?
        @@mb_set_suspension_stiffness = Bridge.get_method_bind("VehicleWheel3D", "set_suspension_stiffness", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_suspension_stiffness, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_suspension_stiffness : Void* = Pointer(Void).null
    def get_suspension_stiffness() : Float64
      if @@mb_get_suspension_stiffness.null?
        @@mb_get_suspension_stiffness = Bridge.get_method_bind("VehicleWheel3D", "get_suspension_stiffness", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_suspension_stiffness, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_suspension_max_force : Void* = Pointer(Void).null
    def set_suspension_max_force(length : Float64) : Void
      if @@mb_set_suspension_max_force.null?
        @@mb_set_suspension_max_force = Bridge.get_method_bind("VehicleWheel3D", "set_suspension_max_force", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_suspension_max_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_suspension_max_force : Void* = Pointer(Void).null
    def get_suspension_max_force() : Float64
      if @@mb_get_suspension_max_force.null?
        @@mb_get_suspension_max_force = Bridge.get_method_bind("VehicleWheel3D", "get_suspension_max_force", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_suspension_max_force, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_damping_compression : Void* = Pointer(Void).null
    def set_damping_compression(length : Float64) : Void
      if @@mb_set_damping_compression.null?
        @@mb_set_damping_compression = Bridge.get_method_bind("VehicleWheel3D", "set_damping_compression", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_damping_compression, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_damping_compression : Void* = Pointer(Void).null
    def get_damping_compression() : Float64
      if @@mb_get_damping_compression.null?
        @@mb_get_damping_compression = Bridge.get_method_bind("VehicleWheel3D", "get_damping_compression", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_damping_compression, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_damping_relaxation : Void* = Pointer(Void).null
    def set_damping_relaxation(length : Float64) : Void
      if @@mb_set_damping_relaxation.null?
        @@mb_set_damping_relaxation = Bridge.get_method_bind("VehicleWheel3D", "set_damping_relaxation", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_damping_relaxation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_damping_relaxation : Void* = Pointer(Void).null
    def get_damping_relaxation() : Float64
      if @@mb_get_damping_relaxation.null?
        @@mb_get_damping_relaxation = Bridge.get_method_bind("VehicleWheel3D", "get_damping_relaxation", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_damping_relaxation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_use_as_traction : Void* = Pointer(Void).null
    def set_use_as_traction(enable : Bool) : Void
      if @@mb_set_use_as_traction.null?
        @@mb_set_use_as_traction = Bridge.get_method_bind("VehicleWheel3D", "set_use_as_traction", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_as_traction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_used_as_traction : Void* = Pointer(Void).null
    def is_used_as_traction() : Bool
      if @@mb_is_used_as_traction.null?
        @@mb_is_used_as_traction = Bridge.get_method_bind("VehicleWheel3D", "is_used_as_traction", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_used_as_traction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_use_as_steering : Void* = Pointer(Void).null
    def set_use_as_steering(enable : Bool) : Void
      if @@mb_set_use_as_steering.null?
        @@mb_set_use_as_steering = Bridge.get_method_bind("VehicleWheel3D", "set_use_as_steering", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_as_steering, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_used_as_steering : Void* = Pointer(Void).null
    def is_used_as_steering() : Bool
      if @@mb_is_used_as_steering.null?
        @@mb_is_used_as_steering = Bridge.get_method_bind("VehicleWheel3D", "is_used_as_steering", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_used_as_steering, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_friction_slip : Void* = Pointer(Void).null
    def set_friction_slip(length : Float64) : Void
      if @@mb_set_friction_slip.null?
        @@mb_set_friction_slip = Bridge.get_method_bind("VehicleWheel3D", "set_friction_slip", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_friction_slip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_friction_slip : Void* = Pointer(Void).null
    def get_friction_slip() : Float64
      if @@mb_get_friction_slip.null?
        @@mb_get_friction_slip = Bridge.get_method_bind("VehicleWheel3D", "get_friction_slip", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_friction_slip, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_in_contact : Void* = Pointer(Void).null
    # Returns `true` if this wheel is in contact with a surface.
    def is_in_contact() : Bool
      if @@mb_is_in_contact.null?
        @@mb_is_in_contact = Bridge.get_method_bind("VehicleWheel3D", "is_in_contact", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_in_contact, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_contact_body : Void* = Pointer(Void).null
    # Returns the contacting body node if valid in the tree, as `Node3D`. At the moment, `GridMap` is not supported so the node will be always of type `PhysicsBody3D`.
    # Returns `null` if the wheel is not in contact with a surface, or the contact body is not a `PhysicsBody3D`.
    def get_contact_body() : Node3D
      if @@mb_get_contact_body.null?
        @@mb_get_contact_body = Bridge.get_method_bind("VehicleWheel3D", "get_contact_body", 151077316_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_contact_body, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Node3D.new(ret_ptr)
    end
    @@mb_get_contact_point : Void* = Pointer(Void).null
    # Returns the point of the suspension's collision in world space if the wheel is in contact. If the wheel isn't in contact with anything, returns the maximum point of the wheel's ray cast in world space, which is defined by `wheel_rest_length + wheel_radius`.
    def get_contact_point() : Vector3
      if @@mb_get_contact_point.null?
        @@mb_get_contact_point = Bridge.get_method_bind("VehicleWheel3D", "get_contact_point", 3360562783_i64)
      end
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_contact_point, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_normal : Void* = Pointer(Void).null
    # Returns the normal of the suspension's collision in world space if the wheel is in contact. If the wheel isn't in contact with anything, returns a vector pointing directly along the suspension axis toward the vehicle in world space.
    def get_contact_normal() : Vector3
      if @@mb_get_contact_normal.null?
        @@mb_get_contact_normal = Bridge.get_method_bind("VehicleWheel3D", "get_contact_normal", 3360562783_i64)
      end
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_contact_normal, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_roll_influence : Void* = Pointer(Void).null
    def set_roll_influence(roll_influence : Float64) : Void
      if @@mb_set_roll_influence.null?
        @@mb_set_roll_influence = Bridge.get_method_bind("VehicleWheel3D", "set_roll_influence", 373806689_i64)
      end
      val_0 = roll_influence
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_roll_influence, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_roll_influence : Void* = Pointer(Void).null
    def get_roll_influence() : Float64
      if @@mb_get_roll_influence.null?
        @@mb_get_roll_influence = Bridge.get_method_bind("VehicleWheel3D", "get_roll_influence", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_roll_influence, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_skidinfo : Void* = Pointer(Void).null
    # Returns a value between 0.0 and 1.0 that indicates whether this wheel is skidding. 0.0 is skidding (the wheel has lost grip, e.g. icy terrain), 1.0 means not skidding (the wheel has full grip, e.g. dry asphalt road).
    def get_skidinfo() : Float64
      if @@mb_get_skidinfo.null?
        @@mb_get_skidinfo = Bridge.get_method_bind("VehicleWheel3D", "get_skidinfo", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_skidinfo, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_rpm : Void* = Pointer(Void).null
    # Returns the rotational speed of the wheel in revolutions per minute.
    def get_rpm() : Float64
      if @@mb_get_rpm.null?
        @@mb_get_rpm = Bridge.get_method_bind("VehicleWheel3D", "get_rpm", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_rpm, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_engine_force : Void* = Pointer(Void).null
    def set_engine_force(engine_force : Float64) : Void
      if @@mb_set_engine_force.null?
        @@mb_set_engine_force = Bridge.get_method_bind("VehicleWheel3D", "set_engine_force", 373806689_i64)
      end
      val_0 = engine_force
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_engine_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_engine_force : Void* = Pointer(Void).null
    def get_engine_force() : Float64
      if @@mb_get_engine_force.null?
        @@mb_get_engine_force = Bridge.get_method_bind("VehicleWheel3D", "get_engine_force", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_engine_force, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_brake : Void* = Pointer(Void).null
    def set_brake(brake : Float64) : Void
      if @@mb_set_brake.null?
        @@mb_set_brake = Bridge.get_method_bind("VehicleWheel3D", "set_brake", 373806689_i64)
      end
      val_0 = brake
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_brake, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_brake : Void* = Pointer(Void).null
    def get_brake() : Float64
      if @@mb_get_brake.null?
        @@mb_get_brake = Bridge.get_method_bind("VehicleWheel3D", "get_brake", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_brake, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_steering : Void* = Pointer(Void).null
    def set_steering(steering : Float64) : Void
      if @@mb_set_steering.null?
        @@mb_set_steering = Bridge.get_method_bind("VehicleWheel3D", "set_steering", 373806689_i64)
      end
      val_0 = steering
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_steering, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_steering : Void* = Pointer(Void).null
    def get_steering() : Float64
      if @@mb_get_steering.null?
        @@mb_get_steering = Bridge.get_method_bind("VehicleWheel3D", "get_steering", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_steering, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Base resource for video streams.
  #
  # Base resource type for all video streams. Classes that derive from `VideoStream` can all be used as resource types to play back videos in `VideoStreamPlayer`.
  class VideoStream < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_file : Void* = Pointer(Void).null
    def set_file(file : String) : Void
      if @@mb_set_file.null?
        @@mb_set_file = Bridge.get_method_bind("VideoStream", "set_file", 83702148_i64)
      end
      str_0 = Bridge.make_string(file)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_file, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_file : Void* = Pointer(Void).null
    def get_file() : String
      if @@mb_get_file.null?
        @@mb_get_file = Bridge.get_method_bind("VideoStream", "get_file", 2841200299_i64)
      end
      ""
    end
  end
  # Internal class used by `VideoStream` to manage playback state when played from a `VideoStreamPlayer`.
  #
  # This class is intended to be overridden by video decoder extensions with custom implementations of `VideoStream`.
  class VideoStreamPlayback < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_mix_audio : Void* = Pointer(Void).null
    # Render `num_frames` audio frames (of `#_get_channels` floats each) from `buffer`, starting from index `offset` in the array. Returns the number of audio frames rendered, or -1 on error.
    def mix_audio(num_frames : Int64, buffer : Void*, offset : Int64) : Int64
      if @@mb_mix_audio.null?
        @@mb_mix_audio = Bridge.get_method_bind("VideoStreamPlayback", "mix_audio", 93876830_i64)
      end
      val_0 = num_frames
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = buffer
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = offset
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mix_audio, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  # A control used for video playback.
  #
  # A control used for playback of `VideoStream` resources.
  # Supported video formats are [$2]($1) (`.ogv`, `VideoStreamTheora`) and any format exposed via a GDExtension plugin.
  # **Warning:** On Web, video playback *will* perform poorly due to missing architecture-specific assembly optimizations.
  class VideoStreamPlayer < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_stream : Void* = Pointer(Void).null
    def set_stream(stream : VideoStream) : Void
      if @@mb_set_stream.null?
        @@mb_set_stream = Bridge.get_method_bind("VideoStreamPlayer", "set_stream", 2317102564_i64)
      end
      arg_ptr_0 = stream ? stream.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_stream, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stream : Void* = Pointer(Void).null
    def get_stream() : VideoStream
      if @@mb_get_stream.null?
        @@mb_get_stream = Bridge.get_method_bind("VideoStreamPlayer", "get_stream", 438621487_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_stream, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      VideoStream.new(ret_ptr)
    end
    @@mb_play : Void* = Pointer(Void).null
    # Starts the video playback from the beginning. If the video is paused, this will not unpause the video.
    def play() : Void
      if @@mb_play.null?
        @@mb_play = Bridge.get_method_bind("VideoStreamPlayer", "play", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_play, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_stop : Void* = Pointer(Void).null
    # Stops the video playback and sets the stream position to 0.
    # **Note:** Although the stream position will be set to 0, the first frame of the video stream won't become the current frame.
    def stop() : Void
      if @@mb_stop.null?
        @@mb_stop = Bridge.get_method_bind("VideoStreamPlayer", "stop", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_stop, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_is_playing : Void* = Pointer(Void).null
    # Returns `true` if the video is playing.
    # **Note:** The video is still considered playing if paused during playback.
    def is_playing() : Bool
      if @@mb_is_playing.null?
        @@mb_is_playing = Bridge.get_method_bind("VideoStreamPlayer", "is_playing", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_playing, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_paused : Void* = Pointer(Void).null
    def set_paused(paused : Bool) : Void
      if @@mb_set_paused.null?
        @@mb_set_paused = Bridge.get_method_bind("VideoStreamPlayer", "set_paused", 2586408642_i64)
      end
      val_0 = paused
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_paused, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_paused : Void* = Pointer(Void).null
    def is_paused() : Bool
      if @@mb_is_paused.null?
        @@mb_is_paused = Bridge.get_method_bind("VideoStreamPlayer", "is_paused", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_paused, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_loop : Void* = Pointer(Void).null
    def set_loop(loop : Bool) : Void
      if @@mb_set_loop.null?
        @@mb_set_loop = Bridge.get_method_bind("VideoStreamPlayer", "set_loop", 2586408642_i64)
      end
      val_0 = loop
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_loop, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_loop : Void* = Pointer(Void).null
    def has_loop() : Bool
      if @@mb_has_loop.null?
        @@mb_has_loop = Bridge.get_method_bind("VideoStreamPlayer", "has_loop", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_loop, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_volume : Void* = Pointer(Void).null
    def set_volume(volume : Float64) : Void
      if @@mb_set_volume.null?
        @@mb_set_volume = Bridge.get_method_bind("VideoStreamPlayer", "set_volume", 373806689_i64)
      end
      val_0 = volume
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_volume, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_volume : Void* = Pointer(Void).null
    def get_volume() : Float64
      if @@mb_get_volume.null?
        @@mb_get_volume = Bridge.get_method_bind("VideoStreamPlayer", "get_volume", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_volume, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_volume_db : Void* = Pointer(Void).null
    def set_volume_db(db : Float64) : Void
      if @@mb_set_volume_db.null?
        @@mb_set_volume_db = Bridge.get_method_bind("VideoStreamPlayer", "set_volume_db", 373806689_i64)
      end
      val_0 = db
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_volume_db, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_volume_db : Void* = Pointer(Void).null
    def get_volume_db() : Float64
      if @@mb_get_volume_db.null?
        @@mb_get_volume_db = Bridge.get_method_bind("VideoStreamPlayer", "get_volume_db", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_volume_db, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_speed_scale : Void* = Pointer(Void).null
    def set_speed_scale(speed_scale : Float64) : Void
      if @@mb_set_speed_scale.null?
        @@mb_set_speed_scale = Bridge.get_method_bind("VideoStreamPlayer", "set_speed_scale", 373806689_i64)
      end
      val_0 = speed_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_speed_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_speed_scale : Void* = Pointer(Void).null
    def get_speed_scale() : Float64
      if @@mb_get_speed_scale.null?
        @@mb_get_speed_scale = Bridge.get_method_bind("VideoStreamPlayer", "get_speed_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_speed_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_audio_track : Void* = Pointer(Void).null
    def set_audio_track(track : Int64) : Void
      if @@mb_set_audio_track.null?
        @@mb_set_audio_track = Bridge.get_method_bind("VideoStreamPlayer", "set_audio_track", 1286410249_i64)
      end
      val_0 = track
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_audio_track, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_audio_track : Void* = Pointer(Void).null
    def get_audio_track() : Int64
      if @@mb_get_audio_track.null?
        @@mb_get_audio_track = Bridge.get_method_bind("VideoStreamPlayer", "get_audio_track", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_audio_track, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_stream_name : Void* = Pointer(Void).null
    # Returns the video stream's name, or `"<No Stream>"` if no video stream is assigned.
    def get_stream_name() : String
      if @@mb_get_stream_name.null?
        @@mb_get_stream_name = Bridge.get_method_bind("VideoStreamPlayer", "get_stream_name", 201670096_i64)
      end
      ""
    end
    @@mb_get_stream_length : Void* = Pointer(Void).null
    # The length of the current stream, in seconds.
    def get_stream_length() : Float64
      if @@mb_get_stream_length.null?
        @@mb_get_stream_length = Bridge.get_method_bind("VideoStreamPlayer", "get_stream_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_stream_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_stream_position : Void* = Pointer(Void).null
    def set_stream_position(position : Float64) : Void
      if @@mb_set_stream_position.null?
        @@mb_set_stream_position = Bridge.get_method_bind("VideoStreamPlayer", "set_stream_position", 373806689_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_stream_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stream_position : Void* = Pointer(Void).null
    def get_stream_position() : Float64
      if @@mb_get_stream_position.null?
        @@mb_get_stream_position = Bridge.get_method_bind("VideoStreamPlayer", "get_stream_position", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_stream_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_autoplay : Void* = Pointer(Void).null
    def set_autoplay(enabled : Bool) : Void
      if @@mb_set_autoplay.null?
        @@mb_set_autoplay = Bridge.get_method_bind("VideoStreamPlayer", "set_autoplay", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autoplay, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_autoplay : Void* = Pointer(Void).null
    def has_autoplay() : Bool
      if @@mb_has_autoplay.null?
        @@mb_has_autoplay = Bridge.get_method_bind("VideoStreamPlayer", "has_autoplay", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_autoplay, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_expand : Void* = Pointer(Void).null
    def set_expand(enable : Bool) : Void
      if @@mb_set_expand.null?
        @@mb_set_expand = Bridge.get_method_bind("VideoStreamPlayer", "set_expand", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_expand, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_expand : Void* = Pointer(Void).null
    def has_expand() : Bool
      if @@mb_has_expand.null?
        @@mb_has_expand = Bridge.get_method_bind("VideoStreamPlayer", "has_expand", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_expand, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_buffering_msec : Void* = Pointer(Void).null
    def set_buffering_msec(msec : Int64) : Void
      if @@mb_set_buffering_msec.null?
        @@mb_set_buffering_msec = Bridge.get_method_bind("VideoStreamPlayer", "set_buffering_msec", 1286410249_i64)
      end
      val_0 = msec
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_buffering_msec, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_buffering_msec : Void* = Pointer(Void).null
    def get_buffering_msec() : Int64
      if @@mb_get_buffering_msec.null?
        @@mb_get_buffering_msec = Bridge.get_method_bind("VideoStreamPlayer", "get_buffering_msec", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_buffering_msec, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bus : Void* = Pointer(Void).null
    def set_bus(bus : String) : Void
      if @@mb_set_bus.null?
        @@mb_set_bus = Bridge.get_method_bind("VideoStreamPlayer", "set_bus", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(bus)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_bus : Void* = Pointer(Void).null
    def get_bus() : String
      if @@mb_get_bus.null?
        @@mb_get_bus = Bridge.get_method_bind("VideoStreamPlayer", "get_bus", 2002593661_i64)
      end
      ""
    end
    @@mb_get_video_texture : Void* = Pointer(Void).null
    # Returns the current frame as a `Texture2D`.
    def get_video_texture() : Texture2D
      if @@mb_get_video_texture.null?
        @@mb_get_video_texture = Bridge.get_method_bind("VideoStreamPlayer", "get_video_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_video_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
  end
  # `VideoStream` resource for Ogg Theora videos.
  #
  # `VideoStream` resource handling the [$2]($1) video format with `.ogv` extension. The Theora codec is decoded on the CPU.
  # **Note:** While Ogg Theora videos can also have a `.ogg` extension, you will have to rename the extension to `.ogv` to use those videos within Godot.
  class VideoStreamTheora < Godot::VideoStream
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Provides the content of a `Viewport` as a dynamic texture.
  #
  # A `ViewportTexture` provides the content of a `Viewport` as a dynamic `Texture2D`. This can be used to combine the rendering of `Control`, `Node2D` and `Node3D` nodes. For example, you can use this texture to display a 3D scene inside a `TextureRect`, or a 2D overlay in a `Sprite3D`.
  # To get a `ViewportTexture` in code, use the `#Viewport.get_texture` method on the target viewport.
  # **Note:** A `ViewportTexture` is always local to its scene (see `Resource.resource_local_to_scene`). If the scene root is not ready, it may return incorrect data (see `Node.ready`).
  # **Note:** Instantiating scenes containing a high-resolution `ViewportTexture` may cause noticeable stutter.
  # **Note:** When using a `Viewport` with `Viewport.use_hdr_2d` set to `true`, the returned texture will be an HDR image that uses linear encoding. This may look darker than normal when displayed directly on screen. To convert to nonlinear sRGB encoding, you can do the following:
  # ```gdscript
  #
  # img.convert(Image.FORMAT_RGBA8)
  # img.linear_to_srgb()
  #
  # ```
  # **Note:** Some nodes such as `Decal`, `Light3D`, and `PointLight2D` do not support using `ViewportTexture` directly. To use texture data from a `ViewportTexture` in these nodes, you need to create an `ImageTexture` by calling `#Texture2D.get_image` on the `ViewportTexture` and passing the result to `#ImageTexture.create_from_image`. This conversion is a slow operation, so it should not be performed every frame.
  class ViewportTexture < Godot::Texture2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_viewport_path_in_scene : Void* = Pointer(Void).null
    def set_viewport_path_in_scene(path : NodePath) : Void
      if @@mb_set_viewport_path_in_scene.null?
        @@mb_set_viewport_path_in_scene = Bridge.get_method_bind("ViewportTexture", "set_viewport_path_in_scene", 1348162250_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_viewport_path_in_scene, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_viewport_path_in_scene : Void* = Pointer(Void).null
    def get_viewport_path_in_scene() : NodePath
      if @@mb_get_viewport_path_in_scene.null?
        @@mb_get_viewport_path_in_scene = Bridge.get_method_bind("ViewportTexture", "get_viewport_path_in_scene", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_viewport_path_in_scene, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
  end
  # A virtual joystick control for touchscreen devices.
  #
  # A customizable on-screen joystick control designed for touchscreen devices. It allows users to provide directional input by dragging a virtual tip within a defined circular area.
  # This control can simulate directional actions (see `action_up`, `action_down`, `action_left`, and `action_right`), which are triggered when the joystick is moved in the corresponding directions.
  class VirtualJoystick < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum JoystickMode : Int64
      JoystickFixed = 0_i64
      JoystickDynamic = 1_i64
      JoystickFollowing = 2_i64
    end
    enum VisibilityMode : Int64
      VisibilityAlways = 0_i64
      VisibilityWhenTouched = 1_i64
    end
    @@mb_set_joystick_mode : Void* = Pointer(Void).null
    def set_joystick_mode(mode : Int64) : Void
      if @@mb_set_joystick_mode.null?
        @@mb_set_joystick_mode = Bridge.get_method_bind("VirtualJoystick", "set_joystick_mode", 1316760817_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_joystick_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joystick_mode : Void* = Pointer(Void).null
    def get_joystick_mode() : Int64
      if @@mb_get_joystick_mode.null?
        @@mb_get_joystick_mode = Bridge.get_method_bind("VirtualJoystick", "get_joystick_mode", 2694680530_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_joystick_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_joystick_size : Void* = Pointer(Void).null
    def set_joystick_size(size : Float64) : Void
      if @@mb_set_joystick_size.null?
        @@mb_set_joystick_size = Bridge.get_method_bind("VirtualJoystick", "set_joystick_size", 373806689_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_joystick_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joystick_size : Void* = Pointer(Void).null
    def get_joystick_size() : Float64
      if @@mb_get_joystick_size.null?
        @@mb_get_joystick_size = Bridge.get_method_bind("VirtualJoystick", "get_joystick_size", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_joystick_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tip_size : Void* = Pointer(Void).null
    def set_tip_size(size : Float64) : Void
      if @@mb_set_tip_size.null?
        @@mb_set_tip_size = Bridge.get_method_bind("VirtualJoystick", "set_tip_size", 373806689_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tip_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tip_size : Void* = Pointer(Void).null
    def get_tip_size() : Float64
      if @@mb_get_tip_size.null?
        @@mb_get_tip_size = Bridge.get_method_bind("VirtualJoystick", "get_tip_size", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_tip_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_deadzone_ratio : Void* = Pointer(Void).null
    def set_deadzone_ratio(ratio : Float64) : Void
      if @@mb_set_deadzone_ratio.null?
        @@mb_set_deadzone_ratio = Bridge.get_method_bind("VirtualJoystick", "set_deadzone_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_deadzone_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_deadzone_ratio : Void* = Pointer(Void).null
    def get_deadzone_ratio() : Float64
      if @@mb_get_deadzone_ratio.null?
        @@mb_get_deadzone_ratio = Bridge.get_method_bind("VirtualJoystick", "get_deadzone_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_deadzone_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_clampzone_ratio : Void* = Pointer(Void).null
    def set_clampzone_ratio(ratio : Float64) : Void
      if @@mb_set_clampzone_ratio.null?
        @@mb_set_clampzone_ratio = Bridge.get_method_bind("VirtualJoystick", "set_clampzone_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_clampzone_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_clampzone_ratio : Void* = Pointer(Void).null
    def get_clampzone_ratio() : Float64
      if @@mb_get_clampzone_ratio.null?
        @@mb_get_clampzone_ratio = Bridge.get_method_bind("VirtualJoystick", "get_clampzone_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_clampzone_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_initial_offset_ratio : Void* = Pointer(Void).null
    def set_initial_offset_ratio(ratio : Vector2) : Void
      if @@mb_set_initial_offset_ratio.null?
        @@mb_set_initial_offset_ratio = Bridge.get_method_bind("VirtualJoystick", "set_initial_offset_ratio", 743155724_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_initial_offset_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_initial_offset_ratio : Void* = Pointer(Void).null
    def get_initial_offset_ratio() : Vector2
      if @@mb_get_initial_offset_ratio.null?
        @@mb_get_initial_offset_ratio = Bridge.get_method_bind("VirtualJoystick", "get_initial_offset_ratio", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_initial_offset_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_action_left : Void* = Pointer(Void).null
    def set_action_left(action : String) : Void
      if @@mb_set_action_left.null?
        @@mb_set_action_left = Bridge.get_method_bind("VirtualJoystick", "set_action_left", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(action)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_action_left, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_action_left : Void* = Pointer(Void).null
    def get_action_left() : String
      if @@mb_get_action_left.null?
        @@mb_get_action_left = Bridge.get_method_bind("VirtualJoystick", "get_action_left", 2002593661_i64)
      end
      ""
    end
    @@mb_set_action_right : Void* = Pointer(Void).null
    def set_action_right(action : String) : Void
      if @@mb_set_action_right.null?
        @@mb_set_action_right = Bridge.get_method_bind("VirtualJoystick", "set_action_right", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(action)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_action_right, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_action_right : Void* = Pointer(Void).null
    def get_action_right() : String
      if @@mb_get_action_right.null?
        @@mb_get_action_right = Bridge.get_method_bind("VirtualJoystick", "get_action_right", 2002593661_i64)
      end
      ""
    end
    @@mb_set_action_up : Void* = Pointer(Void).null
    def set_action_up(action : String) : Void
      if @@mb_set_action_up.null?
        @@mb_set_action_up = Bridge.get_method_bind("VirtualJoystick", "set_action_up", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(action)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_action_up, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_action_up : Void* = Pointer(Void).null
    def get_action_up() : String
      if @@mb_get_action_up.null?
        @@mb_get_action_up = Bridge.get_method_bind("VirtualJoystick", "get_action_up", 2002593661_i64)
      end
      ""
    end
    @@mb_set_action_down : Void* = Pointer(Void).null
    def set_action_down(action : String) : Void
      if @@mb_set_action_down.null?
        @@mb_set_action_down = Bridge.get_method_bind("VirtualJoystick", "set_action_down", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(action)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_action_down, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_action_down : Void* = Pointer(Void).null
    def get_action_down() : String
      if @@mb_get_action_down.null?
        @@mb_get_action_down = Bridge.get_method_bind("VirtualJoystick", "get_action_down", 2002593661_i64)
      end
      ""
    end
    @@mb_set_visibility_mode : Void* = Pointer(Void).null
    def set_visibility_mode(mode : Int64) : Void
      if @@mb_set_visibility_mode.null?
        @@mb_set_visibility_mode = Bridge.get_method_bind("VirtualJoystick", "set_visibility_mode", 2638298545_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_visibility_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_visibility_mode : Void* = Pointer(Void).null
    def get_visibility_mode() : Int64
      if @@mb_get_visibility_mode.null?
        @@mb_get_visibility_mode = Bridge.get_method_bind("VirtualJoystick", "get_visibility_mode", 3530872950_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visibility_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A rectangular region of 2D space that detects whether it is visible on screen.
  #
  # `VisibleOnScreenNotifier2D` represents a rectangular region of 2D space. When any part of this region becomes visible on screen or in a viewport, it will emit a `screen_entered` signal, and likewise it will emit a `screen_exited` signal when no part of it remains visible.
  # If you want a node to be enabled automatically when this region is visible on screen, use `VisibleOnScreenEnabler2D`.
  # **Note:** `VisibleOnScreenNotifier2D` uses the render culling code to determine whether it's visible on screen, so it won't function unless `CanvasItem.visible` is set to `true`.
  class VisibleOnScreenNotifier2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_rect : Void* = Pointer(Void).null
    def set_rect(rect : Rect2) : Void
      if @@mb_set_rect.null?
        @@mb_set_rect = Bridge.get_method_bind("VisibleOnScreenNotifier2D", "set_rect", 2046264180_i64)
      end
      val_0 = rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_rect : Void* = Pointer(Void).null
    def get_rect() : Rect2
      if @@mb_get_rect.null?
        @@mb_get_rect = Bridge.get_method_bind("VisibleOnScreenNotifier2D", "get_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_set_show_rect : Void* = Pointer(Void).null
    def set_show_rect(show_rect : Bool) : Void
      if @@mb_set_show_rect.null?
        @@mb_set_show_rect = Bridge.get_method_bind("VisibleOnScreenNotifier2D", "set_show_rect", 2586408642_i64)
      end
      val_0 = show_rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_showing_rect : Void* = Pointer(Void).null
    def is_showing_rect() : Bool
      if @@mb_is_showing_rect.null?
        @@mb_is_showing_rect = Bridge.get_method_bind("VisibleOnScreenNotifier2D", "is_showing_rect", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_showing_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_on_screen : Void* = Pointer(Void).null
    # If `true`, the bounding rectangle is on the screen.
    # **Note:** It takes one frame for the `VisibleOnScreenNotifier2D`'s visibility to be determined once added to the scene tree, so this method will always return `false` right after it is instantiated, before the draw pass.
    def is_on_screen() : Bool
      if @@mb_is_on_screen.null?
        @@mb_is_on_screen = Bridge.get_method_bind("VisibleOnScreenNotifier2D", "is_on_screen", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_on_screen, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # A rectangular region of 2D space that, when visible on screen, enables a target node.
  #
  # `VisibleOnScreenEnabler2D` contains a rectangular region of 2D space and a target node. The target node will be automatically enabled (via its `Node.process_mode` property) when any part of this region becomes visible on the screen, and automatically disabled otherwise. This can for example be used to activate enemies only when the player approaches them.
  # See `VisibleOnScreenNotifier2D` if you only want to be notified when the region is visible on screen.
  # **Note:** `VisibleOnScreenEnabler2D` uses the render culling code to determine whether it's visible on screen, so it won't function unless `CanvasItem.visible` is set to `true`.
  class VisibleOnScreenEnabler2D < Godot::VisibleOnScreenNotifier2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum EnableMode : Int64
      EnableModeInherit = 0_i64
      EnableModeAlways = 1_i64
      EnableModeWhenPaused = 2_i64
    end
    @@mb_set_enable_mode : Void* = Pointer(Void).null
    def set_enable_mode(mode : Int64) : Void
      if @@mb_set_enable_mode.null?
        @@mb_set_enable_mode = Bridge.get_method_bind("VisibleOnScreenEnabler2D", "set_enable_mode", 2961788752_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enable_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enable_mode : Void* = Pointer(Void).null
    def get_enable_mode() : Int64
      if @@mb_get_enable_mode.null?
        @@mb_get_enable_mode = Bridge.get_method_bind("VisibleOnScreenEnabler2D", "get_enable_mode", 2650445576_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_enable_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_enable_node_path : Void* = Pointer(Void).null
    def set_enable_node_path(path : NodePath) : Void
      if @@mb_set_enable_node_path.null?
        @@mb_set_enable_node_path = Bridge.get_method_bind("VisibleOnScreenEnabler2D", "set_enable_node_path", 1348162250_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enable_node_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enable_node_path : Void* = Pointer(Void).null
    def get_enable_node_path() : NodePath
      if @@mb_get_enable_node_path.null?
        @@mb_get_enable_node_path = Bridge.get_method_bind("VisibleOnScreenEnabler2D", "get_enable_node_path", 277076166_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_enable_node_path, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
  end
  # A box-shaped region of 3D space that detects whether it is visible on screen.
  #
  # `VisibleOnScreenNotifier3D` represents a box-shaped region of 3D space. When any part of this region becomes visible on screen or in a `Camera3D`'s view, it will emit a `screen_entered` signal, and likewise it will emit a `screen_exited` signal when no part of it remains visible.
  # If you want a node to be enabled automatically when this region is visible on screen, use `VisibleOnScreenEnabler3D`.
  # **Note:** `VisibleOnScreenNotifier3D` uses an approximate heuristic that doesn't take walls and other occlusion into account, unless occlusion culling is used. It also won't function unless `Node3D.visible` is set to `true`.
  class VisibleOnScreenNotifier3D < Godot::VisualInstance3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_aabb : Void* = Pointer(Void).null
    def set_aabb(rect : AABB) : Void
      if @@mb_set_aabb.null?
        @@mb_set_aabb = Bridge.get_method_bind("VisibleOnScreenNotifier3D", "set_aabb", 259215842_i64)
      end
      val_0 = rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_aabb, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_on_screen : Void* = Pointer(Void).null
    # Returns `true` if the bounding box is on the screen.
    # **Note:** It takes one frame for the `VisibleOnScreenNotifier3D`'s visibility to be assessed once added to the scene tree, so this method will always return `false` right after it is instantiated.
    def is_on_screen() : Bool
      if @@mb_is_on_screen.null?
        @@mb_is_on_screen = Bridge.get_method_bind("VisibleOnScreenNotifier3D", "is_on_screen", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_on_screen, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # A box-shaped region of 3D space that, when visible on screen, enables a target node.
  #
  # `VisibleOnScreenEnabler3D` contains a box-shaped region of 3D space and a target node. The target node will be automatically enabled (via its `Node.process_mode` property) when any part of this region becomes visible on the screen, and automatically disabled otherwise. This can for example be used to activate enemies only when the player approaches them.
  # See `VisibleOnScreenNotifier3D` if you only want to be notified when the region is visible on screen.
  # **Note:** `VisibleOnScreenEnabler3D` uses an approximate heuristic that doesn't take walls and other occlusion into account, unless occlusion culling is used. It also won't function unless `Node3D.visible` is set to `true`.
  class VisibleOnScreenEnabler3D < Godot::VisibleOnScreenNotifier3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum EnableMode : Int64
      EnableModeInherit = 0_i64
      EnableModeAlways = 1_i64
      EnableModeWhenPaused = 2_i64
    end
    @@mb_set_enable_mode : Void* = Pointer(Void).null
    def set_enable_mode(mode : Int64) : Void
      if @@mb_set_enable_mode.null?
        @@mb_set_enable_mode = Bridge.get_method_bind("VisibleOnScreenEnabler3D", "set_enable_mode", 320303646_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enable_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enable_mode : Void* = Pointer(Void).null
    def get_enable_mode() : Int64
      if @@mb_get_enable_mode.null?
        @@mb_get_enable_mode = Bridge.get_method_bind("VisibleOnScreenEnabler3D", "get_enable_mode", 3352990031_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_enable_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_enable_node_path : Void* = Pointer(Void).null
    def set_enable_node_path(path : NodePath) : Void
      if @@mb_set_enable_node_path.null?
        @@mb_set_enable_node_path = Bridge.get_method_bind("VisibleOnScreenEnabler3D", "set_enable_node_path", 1348162250_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enable_node_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enable_node_path : Void* = Pointer(Void).null
    def get_enable_node_path() : NodePath
      if @@mb_get_enable_node_path.null?
        @@mb_get_enable_node_path = Bridge.get_method_bind("VisibleOnScreenEnabler3D", "get_enable_node_path", 277076166_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_enable_node_path, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
  end
  # A custom shader program with a visual editor.
  #
  # This class provides a graph-like visual editor for creating a `Shader`. Although `VisualShader`s do not require coding, they share the same logic with script shaders. They use `VisualShaderNode`s that can be connected to each other to control the flow of the shader. The visual shader graph is converted to a script shader behind the scenes.
  class VisualShader < Godot::Shader
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Type : Int64
      TypeVertex = 0_i64
      TypeFragment = 1_i64
      TypeLight = 2_i64
      TypeStart = 3_i64
      TypeProcess = 4_i64
      TypeCollide = 5_i64
      TypeStartCustom = 6_i64
      TypeProcessCustom = 7_i64
      TypeSky = 8_i64
      TypeFog = 9_i64
      TypeTextureBlit = 10_i64
      TypeMax = 11_i64
    end
    enum VaryingMode : Int64
      VaryingModeVertexToFragLight = 0_i64
      VaryingModeFragToLight = 1_i64
      VaryingModeMax = 2_i64
    end
    enum VaryingType : Int64
      VaryingTypeFloat = 0_i64
      VaryingTypeInt = 1_i64
      VaryingTypeUint = 2_i64
      VaryingTypeVector2d = 3_i64
      VaryingTypeVector3d = 4_i64
      VaryingTypeVector4d = 5_i64
      VaryingTypeBoolean = 6_i64
      VaryingTypeTransform = 7_i64
      VaryingTypeMax = 8_i64
    end
    @@mb_set_mode : Void* = Pointer(Void).null
    # Sets the mode of this shader.
    def set_mode(mode : Int64) : Void
      if @@mb_set_mode.null?
        @@mb_set_mode = Bridge.get_method_bind("VisualShader", "set_mode", 3978014962_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_node : Void* = Pointer(Void).null
    # Adds the specified `node` to the shader.
    def add_node(get_type : Int64, node : VisualShaderNode, position : Vector2, id : Int64) : Void
      if @@mb_add_node.null?
        @@mb_add_node = Bridge.get_method_bind("VisualShader", "add_node", 1560769431_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = node ? node.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      val_2 = position
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = id
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_add_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_node : Void* = Pointer(Void).null
    # Returns the shader node instance with specified `type` and `id`.
    def get_node(get_type : Int64, id : Int64) : VisualShaderNode
      if @@mb_get_node.null?
        @@mb_get_node = Bridge.get_method_bind("VisualShader", "get_node", 3784670312_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      VisualShaderNode.new(ret_ptr)
    end
    @@mb_set_node_position : Void* = Pointer(Void).null
    # Sets the position of the specified node.
    def set_node_position(get_type : Int64, id : Int64, position : Vector2) : Void
      if @@mb_set_node_position.null?
        @@mb_set_node_position = Bridge.get_method_bind("VisualShader", "set_node_position", 2726660721_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = position
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_node_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_node_position : Void* = Pointer(Void).null
    # Returns the position of the specified node within the shader graph.
    def get_node_position(get_type : Int64, id : Int64) : Vector2
      if @@mb_get_node_position.null?
        @@mb_get_node_position = Bridge.get_method_bind("VisualShader", "get_node_position", 2175036082_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_node_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_node_list : Void* = Pointer(Void).null
    # Returns the list of all nodes in the shader with the specified type.
    def get_node_list(get_type : Int64) : Void*
      if @@mb_get_node_list.null?
        @@mb_get_node_list = Bridge.get_method_bind("VisualShader", "get_node_list", 2370592410_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node_list, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_valid_node_id : Void* = Pointer(Void).null
    # Returns next valid node ID that can be added to the shader graph.
    def get_valid_node_id(get_type : Int64) : Int64
      if @@mb_get_valid_node_id.null?
        @@mb_get_valid_node_id = Bridge.get_method_bind("VisualShader", "get_valid_node_id", 629467342_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_valid_node_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_node : Void* = Pointer(Void).null
    # Removes the specified node from the shader.
    def remove_node(get_type : Int64, id : Int64) : Void
      if @@mb_remove_node.null?
        @@mb_remove_node = Bridge.get_method_bind("VisualShader", "remove_node", 844050912_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_remove_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_replace_node : Void* = Pointer(Void).null
    # Replaces the specified node with a node of new class type.
    def replace_node(get_type : Int64, id : Int64, new_class : String) : Void
      if @@mb_replace_node.null?
        @@mb_replace_node = Bridge.get_method_bind("VisualShader", "replace_node", 3144735253_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      sn_2 = Bridge.make_string_name(new_class)
      arg_2 = sn_2
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_replace_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_2)
    end
    @@mb_is_node_connection : Void* = Pointer(Void).null
    # Returns `true` if the specified node and port connection exists.
    def is_node_connection(get_type : Int64, from_node : Int64, from_port : Int64, to_node : Int64, to_port : Int64) : Bool
      if @@mb_is_node_connection.null?
        @@mb_is_node_connection = Bridge.get_method_bind("VisualShader", "is_node_connection", 3922381898_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_node
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = from_port
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_node
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = to_port
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_node_connection, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_can_connect_nodes : Void* = Pointer(Void).null
    # Returns `true` if the specified nodes and ports can be connected together.
    def can_connect_nodes(get_type : Int64, from_node : Int64, from_port : Int64, to_node : Int64, to_port : Int64) : Bool
      if @@mb_can_connect_nodes.null?
        @@mb_can_connect_nodes = Bridge.get_method_bind("VisualShader", "can_connect_nodes", 3922381898_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_node
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = from_port
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_node
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = to_port
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_u8
      Bridge.ptrcall(@@mb_can_connect_nodes, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_connect_nodes : Void* = Pointer(Void).null
    # Connects the specified nodes and ports.
    def connect_nodes(get_type : Int64, from_node : Int64, from_port : Int64, to_node : Int64, to_port : Int64) : Int64
      if @@mb_connect_nodes.null?
        @@mb_connect_nodes = Bridge.get_method_bind("VisualShader", "connect_nodes", 3081049573_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_node
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = from_port
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_node
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = to_port
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_i64
      Bridge.ptrcall(@@mb_connect_nodes, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_disconnect_nodes : Void* = Pointer(Void).null
    # Connects the specified nodes and ports.
    def disconnect_nodes(get_type : Int64, from_node : Int64, from_port : Int64, to_node : Int64, to_port : Int64) : Void
      if @@mb_disconnect_nodes.null?
        @@mb_disconnect_nodes = Bridge.get_method_bind("VisualShader", "disconnect_nodes", 2268060358_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_node
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = from_port
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_node
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = to_port
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_disconnect_nodes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_connect_nodes_forced : Void* = Pointer(Void).null
    # Connects the specified nodes and ports, even if they can't be connected. Such connection is invalid and will not function properly.
    def connect_nodes_forced(get_type : Int64, from_node : Int64, from_port : Int64, to_node : Int64, to_port : Int64) : Void
      if @@mb_connect_nodes_forced.null?
        @@mb_connect_nodes_forced = Bridge.get_method_bind("VisualShader", "connect_nodes_forced", 2268060358_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_node
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = from_port
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_node
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = to_port
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_connect_nodes_forced, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_node_connections : Void* = Pointer(Void).null
    # Returns the list of connected nodes with the specified type.
    def get_node_connections(get_type : Int64) : Godot::Array
      if @@mb_get_node_connections.null?
        @@mb_get_node_connections = Bridge.get_method_bind("VisualShader", "get_node_connections", 1441964831_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node_connections, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_attach_node_to_frame : Void* = Pointer(Void).null
    # Attaches the given node to the given frame.
    def attach_node_to_frame(get_type : Int64, id : Int64, frame : Int64) : Void
      if @@mb_attach_node_to_frame.null?
        @@mb_attach_node_to_frame = Bridge.get_method_bind("VisualShader", "attach_node_to_frame", 2479945279_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = frame
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_attach_node_to_frame, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_detach_node_from_frame : Void* = Pointer(Void).null
    # Detaches the given node from the frame it is attached to.
    def detach_node_from_frame(get_type : Int64, id : Int64) : Void
      if @@mb_detach_node_from_frame.null?
        @@mb_detach_node_from_frame = Bridge.get_method_bind("VisualShader", "detach_node_from_frame", 844050912_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_detach_node_from_frame, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_varying : Void* = Pointer(Void).null
    # Adds a new varying value node to the shader.
    def add_varying(name : String, mode : Int64, get_type : Int64) : Void
      if @@mb_add_varying.null?
        @@mb_add_varying = Bridge.get_method_bind("VisualShader", "add_varying", 2084110726_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = get_type
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_add_varying, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_remove_varying : Void* = Pointer(Void).null
    # Removes a varying value node with the given `name`. Prints an error if a node with this name is not found.
    def remove_varying(name : String) : Void
      if @@mb_remove_varying.null?
        @@mb_remove_varying = Bridge.get_method_bind("VisualShader", "remove_varying", 83702148_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_varying, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_has_varying : Void* = Pointer(Void).null
    # Returns `true` if the shader has a varying with the given `name`.
    def has_varying(name : String) : Bool
      if @@mb_has_varying.null?
        @@mb_has_varying = Bridge.get_method_bind("VisualShader", "has_varying", 3927539163_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_varying, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_set_graph_offset : Void* = Pointer(Void).null
    def set_graph_offset(offset : Vector2) : Void
      if @@mb_set_graph_offset.null?
        @@mb_set_graph_offset = Bridge.get_method_bind("VisualShader", "set_graph_offset", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_graph_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_graph_offset : Void* = Pointer(Void).null
    def get_graph_offset() : Vector2
      if @@mb_get_graph_offset.null?
        @@mb_get_graph_offset = Bridge.get_method_bind("VisualShader", "get_graph_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_graph_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A reusable group of `VisualShaderNode`s similar to a function in programming.
  #
  # A `VisualShaderGroup` encapsulates a graph of `VisualShaderNode`s into a reusable component. It defines its own input and output ports, which become the interface when the group is used as a `VisualShaderNodeGroup` node inside a `VisualShader` or another `VisualShaderGroup`.
  # Since an actual shader function is created for each `VisualShaderGroup`, you can only use global built-in variables. Parameter and Varying related nodes are not allowed.
  # If the group contains nodes that are incompatible with the shader context it is used in (e.g. particle nodes in a spatial shader), the group's outputs will silently fall back to default values.
  class VisualShaderGroup < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_group_name : Void* = Pointer(Void).null
    def set_group_name(name : String) : Void
      if @@mb_set_group_name.null?
        @@mb_set_group_name = Bridge.get_method_bind("VisualShaderGroup", "set_group_name", 83702148_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_group_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_group_name : Void* = Pointer(Void).null
    def get_group_name() : String
      if @@mb_get_group_name.null?
        @@mb_get_group_name = Bridge.get_method_bind("VisualShaderGroup", "get_group_name", 201670096_i64)
      end
      ""
    end
    @@mb_insert_input_port : Void* = Pointer(Void).null
    # Inserts an input port at the given `id` with the specified `type` and `name`.
    # Returns the validated port name, which may differ from `name` if a port with the same name already exists. Port names must be unique across both input and output ports.
    def insert_input_port(id : Int64, get_type : Int64, name : String) : String
      if @@mb_insert_input_port.null?
        @@mb_insert_input_port = Bridge.get_method_bind("VisualShaderGroup", "insert_input_port", 3880595796_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      str_2 = Bridge.make_string(name)
      arg_2 = str_2
      args = [arg_0, arg_1, arg_2]
      ""
    ensure
      Bridge.free_string(str_2)
    end
    @@mb_remove_input_port : Void* = Pointer(Void).null
    # Removes the input port at the given `id`.
    def remove_input_port(id : Int64) : Void
      if @@mb_remove_input_port.null?
        @@mb_remove_input_port = Bridge.get_method_bind("VisualShaderGroup", "remove_input_port", 1286410249_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_input_port, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_move_input_port : Void* = Pointer(Void).null
    # Moves the input port at index `from` to index `to`. Connections from input nodes inside the group will be updated accordingly.
    def move_input_port(from : Int64, to : Int64) : Void
      if @@mb_move_input_port.null?
        @@mb_move_input_port = Bridge.get_method_bind("VisualShaderGroup", "move_input_port", 3937882851_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_move_input_port, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_input_port_name : Void* = Pointer(Void).null
    # Sets the name of the input port at the given `id`.
    def set_input_port_name(id : Int64, name : String) : Void
      if @@mb_set_input_port_name.null?
        @@mb_set_input_port_name = Bridge.get_method_bind("VisualShaderGroup", "set_input_port_name", 501894301_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      str_1 = Bridge.make_string(name)
      arg_1 = str_1
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_input_port_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_1)
    end
    @@mb_set_input_port_type : Void* = Pointer(Void).null
    # Sets the type of the input port at the given `id`.
    def set_input_port_type(id : Int64, get_type : Int64) : Void
      if @@mb_set_input_port_type.null?
        @@mb_set_input_port_type = Bridge.get_method_bind("VisualShaderGroup", "set_input_port_type", 1959648900_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_input_port_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_input_port_count : Void* = Pointer(Void).null
    def set_input_port_count(count : Int64) : Void
      if @@mb_set_input_port_count.null?
        @@mb_set_input_port_count = Bridge.get_method_bind("VisualShaderGroup", "set_input_port_count", 1286410249_i64)
      end
      val_0 = count
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_input_port_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_input_port_count : Void* = Pointer(Void).null
    def get_input_port_count() : Int64
      if @@mb_get_input_port_count.null?
        @@mb_get_input_port_count = Bridge.get_method_bind("VisualShaderGroup", "get_input_port_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_input_port_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_input_port_name : Void* = Pointer(Void).null
    # Returns the name of the input port at the given `id`.
    def get_input_port_name(id : Int64) : String
      if @@mb_get_input_port_name.null?
        @@mb_get_input_port_name = Bridge.get_method_bind("VisualShaderGroup", "get_input_port_name", 844755477_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_input_port_type : Void* = Pointer(Void).null
    # Returns the type of the input port at the given `id`.
    def get_input_port_type(id : Int64) : Int64
      if @@mb_get_input_port_type.null?
        @@mb_get_input_port_type = Bridge.get_method_bind("VisualShaderGroup", "get_input_port_type", 4102573379_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_input_port_type, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_insert_output_port : Void* = Pointer(Void).null
    # Inserts an output port at the given `id` with the specified `type` and `name`.
    # Returns the validated port name, which may differ from `name` if a port with the same name already exists. Port names must be unique across both input and output ports.
    def insert_output_port(id : Int64, get_type : Int64, name : String) : String
      if @@mb_insert_output_port.null?
        @@mb_insert_output_port = Bridge.get_method_bind("VisualShaderGroup", "insert_output_port", 3880595796_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      str_2 = Bridge.make_string(name)
      arg_2 = str_2
      args = [arg_0, arg_1, arg_2]
      ""
    ensure
      Bridge.free_string(str_2)
    end
    @@mb_remove_output_port : Void* = Pointer(Void).null
    # Removes the output port at the given `id`.
    def remove_output_port(id : Int64) : Void
      if @@mb_remove_output_port.null?
        @@mb_remove_output_port = Bridge.get_method_bind("VisualShaderGroup", "remove_output_port", 1286410249_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_output_port, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_move_output_port : Void* = Pointer(Void).null
    # Moves the output port at index `from` to index `to`. Connections to output nodes inside the group will be updated accordingly.
    def move_output_port(from : Int64, to : Int64) : Void
      if @@mb_move_output_port.null?
        @@mb_move_output_port = Bridge.get_method_bind("VisualShaderGroup", "move_output_port", 3937882851_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_move_output_port, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_output_port_name : Void* = Pointer(Void).null
    # Sets the name of the output port at the given `id`.
    def set_output_port_name(id : Int64, name : String) : Void
      if @@mb_set_output_port_name.null?
        @@mb_set_output_port_name = Bridge.get_method_bind("VisualShaderGroup", "set_output_port_name", 501894301_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      str_1 = Bridge.make_string(name)
      arg_1 = str_1
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_output_port_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_1)
    end
    @@mb_set_output_port_type : Void* = Pointer(Void).null
    # Sets the type of the output port at the given `id`.
    def set_output_port_type(id : Int64, get_type : Int64) : Void
      if @@mb_set_output_port_type.null?
        @@mb_set_output_port_type = Bridge.get_method_bind("VisualShaderGroup", "set_output_port_type", 1959648900_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_output_port_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_output_port_count : Void* = Pointer(Void).null
    def set_output_port_count(count : Int64) : Void
      if @@mb_set_output_port_count.null?
        @@mb_set_output_port_count = Bridge.get_method_bind("VisualShaderGroup", "set_output_port_count", 1286410249_i64)
      end
      val_0 = count
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_output_port_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_output_port_count : Void* = Pointer(Void).null
    def get_output_port_count() : Int64
      if @@mb_get_output_port_count.null?
        @@mb_get_output_port_count = Bridge.get_method_bind("VisualShaderGroup", "get_output_port_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_output_port_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_output_port_name : Void* = Pointer(Void).null
    # Returns the name of the output port at the given `id`.
    def get_output_port_name(id : Int64) : String
      if @@mb_get_output_port_name.null?
        @@mb_get_output_port_name = Bridge.get_method_bind("VisualShaderGroup", "get_output_port_name", 844755477_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_output_port_type : Void* = Pointer(Void).null
    # Returns the type of the output port at the given `id`.
    def get_output_port_type(id : Int64) : Int64
      if @@mb_get_output_port_type.null?
        @@mb_get_output_port_type = Bridge.get_method_bind("VisualShaderGroup", "get_output_port_type", 4102573379_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_output_port_type, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_node : Void* = Pointer(Void).null
    # Adds the specified `node` to the group.
    def add_node(node : VisualShaderNode, position : Vector2, id : Int64) : Void
      if @@mb_add_node.null?
        @@mb_add_node = Bridge.get_method_bind("VisualShaderGroup", "add_node", 3625527446_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = id
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_add_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_node : Void* = Pointer(Void).null
    # Returns the shader node instance with the specified `id`.
    def get_node(id : Int64) : VisualShaderNode
      if @@mb_get_node.null?
        @@mb_get_node = Bridge.get_method_bind("VisualShaderGroup", "get_node", 1177927464_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      VisualShaderNode.new(ret_ptr)
    end
    @@mb_set_node_position : Void* = Pointer(Void).null
    # Sets the position of the specified node.
    def set_node_position(id : Int64, position : Vector2) : Void
      if @@mb_set_node_position.null?
        @@mb_set_node_position = Bridge.get_method_bind("VisualShaderGroup", "set_node_position", 163021252_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_node_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_node_position : Void* = Pointer(Void).null
    # Returns the position of the specified node within the shader graph.
    def get_node_position(id : Int64) : Vector2
      if @@mb_get_node_position.null?
        @@mb_get_node_position = Bridge.get_method_bind("VisualShaderGroup", "get_node_position", 2299179447_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_node_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_node_list : Void* = Pointer(Void).null
    # Returns the list of all nodes in the group.
    def get_node_list() : Void*
      if @@mb_get_node_list.null?
        @@mb_get_node_list = Bridge.get_method_bind("VisualShaderGroup", "get_node_list", 1930428628_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node_list, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_valid_node_id : Void* = Pointer(Void).null
    # Returns the next valid node ID that can be added to the shader graph.
    def get_valid_node_id() : Int64
      if @@mb_get_valid_node_id.null?
        @@mb_get_valid_node_id = Bridge.get_method_bind("VisualShaderGroup", "get_valid_node_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_valid_node_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_node : Void* = Pointer(Void).null
    # Removes the specified node from the group.
    def remove_node(id : Int64) : Void
      if @@mb_remove_node.null?
        @@mb_remove_node = Bridge.get_method_bind("VisualShaderGroup", "remove_node", 1286410249_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_replace_node : Void* = Pointer(Void).null
    # Replaces the specified node with a node of the new class type.
    def replace_node(id : Int64, new_class : String) : Void
      if @@mb_replace_node.null?
        @@mb_replace_node = Bridge.get_method_bind("VisualShaderGroup", "replace_node", 3780747571_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      sn_1 = Bridge.make_string_name(new_class)
      arg_1 = sn_1
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_replace_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_1)
    end
    @@mb_is_node_connection : Void* = Pointer(Void).null
    # Returns `true` if the specified node and port connection exists.
    def is_node_connection(from_node : Int64, from_port : Int64, to_node : Int64, to_port : Int64) : Bool
      if @@mb_is_node_connection.null?
        @@mb_is_node_connection = Bridge.get_method_bind("VisualShaderGroup", "is_node_connection", 1701679529_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_port
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_node
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_port
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_node_connection, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_can_connect_nodes : Void* = Pointer(Void).null
    # Returns `true` if the specified nodes and ports can be connected.
    def can_connect_nodes(from_node : Int64, from_port : Int64, to_node : Int64, to_port : Int64) : Bool
      if @@mb_can_connect_nodes.null?
        @@mb_can_connect_nodes = Bridge.get_method_bind("VisualShaderGroup", "can_connect_nodes", 1701679529_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_port
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_node
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_port
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_u8
      Bridge.ptrcall(@@mb_can_connect_nodes, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_connect_nodes : Void* = Pointer(Void).null
    # Connects the specified nodes and ports.
    def connect_nodes(from_node : Int64, from_port : Int64, to_node : Int64, to_port : Int64) : Int64
      if @@mb_connect_nodes.null?
        @@mb_connect_nodes = Bridge.get_method_bind("VisualShaderGroup", "connect_nodes", 3684568301_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_port
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_node
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_port
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_i64
      Bridge.ptrcall(@@mb_connect_nodes, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_disconnect_nodes : Void* = Pointer(Void).null
    # Disconnects the specified nodes and ports.
    def disconnect_nodes(from_node : Int64, from_port : Int64, to_node : Int64, to_port : Int64) : Void
      if @@mb_disconnect_nodes.null?
        @@mb_disconnect_nodes = Bridge.get_method_bind("VisualShaderGroup", "disconnect_nodes", 4275841770_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_port
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_node
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_port
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_disconnect_nodes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_connect_nodes_forced : Void* = Pointer(Void).null
    # Connects the specified nodes and ports, even if they can't be connected.
    def connect_nodes_forced(from_node : Int64, from_port : Int64, to_node : Int64, to_port : Int64) : Void
      if @@mb_connect_nodes_forced.null?
        @@mb_connect_nodes_forced = Bridge.get_method_bind("VisualShaderGroup", "connect_nodes_forced", 4275841770_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_port
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_node
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_port
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_connect_nodes_forced, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_node_connections : Void* = Pointer(Void).null
    # Returns the list of connected nodes.
    def get_node_connections() : Godot::Array
      if @@mb_get_node_connections.null?
        @@mb_get_node_connections = Bridge.get_method_bind("VisualShaderGroup", "get_node_connections", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node_connections, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_attach_node_to_frame : Void* = Pointer(Void).null
    # Attaches the given node to the given frame.
    def attach_node_to_frame(id : Int64, frame : Int64) : Void
      if @@mb_attach_node_to_frame.null?
        @@mb_attach_node_to_frame = Bridge.get_method_bind("VisualShaderGroup", "attach_node_to_frame", 3937882851_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = frame
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_attach_node_to_frame, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_detach_node_from_frame : Void* = Pointer(Void).null
    # Detaches the given node from the frame it is attached to.
    def detach_node_from_frame(id : Int64) : Void
      if @@mb_detach_node_from_frame.null?
        @@mb_detach_node_from_frame = Bridge.get_method_bind("VisualShaderGroup", "detach_node_from_frame", 1286410249_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_detach_node_from_frame, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  # Base class for `VisualShader` nodes. Not related to scene nodes.
  #
  # A visual shader graph consists of various nodes. Each node in a graph is an individual resource, represented as a rectangular box containing a title and several related properties. Each node can also be connected to other nodes through their connection ports in order to control the shader's flow.
  class VisualShaderNode < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum PortType : Int64
      PortTypeScalar = 0_i64
      PortTypeScalarInt = 1_i64
      PortTypeScalarUint = 2_i64
      PortTypeVector2d = 3_i64
      PortTypeVector3d = 4_i64
      PortTypeVector4d = 5_i64
      PortTypeBoolean = 6_i64
      PortTypeTransform = 7_i64
      PortTypeSampler = 8_i64
      PortTypeMax = 9_i64
    end
    @@mb_get_default_input_port : Void* = Pointer(Void).null
    # Returns the input port which should be connected by default when this node is created as a result of dragging a connection from an existing node to the empty space on the graph.
    def get_default_input_port(get_type : Int64) : Int64
      if @@mb_get_default_input_port.null?
        @@mb_get_default_input_port = Bridge.get_method_bind("VisualShaderNode", "get_default_input_port", 1894493699_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_default_input_port, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_output_port_for_preview : Void* = Pointer(Void).null
    def set_output_port_for_preview(port : Int64) : Void
      if @@mb_set_output_port_for_preview.null?
        @@mb_set_output_port_for_preview = Bridge.get_method_bind("VisualShaderNode", "set_output_port_for_preview", 1286410249_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_output_port_for_preview, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_output_port_for_preview : Void* = Pointer(Void).null
    def get_output_port_for_preview() : Int64
      if @@mb_get_output_port_for_preview.null?
        @@mb_get_output_port_for_preview = Bridge.get_method_bind("VisualShaderNode", "get_output_port_for_preview", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_output_port_for_preview, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_input_port_default_value : Void* = Pointer(Void).null
    # Sets the default `value` for the selected input `port`.
    def set_input_port_default_value(port : Int64, value : Void*, prev_value : Void*) : Void
      if @@mb_set_input_port_default_value.null?
        @@mb_set_input_port_default_value = Bridge.get_method_bind("VisualShaderNode", "set_input_port_default_value", 150923387_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = prev_value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_input_port_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_input_port_default_value : Void* = Pointer(Void).null
    # Returns the default value of the input `port`.
    def get_input_port_default_value(port : Int64) : Void*
      if @@mb_get_input_port_default_value.null?
        @@mb_get_input_port_default_value = Bridge.get_method_bind("VisualShaderNode", "get_input_port_default_value", 4227898402_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_var = StaticArray(UInt8, 24).new(0_u8)
      Bridge.ptrcall(@@mb_get_input_port_default_value, @pointer, args.to_unsafe.as(Void**), ret_var.to_unsafe.as(Void*))
      ret_ptr = Pointer(Void).null
      Bridge.type_from_variant(24, pointerof(ret_ptr).as(Void*), ret_var.to_unsafe.as(Void*))
      ret_ptr
    end
    @@mb_remove_input_port_default_value : Void* = Pointer(Void).null
    # Removes the default value of the input `port`.
    def remove_input_port_default_value(port : Int64) : Void
      if @@mb_remove_input_port_default_value.null?
        @@mb_remove_input_port_default_value = Bridge.get_method_bind("VisualShaderNode", "remove_input_port_default_value", 1286410249_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_input_port_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear_default_input_values : Void* = Pointer(Void).null
    # Clears the default input ports value.
    def clear_default_input_values() : Void
      if @@mb_clear_default_input_values.null?
        @@mb_clear_default_input_values = Bridge.get_method_bind("VisualShaderNode", "clear_default_input_values", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_default_input_values, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_default_input_values : Void* = Pointer(Void).null
    # Sets the default input ports values using an `Array` of the form `[index0, value0, index1, value1, ...]`. For example: `[0, Vector3(0, 0, 0), 1, Vector3(0, 0, 0)]`.
    def set_default_input_values(values : Godot::Array) : Void
      if @@mb_set_default_input_values.null?
        @@mb_set_default_input_values = Bridge.get_method_bind("VisualShaderNode", "set_default_input_values", 381264803_i64)
      end
      arg_ptr_0 = values ? values.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_input_values, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_input_values : Void* = Pointer(Void).null
    # Returns an `Array` containing default values for all of the input ports of the node in the form `[index0, value0, index1, value1, ...]`.
    def get_default_input_values() : Godot::Array
      if @@mb_get_default_input_values.null?
        @@mb_get_default_input_values = Bridge.get_method_bind("VisualShaderNode", "get_default_input_values", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_default_input_values, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_frame : Void* = Pointer(Void).null
    def set_frame(frame : Int64) : Void
      if @@mb_set_frame.null?
        @@mb_set_frame = Bridge.get_method_bind("VisualShaderNode", "set_frame", 1286410249_i64)
      end
      val_0 = frame
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_frame, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_frame : Void* = Pointer(Void).null
    def get_frame() : Int64
      if @@mb_get_frame.null?
        @@mb_get_frame = Bridge.get_method_bind("VisualShaderNode", "get_frame", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_frame, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A node that controls how the object faces the camera to be used within the visual shader graph.
  #
  # The output port of this node needs to be connected to `Model View Matrix` port of `VisualShaderNodeOutput`.
  class VisualShaderNodeBillboard < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum BillboardType : Int64
      BillboardTypeDisabled = 0_i64
      BillboardTypeEnabled = 1_i64
      BillboardTypeFixedY = 2_i64
      BillboardTypeParticles = 3_i64
      BillboardTypeMax = 4_i64
    end
    @@mb_set_billboard_type : Void* = Pointer(Void).null
    def set_billboard_type(billboard_type : Int64) : Void
      if @@mb_set_billboard_type.null?
        @@mb_set_billboard_type = Bridge.get_method_bind("VisualShaderNodeBillboard", "set_billboard_type", 1227463289_i64)
      end
      val_0 = billboard_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_billboard_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_billboard_type : Void* = Pointer(Void).null
    def get_billboard_type() : Int64
      if @@mb_get_billboard_type.null?
        @@mb_get_billboard_type = Bridge.get_method_bind("VisualShaderNodeBillboard", "get_billboard_type", 3724188517_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_billboard_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_keep_scale_enabled : Void* = Pointer(Void).null
    def set_keep_scale_enabled(enabled : Bool) : Void
      if @@mb_set_keep_scale_enabled.null?
        @@mb_set_keep_scale_enabled = Bridge.get_method_bind("VisualShaderNodeBillboard", "set_keep_scale_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_keep_scale_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_keep_scale_enabled : Void* = Pointer(Void).null
    def is_keep_scale_enabled() : Bool
      if @@mb_is_keep_scale_enabled.null?
        @@mb_is_keep_scale_enabled = Bridge.get_method_bind("VisualShaderNodeBillboard", "is_keep_scale_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_keep_scale_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # A base type for the constants within the visual shader graph.
  #
  # This is an abstract class. See the derived types for descriptions of the possible values.
  class VisualShaderNodeConstant < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A boolean constant to be used within the visual shader graph.
  #
  # Has only one output port and no inputs.
  # Translated to [code skip-lint]bool[/code] in the shader language.
  class VisualShaderNodeBooleanConstant < Godot::VisualShaderNodeConstant
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_constant : Void* = Pointer(Void).null
    def set_constant(constant : Bool) : Void
      if @@mb_set_constant.null?
        @@mb_set_constant = Bridge.get_method_bind("VisualShaderNodeBooleanConstant", "set_constant", 2586408642_i64)
      end
      val_0 = constant
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant : Void* = Pointer(Void).null
    def get_constant() : Bool
      if @@mb_get_constant.null?
        @@mb_get_constant = Bridge.get_method_bind("VisualShaderNodeBooleanConstant", "get_constant", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_constant, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # A base type for the parameters within the visual shader graph.
  #
  # A parameter represents a variable in the shader which is set externally, i.e. from the `ShaderMaterial`. Parameters are exposed as properties in the `ShaderMaterial` and can be assigned from the Inspector or from a script.
  class VisualShaderNodeParameter < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Qualifier : Int64
      QualNone = 0_i64
      QualGlobal = 1_i64
      QualInstance = 2_i64
      QualInstanceIndex = 3_i64
      QualMax = 4_i64
    end
    @@mb_set_parameter_name : Void* = Pointer(Void).null
    def set_parameter_name(name : String) : Void
      if @@mb_set_parameter_name.null?
        @@mb_set_parameter_name = Bridge.get_method_bind("VisualShaderNodeParameter", "set_parameter_name", 83702148_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_parameter_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_parameter_name : Void* = Pointer(Void).null
    def get_parameter_name() : String
      if @@mb_get_parameter_name.null?
        @@mb_get_parameter_name = Bridge.get_method_bind("VisualShaderNodeParameter", "get_parameter_name", 201670096_i64)
      end
      ""
    end
    @@mb_set_qualifier : Void* = Pointer(Void).null
    def set_qualifier(qualifier : Int64) : Void
      if @@mb_set_qualifier.null?
        @@mb_set_qualifier = Bridge.get_method_bind("VisualShaderNodeParameter", "set_qualifier", 1276489447_i64)
      end
      val_0 = qualifier
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_qualifier, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_qualifier : Void* = Pointer(Void).null
    def get_qualifier() : Int64
      if @@mb_get_qualifier.null?
        @@mb_get_qualifier = Bridge.get_method_bind("VisualShaderNodeParameter", "get_qualifier", 3558406205_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_qualifier, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_instance_index : Void* = Pointer(Void).null
    def set_instance_index(instance_index : Int64) : Void
      if @@mb_set_instance_index.null?
        @@mb_set_instance_index = Bridge.get_method_bind("VisualShaderNodeParameter", "set_instance_index", 1286410249_i64)
      end
      val_0 = instance_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_instance_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_instance_index : Void* = Pointer(Void).null
    def get_instance_index() : Int64
      if @@mb_get_instance_index.null?
        @@mb_get_instance_index = Bridge.get_method_bind("VisualShaderNodeParameter", "get_instance_index", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_instance_index, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A boolean parameter to be used within the visual shader graph.
  #
  # Translated to `uniform bool` in the shader language.
  class VisualShaderNodeBooleanParameter < Godot::VisualShaderNodeParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_default_value_enabled : Void* = Pointer(Void).null
    def set_default_value_enabled(enabled : Bool) : Void
      if @@mb_set_default_value_enabled.null?
        @@mb_set_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeBooleanParameter", "set_default_value_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_default_value_enabled : Void* = Pointer(Void).null
    def is_default_value_enabled() : Bool
      if @@mb_is_default_value_enabled.null?
        @@mb_is_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeBooleanParameter", "is_default_value_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_default_value_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_default_value : Void* = Pointer(Void).null
    def set_default_value(value : Bool) : Void
      if @@mb_set_default_value.null?
        @@mb_set_default_value = Bridge.get_method_bind("VisualShaderNodeBooleanParameter", "set_default_value", 2586408642_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_value : Void* = Pointer(Void).null
    def get_default_value() : Bool
      if @@mb_get_default_value.null?
        @@mb_get_default_value = Bridge.get_method_bind("VisualShaderNodeBooleanParameter", "get_default_value", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_default_value, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # Clamps a value within the visual shader graph.
  #
  # Constrains a value to lie between `min` and `max` values.
  class VisualShaderNodeClamp < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum OpType : Int64
      OpTypeFloat = 0_i64
      OpTypeInt = 1_i64
      OpTypeUint = 2_i64
      OpTypeVector2d = 3_i64
      OpTypeVector3d = 4_i64
      OpTypeVector4d = 5_i64
      OpTypeMax = 6_i64
    end
    @@mb_set_op_type : Void* = Pointer(Void).null
    def set_op_type(op_type : Int64) : Void
      if @@mb_set_op_type.null?
        @@mb_set_op_type = Bridge.get_method_bind("VisualShaderNodeClamp", "set_op_type", 405010749_i64)
      end
      val_0 = op_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_op_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_op_type : Void* = Pointer(Void).null
    def get_op_type() : Int64
      if @@mb_get_op_type.null?
        @@mb_get_op_type = Bridge.get_method_bind("VisualShaderNodeClamp", "get_op_type", 233276050_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_op_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Color` constant to be used within the visual shader graph.
  #
  # Has two output ports representing RGB and alpha channels of `Color`.
  # Translated to `vec3 rgb` and `float alpha` in the shader language.
  class VisualShaderNodeColorConstant < Godot::VisualShaderNodeConstant
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_constant : Void* = Pointer(Void).null
    def set_constant(constant : Color) : Void
      if @@mb_set_constant.null?
        @@mb_set_constant = Bridge.get_method_bind("VisualShaderNodeColorConstant", "set_constant", 2920490490_i64)
      end
      val_0 = constant
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant : Void* = Pointer(Void).null
    def get_constant() : Color
      if @@mb_get_constant.null?
        @@mb_get_constant = Bridge.get_method_bind("VisualShaderNodeColorConstant", "get_constant", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_constant, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Color` function to be used within the visual shader graph.
  #
  # Accept a `Color` to the input port and transform it according to `function`.
  class VisualShaderNodeColorFunc < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Function : Int64
      FuncGrayscale = 0_i64
      FuncHsv2rgb = 1_i64
      FuncRgb2hsv = 2_i64
      FuncSepia = 3_i64
      FuncLinearToSrgb = 4_i64
      FuncSrgbToLinear = 5_i64
      FuncMax = 6_i64
    end
    @@mb_set_function : Void* = Pointer(Void).null
    def set_function(func : Int64) : Void
      if @@mb_set_function.null?
        @@mb_set_function = Bridge.get_method_bind("VisualShaderNodeColorFunc", "set_function", 3973396138_i64)
      end
      val_0 = func
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_function, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_function : Void* = Pointer(Void).null
    def get_function() : Int64
      if @@mb_get_function.null?
        @@mb_get_function = Bridge.get_method_bind("VisualShaderNodeColorFunc", "get_function", 554863321_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_function, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Color` operator to be used within the visual shader graph.
  #
  # Applies `operator` to two color inputs.
  class VisualShaderNodeColorOp < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Operator : Int64
      OpScreen = 0_i64
      OpDifference = 1_i64
      OpDarken = 2_i64
      OpLighten = 3_i64
      OpOverlay = 4_i64
      OpDodge = 5_i64
      OpBurn = 6_i64
      OpSoftLight = 7_i64
      OpHardLight = 8_i64
      OpMax = 9_i64
    end
    @@mb_set_operator : Void* = Pointer(Void).null
    def set_operator(op : Int64) : Void
      if @@mb_set_operator.null?
        @@mb_set_operator = Bridge.get_method_bind("VisualShaderNodeColorOp", "set_operator", 4260370673_i64)
      end
      val_0 = op
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_operator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_operator : Void* = Pointer(Void).null
    def get_operator() : Int64
      if @@mb_get_operator.null?
        @@mb_get_operator = Bridge.get_method_bind("VisualShaderNodeColorOp", "get_operator", 1950956529_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_operator, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Color` parameter to be used within the visual shader graph.
  #
  # Translated to `uniform vec4` in the shader language.
  class VisualShaderNodeColorParameter < Godot::VisualShaderNodeParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_default_value_enabled : Void* = Pointer(Void).null
    def set_default_value_enabled(enabled : Bool) : Void
      if @@mb_set_default_value_enabled.null?
        @@mb_set_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeColorParameter", "set_default_value_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_default_value_enabled : Void* = Pointer(Void).null
    def is_default_value_enabled() : Bool
      if @@mb_is_default_value_enabled.null?
        @@mb_is_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeColorParameter", "is_default_value_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_default_value_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_default_value : Void* = Pointer(Void).null
    def set_default_value(value : Color) : Void
      if @@mb_set_default_value.null?
        @@mb_set_default_value = Bridge.get_method_bind("VisualShaderNodeColorParameter", "set_default_value", 2920490490_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_value : Void* = Pointer(Void).null
    def get_default_value() : Color
      if @@mb_get_default_value.null?
        @@mb_get_default_value = Bridge.get_method_bind("VisualShaderNodeColorParameter", "get_default_value", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_default_value, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Base class for resizable nodes in a visual shader graph.
  #
  # Resizable nodes have a handle that allows the user to adjust their size as needed.
  class VisualShaderNodeResizableBase < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_size : Void* = Pointer(Void).null
    def set_size(size : Vector2) : Void
      if @@mb_set_size.null?
        @@mb_set_size = Bridge.get_method_bind("VisualShaderNodeResizableBase", "set_size", 743155724_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_size : Void* = Pointer(Void).null
    def get_size() : Vector2
      if @@mb_get_size.null?
        @@mb_get_size = Bridge.get_method_bind("VisualShaderNodeResizableBase", "get_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A frame other visual shader nodes can be attached to for better organization.
  #
  # A rectangular frame that can be used to group visual shader nodes together to improve organization.
  # Nodes attached to the frame will move with it when it is dragged and it can automatically resize to enclose all attached nodes.
  # Its title, description and color can be customized.
  class VisualShaderNodeFrame < Godot::VisualShaderNodeResizableBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_title : Void* = Pointer(Void).null
    def set_title(title : String) : Void
      if @@mb_set_title.null?
        @@mb_set_title = Bridge.get_method_bind("VisualShaderNodeFrame", "set_title", 83702148_i64)
      end
      str_0 = Bridge.make_string(title)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_title, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_title : Void* = Pointer(Void).null
    def get_title() : String
      if @@mb_get_title.null?
        @@mb_get_title = Bridge.get_method_bind("VisualShaderNodeFrame", "get_title", 201670096_i64)
      end
      ""
    end
    @@mb_set_tint_color_enabled : Void* = Pointer(Void).null
    def set_tint_color_enabled(enable : Bool) : Void
      if @@mb_set_tint_color_enabled.null?
        @@mb_set_tint_color_enabled = Bridge.get_method_bind("VisualShaderNodeFrame", "set_tint_color_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tint_color_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_tint_color_enabled : Void* = Pointer(Void).null
    def is_tint_color_enabled() : Bool
      if @@mb_is_tint_color_enabled.null?
        @@mb_is_tint_color_enabled = Bridge.get_method_bind("VisualShaderNodeFrame", "is_tint_color_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_tint_color_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_tint_color : Void* = Pointer(Void).null
    def set_tint_color(color : Color) : Void
      if @@mb_set_tint_color.null?
        @@mb_set_tint_color = Bridge.get_method_bind("VisualShaderNodeFrame", "set_tint_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tint_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tint_color : Void* = Pointer(Void).null
    def get_tint_color() : Color
      if @@mb_get_tint_color.null?
        @@mb_get_tint_color = Bridge.get_method_bind("VisualShaderNodeFrame", "get_tint_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_tint_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_autoshrink_enabled : Void* = Pointer(Void).null
    def set_autoshrink_enabled(enable : Bool) : Void
      if @@mb_set_autoshrink_enabled.null?
        @@mb_set_autoshrink_enabled = Bridge.get_method_bind("VisualShaderNodeFrame", "set_autoshrink_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autoshrink_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_autoshrink_enabled : Void* = Pointer(Void).null
    def is_autoshrink_enabled() : Bool
      if @@mb_is_autoshrink_enabled.null?
        @@mb_is_autoshrink_enabled = Bridge.get_method_bind("VisualShaderNodeFrame", "is_autoshrink_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_autoshrink_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_add_attached_node : Void* = Pointer(Void).null
    # Adds a node to the list of nodes attached to the frame. Should not be called directly, use the `#VisualShader.attach_node_to_frame` method instead.
    def add_attached_node(node : Int64) : Void
      if @@mb_add_attached_node.null?
        @@mb_add_attached_node = Bridge.get_method_bind("VisualShaderNodeFrame", "add_attached_node", 1286410249_i64)
      end
      val_0 = node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_attached_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_attached_node : Void* = Pointer(Void).null
    # Removes a node from the list of nodes attached to the frame. Should not be called directly, use the `#VisualShader.detach_node_from_frame` method instead.
    def remove_attached_node(node : Int64) : Void
      if @@mb_remove_attached_node.null?
        @@mb_remove_attached_node = Bridge.get_method_bind("VisualShaderNodeFrame", "remove_attached_node", 1286410249_i64)
      end
      val_0 = node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_attached_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_attached_nodes : Void* = Pointer(Void).null
    def set_attached_nodes(attached_nodes : Void*) : Void
      if @@mb_set_attached_nodes.null?
        @@mb_set_attached_nodes = Bridge.get_method_bind("VisualShaderNodeFrame", "set_attached_nodes", 3614634198_i64)
      end
      val_0 = attached_nodes
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_attached_nodes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_attached_nodes : Void* = Pointer(Void).null
    def get_attached_nodes() : Void*
      if @@mb_get_attached_nodes.null?
        @@mb_get_attached_nodes = Bridge.get_method_bind("VisualShaderNodeFrame", "get_attached_nodes", 1930428628_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_attached_nodes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
  end
  # Only exists for compatibility. Use `VisualShaderNodeFrame` as a replacement.
  #
  # This node was replaced by `VisualShaderNodeFrame` and only exists to preserve compatibility. In the `VisualShader` editor it behaves exactly like `VisualShaderNodeFrame`.
  class VisualShaderNodeComment < Godot::VisualShaderNodeFrame
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_description : Void* = Pointer(Void).null
    def set_description(description : String) : Void
      if @@mb_set_description.null?
        @@mb_set_description = Bridge.get_method_bind("VisualShaderNodeComment", "set_description", 83702148_i64)
      end
      str_0 = Bridge.make_string(description)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_description, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_description : Void* = Pointer(Void).null
    def get_description() : String
      if @@mb_get_description.null?
        @@mb_get_description = Bridge.get_method_bind("VisualShaderNodeComment", "get_description", 201670096_i64)
      end
      ""
    end
  end
  # A comparison function for common types within the visual shader graph.
  #
  # Compares `a` and `b` of `type` by `function`. Returns a boolean scalar. Translates to `if` instruction in shader code.
  class VisualShaderNodeCompare < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ComparisonType : Int64
      CtypeScalar = 0_i64
      CtypeScalarInt = 1_i64
      CtypeScalarUint = 2_i64
      CtypeVector2d = 3_i64
      CtypeVector3d = 4_i64
      CtypeVector4d = 5_i64
      CtypeBoolean = 6_i64
      CtypeTransform = 7_i64
      CtypeMax = 8_i64
    end
    enum Function : Int64
      FuncEqual = 0_i64
      FuncNotEqual = 1_i64
      FuncGreaterThan = 2_i64
      FuncGreaterThanEqual = 3_i64
      FuncLessThan = 4_i64
      FuncLessThanEqual = 5_i64
      FuncMax = 6_i64
    end
    enum Condition : Int64
      CondAll = 0_i64
      CondAny = 1_i64
      CondMax = 2_i64
    end
    @@mb_set_comparison_type : Void* = Pointer(Void).null
    def set_comparison_type(get_type : Int64) : Void
      if @@mb_set_comparison_type.null?
        @@mb_set_comparison_type = Bridge.get_method_bind("VisualShaderNodeCompare", "set_comparison_type", 516558320_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_comparison_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_comparison_type : Void* = Pointer(Void).null
    def get_comparison_type() : Int64
      if @@mb_get_comparison_type.null?
        @@mb_get_comparison_type = Bridge.get_method_bind("VisualShaderNodeCompare", "get_comparison_type", 3495315961_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_comparison_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_function : Void* = Pointer(Void).null
    def set_function(func : Int64) : Void
      if @@mb_set_function.null?
        @@mb_set_function = Bridge.get_method_bind("VisualShaderNodeCompare", "set_function", 2370951349_i64)
      end
      val_0 = func
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_function, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_function : Void* = Pointer(Void).null
    def get_function() : Int64
      if @@mb_get_function.null?
        @@mb_get_function = Bridge.get_method_bind("VisualShaderNodeCompare", "get_function", 4089164265_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_function, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_condition : Void* = Pointer(Void).null
    def set_condition(condition : Int64) : Void
      if @@mb_set_condition.null?
        @@mb_set_condition = Bridge.get_method_bind("VisualShaderNodeCompare", "set_condition", 918742392_i64)
      end
      val_0 = condition
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_condition, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_condition : Void* = Pointer(Void).null
    def get_condition() : Int64
      if @@mb_get_condition.null?
        @@mb_get_condition = Bridge.get_method_bind("VisualShaderNodeCompare", "get_condition", 3281078941_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_condition, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Cubemap` sampling node to be used within the visual shader graph.
  #
  # Translated to `texture(cubemap, vec3)` in the shader language. Returns a color vector and alpha channel as scalar.
  class VisualShaderNodeCubemap < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Source : Int64
      SourceTexture = 0_i64
      SourcePort = 1_i64
      SourceMax = 2_i64
    end
    enum TextureType : Int64
      TypeData = 0_i64
      TypeColor = 1_i64
      TypeNormalMap = 2_i64
      TypeMax = 3_i64
    end
    @@mb_set_source : Void* = Pointer(Void).null
    def set_source(value : Int64) : Void
      if @@mb_set_source.null?
        @@mb_set_source = Bridge.get_method_bind("VisualShaderNodeCubemap", "set_source", 1625400621_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_source, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_source : Void* = Pointer(Void).null
    def get_source() : Int64
      if @@mb_get_source.null?
        @@mb_get_source = Bridge.get_method_bind("VisualShaderNodeCubemap", "get_source", 2222048781_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_source, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_cube_map : Void* = Pointer(Void).null
    def set_cube_map(value : TextureLayered) : Void
      if @@mb_set_cube_map.null?
        @@mb_set_cube_map = Bridge.get_method_bind("VisualShaderNodeCubemap", "set_cube_map", 1278366092_i64)
      end
      arg_ptr_0 = value ? value.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_cube_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_cube_map : Void* = Pointer(Void).null
    def get_cube_map() : TextureLayered
      if @@mb_get_cube_map.null?
        @@mb_get_cube_map = Bridge.get_method_bind("VisualShaderNodeCubemap", "get_cube_map", 3984243839_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_cube_map, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      TextureLayered.new(ret_ptr)
    end
    @@mb_set_texture_type : Void* = Pointer(Void).null
    def set_texture_type(value : Int64) : Void
      if @@mb_set_texture_type.null?
        @@mb_set_texture_type = Bridge.get_method_bind("VisualShaderNodeCubemap", "set_texture_type", 1899718876_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_type : Void* = Pointer(Void).null
    def get_texture_type() : Int64
      if @@mb_get_texture_type.null?
        @@mb_get_texture_type = Bridge.get_method_bind("VisualShaderNodeCubemap", "get_texture_type", 3356498888_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_texture_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Performs a uniform texture lookup within the visual shader graph.
  #
  # Performs a lookup operation on the texture provided as a uniform for the shader.
  class VisualShaderNodeTextureParameter < Godot::VisualShaderNodeParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum TextureType : Int64
      TypeData = 0_i64
      TypeColor = 1_i64
      TypeNormalMap = 2_i64
      TypeAnisotropy = 3_i64
      TypeMax = 4_i64
    end
    enum ColorDefault : Int64
      ColorDefaultWhite = 0_i64
      ColorDefaultBlack = 1_i64
      ColorDefaultTransparent = 2_i64
      ColorDefaultMax = 3_i64
    end
    enum TextureFilter : Int64
      FilterDefault = 0_i64
      FilterNearest = 1_i64
      FilterLinear = 2_i64
      FilterNearestMipmap = 3_i64
      FilterLinearMipmap = 4_i64
      FilterNearestMipmapAnisotropic = 5_i64
      FilterLinearMipmapAnisotropic = 6_i64
      FilterMax = 7_i64
    end
    enum TextureRepeat : Int64
      RepeatDefault = 0_i64
      RepeatEnabled = 1_i64
      RepeatDisabled = 2_i64
      RepeatMax = 3_i64
    end
    enum TextureSource : Int64
      SourceNone = 0_i64
      SourceScreen = 1_i64
      SourceDepth = 2_i64
      SourceNormalRoughness = 3_i64
      SourceMax = 4_i64
    end
    @@mb_set_texture_type : Void* = Pointer(Void).null
    def set_texture_type(get_type : Int64) : Void
      if @@mb_set_texture_type.null?
        @@mb_set_texture_type = Bridge.get_method_bind("VisualShaderNodeTextureParameter", "set_texture_type", 2227296876_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_type : Void* = Pointer(Void).null
    def get_texture_type() : Int64
      if @@mb_get_texture_type.null?
        @@mb_get_texture_type = Bridge.get_method_bind("VisualShaderNodeTextureParameter", "get_texture_type", 367922070_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_texture_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_color_default : Void* = Pointer(Void).null
    def set_color_default(color : Int64) : Void
      if @@mb_set_color_default.null?
        @@mb_set_color_default = Bridge.get_method_bind("VisualShaderNodeTextureParameter", "set_color_default", 4217624432_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_color_default, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_color_default : Void* = Pointer(Void).null
    def get_color_default() : Int64
      if @@mb_get_color_default.null?
        @@mb_get_color_default = Bridge.get_method_bind("VisualShaderNodeTextureParameter", "get_color_default", 3837060134_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_color_default, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_texture_filter : Void* = Pointer(Void).null
    def set_texture_filter(filter : Int64) : Void
      if @@mb_set_texture_filter.null?
        @@mb_set_texture_filter = Bridge.get_method_bind("VisualShaderNodeTextureParameter", "set_texture_filter", 2147684752_i64)
      end
      val_0 = filter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_filter : Void* = Pointer(Void).null
    def get_texture_filter() : Int64
      if @@mb_get_texture_filter.null?
        @@mb_get_texture_filter = Bridge.get_method_bind("VisualShaderNodeTextureParameter", "get_texture_filter", 4184490817_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_texture_filter, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_texture_repeat : Void* = Pointer(Void).null
    def set_texture_repeat(repeat : Int64) : Void
      if @@mb_set_texture_repeat.null?
        @@mb_set_texture_repeat = Bridge.get_method_bind("VisualShaderNodeTextureParameter", "set_texture_repeat", 2036143070_i64)
      end
      val_0 = repeat
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_repeat, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_repeat : Void* = Pointer(Void).null
    def get_texture_repeat() : Int64
      if @@mb_get_texture_repeat.null?
        @@mb_get_texture_repeat = Bridge.get_method_bind("VisualShaderNodeTextureParameter", "get_texture_repeat", 1690132794_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_texture_repeat, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_texture_source : Void* = Pointer(Void).null
    def set_texture_source(source : Int64) : Void
      if @@mb_set_texture_source.null?
        @@mb_set_texture_source = Bridge.get_method_bind("VisualShaderNodeTextureParameter", "set_texture_source", 1212687372_i64)
      end
      val_0 = source
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_source, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_source : Void* = Pointer(Void).null
    def get_texture_source() : Int64
      if @@mb_get_texture_source.null?
        @@mb_get_texture_source = Bridge.get_method_bind("VisualShaderNodeTextureParameter", "get_texture_source", 2039092262_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_texture_source, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Cubemap` parameter node to be used within the visual shader graph.
  #
  # Translated to `uniform samplerCube` in the shader language. The output value can be used as port for `VisualShaderNodeCubemap`.
  class VisualShaderNodeCubemapParameter < Godot::VisualShaderNodeTextureParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Performs a `CurveTexture` lookup within the visual shader graph.
  #
  # Comes with a built-in editor for texture's curves.
  class VisualShaderNodeCurveTexture < Godot::VisualShaderNodeResizableBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : CurveTexture) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("VisualShaderNodeCurveTexture", "set_texture", 181872837_i64)
      end
      arg_ptr_0 = texture ? texture.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : CurveTexture
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("VisualShaderNodeCurveTexture", "get_texture", 2800800579_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      CurveTexture.new(ret_ptr)
    end
  end
  # Performs a `CurveXYZTexture` lookup within the visual shader graph.
  #
  # Comes with a built-in editor for texture's curves.
  class VisualShaderNodeCurveXYZTexture < Godot::VisualShaderNodeResizableBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : CurveXYZTexture) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("VisualShaderNodeCurveXYZTexture", "set_texture", 8031783_i64)
      end
      arg_ptr_0 = texture ? texture.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : CurveXYZTexture
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("VisualShaderNodeCurveXYZTexture", "get_texture", 1950275015_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      CurveXYZTexture.new(ret_ptr)
    end
  end
  # Virtual class to define custom `VisualShaderNode`s for use in the Visual Shader Editor.
  #
  # By inheriting this class you can create a custom `VisualShader` script addon which will be automatically added to the Visual Shader Editor. The `VisualShaderNode`'s behavior is defined by overriding the provided virtual methods.
  # In order for the node to be registered as an editor addon, you must use the `@tool` annotation and provide a `class_name` for your custom script. For example:
  # ```gdscript
  #
  # @tool
  # extends VisualShaderNodeCustom
  # class_name VisualShaderNodeNoise
  #
  # ```
  class VisualShaderNodeCustom < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_option_index : Void* = Pointer(Void).null
    # Returns the selected index of the drop-down list option within a graph. You may use this function to define the specific behavior in the `#_get_code` or `#_get_global_code`.
    def get_option_index(option : Int64) : Int64
      if @@mb_get_option_index.null?
        @@mb_get_option_index = Bridge.get_method_bind("VisualShaderNodeCustom", "get_option_index", 923996154_i64)
      end
      val_0 = option
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_option_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  # Calculates a derivative within the visual shader graph.
  #
  # This node is only available in `Fragment` and `Light` visual shaders.
  class VisualShaderNodeDerivativeFunc < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum OpType : Int64
      OpTypeScalar = 0_i64
      OpTypeVector2d = 1_i64
      OpTypeVector3d = 2_i64
      OpTypeVector4d = 3_i64
      OpTypeMax = 4_i64
    end
    enum Function : Int64
      FuncSum = 0_i64
      FuncX = 1_i64
      FuncY = 2_i64
      FuncMax = 3_i64
    end
    enum Precision : Int64
      PrecisionNone = 0_i64
      PrecisionCoarse = 1_i64
      PrecisionFine = 2_i64
      PrecisionMax = 3_i64
    end
    @@mb_set_op_type : Void* = Pointer(Void).null
    def set_op_type(get_type : Int64) : Void
      if @@mb_set_op_type.null?
        @@mb_set_op_type = Bridge.get_method_bind("VisualShaderNodeDerivativeFunc", "set_op_type", 377800221_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_op_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_op_type : Void* = Pointer(Void).null
    def get_op_type() : Int64
      if @@mb_get_op_type.null?
        @@mb_get_op_type = Bridge.get_method_bind("VisualShaderNodeDerivativeFunc", "get_op_type", 3997800514_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_op_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_function : Void* = Pointer(Void).null
    def set_function(func : Int64) : Void
      if @@mb_set_function.null?
        @@mb_set_function = Bridge.get_method_bind("VisualShaderNodeDerivativeFunc", "set_function", 1944704156_i64)
      end
      val_0 = func
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_function, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_function : Void* = Pointer(Void).null
    def get_function() : Int64
      if @@mb_get_function.null?
        @@mb_get_function = Bridge.get_method_bind("VisualShaderNodeDerivativeFunc", "get_function", 2389093396_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_function, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_precision : Void* = Pointer(Void).null
    def set_precision(precision : Int64) : Void
      if @@mb_set_precision.null?
        @@mb_set_precision = Bridge.get_method_bind("VisualShaderNodeDerivativeFunc", "set_precision", 797270566_i64)
      end
      val_0 = precision
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_precision, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_precision : Void* = Pointer(Void).null
    def get_precision() : Int64
      if @@mb_get_precision.null?
        @@mb_get_precision = Bridge.get_method_bind("VisualShaderNodeDerivativeFunc", "get_precision", 3822547323_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_precision, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Calculates the determinant of a `Transform3D` within the visual shader graph.
  #
  # Translates to `determinant(x)` in the shader language.
  class VisualShaderNodeDeterminant < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node representing distance fade effect.
  #
  # The distance fade effect fades out each pixel based on its distance to another object.
  class VisualShaderNodeDistanceFade < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Calculates a dot product of two vectors within the visual shader graph.
  #
  # Translates to `dot(a, b)` in the shader language.
  class VisualShaderNodeDotProduct < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Base class for a family of nodes with variable number of input and output ports within the visual shader graph.
  #
  # Currently, has no direct usage, use the derived classes instead.
  class VisualShaderNodeGroupBase < Godot::VisualShaderNodeResizableBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_inputs : Void* = Pointer(Void).null
    # Defines all input ports using a `String` formatted as a colon-separated list: `id,type,name;` (see `#add_input_port`).
    def set_inputs(inputs : String) : Void
      if @@mb_set_inputs.null?
        @@mb_set_inputs = Bridge.get_method_bind("VisualShaderNodeGroupBase", "set_inputs", 83702148_i64)
      end
      str_0 = Bridge.make_string(inputs)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_inputs, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_inputs : Void* = Pointer(Void).null
    # Returns a `String` description of the input ports as a colon-separated list using the format `id,type,name;` (see `#add_input_port`).
    def get_inputs() : String
      if @@mb_get_inputs.null?
        @@mb_get_inputs = Bridge.get_method_bind("VisualShaderNodeGroupBase", "get_inputs", 201670096_i64)
      end
      ""
    end
    @@mb_set_outputs : Void* = Pointer(Void).null
    # Defines all output ports using a `String` formatted as a colon-separated list: `id,type,name;` (see `#add_output_port`).
    def set_outputs(outputs : String) : Void
      if @@mb_set_outputs.null?
        @@mb_set_outputs = Bridge.get_method_bind("VisualShaderNodeGroupBase", "set_outputs", 83702148_i64)
      end
      str_0 = Bridge.make_string(outputs)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_outputs, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_outputs : Void* = Pointer(Void).null
    # Returns a `String` description of the output ports as a colon-separated list using the format `id,type,name;` (see `#add_output_port`).
    def get_outputs() : String
      if @@mb_get_outputs.null?
        @@mb_get_outputs = Bridge.get_method_bind("VisualShaderNodeGroupBase", "get_outputs", 201670096_i64)
      end
      ""
    end
    @@mb_is_valid_port_name : Void* = Pointer(Void).null
    # Returns `true` if the specified port name does not override an existed port name and is valid within the shader.
    def is_valid_port_name(name : String) : Bool
      if @@mb_is_valid_port_name.null?
        @@mb_is_valid_port_name = Bridge.get_method_bind("VisualShaderNodeGroupBase", "is_valid_port_name", 3927539163_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_valid_port_name, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_add_input_port : Void* = Pointer(Void).null
    # Adds an input port with the specified `type` (see `VisualShaderNode.PortType`) and `name`.
    def add_input_port(id : Int64, get_type : Int64, name : String) : Void
      if @@mb_add_input_port.null?
        @@mb_add_input_port = Bridge.get_method_bind("VisualShaderNodeGroupBase", "add_input_port", 2285447957_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      str_2 = Bridge.make_string(name)
      arg_2 = str_2
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_add_input_port, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_2)
    end
    @@mb_remove_input_port : Void* = Pointer(Void).null
    # Removes the specified input port.
    def remove_input_port(id : Int64) : Void
      if @@mb_remove_input_port.null?
        @@mb_remove_input_port = Bridge.get_method_bind("VisualShaderNodeGroupBase", "remove_input_port", 1286410249_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_input_port, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_input_port_count : Void* = Pointer(Void).null
    # Returns the number of input ports in use. Alternative for `#get_free_input_port_id`.
    def get_input_port_count() : Int64
      if @@mb_get_input_port_count.null?
        @@mb_get_input_port_count = Bridge.get_method_bind("VisualShaderNodeGroupBase", "get_input_port_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_input_port_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_has_input_port : Void* = Pointer(Void).null
    # Returns `true` if the specified input port exists.
    def has_input_port(id : Int64) : Bool
      if @@mb_has_input_port.null?
        @@mb_has_input_port = Bridge.get_method_bind("VisualShaderNodeGroupBase", "has_input_port", 1116898809_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_input_port, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_clear_input_ports : Void* = Pointer(Void).null
    # Removes all previously specified input ports.
    def clear_input_ports() : Void
      if @@mb_clear_input_ports.null?
        @@mb_clear_input_ports = Bridge.get_method_bind("VisualShaderNodeGroupBase", "clear_input_ports", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_input_ports, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_add_output_port : Void* = Pointer(Void).null
    # Adds an output port with the specified `type` (see `VisualShaderNode.PortType`) and `name`.
    def add_output_port(id : Int64, get_type : Int64, name : String) : Void
      if @@mb_add_output_port.null?
        @@mb_add_output_port = Bridge.get_method_bind("VisualShaderNodeGroupBase", "add_output_port", 2285447957_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      str_2 = Bridge.make_string(name)
      arg_2 = str_2
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_add_output_port, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_2)
    end
    @@mb_remove_output_port : Void* = Pointer(Void).null
    # Removes the specified output port.
    def remove_output_port(id : Int64) : Void
      if @@mb_remove_output_port.null?
        @@mb_remove_output_port = Bridge.get_method_bind("VisualShaderNodeGroupBase", "remove_output_port", 1286410249_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_output_port, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_output_port_count : Void* = Pointer(Void).null
    # Returns the number of output ports in use. Alternative for `#get_free_output_port_id`.
    def get_output_port_count() : Int64
      if @@mb_get_output_port_count.null?
        @@mb_get_output_port_count = Bridge.get_method_bind("VisualShaderNodeGroupBase", "get_output_port_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_output_port_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_has_output_port : Void* = Pointer(Void).null
    # Returns `true` if the specified output port exists.
    def has_output_port(id : Int64) : Bool
      if @@mb_has_output_port.null?
        @@mb_has_output_port = Bridge.get_method_bind("VisualShaderNodeGroupBase", "has_output_port", 1116898809_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_output_port, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_clear_output_ports : Void* = Pointer(Void).null
    # Removes all previously specified output ports.
    def clear_output_ports() : Void
      if @@mb_clear_output_ports.null?
        @@mb_clear_output_ports = Bridge.get_method_bind("VisualShaderNodeGroupBase", "clear_output_ports", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_output_ports, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_input_port_name : Void* = Pointer(Void).null
    # Renames the specified input port.
    def set_input_port_name(id : Int64, name : String) : Void
      if @@mb_set_input_port_name.null?
        @@mb_set_input_port_name = Bridge.get_method_bind("VisualShaderNodeGroupBase", "set_input_port_name", 501894301_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      str_1 = Bridge.make_string(name)
      arg_1 = str_1
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_input_port_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_1)
    end
    @@mb_set_input_port_type : Void* = Pointer(Void).null
    # Sets the specified input port's type (see `VisualShaderNode.PortType`).
    def set_input_port_type(id : Int64, get_type : Int64) : Void
      if @@mb_set_input_port_type.null?
        @@mb_set_input_port_type = Bridge.get_method_bind("VisualShaderNodeGroupBase", "set_input_port_type", 3937882851_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_input_port_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_output_port_name : Void* = Pointer(Void).null
    # Renames the specified output port.
    def set_output_port_name(id : Int64, name : String) : Void
      if @@mb_set_output_port_name.null?
        @@mb_set_output_port_name = Bridge.get_method_bind("VisualShaderNodeGroupBase", "set_output_port_name", 501894301_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      str_1 = Bridge.make_string(name)
      arg_1 = str_1
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_output_port_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_1)
    end
    @@mb_set_output_port_type : Void* = Pointer(Void).null
    # Sets the specified output port's type (see `VisualShaderNode.PortType`).
    def set_output_port_type(id : Int64, get_type : Int64) : Void
      if @@mb_set_output_port_type.null?
        @@mb_set_output_port_type = Bridge.get_method_bind("VisualShaderNodeGroupBase", "set_output_port_type", 3937882851_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_output_port_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_free_input_port_id : Void* = Pointer(Void).null
    # Returns a free input port ID which can be used in `#add_input_port`.
    def get_free_input_port_id() : Int64
      if @@mb_get_free_input_port_id.null?
        @@mb_get_free_input_port_id = Bridge.get_method_bind("VisualShaderNodeGroupBase", "get_free_input_port_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_free_input_port_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_free_output_port_id : Void* = Pointer(Void).null
    # Returns a free output port ID which can be used in `#add_output_port`.
    def get_free_output_port_id() : Int64
      if @@mb_get_free_output_port_id.null?
        @@mb_get_free_output_port_id = Bridge.get_method_bind("VisualShaderNodeGroupBase", "get_free_output_port_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_free_output_port_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A custom visual shader graph expression written in Godot Shading Language.
  #
  # Custom Godot Shading Language expression, with a custom number of input and output ports.
  # The provided code is directly injected into the graph's matching shader function (`vertex`, `fragment`, or `light`), so it cannot be used to declare functions, varyings, uniforms, or global constants. See `VisualShaderNodeGlobalExpression` for such global definitions.
  class VisualShaderNodeExpression < Godot::VisualShaderNodeGroupBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_expression : Void* = Pointer(Void).null
    def set_expression(expression : String) : Void
      if @@mb_set_expression.null?
        @@mb_set_expression = Bridge.get_method_bind("VisualShaderNodeExpression", "set_expression", 83702148_i64)
      end
      str_0 = Bridge.make_string(expression)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_expression, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_expression : Void* = Pointer(Void).null
    def get_expression() : String
      if @@mb_get_expression.null?
        @@mb_get_expression = Bridge.get_method_bind("VisualShaderNodeExpression", "get_expression", 201670096_i64)
      end
      ""
    end
  end
  # A base type for the nodes that perform vector operations within the visual shader graph.
  #
  # This is an abstract class. See the derived types for descriptions of the possible operations.
  class VisualShaderNodeVectorBase < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum OpType : Int64
      OpTypeVector2d = 0_i64
      OpTypeVector3d = 1_i64
      OpTypeVector4d = 2_i64
      OpTypeMax = 3_i64
    end
    @@mb_set_op_type : Void* = Pointer(Void).null
    def set_op_type(get_type : Int64) : Void
      if @@mb_set_op_type.null?
        @@mb_set_op_type = Bridge.get_method_bind("VisualShaderNodeVectorBase", "set_op_type", 1692596998_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_op_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_op_type : Void* = Pointer(Void).null
    def get_op_type() : Int64
      if @@mb_get_op_type.null?
        @@mb_get_op_type = Bridge.get_method_bind("VisualShaderNodeVectorBase", "get_op_type", 2568738462_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_op_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Returns the vector that points in the same direction as a reference vector within the visual shader graph.
  #
  # Translates to `faceforward(N, I, Nref)` in the shader language. The function has three vector parameters: `N`, the vector to orient, `I`, the incident vector, and `Nref`, the reference vector. If the dot product of `I` and `Nref` is smaller than zero the return value is `N`. Otherwise, `-N` is returned.
  class VisualShaderNodeFaceForward < Godot::VisualShaderNodeVectorBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A scalar floating-point constant to be used within the visual shader graph.
  #
  # Translated to [code skip-lint]float[/code] in the shader language.
  class VisualShaderNodeFloatConstant < Godot::VisualShaderNodeConstant
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_constant : Void* = Pointer(Void).null
    def set_constant(constant : Float64) : Void
      if @@mb_set_constant.null?
        @@mb_set_constant = Bridge.get_method_bind("VisualShaderNodeFloatConstant", "set_constant", 373806689_i64)
      end
      val_0 = constant
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant : Void* = Pointer(Void).null
    def get_constant() : Float64
      if @@mb_get_constant.null?
        @@mb_get_constant = Bridge.get_method_bind("VisualShaderNodeFloatConstant", "get_constant", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_constant, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A scalar floating-point function to be used within the visual shader graph.
  #
  # Accept a floating-point scalar (`x`) to the input port and transform it according to `function`.
  class VisualShaderNodeFloatFunc < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Function : Int64
      FuncSin = 0_i64
      FuncCos = 1_i64
      FuncTan = 2_i64
      FuncAsin = 3_i64
      FuncAcos = 4_i64
      FuncAtan = 5_i64
      FuncSinh = 6_i64
      FuncCosh = 7_i64
      FuncTanh = 8_i64
      FuncLog = 9_i64
      FuncExp = 10_i64
      FuncSqrt = 11_i64
      FuncAbs = 12_i64
      FuncSign = 13_i64
      FuncFloor = 14_i64
      FuncRound = 15_i64
      FuncCeil = 16_i64
      FuncFract = 17_i64
      FuncSaturate = 18_i64
      FuncNegate = 19_i64
      FuncAcosh = 20_i64
      FuncAsinh = 21_i64
      FuncAtanh = 22_i64
      FuncDegrees = 23_i64
      FuncExp2 = 24_i64
      FuncInverseSqrt = 25_i64
      FuncLog2 = 26_i64
      FuncRadians = 27_i64
      FuncReciprocal = 28_i64
      FuncRoundeven = 29_i64
      FuncTrunc = 30_i64
      FuncOneminus = 31_i64
      FuncMax = 32_i64
    end
    @@mb_set_function : Void* = Pointer(Void).null
    def set_function(func : Int64) : Void
      if @@mb_set_function.null?
        @@mb_set_function = Bridge.get_method_bind("VisualShaderNodeFloatFunc", "set_function", 536026177_i64)
      end
      val_0 = func
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_function, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_function : Void* = Pointer(Void).null
    def get_function() : Int64
      if @@mb_get_function.null?
        @@mb_get_function = Bridge.get_method_bind("VisualShaderNodeFloatFunc", "get_function", 2033948868_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_function, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A floating-point scalar operator to be used within the visual shader graph.
  #
  # Applies `operator` to two floating-point inputs: `a` and `b`.
  class VisualShaderNodeFloatOp < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Operator : Int64
      OpAdd = 0_i64
      OpSub = 1_i64
      OpMul = 2_i64
      OpDiv = 3_i64
      OpMod = 4_i64
      OpPow = 5_i64
      OpMax = 6_i64
      OpMin = 7_i64
      OpAtan2 = 8_i64
      OpStep = 9_i64
      OpEnumSize = 10_i64
    end
    @@mb_set_operator : Void* = Pointer(Void).null
    def set_operator(op : Int64) : Void
      if @@mb_set_operator.null?
        @@mb_set_operator = Bridge.get_method_bind("VisualShaderNodeFloatOp", "set_operator", 2488468047_i64)
      end
      val_0 = op
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_operator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_operator : Void* = Pointer(Void).null
    def get_operator() : Int64
      if @@mb_get_operator.null?
        @@mb_get_operator = Bridge.get_method_bind("VisualShaderNodeFloatOp", "get_operator", 1867979390_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_operator, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A scalar float parameter to be used within the visual shader graph.
  #
  # Translated to `uniform float` in the shader language.
  class VisualShaderNodeFloatParameter < Godot::VisualShaderNodeParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Hint : Int64
      HintNone = 0_i64
      HintRange = 1_i64
      HintRangeStep = 2_i64
      HintMax = 3_i64
    end
    @@mb_set_hint : Void* = Pointer(Void).null
    def set_hint(hint : Int64) : Void
      if @@mb_set_hint.null?
        @@mb_set_hint = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "set_hint", 3712586466_i64)
      end
      val_0 = hint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hint : Void* = Pointer(Void).null
    def get_hint() : Int64
      if @@mb_get_hint.null?
        @@mb_get_hint = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "get_hint", 3042240429_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_hint, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_min : Void* = Pointer(Void).null
    def set_min(value : Float64) : Void
      if @@mb_set_min.null?
        @@mb_set_min = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "set_min", 373806689_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_min, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_min : Void* = Pointer(Void).null
    def get_min() : Float64
      if @@mb_get_min.null?
        @@mb_get_min = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "get_min", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_min, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max : Void* = Pointer(Void).null
    def set_max(value : Float64) : Void
      if @@mb_set_max.null?
        @@mb_set_max = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "set_max", 373806689_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max : Void* = Pointer(Void).null
    def get_max() : Float64
      if @@mb_get_max.null?
        @@mb_get_max = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "get_max", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_max, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_step : Void* = Pointer(Void).null
    def set_step(value : Float64) : Void
      if @@mb_set_step.null?
        @@mb_set_step = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "set_step", 373806689_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_step, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_step : Void* = Pointer(Void).null
    def get_step() : Float64
      if @@mb_get_step.null?
        @@mb_get_step = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "get_step", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_step, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_default_value_enabled : Void* = Pointer(Void).null
    def set_default_value_enabled(enabled : Bool) : Void
      if @@mb_set_default_value_enabled.null?
        @@mb_set_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "set_default_value_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_default_value_enabled : Void* = Pointer(Void).null
    def is_default_value_enabled() : Bool
      if @@mb_is_default_value_enabled.null?
        @@mb_is_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "is_default_value_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_default_value_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_default_value : Void* = Pointer(Void).null
    def set_default_value(value : Float64) : Void
      if @@mb_set_default_value.null?
        @@mb_set_default_value = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "set_default_value", 373806689_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_value : Void* = Pointer(Void).null
    def get_default_value() : Float64
      if @@mb_get_default_value.null?
        @@mb_get_default_value = Bridge.get_method_bind("VisualShaderNodeFloatParameter", "get_default_value", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_default_value, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A Fresnel effect to be used within the visual shader graph.
  #
  # Returns falloff based on the dot product of surface normal and view direction of camera (pass associated inputs to it).
  class VisualShaderNodeFresnel < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A custom global visual shader graph expression written in Godot Shading Language.
  #
  # Custom Godot Shader Language expression, which is placed on top of the generated shader. You can place various function definitions inside to call later in `VisualShaderNodeExpression`s (which are injected in the main shader functions). You can also declare varyings, uniforms and global constants.
  class VisualShaderNodeGlobalExpression < Godot::VisualShaderNodeExpression
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node that instances a `VisualShaderGroup`.
  #
  # Represents a `VisualShaderGroup` inside a `VisualShader` or another `VisualShaderGroup`. Its input and output ports are defined by the assigned `group` resource.
  # If the group contains nodes incompatible with the current shader context, the outputs will use default values and a warning will be shown.
  class VisualShaderNodeGroup < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_group : Void* = Pointer(Void).null
    def set_group(group : VisualShaderGroup) : Void
      if @@mb_set_group.null?
        @@mb_set_group = Bridge.get_method_bind("VisualShaderNodeGroup", "set_group", 3093265740_i64)
      end
      arg_ptr_0 = group ? group.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_group : Void* = Pointer(Void).null
    def get_group() : VisualShaderGroup
      if @@mb_get_group.null?
        @@mb_get_group = Bridge.get_method_bind("VisualShaderNodeGroup", "get_group", 1230504110_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_group, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      VisualShaderGroup.new(ret_ptr)
    end
  end
  # Represents the input ports of a `VisualShaderGroup` within its graph.
  #
  # This node is automatically created inside each `VisualShaderGroup`. It has no input ports and its output ports correspond to the input ports defined on the parent `VisualShaderGroup`.
  class VisualShaderNodeGroupInput < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Represents the output ports of a `VisualShaderGroup` within its graph.
  #
  # This node is automatically created inside each `VisualShaderGroup`. It has no output ports and its input ports correspond to the output ports defined on the parent `VisualShaderGroup`.
  class VisualShaderNodeGroupOutput < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Outputs a 3D vector based on the result of a floating-point comparison within the visual shader graph.
  #
  # This visual shader node has six input ports:
  # - Port **1** and **2** provide the two floating-point numbers `a` and `b` that will be compared.
  # - Port **3** is the tolerance, which allows similar floating-point numbers to be considered equal.
  # - Ports **4**, **5**, and **6** are the possible outputs, returned if `a == b`, `a > b`, or `a < b` respectively.
  class VisualShaderNodeIf < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Represents the input shader parameter within the visual shader graph.
  #
  # Gives access to input variables (built-ins) available for the shader. See the shading reference for the list of available built-ins for each shader type (check `Tutorials` section for link).
  class VisualShaderNodeInput < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_input_name : Void* = Pointer(Void).null
    def set_input_name(name : String) : Void
      if @@mb_set_input_name.null?
        @@mb_set_input_name = Bridge.get_method_bind("VisualShaderNodeInput", "set_input_name", 83702148_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_input_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_input_name : Void* = Pointer(Void).null
    def get_input_name() : String
      if @@mb_get_input_name.null?
        @@mb_get_input_name = Bridge.get_method_bind("VisualShaderNodeInput", "get_input_name", 201670096_i64)
      end
      ""
    end
    @@mb_get_input_real_name : Void* = Pointer(Void).null
    # Returns a translated name of the current constant in the Godot Shader Language. E.g. `"ALBEDO"` if the `input_name` equal to `"albedo"`.
    def get_input_real_name() : String
      if @@mb_get_input_real_name.null?
        @@mb_get_input_real_name = Bridge.get_method_bind("VisualShaderNodeInput", "get_input_real_name", 201670096_i64)
      end
      ""
    end
  end
  # A scalar integer constant to be used within the visual shader graph.
  #
  # Translated to [code skip-lint]int[/code] in the shader language.
  class VisualShaderNodeIntConstant < Godot::VisualShaderNodeConstant
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_constant : Void* = Pointer(Void).null
    def set_constant(constant : Int64) : Void
      if @@mb_set_constant.null?
        @@mb_set_constant = Bridge.get_method_bind("VisualShaderNodeIntConstant", "set_constant", 1286410249_i64)
      end
      val_0 = constant
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant : Void* = Pointer(Void).null
    def get_constant() : Int64
      if @@mb_get_constant.null?
        @@mb_get_constant = Bridge.get_method_bind("VisualShaderNodeIntConstant", "get_constant", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_constant, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A scalar integer function to be used within the visual shader graph.
  #
  # Accept an integer scalar (`x`) to the input port and transform it according to `function`.
  class VisualShaderNodeIntFunc < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Function : Int64
      FuncAbs = 0_i64
      FuncNegate = 1_i64
      FuncSign = 2_i64
      FuncBitwiseNot = 3_i64
      FuncMax = 4_i64
    end
    @@mb_set_function : Void* = Pointer(Void).null
    def set_function(func : Int64) : Void
      if @@mb_set_function.null?
        @@mb_set_function = Bridge.get_method_bind("VisualShaderNodeIntFunc", "set_function", 424195284_i64)
      end
      val_0 = func
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_function, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_function : Void* = Pointer(Void).null
    def get_function() : Int64
      if @@mb_get_function.null?
        @@mb_get_function = Bridge.get_method_bind("VisualShaderNodeIntFunc", "get_function", 2753496911_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_function, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # An integer scalar operator to be used within the visual shader graph.
  #
  # Applies `operator` to two integer inputs: `a` and `b`.
  class VisualShaderNodeIntOp < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Operator : Int64
      OpAdd = 0_i64
      OpSub = 1_i64
      OpMul = 2_i64
      OpDiv = 3_i64
      OpMod = 4_i64
      OpMax = 5_i64
      OpMin = 6_i64
      OpBitwiseAnd = 7_i64
      OpBitwiseOr = 8_i64
      OpBitwiseXor = 9_i64
      OpBitwiseLeftShift = 10_i64
      OpBitwiseRightShift = 11_i64
      OpEnumSize = 12_i64
    end
    @@mb_set_operator : Void* = Pointer(Void).null
    def set_operator(op : Int64) : Void
      if @@mb_set_operator.null?
        @@mb_set_operator = Bridge.get_method_bind("VisualShaderNodeIntOp", "set_operator", 1677909323_i64)
      end
      val_0 = op
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_operator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_operator : Void* = Pointer(Void).null
    def get_operator() : Int64
      if @@mb_get_operator.null?
        @@mb_get_operator = Bridge.get_method_bind("VisualShaderNodeIntOp", "get_operator", 1236987913_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_operator, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A visual shader node for shader parameter (uniform) of type `int`.
  #
  # A `VisualShaderNodeParameter` of type `int`. Offers additional customization for range of accepted values.
  class VisualShaderNodeIntParameter < Godot::VisualShaderNodeParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Hint : Int64
      HintNone = 0_i64
      HintRange = 1_i64
      HintRangeStep = 2_i64
      HintEnum = 3_i64
      HintMax = 4_i64
    end
    @@mb_set_hint : Void* = Pointer(Void).null
    def set_hint(hint : Int64) : Void
      if @@mb_set_hint.null?
        @@mb_set_hint = Bridge.get_method_bind("VisualShaderNodeIntParameter", "set_hint", 2540512075_i64)
      end
      val_0 = hint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hint : Void* = Pointer(Void).null
    def get_hint() : Int64
      if @@mb_get_hint.null?
        @@mb_get_hint = Bridge.get_method_bind("VisualShaderNodeIntParameter", "get_hint", 4250814924_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_hint, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_min : Void* = Pointer(Void).null
    def set_min(value : Int64) : Void
      if @@mb_set_min.null?
        @@mb_set_min = Bridge.get_method_bind("VisualShaderNodeIntParameter", "set_min", 1286410249_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_min, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_min : Void* = Pointer(Void).null
    def get_min() : Int64
      if @@mb_get_min.null?
        @@mb_get_min = Bridge.get_method_bind("VisualShaderNodeIntParameter", "get_min", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_min, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max : Void* = Pointer(Void).null
    def set_max(value : Int64) : Void
      if @@mb_set_max.null?
        @@mb_set_max = Bridge.get_method_bind("VisualShaderNodeIntParameter", "set_max", 1286410249_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max : Void* = Pointer(Void).null
    def get_max() : Int64
      if @@mb_get_max.null?
        @@mb_get_max = Bridge.get_method_bind("VisualShaderNodeIntParameter", "get_max", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_step : Void* = Pointer(Void).null
    def set_step(value : Int64) : Void
      if @@mb_set_step.null?
        @@mb_set_step = Bridge.get_method_bind("VisualShaderNodeIntParameter", "set_step", 1286410249_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_step, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_step : Void* = Pointer(Void).null
    def get_step() : Int64
      if @@mb_get_step.null?
        @@mb_get_step = Bridge.get_method_bind("VisualShaderNodeIntParameter", "get_step", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_step, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_enum_names : Void* = Pointer(Void).null
    def set_enum_names(names : Void*) : Void
      if @@mb_set_enum_names.null?
        @@mb_set_enum_names = Bridge.get_method_bind("VisualShaderNodeIntParameter", "set_enum_names", 4015028928_i64)
      end
      val_0 = names
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enum_names, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enum_names : Void* = Pointer(Void).null
    def get_enum_names() : Void*
      if @@mb_get_enum_names.null?
        @@mb_get_enum_names = Bridge.get_method_bind("VisualShaderNodeIntParameter", "get_enum_names", 1139954409_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_enum_names, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_default_value_enabled : Void* = Pointer(Void).null
    def set_default_value_enabled(enabled : Bool) : Void
      if @@mb_set_default_value_enabled.null?
        @@mb_set_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeIntParameter", "set_default_value_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_default_value_enabled : Void* = Pointer(Void).null
    def is_default_value_enabled() : Bool
      if @@mb_is_default_value_enabled.null?
        @@mb_is_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeIntParameter", "is_default_value_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_default_value_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_default_value : Void* = Pointer(Void).null
    def set_default_value(value : Int64) : Void
      if @@mb_set_default_value.null?
        @@mb_set_default_value = Bridge.get_method_bind("VisualShaderNodeIntParameter", "set_default_value", 1286410249_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_value : Void* = Pointer(Void).null
    def get_default_value() : Int64
      if @@mb_get_default_value.null?
        @@mb_get_default_value = Bridge.get_method_bind("VisualShaderNodeIntParameter", "get_default_value", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_default_value, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A boolean comparison operator to be used within the visual shader graph.
  #
  # Returns the boolean result of the comparison between `INF` or `NaN` and a scalar parameter.
  class VisualShaderNodeIs < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Function : Int64
      FuncIsInf = 0_i64
      FuncIsNan = 1_i64
      FuncMax = 2_i64
    end
    @@mb_set_function : Void* = Pointer(Void).null
    def set_function(func : Int64) : Void
      if @@mb_set_function.null?
        @@mb_set_function = Bridge.get_method_bind("VisualShaderNodeIs", "set_function", 1438374690_i64)
      end
      val_0 = func
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_function, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_function : Void* = Pointer(Void).null
    def get_function() : Int64
      if @@mb_get_function.null?
        @@mb_get_function = Bridge.get_method_bind("VisualShaderNodeIs", "get_function", 580678557_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_function, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A visual shader node that returns the depth value of the DEPTH_TEXTURE node in a linear space.
  #
  # This node can be used in fragment shaders.
  class VisualShaderNodeLinearSceneDepth < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Linearly interpolates between two values within the visual shader graph.
  #
  # Translates to `mix(a, b, weight)` in the shader language.
  class VisualShaderNodeMix < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum OpType : Int64
      OpTypeScalar = 0_i64
      OpTypeVector2d = 1_i64
      OpTypeVector2dScalar = 2_i64
      OpTypeVector3d = 3_i64
      OpTypeVector3dScalar = 4_i64
      OpTypeVector4d = 5_i64
      OpTypeVector4dScalar = 6_i64
      OpTypeMax = 7_i64
    end
    @@mb_set_op_type : Void* = Pointer(Void).null
    def set_op_type(op_type : Int64) : Void
      if @@mb_set_op_type.null?
        @@mb_set_op_type = Bridge.get_method_bind("VisualShaderNodeMix", "set_op_type", 3397501671_i64)
      end
      val_0 = op_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_op_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_op_type : Void* = Pointer(Void).null
    def get_op_type() : Int64
      if @@mb_get_op_type.null?
        @@mb_get_op_type = Bridge.get_method_bind("VisualShaderNodeMix", "get_op_type", 4013957297_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_op_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Performs a fused multiply-add operation within the visual shader graph.
  #
  # Uses three operands to compute `(a * b + c)` expression.
  class VisualShaderNodeMultiplyAdd < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum OpType : Int64
      OpTypeScalar = 0_i64
      OpTypeVector2d = 1_i64
      OpTypeVector3d = 2_i64
      OpTypeVector4d = 3_i64
      OpTypeMax = 4_i64
    end
    @@mb_set_op_type : Void* = Pointer(Void).null
    def set_op_type(get_type : Int64) : Void
      if @@mb_set_op_type.null?
        @@mb_set_op_type = Bridge.get_method_bind("VisualShaderNodeMultiplyAdd", "set_op_type", 1409862380_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_op_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_op_type : Void* = Pointer(Void).null
    def get_op_type() : Int64
      if @@mb_get_op_type.null?
        @@mb_get_op_type = Bridge.get_method_bind("VisualShaderNodeMultiplyAdd", "get_op_type", 2823201991_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_op_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Calculates an outer product of two vectors within the visual shader graph.
  #
  # `OuterProduct` treats the first parameter `c` as a column vector (matrix with one column) and the second parameter `r` as a row vector (matrix with one row) and does a linear algebraic matrix multiply `c * r`, yielding a matrix whose number of rows is the number of components in `c` and whose number of columns is the number of components in `r`.
  class VisualShaderNodeOuterProduct < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Represents the output shader parameters within the visual shader graph.
  #
  # This visual shader node is present in all shader graphs in form of "Output" block with multiple output value ports.
  class VisualShaderNodeOutput < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A reference to an existing `VisualShaderNodeParameter`.
  #
  # Creating a reference to a `VisualShaderNodeParameter` allows you to reuse this parameter in different shaders or shader stages easily.
  class VisualShaderNodeParameterRef < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_parameter_name : Void* = Pointer(Void).null
    def set_parameter_name(name : String) : Void
      if @@mb_set_parameter_name.null?
        @@mb_set_parameter_name = Bridge.get_method_bind("VisualShaderNodeParameterRef", "set_parameter_name", 83702148_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_parameter_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_parameter_name : Void* = Pointer(Void).null
    def get_parameter_name() : String
      if @@mb_get_parameter_name.null?
        @@mb_get_parameter_name = Bridge.get_method_bind("VisualShaderNodeParameterRef", "get_parameter_name", 201670096_i64)
      end
      ""
    end
  end
  # A visual shader node that accelerates particles.
  #
  # Particle accelerator can be used in "process" step of particle shader. It will accelerate the particles. Connect it to the Velocity output port.
  class VisualShaderNodeParticleAccelerator < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Mode : Int64
      ModeLinear = 0_i64
      ModeRadial = 1_i64
      ModeTangential = 2_i64
      ModeMax = 3_i64
    end
    @@mb_set_mode : Void* = Pointer(Void).null
    def set_mode(mode : Int64) : Void
      if @@mb_set_mode.null?
        @@mb_set_mode = Bridge.get_method_bind("VisualShaderNodeParticleAccelerator", "set_mode", 3457585749_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_mode : Void* = Pointer(Void).null
    def get_mode() : Int64
      if @@mb_get_mode.null?
        @@mb_get_mode = Bridge.get_method_bind("VisualShaderNodeParticleAccelerator", "get_mode", 2660365633_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A base class for particle emitters.
  #
  # Particle emitter nodes can be used in "start" step of particle shaders and they define the starting position of the particles. Connect them to the Position output port.
  class VisualShaderNodeParticleEmitter < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_mode_2d : Void* = Pointer(Void).null
    def set_mode_2d(enabled : Bool) : Void
      if @@mb_set_mode_2d.null?
        @@mb_set_mode_2d = Bridge.get_method_bind("VisualShaderNodeParticleEmitter", "set_mode_2d", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_mode_2d, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_mode_2d : Void* = Pointer(Void).null
    def is_mode_2d() : Bool
      if @@mb_is_mode_2d.null?
        @@mb_is_mode_2d = Bridge.get_method_bind("VisualShaderNodeParticleEmitter", "is_mode_2d", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_mode_2d, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # A visual shader node that makes particles emitted in a box shape.
  #
  # `VisualShaderNodeParticleEmitter` that makes the particles emitted in box shape with the specified extents.
  class VisualShaderNodeParticleBoxEmitter < Godot::VisualShaderNodeParticleEmitter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node that makes particles move in a cone shape.
  #
  # This node can be used in "start" step of particle shader. It defines the initial velocity of the particles, making them move in cone shape starting from the center, with a given spread.
  class VisualShaderNodeParticleConeVelocity < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node that forces to emit a particle from a sub-emitter.
  #
  # This node calls the internal `emit_subparticle` method. It will emit a particle from the configured sub-emitter and also allows to customize how it's emitted. Requires a sub-emitter assigned to the particles node that is using this shader.
  class VisualShaderNodeParticleEmit < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum EmitFlags : Int64
      EmitFlagPosition = 1_i64
      EmitFlagRotScale = 2_i64
      EmitFlagVelocity = 4_i64
      EmitFlagColor = 8_i64
      EmitFlagCustom = 16_i64
    end
    @@mb_set_flags : Void* = Pointer(Void).null
    def set_flags(flags : Int64) : Void
      if @@mb_set_flags.null?
        @@mb_set_flags = Bridge.get_method_bind("VisualShaderNodeParticleEmit", "set_flags", 3960756792_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_flags : Void* = Pointer(Void).null
    def get_flags() : Int64
      if @@mb_get_flags.null?
        @@mb_get_flags = Bridge.get_method_bind("VisualShaderNodeParticleEmit", "get_flags", 171277835_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A visual shader node that makes particles emitted in a shape defined by a `Mesh`.
  #
  # `VisualShaderNodeParticleEmitter` that makes the particles emitted in a shape of the assigned `mesh`. It will emit from the mesh's surfaces, either all or only the specified one.
  class VisualShaderNodeParticleMeshEmitter < Godot::VisualShaderNodeParticleEmitter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_mesh : Void* = Pointer(Void).null
    def set_mesh(mesh : Mesh) : Void
      if @@mb_set_mesh.null?
        @@mb_set_mesh = Bridge.get_method_bind("VisualShaderNodeParticleMeshEmitter", "set_mesh", 194775623_i64)
      end
      arg_ptr_0 = mesh ? mesh.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_mesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_mesh : Void* = Pointer(Void).null
    def get_mesh() : Mesh
      if @@mb_get_mesh.null?
        @@mb_get_mesh = Bridge.get_method_bind("VisualShaderNodeParticleMeshEmitter", "get_mesh", 1808005922_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_mesh, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Mesh.new(ret_ptr)
    end
    @@mb_set_use_all_surfaces : Void* = Pointer(Void).null
    def set_use_all_surfaces(enabled : Bool) : Void
      if @@mb_set_use_all_surfaces.null?
        @@mb_set_use_all_surfaces = Bridge.get_method_bind("VisualShaderNodeParticleMeshEmitter", "set_use_all_surfaces", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_all_surfaces, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_use_all_surfaces : Void* = Pointer(Void).null
    def is_use_all_surfaces() : Bool
      if @@mb_is_use_all_surfaces.null?
        @@mb_is_use_all_surfaces = Bridge.get_method_bind("VisualShaderNodeParticleMeshEmitter", "is_use_all_surfaces", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_use_all_surfaces, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_surface_index : Void* = Pointer(Void).null
    def set_surface_index(surface_index : Int64) : Void
      if @@mb_set_surface_index.null?
        @@mb_set_surface_index = Bridge.get_method_bind("VisualShaderNodeParticleMeshEmitter", "set_surface_index", 1286410249_i64)
      end
      val_0 = surface_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_surface_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_surface_index : Void* = Pointer(Void).null
    def get_surface_index() : Int64
      if @@mb_get_surface_index.null?
        @@mb_get_surface_index = Bridge.get_method_bind("VisualShaderNodeParticleMeshEmitter", "get_surface_index", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_surface_index, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A visual shader helper node for multiplying position and rotation of particles.
  #
  # This node helps to multiply a position input vector by rotation using specific axis. Intended to work with emitters.
  class VisualShaderNodeParticleMultiplyByAxisAngle < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_degrees_mode : Void* = Pointer(Void).null
    def set_degrees_mode(enabled : Bool) : Void
      if @@mb_set_degrees_mode.null?
        @@mb_set_degrees_mode = Bridge.get_method_bind("VisualShaderNodeParticleMultiplyByAxisAngle", "set_degrees_mode", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_degrees_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_degrees_mode : Void* = Pointer(Void).null
    def is_degrees_mode() : Bool
      if @@mb_is_degrees_mode.null?
        @@mb_is_degrees_mode = Bridge.get_method_bind("VisualShaderNodeParticleMultiplyByAxisAngle", "is_degrees_mode", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_degrees_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # Visual shader node that defines output values for particle emitting.
  #
  # This node defines how particles are emitted. It allows to customize e.g. position and velocity. Available ports are different depending on which function this node is inside (start, process, collision) and whether custom data is enabled.
  class VisualShaderNodeParticleOutput < Godot::VisualShaderNodeOutput
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Visual shader node for randomizing particle values.
  #
  # Randomness node will output pseudo-random values of the given type based on the specified minimum and maximum values.
  class VisualShaderNodeParticleRandomness < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum OpType : Int64
      OpTypeScalar = 0_i64
      OpTypeVector2d = 1_i64
      OpTypeVector3d = 2_i64
      OpTypeVector4d = 3_i64
      OpTypeMax = 4_i64
    end
    @@mb_set_op_type : Void* = Pointer(Void).null
    def set_op_type(get_type : Int64) : Void
      if @@mb_set_op_type.null?
        @@mb_set_op_type = Bridge.get_method_bind("VisualShaderNodeParticleRandomness", "set_op_type", 2060089061_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_op_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_op_type : Void* = Pointer(Void).null
    def get_op_type() : Int64
      if @@mb_get_op_type.null?
        @@mb_get_op_type = Bridge.get_method_bind("VisualShaderNodeParticleRandomness", "get_op_type", 3597061078_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_op_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A visual shader node that makes particles emitted in a ring shape.
  #
  # `VisualShaderNodeParticleEmitter` that makes the particles emitted in ring shape with the specified inner and outer radii and height.
  class VisualShaderNodeParticleRingEmitter < Godot::VisualShaderNodeParticleEmitter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node that makes particles emitted in a sphere shape.
  #
  # `VisualShaderNodeParticleEmitter` that makes the particles emitted in sphere shape with the specified inner and outer radii.
  class VisualShaderNodeParticleSphereEmitter < Godot::VisualShaderNodeParticleEmitter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node representing proximity fade effect.
  #
  # The proximity fade effect fades out each pixel based on its distance to another object.
  class VisualShaderNodeProximityFade < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node that generates a pseudo-random scalar.
  #
  # Random range node will output a pseudo-random scalar value in the specified range, based on the seed. The value is always the same for the given seed and range, so you should provide a changing input, e.g. by using time.
  class VisualShaderNodeRandomRange < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node for remap function.
  #
  # Remap will transform the input range into output range, e.g. you can change a `0..1` value to `-2..2` etc. See [method @GlobalScope.remap] for more details.
  class VisualShaderNodeRemap < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum OpType : Int64
      OpTypeScalar = 0_i64
      OpTypeVector2d = 1_i64
      OpTypeVector2dScalar = 2_i64
      OpTypeVector3d = 3_i64
      OpTypeVector3dScalar = 4_i64
      OpTypeVector4d = 5_i64
      OpTypeVector4dScalar = 6_i64
      OpTypeMax = 7_i64
    end
    @@mb_set_op_type : Void* = Pointer(Void).null
    def set_op_type(op_type : Int64) : Void
      if @@mb_set_op_type.null?
        @@mb_set_op_type = Bridge.get_method_bind("VisualShaderNodeRemap", "set_op_type", 1703697889_i64)
      end
      val_0 = op_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_op_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_op_type : Void* = Pointer(Void).null
    def get_op_type() : Int64
      if @@mb_get_op_type.null?
        @@mb_get_op_type = Bridge.get_method_bind("VisualShaderNodeRemap", "get_op_type", 1678380563_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_op_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A node that allows rerouting a connection within the visual shader graph.
  #
  # Automatically adapts its port type to the type of the incoming connection and ensures valid connections.
  class VisualShaderNodeReroute < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_port_type : Void* = Pointer(Void).null
    # Returns the port type of the reroute node.
    def get_port_type() : Int64
      if @@mb_get_port_type.null?
        @@mb_get_port_type = Bridge.get_method_bind("VisualShaderNodeReroute", "get_port_type", 1287173294_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_port_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A visual shader node that modifies the rotation of the object using a rotation matrix.
  #
  # RotationByAxis node will transform the vertices of a mesh with specified axis and angle in radians. It can be used to rotate an object in an arbitrary axis.
  class VisualShaderNodeRotationByAxis < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # SDF raymarching algorithm to be used within the visual shader graph.
  #
  # Casts a ray against the screen SDF (signed-distance field) and returns the distance travelled.
  class VisualShaderNodeSDFRaymarch < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A function to convert an SDF (signed-distance field) to screen UV, to be used within the visual shader graph.
  #
  # Translates to `sdf_to_screen_uv(sdf_pos)` in the shader language.
  class VisualShaderNodeSDFToScreenUV < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A base node for nodes which samples 3D textures in the visual shader graph.
  #
  # A virtual class, use the descendants instead.
  class VisualShaderNodeSample3D < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Source : Int64
      SourceTexture = 0_i64
      SourcePort = 1_i64
      SourceMax = 2_i64
    end
    @@mb_set_source : Void* = Pointer(Void).null
    def set_source(value : Int64) : Void
      if @@mb_set_source.null?
        @@mb_set_source = Bridge.get_method_bind("VisualShaderNodeSample3D", "set_source", 3315130991_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_source, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_source : Void* = Pointer(Void).null
    def get_source() : Int64
      if @@mb_get_source.null?
        @@mb_get_source = Bridge.get_method_bind("VisualShaderNodeSample3D", "get_source", 1079494121_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_source, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A visual shader node that unpacks the screen normal texture in World Space.
  #
  # The ScreenNormalWorldSpace node allows to create outline effects.
  class VisualShaderNodeScreenNormalWorldSpace < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A function to convert screen UV to an SDF (signed-distance field), to be used within the visual shader graph.
  #
  # Translates to `screen_uv_to_sdf(uv)` in the shader language. If the UV port isn't connected, `SCREEN_UV` is used instead.
  class VisualShaderNodeScreenUVToSDF < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Calculates a SmoothStep function within the visual shader graph.
  #
  # Translates to `smoothstep(edge0, edge1, x)` in the shader language.
  # Returns `0.0` if `x` is smaller than `edge0` and `1.0` if `x` is larger than `edge1`. Otherwise, the return value is interpolated between `0.0` and `1.0` using Hermite polynomials.
  class VisualShaderNodeSmoothStep < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum OpType : Int64
      OpTypeScalar = 0_i64
      OpTypeVector2d = 1_i64
      OpTypeVector2dScalar = 2_i64
      OpTypeVector3d = 3_i64
      OpTypeVector3dScalar = 4_i64
      OpTypeVector4d = 5_i64
      OpTypeVector4dScalar = 6_i64
      OpTypeMax = 7_i64
    end
    @@mb_set_op_type : Void* = Pointer(Void).null
    def set_op_type(op_type : Int64) : Void
      if @@mb_set_op_type.null?
        @@mb_set_op_type = Bridge.get_method_bind("VisualShaderNodeSmoothStep", "set_op_type", 2427426148_i64)
      end
      val_0 = op_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_op_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_op_type : Void* = Pointer(Void).null
    def get_op_type() : Int64
      if @@mb_get_op_type.null?
        @@mb_get_op_type = Bridge.get_method_bind("VisualShaderNodeSmoothStep", "get_op_type", 359640855_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_op_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Calculates a Step function within the visual shader graph.
  #
  # Translates to `step(edge, x)` in the shader language.
  # Returns `0.0` if `x` is smaller than `edge` and `1.0` otherwise.
  class VisualShaderNodeStep < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum OpType : Int64
      OpTypeScalar = 0_i64
      OpTypeVector2d = 1_i64
      OpTypeVector2dScalar = 2_i64
      OpTypeVector3d = 3_i64
      OpTypeVector3dScalar = 4_i64
      OpTypeVector4d = 5_i64
      OpTypeVector4dScalar = 6_i64
      OpTypeMax = 7_i64
    end
    @@mb_set_op_type : Void* = Pointer(Void).null
    def set_op_type(op_type : Int64) : Void
      if @@mb_set_op_type.null?
        @@mb_set_op_type = Bridge.get_method_bind("VisualShaderNodeStep", "set_op_type", 715172489_i64)
      end
      val_0 = op_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_op_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_op_type : Void* = Pointer(Void).null
    def get_op_type() : Int64
      if @@mb_get_op_type.null?
        @@mb_get_op_type = Bridge.get_method_bind("VisualShaderNodeStep", "get_op_type", 3274022781_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_op_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A selector function for use within the visual shader graph.
  #
  # Returns an associated value of the `op_type` type if the provided boolean value is `true` or `false`.
  class VisualShaderNodeSwitch < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum OpType : Int64
      OpTypeFloat = 0_i64
      OpTypeInt = 1_i64
      OpTypeUint = 2_i64
      OpTypeVector2d = 3_i64
      OpTypeVector3d = 4_i64
      OpTypeVector4d = 5_i64
      OpTypeBoolean = 6_i64
      OpTypeTransform = 7_i64
      OpTypeMax = 8_i64
    end
    @@mb_set_op_type : Void* = Pointer(Void).null
    def set_op_type(get_type : Int64) : Void
      if @@mb_set_op_type.null?
        @@mb_set_op_type = Bridge.get_method_bind("VisualShaderNodeSwitch", "set_op_type", 510471861_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_op_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_op_type : Void* = Pointer(Void).null
    def get_op_type() : Int64
      if @@mb_get_op_type.null?
        @@mb_get_op_type = Bridge.get_method_bind("VisualShaderNodeSwitch", "get_op_type", 2517845071_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_op_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Performs a 2D texture lookup within the visual shader graph.
  #
  # Performs a lookup operation on the provided texture, with support for multiple texture sources to choose from.
  class VisualShaderNodeTexture < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Source : Int64
      SourceTexture = 0_i64
      SourceScreen = 1_i64
      Source2dTexture = 2_i64
      Source2dNormal = 3_i64
      SourceDepth = 4_i64
      SourcePort = 5_i64
      Source3dNormal = 6_i64
      SourceRoughness = 7_i64
      SourceMax = 8_i64
    end
    enum TextureType : Int64
      TypeData = 0_i64
      TypeColor = 1_i64
      TypeNormalMap = 2_i64
      TypeMax = 3_i64
    end
    @@mb_set_source : Void* = Pointer(Void).null
    def set_source(value : Int64) : Void
      if @@mb_set_source.null?
        @@mb_set_source = Bridge.get_method_bind("VisualShaderNodeTexture", "set_source", 905262939_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_source, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_source : Void* = Pointer(Void).null
    def get_source() : Int64
      if @@mb_get_source.null?
        @@mb_get_source = Bridge.get_method_bind("VisualShaderNodeTexture", "get_source", 2896297444_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_source, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(value : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("VisualShaderNodeTexture", "set_texture", 4051416890_i64)
      end
      arg_ptr_0 = value ? value.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("VisualShaderNodeTexture", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_texture_type : Void* = Pointer(Void).null
    def set_texture_type(value : Int64) : Void
      if @@mb_set_texture_type.null?
        @@mb_set_texture_type = Bridge.get_method_bind("VisualShaderNodeTexture", "set_texture_type", 986314081_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_type : Void* = Pointer(Void).null
    def get_texture_type() : Int64
      if @@mb_get_texture_type.null?
        @@mb_get_texture_type = Bridge.get_method_bind("VisualShaderNodeTexture", "get_texture_type", 3290430153_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_texture_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A 2D texture uniform array to be used within the visual shader graph.
  #
  # Translated to `uniform sampler2DArray` in the shader language.
  class VisualShaderNodeTexture2DArray < Godot::VisualShaderNodeSample3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_texture_array : Void* = Pointer(Void).null
    def set_texture_array(value : TextureLayered) : Void
      if @@mb_set_texture_array.null?
        @@mb_set_texture_array = Bridge.get_method_bind("VisualShaderNodeTexture2DArray", "set_texture_array", 1278366092_i64)
      end
      arg_ptr_0 = value ? value.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_array, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_array : Void* = Pointer(Void).null
    def get_texture_array() : TextureLayered
      if @@mb_get_texture_array.null?
        @@mb_get_texture_array = Bridge.get_method_bind("VisualShaderNodeTexture2DArray", "get_texture_array", 3984243839_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture_array, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      TextureLayered.new(ret_ptr)
    end
  end
  # A visual shader node for shader parameter (uniform) of type `Texture2DArray`.
  #
  # This parameter allows to provide a collection of textures for the shader. You can use `VisualShaderNodeTexture2DArray` to extract the textures from array.
  class VisualShaderNodeTexture2DArrayParameter < Godot::VisualShaderNodeTextureParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Provides a 2D texture parameter within the visual shader graph.
  #
  # Translated to `uniform sampler2D` in the shader language.
  class VisualShaderNodeTexture2DParameter < Godot::VisualShaderNodeTextureParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Performs a 3D texture lookup within the visual shader graph.
  #
  # Performs a lookup operation on the provided texture, with support for multiple texture sources to choose from.
  class VisualShaderNodeTexture3D < Godot::VisualShaderNodeSample3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(value : Texture3D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("VisualShaderNodeTexture3D", "set_texture", 1188404210_i64)
      end
      arg_ptr_0 = value ? value.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture3D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("VisualShaderNodeTexture3D", "get_texture", 373985333_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture3D.new(ret_ptr)
    end
  end
  # Provides a 3D texture parameter within the visual shader graph.
  #
  # Translated to `uniform sampler3D` in the shader language.
  class VisualShaderNodeTexture3DParameter < Godot::VisualShaderNodeTextureParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Performs a uniform texture lookup with triplanar within the visual shader graph.
  #
  # Performs a lookup operation on the texture provided as a uniform for the shader, with support for triplanar mapping.
  class VisualShaderNodeTextureParameterTriplanar < Godot::VisualShaderNodeTextureParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Performs an SDF (signed-distance field) texture lookup within the visual shader graph.
  #
  # Translates to `texture_sdf(sdf_pos)` in the shader language.
  class VisualShaderNodeTextureSDF < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Performs an SDF (signed-distance field) normal texture lookup within the visual shader graph.
  #
  # Translates to `texture_sdf_normal(sdf_pos)` in the shader language.
  class VisualShaderNodeTextureSDFNormal < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Composes a `Transform3D` from four `Vector3`s within the visual shader graph.
  #
  # Creates a 4×4 transform matrix using four vectors of type `vec3`. Each vector is one row in the matrix and the last column is a `vec4(0, 0, 0, 1)`.
  class VisualShaderNodeTransformCompose < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A `Transform3D` constant for use within the visual shader graph.
  #
  # A constant `Transform3D`, which can be used as an input node.
  class VisualShaderNodeTransformConstant < Godot::VisualShaderNodeConstant
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_constant : Void* = Pointer(Void).null
    def set_constant(constant : Transform3D) : Void
      if @@mb_set_constant.null?
        @@mb_set_constant = Bridge.get_method_bind("VisualShaderNodeTransformConstant", "set_constant", 2952846383_i64)
      end
      val_0 = constant
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant : Void* = Pointer(Void).null
    def get_constant() : Transform3D
      if @@mb_get_constant.null?
        @@mb_get_constant = Bridge.get_method_bind("VisualShaderNodeTransformConstant", "get_constant", 3229777777_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_constant, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Decomposes a `Transform3D` into four `Vector3`s within the visual shader graph.
  #
  # Takes a 4×4 transform matrix and decomposes it into four `vec3` values, one from each row of the matrix.
  class VisualShaderNodeTransformDecompose < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Computes a `Transform3D` function within the visual shader graph.
  #
  # Computes an inverse or transpose function on the provided `Transform3D`.
  class VisualShaderNodeTransformFunc < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Function : Int64
      FuncInverse = 0_i64
      FuncTranspose = 1_i64
      FuncMax = 2_i64
    end
    @@mb_set_function : Void* = Pointer(Void).null
    def set_function(func : Int64) : Void
      if @@mb_set_function.null?
        @@mb_set_function = Bridge.get_method_bind("VisualShaderNodeTransformFunc", "set_function", 2900990409_i64)
      end
      val_0 = func
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_function, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_function : Void* = Pointer(Void).null
    def get_function() : Int64
      if @@mb_get_function.null?
        @@mb_get_function = Bridge.get_method_bind("VisualShaderNodeTransformFunc", "get_function", 2839926569_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_function, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Transform3D` operator to be used within the visual shader graph.
  #
  # Applies `operator` to two transform (4×4 matrices) inputs.
  class VisualShaderNodeTransformOp < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Operator : Int64
      OpAxb = 0_i64
      OpBxa = 1_i64
      OpAxbComp = 2_i64
      OpBxaComp = 3_i64
      OpAdd = 4_i64
      OpAMinusB = 5_i64
      OpBMinusA = 6_i64
      OpADivB = 7_i64
      OpBDivA = 8_i64
      OpMax = 9_i64
    end
    @@mb_set_operator : Void* = Pointer(Void).null
    def set_operator(op : Int64) : Void
      if @@mb_set_operator.null?
        @@mb_set_operator = Bridge.get_method_bind("VisualShaderNodeTransformOp", "set_operator", 2287310733_i64)
      end
      val_0 = op
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_operator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_operator : Void* = Pointer(Void).null
    def get_operator() : Int64
      if @@mb_get_operator.null?
        @@mb_get_operator = Bridge.get_method_bind("VisualShaderNodeTransformOp", "get_operator", 1238663601_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_operator, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Transform3D` parameter for use within the visual shader graph.
  #
  # Translated to `uniform mat4` in the shader language.
  class VisualShaderNodeTransformParameter < Godot::VisualShaderNodeParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_default_value_enabled : Void* = Pointer(Void).null
    def set_default_value_enabled(enabled : Bool) : Void
      if @@mb_set_default_value_enabled.null?
        @@mb_set_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeTransformParameter", "set_default_value_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_default_value_enabled : Void* = Pointer(Void).null
    def is_default_value_enabled() : Bool
      if @@mb_is_default_value_enabled.null?
        @@mb_is_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeTransformParameter", "is_default_value_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_default_value_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_default_value : Void* = Pointer(Void).null
    def set_default_value(value : Transform3D) : Void
      if @@mb_set_default_value.null?
        @@mb_set_default_value = Bridge.get_method_bind("VisualShaderNodeTransformParameter", "set_default_value", 2952846383_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_value : Void* = Pointer(Void).null
    def get_default_value() : Transform3D
      if @@mb_get_default_value.null?
        @@mb_get_default_value = Bridge.get_method_bind("VisualShaderNodeTransformParameter", "get_default_value", 3229777777_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_default_value, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Multiplies a `Transform3D` and a `Vector3` within the visual shader graph.
  #
  # A multiplication operation on a transform (4×4 matrix) and a vector, with support for different multiplication operators.
  class VisualShaderNodeTransformVecMult < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Operator : Int64
      OpAxb = 0_i64
      OpBxa = 1_i64
      Op3x3Axb = 2_i64
      Op3x3Bxa = 3_i64
      OpMax = 4_i64
    end
    @@mb_set_operator : Void* = Pointer(Void).null
    def set_operator(op : Int64) : Void
      if @@mb_set_operator.null?
        @@mb_set_operator = Bridge.get_method_bind("VisualShaderNodeTransformVecMult", "set_operator", 1785665912_i64)
      end
      val_0 = op
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_operator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_operator : Void* = Pointer(Void).null
    def get_operator() : Int64
      if @@mb_get_operator.null?
        @@mb_get_operator = Bridge.get_method_bind("VisualShaderNodeTransformVecMult", "get_operator", 1622088722_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_operator, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # An unsigned scalar integer constant to be used within the visual shader graph.
  #
  # Translated to `uint` in the shader language.
  class VisualShaderNodeUIntConstant < Godot::VisualShaderNodeConstant
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_constant : Void* = Pointer(Void).null
    def set_constant(constant : Int64) : Void
      if @@mb_set_constant.null?
        @@mb_set_constant = Bridge.get_method_bind("VisualShaderNodeUIntConstant", "set_constant", 1286410249_i64)
      end
      val_0 = constant
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant : Void* = Pointer(Void).null
    def get_constant() : Int64
      if @@mb_get_constant.null?
        @@mb_get_constant = Bridge.get_method_bind("VisualShaderNodeUIntConstant", "get_constant", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_constant, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # An unsigned scalar integer function to be used within the visual shader graph.
  #
  # Accept an unsigned integer scalar (`x`) to the input port and transform it according to `function`.
  class VisualShaderNodeUIntFunc < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Function : Int64
      FuncNegate = 0_i64
      FuncBitwiseNot = 1_i64
      FuncMax = 2_i64
    end
    @@mb_set_function : Void* = Pointer(Void).null
    def set_function(func : Int64) : Void
      if @@mb_set_function.null?
        @@mb_set_function = Bridge.get_method_bind("VisualShaderNodeUIntFunc", "set_function", 2273148961_i64)
      end
      val_0 = func
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_function, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_function : Void* = Pointer(Void).null
    def get_function() : Int64
      if @@mb_get_function.null?
        @@mb_get_function = Bridge.get_method_bind("VisualShaderNodeUIntFunc", "get_function", 4187123296_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_function, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # An unsigned integer scalar operator to be used within the visual shader graph.
  #
  # Applies `operator` to two unsigned integer inputs: `a` and `b`.
  class VisualShaderNodeUIntOp < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Operator : Int64
      OpAdd = 0_i64
      OpSub = 1_i64
      OpMul = 2_i64
      OpDiv = 3_i64
      OpMod = 4_i64
      OpMax = 5_i64
      OpMin = 6_i64
      OpBitwiseAnd = 7_i64
      OpBitwiseOr = 8_i64
      OpBitwiseXor = 9_i64
      OpBitwiseLeftShift = 10_i64
      OpBitwiseRightShift = 11_i64
      OpEnumSize = 12_i64
    end
    @@mb_set_operator : Void* = Pointer(Void).null
    def set_operator(op : Int64) : Void
      if @@mb_set_operator.null?
        @@mb_set_operator = Bridge.get_method_bind("VisualShaderNodeUIntOp", "set_operator", 3463048345_i64)
      end
      val_0 = op
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_operator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_operator : Void* = Pointer(Void).null
    def get_operator() : Int64
      if @@mb_get_operator.null?
        @@mb_get_operator = Bridge.get_method_bind("VisualShaderNodeUIntOp", "get_operator", 256631461_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_operator, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A visual shader node for shader parameter (uniform) of type unsigned `int`.
  #
  # A `VisualShaderNodeParameter` of type unsigned `int`. Offers additional customization for range of accepted values.
  class VisualShaderNodeUIntParameter < Godot::VisualShaderNodeParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_default_value_enabled : Void* = Pointer(Void).null
    def set_default_value_enabled(enabled : Bool) : Void
      if @@mb_set_default_value_enabled.null?
        @@mb_set_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeUIntParameter", "set_default_value_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_default_value_enabled : Void* = Pointer(Void).null
    def is_default_value_enabled() : Bool
      if @@mb_is_default_value_enabled.null?
        @@mb_is_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeUIntParameter", "is_default_value_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_default_value_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_default_value : Void* = Pointer(Void).null
    def set_default_value(value : Int64) : Void
      if @@mb_set_default_value.null?
        @@mb_set_default_value = Bridge.get_method_bind("VisualShaderNodeUIntParameter", "set_default_value", 1286410249_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_value : Void* = Pointer(Void).null
    def get_default_value() : Int64
      if @@mb_get_default_value.null?
        @@mb_get_default_value = Bridge.get_method_bind("VisualShaderNodeUIntParameter", "get_default_value", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_default_value, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Contains functions to modify texture coordinates (`uv`) to be used within the visual shader graph.
  #
  # UV functions are similar to `Vector2` functions, but the input port of this node uses the shader's UV value by default.
  class VisualShaderNodeUVFunc < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Function : Int64
      FuncPanning = 0_i64
      FuncScaling = 1_i64
      FuncMax = 2_i64
    end
    @@mb_set_function : Void* = Pointer(Void).null
    def set_function(func : Int64) : Void
      if @@mb_set_function.null?
        @@mb_set_function = Bridge.get_method_bind("VisualShaderNodeUVFunc", "set_function", 765791915_i64)
      end
      val_0 = func
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_function, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_function : Void* = Pointer(Void).null
    def get_function() : Int64
      if @@mb_get_function.null?
        @@mb_get_function = Bridge.get_method_bind("VisualShaderNodeUVFunc", "get_function", 3772902164_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_function, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A visual shader node that modifies the texture UV using polar coordinates.
  #
  # UV polar coord node will transform UV values into polar coordinates, with specified scale, zoom strength and repeat parameters. It can be used to create various swirl distortions.
  class VisualShaderNodeUVPolarCoord < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node that represents a "varying" shader value.
  #
  # Varying values are shader variables that can be passed between shader functions, e.g. from Vertex shader to Fragment shader.
  class VisualShaderNodeVarying < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_varying_name : Void* = Pointer(Void).null
    def set_varying_name(name : String) : Void
      if @@mb_set_varying_name.null?
        @@mb_set_varying_name = Bridge.get_method_bind("VisualShaderNodeVarying", "set_varying_name", 83702148_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_varying_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_varying_name : Void* = Pointer(Void).null
    def get_varying_name() : String
      if @@mb_get_varying_name.null?
        @@mb_get_varying_name = Bridge.get_method_bind("VisualShaderNodeVarying", "get_varying_name", 201670096_i64)
      end
      ""
    end
    @@mb_set_varying_type : Void* = Pointer(Void).null
    def set_varying_type(get_type : Int64) : Void
      if @@mb_set_varying_type.null?
        @@mb_set_varying_type = Bridge.get_method_bind("VisualShaderNodeVarying", "set_varying_type", 3565867981_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_varying_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_varying_type : Void* = Pointer(Void).null
    def get_varying_type() : Int64
      if @@mb_get_varying_type.null?
        @@mb_get_varying_type = Bridge.get_method_bind("VisualShaderNodeVarying", "get_varying_type", 523183580_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_varying_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A visual shader node that gets a value of a varying.
  #
  # Outputs a value of a varying defined in the shader. You need to first create a varying that can be used in the given function, e.g. varying getter in Fragment shader requires a varying with mode set to `VisualShader.VARYING_MODE_VERTEX_TO_FRAG_LIGHT`.
  class VisualShaderNodeVaryingGetter < Godot::VisualShaderNodeVarying
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node that sets a value of a varying.
  #
  # Inputs a value to a varying defined in the shader. You need to first create a varying that can be used in the given function, e.g. varying setter in Fragment shader requires a varying with mode set to `VisualShader.VARYING_MODE_FRAG_TO_LIGHT`.
  class VisualShaderNodeVaryingSetter < Godot::VisualShaderNodeVarying
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A `Vector2` constant to be used within the visual shader graph.
  #
  # A constant `Vector2`, which can be used as an input node.
  class VisualShaderNodeVec2Constant < Godot::VisualShaderNodeConstant
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_constant : Void* = Pointer(Void).null
    def set_constant(constant : Vector2) : Void
      if @@mb_set_constant.null?
        @@mb_set_constant = Bridge.get_method_bind("VisualShaderNodeVec2Constant", "set_constant", 743155724_i64)
      end
      val_0 = constant
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant : Void* = Pointer(Void).null
    def get_constant() : Vector2
      if @@mb_get_constant.null?
        @@mb_get_constant = Bridge.get_method_bind("VisualShaderNodeVec2Constant", "get_constant", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_constant, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Vector2` parameter to be used within the visual shader graph.
  #
  # Translated to `uniform vec2` in the shader language.
  class VisualShaderNodeVec2Parameter < Godot::VisualShaderNodeParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_default_value_enabled : Void* = Pointer(Void).null
    def set_default_value_enabled(enabled : Bool) : Void
      if @@mb_set_default_value_enabled.null?
        @@mb_set_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeVec2Parameter", "set_default_value_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_default_value_enabled : Void* = Pointer(Void).null
    def is_default_value_enabled() : Bool
      if @@mb_is_default_value_enabled.null?
        @@mb_is_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeVec2Parameter", "is_default_value_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_default_value_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_default_value : Void* = Pointer(Void).null
    def set_default_value(value : Vector2) : Void
      if @@mb_set_default_value.null?
        @@mb_set_default_value = Bridge.get_method_bind("VisualShaderNodeVec2Parameter", "set_default_value", 743155724_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_value : Void* = Pointer(Void).null
    def get_default_value() : Vector2
      if @@mb_get_default_value.null?
        @@mb_get_default_value = Bridge.get_method_bind("VisualShaderNodeVec2Parameter", "get_default_value", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_default_value, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Vector3` constant to be used within the visual shader graph.
  #
  # A constant `Vector3`, which can be used as an input node.
  class VisualShaderNodeVec3Constant < Godot::VisualShaderNodeConstant
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_constant : Void* = Pointer(Void).null
    def set_constant(constant : Vector3) : Void
      if @@mb_set_constant.null?
        @@mb_set_constant = Bridge.get_method_bind("VisualShaderNodeVec3Constant", "set_constant", 3460891852_i64)
      end
      val_0 = constant
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant : Void* = Pointer(Void).null
    def get_constant() : Vector3
      if @@mb_get_constant.null?
        @@mb_get_constant = Bridge.get_method_bind("VisualShaderNodeVec3Constant", "get_constant", 3360562783_i64)
      end
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_constant, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A `Vector3` parameter to be used within the visual shader graph.
  #
  # Translated to `uniform vec3` in the shader language.
  class VisualShaderNodeVec3Parameter < Godot::VisualShaderNodeParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_default_value_enabled : Void* = Pointer(Void).null
    def set_default_value_enabled(enabled : Bool) : Void
      if @@mb_set_default_value_enabled.null?
        @@mb_set_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeVec3Parameter", "set_default_value_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_default_value_enabled : Void* = Pointer(Void).null
    def is_default_value_enabled() : Bool
      if @@mb_is_default_value_enabled.null?
        @@mb_is_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeVec3Parameter", "is_default_value_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_default_value_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_default_value : Void* = Pointer(Void).null
    def set_default_value(value : Vector3) : Void
      if @@mb_set_default_value.null?
        @@mb_set_default_value = Bridge.get_method_bind("VisualShaderNodeVec3Parameter", "set_default_value", 3460891852_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_value : Void* = Pointer(Void).null
    def get_default_value() : Vector3
      if @@mb_get_default_value.null?
        @@mb_get_default_value = Bridge.get_method_bind("VisualShaderNodeVec3Parameter", "get_default_value", 3360562783_i64)
      end
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_default_value, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A 4D vector constant to be used within the visual shader graph.
  #
  # A constant 4D vector, which can be used as an input node.
  class VisualShaderNodeVec4Constant < Godot::VisualShaderNodeConstant
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_constant : Void* = Pointer(Void).null
    def set_constant(constant : Quaternion) : Void
      if @@mb_set_constant.null?
        @@mb_set_constant = Bridge.get_method_bind("VisualShaderNodeVec4Constant", "set_constant", 1727505552_i64)
      end
      val_0 = constant
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant : Void* = Pointer(Void).null
    def get_constant() : Quaternion
      if @@mb_get_constant.null?
        @@mb_get_constant = Bridge.get_method_bind("VisualShaderNodeVec4Constant", "get_constant", 1222331677_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_constant, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Quaternion.new(ret_ptr)
    end
  end
  # A 4D vector parameter to be used within the visual shader graph.
  #
  # Translated to `uniform vec4` in the shader language.
  class VisualShaderNodeVec4Parameter < Godot::VisualShaderNodeParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_default_value_enabled : Void* = Pointer(Void).null
    def set_default_value_enabled(enabled : Bool) : Void
      if @@mb_set_default_value_enabled.null?
        @@mb_set_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeVec4Parameter", "set_default_value_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_default_value_enabled : Void* = Pointer(Void).null
    def is_default_value_enabled() : Bool
      if @@mb_is_default_value_enabled.null?
        @@mb_is_default_value_enabled = Bridge.get_method_bind("VisualShaderNodeVec4Parameter", "is_default_value_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_default_value_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_default_value : Void* = Pointer(Void).null
    def set_default_value(value : Vector4) : Void
      if @@mb_set_default_value.null?
        @@mb_set_default_value = Bridge.get_method_bind("VisualShaderNodeVec4Parameter", "set_default_value", 643568085_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_value : Void* = Pointer(Void).null
    def get_default_value() : Vector4
      if @@mb_get_default_value.null?
        @@mb_get_default_value = Bridge.get_method_bind("VisualShaderNodeVec4Parameter", "get_default_value", 2435802345_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_default_value, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Vector4.new(ret_ptr)
    end
  end
  # Composes a `Vector2`, `Vector3` or 4D vector (represented as a `Quaternion`) from scalars within the visual shader graph.
  #
  # Creates a `vec2`, `vec3` or `vec4` using scalar values that can be provided from separate inputs.
  class VisualShaderNodeVectorCompose < Godot::VisualShaderNodeVectorBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Decomposes a `Vector2`, `Vector3` or 4D vector (represented as a `Quaternion`) into scalars within the visual shader graph.
  #
  # Takes a `vec2`, `vec3` or `vec4` and decomposes it into scalar values that can be used as separate outputs.
  class VisualShaderNodeVectorDecompose < Godot::VisualShaderNodeVectorBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Returns the distance between two points. To be used within the visual shader graph.
  #
  # Calculates distance from point represented by vector `p0` to vector `p1`.
  # Translated to `distance(p0, p1)` in the shader language.
  class VisualShaderNodeVectorDistance < Godot::VisualShaderNodeVectorBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A vector function to be used within the visual shader graph.
  #
  # A visual shader node able to perform different functions using vectors.
  class VisualShaderNodeVectorFunc < Godot::VisualShaderNodeVectorBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Function : Int64
      FuncNormalize = 0_i64
      FuncSaturate = 1_i64
      FuncNegate = 2_i64
      FuncReciprocal = 3_i64
      FuncAbs = 4_i64
      FuncAcos = 5_i64
      FuncAcosh = 6_i64
      FuncAsin = 7_i64
      FuncAsinh = 8_i64
      FuncAtan = 9_i64
      FuncAtanh = 10_i64
      FuncCeil = 11_i64
      FuncCos = 12_i64
      FuncCosh = 13_i64
      FuncDegrees = 14_i64
      FuncExp = 15_i64
      FuncExp2 = 16_i64
      FuncFloor = 17_i64
      FuncFract = 18_i64
      FuncInverseSqrt = 19_i64
      FuncLog = 20_i64
      FuncLog2 = 21_i64
      FuncRadians = 22_i64
      FuncRound = 23_i64
      FuncRoundeven = 24_i64
      FuncSign = 25_i64
      FuncSin = 26_i64
      FuncSinh = 27_i64
      FuncSqrt = 28_i64
      FuncTan = 29_i64
      FuncTanh = 30_i64
      FuncTrunc = 31_i64
      FuncOneminus = 32_i64
      FuncMax = 33_i64
    end
    @@mb_set_function : Void* = Pointer(Void).null
    def set_function(func : Int64) : Void
      if @@mb_set_function.null?
        @@mb_set_function = Bridge.get_method_bind("VisualShaderNodeVectorFunc", "set_function", 629964457_i64)
      end
      val_0 = func
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_function, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_function : Void* = Pointer(Void).null
    def get_function() : Int64
      if @@mb_get_function.null?
        @@mb_get_function = Bridge.get_method_bind("VisualShaderNodeVectorFunc", "get_function", 4047776843_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_function, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Returns the length of a `Vector3` within the visual shader graph.
  #
  # Translated to `length(p0)` in the shader language.
  class VisualShaderNodeVectorLen < Godot::VisualShaderNodeVectorBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A vector operator to be used within the visual shader graph.
  #
  # A visual shader node for use of vector operators. Operates on vector `a` and vector `b`.
  class VisualShaderNodeVectorOp < Godot::VisualShaderNodeVectorBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Operator : Int64
      OpAdd = 0_i64
      OpSub = 1_i64
      OpMul = 2_i64
      OpDiv = 3_i64
      OpMod = 4_i64
      OpPow = 5_i64
      OpMax = 6_i64
      OpMin = 7_i64
      OpCross = 8_i64
      OpAtan2 = 9_i64
      OpReflect = 10_i64
      OpStep = 11_i64
      OpEnumSize = 12_i64
    end
    @@mb_set_operator : Void* = Pointer(Void).null
    def set_operator(op : Int64) : Void
      if @@mb_set_operator.null?
        @@mb_set_operator = Bridge.get_method_bind("VisualShaderNodeVectorOp", "set_operator", 3371507302_i64)
      end
      val_0 = op
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_operator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_operator : Void* = Pointer(Void).null
    def get_operator() : Int64
      if @@mb_get_operator.null?
        @@mb_get_operator = Bridge.get_method_bind("VisualShaderNodeVectorOp", "get_operator", 11793929_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_operator, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Returns the vector that points in the direction of refraction. For use within the visual shader graph.
  #
  # Translated to `refract(I, N, eta)` in the shader language, where `I` is the incident vector, `N` is the normal vector and `eta` is the ratio of the indices of the refraction.
  class VisualShaderNodeVectorRefract < Godot::VisualShaderNodeVectorBase
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A visual shader node that calculates the position of the pixel in world space using the depth texture.
  #
  # The WorldPositionFromDepth node reconstructs the depth position of the pixel in world space. This can be used to obtain world space UVs for projection mapping like Caustics.
  class VisualShaderNodeWorldPositionFromDepth < Godot::VisualShaderNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Real-time global illumination (GI) probe.
  #
  # `VoxelGI`s are used to provide high-quality real-time indirect light and reflections to scenes. They precompute the effect of objects that emit light and the effect of static geometry to simulate the behavior of complex light in real-time. `VoxelGI`s need to be baked before having a visible effect. However, once baked, dynamic objects will receive light from them. Furthermore, lights can be fully dynamic or baked.
  # **Note:** `VoxelGI` is only supported in the Forward+ rendering method, not Mobile or Compatibility.
  # **Procedural generation:** `VoxelGI` can be baked in an exported project, which makes it suitable for procedurally generated or user-built levels as long as all the geometry is generated in advance. For games where geometry is generated at any time during gameplay, SDFGI is more suitable (see `Environment.sdfgi_enabled`).
  # **Performance:** `VoxelGI` is relatively demanding on the GPU and is not suited to low-end hardware such as integrated graphics (consider `LightmapGI` instead). To improve performance, adjust [member ProjectSettings.rendering/global_illumination/voxel_gi/quality] and enable [member ProjectSettings.rendering/global_illumination/gi/use_half_resolution] in the Project Settings. To provide a fallback for low-end hardware, consider adding an option to disable `VoxelGI` in your project's options menus. A `VoxelGI` node can be disabled by hiding it.
  # **Note:** Meshes should have sufficiently thick walls to avoid light leaks (avoid one-sided walls). For interior levels, enclose your level geometry in a sufficiently large box and bridge the loops to close the mesh. To further prevent light leaks, you can also strategically place temporary `MeshInstance3D` nodes with their `GeometryInstance3D.gi_mode` set to `GeometryInstance3D.GI_MODE_STATIC`. These temporary nodes can then be hidden after baking the `VoxelGI` node.
  class VoxelGI < Godot::VisualInstance3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Subdiv : Int64
      Subdiv64 = 0_i64
      Subdiv128 = 1_i64
      Subdiv256 = 2_i64
      Subdiv512 = 3_i64
      SubdivMax = 4_i64
    end
    @@mb_set_probe_data : Void* = Pointer(Void).null
    def set_probe_data(data : VoxelGIData) : Void
      if @@mb_set_probe_data.null?
        @@mb_set_probe_data = Bridge.get_method_bind("VoxelGI", "set_probe_data", 1637849675_i64)
      end
      arg_ptr_0 = data ? data.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_probe_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_probe_data : Void* = Pointer(Void).null
    def get_probe_data() : VoxelGIData
      if @@mb_get_probe_data.null?
        @@mb_get_probe_data = Bridge.get_method_bind("VoxelGI", "get_probe_data", 1730645405_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_probe_data, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      VoxelGIData.new(ret_ptr)
    end
    @@mb_set_subdiv : Void* = Pointer(Void).null
    def set_subdiv(subdiv : Int64) : Void
      if @@mb_set_subdiv.null?
        @@mb_set_subdiv = Bridge.get_method_bind("VoxelGI", "set_subdiv", 2240898472_i64)
      end
      val_0 = subdiv
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_subdiv, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_subdiv : Void* = Pointer(Void).null
    def get_subdiv() : Int64
      if @@mb_get_subdiv.null?
        @@mb_get_subdiv = Bridge.get_method_bind("VoxelGI", "get_subdiv", 4261647950_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_subdiv, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_size : Void* = Pointer(Void).null
    def set_size(size : Vector3) : Void
      if @@mb_set_size.null?
        @@mb_set_size = Bridge.get_method_bind("VoxelGI", "set_size", 3460891852_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_size : Void* = Pointer(Void).null
    def get_size() : Vector3
      if @@mb_get_size.null?
        @@mb_get_size = Bridge.get_method_bind("VoxelGI", "get_size", 3360562783_i64)
      end
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_camera_attributes : Void* = Pointer(Void).null
    def set_camera_attributes(camera_attributes : CameraAttributes) : Void
      if @@mb_set_camera_attributes.null?
        @@mb_set_camera_attributes = Bridge.get_method_bind("VoxelGI", "set_camera_attributes", 2817810567_i64)
      end
      arg_ptr_0 = camera_attributes ? camera_attributes.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_camera_attributes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_camera_attributes : Void* = Pointer(Void).null
    def get_camera_attributes() : CameraAttributes
      if @@mb_get_camera_attributes.null?
        @@mb_get_camera_attributes = Bridge.get_method_bind("VoxelGI", "get_camera_attributes", 3921283215_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_camera_attributes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      CameraAttributes.new(ret_ptr)
    end
    @@mb_bake : Void* = Pointer(Void).null
    # Bakes the effect from all `GeometryInstance3D`s marked with `GeometryInstance3D.GI_MODE_STATIC` and `Light3D`s marked with either `Light3D.BAKE_STATIC` or `Light3D.BAKE_DYNAMIC`. If `create_visual_debug` is `true`, after baking the light, this will generate a `MultiMesh` that has a cube representing each solid cell with each cube colored to the cell's albedo color. This can be used to visualize the `VoxelGI`'s data and debug any issues that may be occurring.
    # **Note:** `#bake` works from the editor and in exported projects. This makes it suitable for procedurally generated or user-built levels. Baking a `VoxelGI` node generally takes from 5 to 20 seconds in most scenes. Reducing `subdiv` can speed up baking.
    # **Note:** `GeometryInstance3D`s and `Light3D`s must be fully ready before `#bake` is called. If you are procedurally creating those and some meshes or lights are missing from your baked `VoxelGI`, use `call_deferred("bake")` instead of calling `#bake` directly.
    def bake(from_node : Node, create_visual_debug : Bool) : Void
      if @@mb_bake.null?
        @@mb_bake = Bridge.get_method_bind("VoxelGI", "bake", 2781551026_i64)
      end
      arg_ptr_0 = from_node ? from_node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = create_visual_debug
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_bake, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_debug_bake : Void* = Pointer(Void).null
    # Calls `#bake` with `create_visual_debug` enabled.
    def debug_bake() : Void
      if @@mb_debug_bake.null?
        @@mb_debug_bake = Bridge.get_method_bind("VoxelGI", "debug_bake", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_debug_bake, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
  end
  # Contains baked voxel global illumination data for use in a `VoxelGI` node.
  #
  # `VoxelGIData` contains baked voxel global illumination for use in a `VoxelGI` node. `VoxelGIData` also offers several properties to adjust the final appearance of the global illumination. These properties can be adjusted at run-time without having to bake the `VoxelGI` node again.
  # **Note:** To prevent text-based scene files (`.tscn`) from growing too much and becoming slow to load and save, always save `VoxelGIData` to an external binary resource file (`.res`) instead of embedding it within the scene. This can be done by clicking the dropdown arrow next to the `VoxelGIData` resource, choosing **Edit**, clicking the floppy disk icon at the top of the Inspector then choosing **Save As...**.
  class VoxelGIData < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_allocate : Void* = Pointer(Void).null
    # Initializes this `VoxelGIData` with the specified data. `octree_cells` must be a multiple of 32. `octree_cells` must be double the size of `data_cells`. The allocated data can be retrieved later using the various getter methods.
    def godot_allocate(to_cell_xform : Transform3D, aabb : AABB, octree_size : Vector3, octree_cells : Void*, data_cells : Void*, distance_field : Void*, level_counts : Void*) : Void
      if @@mb_allocate.null?
        @@mb_allocate = Bridge.get_method_bind("VoxelGIData", "allocate", 4041601946_i64)
      end
      val_0 = to_cell_xform
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = aabb
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = octree_size
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = octree_cells
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = data_cells
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = distance_field
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = level_counts
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      Bridge.ptrcall(@@mb_allocate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bounds : Void* = Pointer(Void).null
    # Returns the bounds of the baked voxel data as an `AABB`, which should match `VoxelGI.size` after being baked (which only contains the size as a `Vector3`).
    # **Note:** If the size was modified without baking the VoxelGI data, then the value of `#get_bounds` and `VoxelGI.size` will not match.
    def get_bounds() : AABB
      if @@mb_get_bounds.null?
        @@mb_get_bounds = Bridge.get_method_bind("VoxelGIData", "get_bounds", 1068685055_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bounds, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      AABB.new(ret_ptr)
    end
    @@mb_get_octree_size : Void* = Pointer(Void).null
    # Returns the baked octree size for this `VoxelGIData`, which corresponds to the number of subdivisions per axis. This can be viewed in the editor by hovering the **Bake VoxelGI** button at the top of the 3D editor viewport when a `VoxelGI` node is selected and looking at the **Subdivisions** field in the tooltip.
    def get_octree_size() : Vector3
      if @@mb_get_octree_size.null?
        @@mb_get_octree_size = Bridge.get_method_bind("VoxelGIData", "get_octree_size", 3360562783_i64)
      end
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_octree_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_to_cell_xform : Void* = Pointer(Void).null
    # Returns the baked cell transform for this `VoxelGIData`.
    def get_to_cell_xform() : Transform3D
      if @@mb_get_to_cell_xform.null?
        @@mb_get_to_cell_xform = Bridge.get_method_bind("VoxelGIData", "get_to_cell_xform", 3229777777_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_to_cell_xform, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_octree_cells : Void* = Pointer(Void).null
    # Returns the baked octree cell data for this `VoxelGIData`.
    def get_octree_cells() : Void*
      if @@mb_get_octree_cells.null?
        @@mb_get_octree_cells = Bridge.get_method_bind("VoxelGIData", "get_octree_cells", 2362200018_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_octree_cells, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_data_cells : Void* = Pointer(Void).null
    # Returns the baked cell data for this `VoxelGIData`.
    def get_data_cells() : Void*
      if @@mb_get_data_cells.null?
        @@mb_get_data_cells = Bridge.get_method_bind("VoxelGIData", "get_data_cells", 2362200018_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_data_cells, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_level_counts : Void* = Pointer(Void).null
    # Returns the baked level counts for this `VoxelGIData`.
    def get_level_counts() : Void*
      if @@mb_get_level_counts.null?
        @@mb_get_level_counts = Bridge.get_method_bind("VoxelGIData", "get_level_counts", 1930428628_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_level_counts, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_dynamic_range : Void* = Pointer(Void).null
    def set_dynamic_range(dynamic_range : Float64) : Void
      if @@mb_set_dynamic_range.null?
        @@mb_set_dynamic_range = Bridge.get_method_bind("VoxelGIData", "set_dynamic_range", 373806689_i64)
      end
      val_0 = dynamic_range
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_dynamic_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_dynamic_range : Void* = Pointer(Void).null
    def get_dynamic_range() : Float64
      if @@mb_get_dynamic_range.null?
        @@mb_get_dynamic_range = Bridge.get_method_bind("VoxelGIData", "get_dynamic_range", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_dynamic_range, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_energy : Void* = Pointer(Void).null
    def set_energy(energy : Float64) : Void
      if @@mb_set_energy.null?
        @@mb_set_energy = Bridge.get_method_bind("VoxelGIData", "set_energy", 373806689_i64)
      end
      val_0 = energy
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_energy, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_energy : Void* = Pointer(Void).null
    def get_energy() : Float64
      if @@mb_get_energy.null?
        @@mb_get_energy = Bridge.get_method_bind("VoxelGIData", "get_energy", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_energy, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bias : Void* = Pointer(Void).null
    def set_bias(bias : Float64) : Void
      if @@mb_set_bias.null?
        @@mb_set_bias = Bridge.get_method_bind("VoxelGIData", "set_bias", 373806689_i64)
      end
      val_0 = bias
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bias, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bias : Void* = Pointer(Void).null
    def get_bias() : Float64
      if @@mb_get_bias.null?
        @@mb_get_bias = Bridge.get_method_bind("VoxelGIData", "get_bias", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_bias, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_normal_bias : Void* = Pointer(Void).null
    def set_normal_bias(bias : Float64) : Void
      if @@mb_set_normal_bias.null?
        @@mb_set_normal_bias = Bridge.get_method_bind("VoxelGIData", "set_normal_bias", 373806689_i64)
      end
      val_0 = bias
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_normal_bias, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_normal_bias : Void* = Pointer(Void).null
    def get_normal_bias() : Float64
      if @@mb_get_normal_bias.null?
        @@mb_get_normal_bias = Bridge.get_method_bind("VoxelGIData", "get_normal_bias", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_normal_bias, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_propagation : Void* = Pointer(Void).null
    def set_propagation(propagation : Float64) : Void
      if @@mb_set_propagation.null?
        @@mb_set_propagation = Bridge.get_method_bind("VoxelGIData", "set_propagation", 373806689_i64)
      end
      val_0 = propagation
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_propagation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_propagation : Void* = Pointer(Void).null
    def get_propagation() : Float64
      if @@mb_get_propagation.null?
        @@mb_get_propagation = Bridge.get_method_bind("VoxelGIData", "get_propagation", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_propagation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_interior : Void* = Pointer(Void).null
    def set_interior(interior : Bool) : Void
      if @@mb_set_interior.null?
        @@mb_set_interior = Bridge.get_method_bind("VoxelGIData", "set_interior", 2586408642_i64)
      end
      val_0 = interior
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_interior, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_interior : Void* = Pointer(Void).null
    def is_interior() : Bool
      if @@mb_is_interior.null?
        @@mb_is_interior = Bridge.get_method_bind("VoxelGIData", "is_interior", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_interior, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_use_two_bounces : Void* = Pointer(Void).null
    def set_use_two_bounces(enable : Bool) : Void
      if @@mb_set_use_two_bounces.null?
        @@mb_set_use_two_bounces = Bridge.get_method_bind("VoxelGIData", "set_use_two_bounces", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_two_bounces, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_using_two_bounces : Void* = Pointer(Void).null
    def is_using_two_bounces() : Bool
      if @@mb_is_using_two_bounces.null?
        @@mb_is_using_two_bounces = Bridge.get_method_bind("VoxelGIData", "is_using_two_bounces", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_using_two_bounces, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # Holds an `Object`. If the object is `RefCounted`, it doesn't update the reference count.
  #
  # A weakref can hold a `RefCounted` without contributing to the reference counter. A weakref can be created from an `Object` using [method @GlobalScope.weakref]. If this object is not a reference, weakref still works, however, it does not have any effect on the object. Weakrefs are useful in cases where multiple classes have variables that refer to each other. Without weakrefs, using these classes could lead to memory leaks, since both references keep each other from being released. Making part of the variables a weakref can prevent this cyclic dependency, and allows the references to be released.
  class WeakRef < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_ref : Void* = Pointer(Void).null
    # Returns the `Object` this weakref is referring to. Returns `null` if that object no longer exists.
    def get_ref() : Void*
      if @@mb_get_ref.null?
        @@mb_get_ref = Bridge.get_method_bind("WeakRef", "get_ref", 1214101251_i64)
      end
      ret_var = StaticArray(UInt8, 24).new(0_u8)
      Bridge.ptrcall(@@mb_get_ref, @pointer, Pointer(Pointer(Void)).null, ret_var.to_unsafe.as(Void*))
      ret_ptr = Pointer(Void).null
      Bridge.type_from_variant(24, pointerof(ret_ptr).as(Void*), ret_var.to_unsafe.as(Void*))
      ret_ptr
    end
  end
  class WebRTCDataChannel < Godot::PacketPeer
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum WriteMode : Int64
      WriteModeText = 0_i64
      WriteModeBinary = 1_i64
    end
    enum ChannelState : Int64
      StateConnecting = 0_i64
      StateOpen = 1_i64
      StateClosing = 2_i64
      StateClosed = 3_i64
    end
    @@mb_poll : Void* = Pointer(Void).null
    # Reserved, but not used for now.
    def poll() : Int64
      if @@mb_poll.null?
        @@mb_poll = Bridge.get_method_bind("WebRTCDataChannel", "poll", 166280745_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_poll, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_close : Void* = Pointer(Void).null
    # Closes this data channel, notifying the other peer.
    def close() : Void
      if @@mb_close.null?
        @@mb_close = Bridge.get_method_bind("WebRTCDataChannel", "close", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_close, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_was_string_packet : Void* = Pointer(Void).null
    # Returns `true` if the last received packet was transferred as text. See `write_mode`.
    def was_string_packet() : Bool
      if @@mb_was_string_packet.null?
        @@mb_was_string_packet = Bridge.get_method_bind("WebRTCDataChannel", "was_string_packet", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_was_string_packet, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_write_mode : Void* = Pointer(Void).null
    def set_write_mode(write_mode : Int64) : Void
      if @@mb_set_write_mode.null?
        @@mb_set_write_mode = Bridge.get_method_bind("WebRTCDataChannel", "set_write_mode", 1999768052_i64)
      end
      val_0 = write_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_write_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_write_mode : Void* = Pointer(Void).null
    def get_write_mode() : Int64
      if @@mb_get_write_mode.null?
        @@mb_get_write_mode = Bridge.get_method_bind("WebRTCDataChannel", "get_write_mode", 2848495172_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_write_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_ready_state : Void* = Pointer(Void).null
    # Returns the current state of this channel.
    def get_ready_state() : Int64
      if @@mb_get_ready_state.null?
        @@mb_get_ready_state = Bridge.get_method_bind("WebRTCDataChannel", "get_ready_state", 3501143017_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_ready_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_label : Void* = Pointer(Void).null
    # Returns the label assigned to this channel during creation.
    def get_label() : String
      if @@mb_get_label.null?
        @@mb_get_label = Bridge.get_method_bind("WebRTCDataChannel", "get_label", 201670096_i64)
      end
      ""
    end
    @@mb_is_ordered : Void* = Pointer(Void).null
    # Returns `true` if this channel was created with ordering enabled (default).
    def is_ordered() : Bool
      if @@mb_is_ordered.null?
        @@mb_is_ordered = Bridge.get_method_bind("WebRTCDataChannel", "is_ordered", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_ordered, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_id : Void* = Pointer(Void).null
    # Returns the ID assigned to this channel during creation (or auto-assigned during negotiation).
    # If the channel is not negotiated out-of-band the ID will only be available after the connection is established (will return `65535` until then).
    def get_id() : Int64
      if @@mb_get_id.null?
        @@mb_get_id = Bridge.get_method_bind("WebRTCDataChannel", "get_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_max_packet_life_time : Void* = Pointer(Void).null
    # Returns the `maxPacketLifeTime` value assigned to this channel during creation.
    # Will be `65535` if not specified.
    def get_max_packet_life_time() : Int64
      if @@mb_get_max_packet_life_time.null?
        @@mb_get_max_packet_life_time = Bridge.get_method_bind("WebRTCDataChannel", "get_max_packet_life_time", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_packet_life_time, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_max_retransmits : Void* = Pointer(Void).null
    # Returns the `maxRetransmits` value assigned to this channel during creation.
    # Will be `65535` if not specified.
    def get_max_retransmits() : Int64
      if @@mb_get_max_retransmits.null?
        @@mb_get_max_retransmits = Bridge.get_method_bind("WebRTCDataChannel", "get_max_retransmits", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_retransmits, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_protocol : Void* = Pointer(Void).null
    # Returns the sub-protocol assigned to this channel during creation. An empty string if not specified.
    def get_protocol() : String
      if @@mb_get_protocol.null?
        @@mb_get_protocol = Bridge.get_method_bind("WebRTCDataChannel", "get_protocol", 201670096_i64)
      end
      ""
    end
    @@mb_is_negotiated : Void* = Pointer(Void).null
    # Returns `true` if this channel was created with out-of-band configuration.
    def is_negotiated() : Bool
      if @@mb_is_negotiated.null?
        @@mb_is_negotiated = Bridge.get_method_bind("WebRTCDataChannel", "is_negotiated", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_negotiated, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_buffered_amount : Void* = Pointer(Void).null
    # Returns the number of bytes currently queued to be sent over this channel.
    def get_buffered_amount() : Int64
      if @@mb_get_buffered_amount.null?
        @@mb_get_buffered_amount = Bridge.get_method_bind("WebRTCDataChannel", "get_buffered_amount", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_buffered_amount, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class WebRTCDataChannelExtension < Godot::WebRTCDataChannel
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A simple interface to create a peer-to-peer mesh network composed of `WebRTCPeerConnection` that is compatible with the `MultiplayerAPI`.
  #
  # This class constructs a full mesh of `WebRTCPeerConnection` (one connection for each peer) that can be used as a `MultiplayerAPI.multiplayer_peer`.
  # You can add each `WebRTCPeerConnection` via `#add_peer` or remove them via `#remove_peer`. Peers must be added in `WebRTCPeerConnection.STATE_NEW` state to allow it to create the appropriate channels. This class will not create offers nor set descriptions, it will only poll them, and notify connections and disconnections.
  # When creating the peer via `#create_client` or `#create_server` the `#MultiplayerPeer.is_server_relay_supported` method will return `true` enabling peer exchange and packet relaying when supported by the `MultiplayerAPI` implementation.
  # **Note:** When exporting to Android, make sure to enable the `INTERNET` permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
  class WebRTCMultiplayerPeer < Godot::MultiplayerPeer
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_create_server : Void* = Pointer(Void).null
    # Initialize the multiplayer peer as a server (with unique ID of `1`). This mode enables `#MultiplayerPeer.is_server_relay_supported`, allowing the upper `MultiplayerAPI` layer to perform peer exchange and packet relaying.
    # You can optionally specify a `channels_config` array of `MultiplayerPeer.TransferMode` which will be used to create extra channels (WebRTC only supports one transfer mode per channel).
    def create_server(channels_config : Godot::Array) : Int64
      if @@mb_create_server.null?
        @@mb_create_server = Bridge.get_method_bind("WebRTCMultiplayerPeer", "create_server", 2865356025_i64)
      end
      arg_ptr_0 = channels_config ? channels_config.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_server, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_create_client : Void* = Pointer(Void).null
    # Initialize the multiplayer peer as a client with the given `peer_id` (must be between 2 and 2147483647). In this mode, you should only call `#add_peer` once and with `peer_id` of `1`. This mode enables `#MultiplayerPeer.is_server_relay_supported`, allowing the upper `MultiplayerAPI` layer to perform peer exchange and packet relaying.
    # You can optionally specify a `channels_config` array of `MultiplayerPeer.TransferMode` which will be used to create extra channels (WebRTC only supports one transfer mode per channel).
    def create_client(peer_id : Int64, channels_config : Godot::Array) : Int64
      if @@mb_create_client.null?
        @@mb_create_client = Bridge.get_method_bind("WebRTCMultiplayerPeer", "create_client", 2641732907_i64)
      end
      val_0 = peer_id
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = channels_config ? channels_config.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_client, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_create_mesh : Void* = Pointer(Void).null
    # Initialize the multiplayer peer as a mesh (i.e. all peers connect to each other) with the given `peer_id` (must be between 1 and 2147483647).
    def create_mesh(peer_id : Int64, channels_config : Godot::Array) : Int64
      if @@mb_create_mesh.null?
        @@mb_create_mesh = Bridge.get_method_bind("WebRTCMultiplayerPeer", "create_mesh", 2641732907_i64)
      end
      val_0 = peer_id
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = channels_config ? channels_config.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_mesh, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_peer : Void* = Pointer(Void).null
    # Add a new peer to the mesh with the given `peer_id`. The `WebRTCPeerConnection` must be in state `WebRTCPeerConnection.STATE_NEW`.
    # Three channels will be created for reliable, unreliable, and ordered transport. The value of `unreliable_lifetime` will be passed to the `"maxPacketLifetime"` option when creating unreliable and ordered channels (see `#WebRTCPeerConnection.create_data_channel`).
    def add_peer(peer : WebRTCPeerConnection, peer_id : Int64, unreliable_lifetime : Int64) : Int64
      if @@mb_add_peer.null?
        @@mb_add_peer = Bridge.get_method_bind("WebRTCMultiplayerPeer", "add_peer", 4078953270_i64)
      end
      arg_ptr_0 = peer ? peer.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = peer_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = unreliable_lifetime
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_add_peer, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_peer : Void* = Pointer(Void).null
    # Remove the peer with given `peer_id` from the mesh. If the peer was connected, and `MultiplayerPeer.peer_connected` was emitted for it, then `MultiplayerPeer.peer_disconnected` will be emitted.
    def remove_peer(peer_id : Int64) : Void
      if @@mb_remove_peer.null?
        @@mb_remove_peer = Bridge.get_method_bind("WebRTCMultiplayerPeer", "remove_peer", 1286410249_i64)
      end
      val_0 = peer_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_peer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_peer : Void* = Pointer(Void).null
    # Returns `true` if the given `peer_id` is in the peers map (it might not be connected though).
    def has_peer(peer_id : Int64) : Bool
      if @@mb_has_peer.null?
        @@mb_has_peer = Bridge.get_method_bind("WebRTCMultiplayerPeer", "has_peer", 3067735520_i64)
      end
      val_0 = peer_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_peer, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_peer : Void* = Pointer(Void).null
    # Returns a dictionary representation of the peer with given `peer_id` with three keys. `"connection"` containing the `WebRTCPeerConnection` to this peer, `"channels"` an array of three `WebRTCDataChannel`, and `"connected"` a boolean representing if the peer connection is currently connected (all three channels are open).
    def get_peer(peer_id : Int64) : Void*
      if @@mb_get_peer.null?
        @@mb_get_peer = Bridge.get_method_bind("WebRTCMultiplayerPeer", "get_peer", 3554694381_i64)
      end
      val_0 = peer_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_peer, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_peers : Void* = Pointer(Void).null
    # Returns a dictionary which keys are the peer ids and values the peer representation as in `#get_peer`.
    def get_peers() : Void*
      if @@mb_get_peers.null?
        @@mb_get_peers = Bridge.get_method_bind("WebRTCMultiplayerPeer", "get_peers", 2382534195_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_peers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
  end
  # Interface to a WebRTC peer connection.
  #
  # A WebRTC connection between the local computer and a remote peer. Provides an interface to connect, maintain, and monitor the connection.
  # Setting up a WebRTC connection between two peers may not seem a trivial task, but it can be broken down into 3 main steps:
  # - The peer that wants to initiate the connection (`A` from now on) creates an offer and sends it to the other peer (`B` from now on).
  # - `B` receives the offer, generates an answer, and sends it to `A`.
  # - `A` and `B` then generate and exchange ICE candidates with each other.
  # After these steps, the connection should be established. Refer to the linked tutorials for details.
  class WebRTCPeerConnection < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ConnectionState : Int64
      StateNew = 0_i64
      StateConnecting = 1_i64
      StateConnected = 2_i64
      StateDisconnected = 3_i64
      StateFailed = 4_i64
      StateClosed = 5_i64
    end
    enum GatheringState : Int64
      GatheringStateNew = 0_i64
      GatheringStateGathering = 1_i64
      GatheringStateComplete = 2_i64
    end
    enum SignalingState : Int64
      SignalingStateStable = 0_i64
      SignalingStateHaveLocalOffer = 1_i64
      SignalingStateHaveRemoteOffer = 2_i64
      SignalingStateHaveLocalPranswer = 3_i64
      SignalingStateHaveRemotePranswer = 4_i64
      SignalingStateClosed = 5_i64
    end
    @@mb_set_default_extension : Void* = Pointer(Void).null
    # Sets the `extension_class` as the default `WebRTCPeerConnectionExtension` returned when creating a new `WebRTCPeerConnection`.
    def set_default_extension(extension_class : String) : Void
      if @@mb_set_default_extension.null?
        @@mb_set_default_extension = Bridge.get_method_bind("WebRTCPeerConnection", "set_default_extension", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(extension_class)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_extension, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_initialize : Void* = Pointer(Void).null
    # Re-initialize this peer connection, closing any previously active connection, and going back to state `STATE_NEW`. A dictionary of `configuration` options can be passed to configure the peer connection.
    # Valid `configuration` options are:
    # ```gdscript
    #
    # {
    # 	"iceServers": [
    # 		{
    # 			"urls": [ "stun:stun.example.com:3478" ], # One or more STUN servers.
    # 		},
    # 		{
    # 			"urls": [ "turn:turn.example.com:3478" ], # One or more TURN servers.
    # 			"username": "a_username", # Optional username for the TURN server.
    # 			"credential": "a_password", # Optional password for the TURN server.
    # 		}
    # 	]
    # }
    #
    # ```
    def godot_initialize(configuration : Void*) : Int64
      if @@mb_initialize.null?
        @@mb_initialize = Bridge.get_method_bind("WebRTCPeerConnection", "initialize", 2625064318_i64)
      end
      val_0 = configuration
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_initialize, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_create_data_channel : Void* = Pointer(Void).null
    # Returns a new `WebRTCDataChannel` (or `null` on failure) with given `label` and optionally configured via the `options` dictionary. This method can only be called when the connection is in state `STATE_NEW`.
    # There are two ways to create a working data channel: either call `#create_data_channel` on only one of the peer and listen to `data_channel_received` on the other, or call `#create_data_channel` on both peers, with the same values, and the `"negotiated"` option set to `true`.
    # Valid `options` are:
    # ```gdscript
    #
    # {
    # 	"negotiated": true, # When set to true (default off), means the channel is negotiated out of band. "id" must be set too. "data_channel_received" will not be called.
    # 	"id": 1, # When "negotiated" is true this value must also be set to the same value on both peer.
    #
    # 	# Only one of maxRetransmits and maxPacketLifeTime can be specified, not both. They make the channel unreliable (but also better at real time).
    # 	"maxRetransmits": 1, # Specify the maximum number of attempt the peer will make to retransmits packets if they are not acknowledged.
    # 	"maxPacketLifeTime": 100, # Specify the maximum amount of time before giving up retransmitions of unacknowledged packets (in milliseconds).
    # 	"ordered": true, # When in unreliable mode (i.e. either "maxRetransmits" or "maxPacketLifetime" is set), "ordered" (true by default) specify if packet ordering is to be enforced.
    #
    # 	"protocol": "my-custom-protocol", # A custom sub-protocol string for this channel.
    # }
    #
    # ```
    # **Note:** You must keep a reference to channels created this way, or it will be closed.
    def create_data_channel(label : String, options : Void*) : WebRTCDataChannel
      if @@mb_create_data_channel.null?
        @@mb_create_data_channel = Bridge.get_method_bind("WebRTCPeerConnection", "create_data_channel", 1288557393_i64)
      end
      str_0 = Bridge.make_string(label)
      arg_0 = str_0
      val_1 = options
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_create_data_channel, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      WebRTCDataChannel.new(ret_ptr)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_create_offer : Void* = Pointer(Void).null
    # Creates a new SDP offer to start a WebRTC connection with a remote peer. At least one `WebRTCDataChannel` must have been created before calling this method.
    # If this functions returns `OK`, `session_description_created` will be called when the session is ready to be sent.
    def create_offer() : Int64
      if @@mb_create_offer.null?
        @@mb_create_offer = Bridge.get_method_bind("WebRTCPeerConnection", "create_offer", 166280745_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_offer, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_local_description : Void* = Pointer(Void).null
    # Sets the SDP description of the local peer. This should be called in response to `session_description_created`.
    # After calling this function the peer will start emitting `ice_candidate_created` (unless an `Error` different from `OK` is returned).
    def set_local_description(get_type : String, sdp : String) : Int64
      if @@mb_set_local_description.null?
        @@mb_set_local_description = Bridge.get_method_bind("WebRTCPeerConnection", "set_local_description", 852856452_i64)
      end
      str_0 = Bridge.make_string(get_type)
      arg_0 = str_0
      str_1 = Bridge.make_string(sdp)
      arg_1 = str_1
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_set_local_description, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
      Bridge.free_string(str_1)
    end
    @@mb_set_remote_description : Void* = Pointer(Void).null
    # Sets the SDP description of the remote peer. This should be called with the values generated by a remote peer and received over the signaling server.
    # If `type` is `"offer"` the peer will emit `session_description_created` with the appropriate answer.
    # If `type` is `"answer"` the peer will start emitting `ice_candidate_created`.
    def set_remote_description(get_type : String, sdp : String) : Int64
      if @@mb_set_remote_description.null?
        @@mb_set_remote_description = Bridge.get_method_bind("WebRTCPeerConnection", "set_remote_description", 852856452_i64)
      end
      str_0 = Bridge.make_string(get_type)
      arg_0 = str_0
      str_1 = Bridge.make_string(sdp)
      arg_1 = str_1
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_set_remote_description, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
      Bridge.free_string(str_1)
    end
    @@mb_add_ice_candidate : Void* = Pointer(Void).null
    # Add an ice candidate generated by a remote peer (and received over the signaling server). See `ice_candidate_created`.
    def add_ice_candidate(media : String, index : Int64, name : String) : Int64
      if @@mb_add_ice_candidate.null?
        @@mb_add_ice_candidate = Bridge.get_method_bind("WebRTCPeerConnection", "add_ice_candidate", 3958950400_i64)
      end
      str_0 = Bridge.make_string(media)
      arg_0 = str_0
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      str_2 = Bridge.make_string(name)
      arg_2 = str_2
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_add_ice_candidate, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
      Bridge.free_string(str_2)
    end
    @@mb_poll : Void* = Pointer(Void).null
    # Call this method frequently (e.g. in `#Node._process` or `#Node._physics_process`) to properly receive signals.
    def poll() : Int64
      if @@mb_poll.null?
        @@mb_poll = Bridge.get_method_bind("WebRTCPeerConnection", "poll", 166280745_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_poll, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_close : Void* = Pointer(Void).null
    # Close the peer connection and all data channels associated with it.
    # **Note:** You cannot reuse this object for a new connection unless you call `#initialize`.
    def close() : Void
      if @@mb_close.null?
        @@mb_close = Bridge.get_method_bind("WebRTCPeerConnection", "close", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_close, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_connection_state : Void* = Pointer(Void).null
    # Returns the connection state.
    def get_connection_state() : Int64
      if @@mb_get_connection_state.null?
        @@mb_get_connection_state = Bridge.get_method_bind("WebRTCPeerConnection", "get_connection_state", 2275710506_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_connection_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_gathering_state : Void* = Pointer(Void).null
    # Returns the ICE `GatheringState` of the connection. This lets you detect, for example, when collection of ICE candidates has finished.
    def get_gathering_state() : Int64
      if @@mb_get_gathering_state.null?
        @@mb_get_gathering_state = Bridge.get_method_bind("WebRTCPeerConnection", "get_gathering_state", 4262591401_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_gathering_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_signaling_state : Void* = Pointer(Void).null
    # Returns the signaling state on the local end of the connection while connecting or reconnecting to another peer.
    def get_signaling_state() : Int64
      if @@mb_get_signaling_state.null?
        @@mb_get_signaling_state = Bridge.get_method_bind("WebRTCPeerConnection", "get_signaling_state", 3342956226_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_signaling_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class WebRTCPeerConnectionExtension < Godot::WebRTCPeerConnection
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # Base class for WebSocket server and client.
  #
  # Base class for WebSocket server and client, allowing them to be used as multiplayer peer for the `MultiplayerAPI`.
  # **Note:** When exporting to Android, make sure to enable the `INTERNET` permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.
  class WebSocketMultiplayerPeer < Godot::MultiplayerPeer
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_create_client : Void* = Pointer(Void).null
    # Starts a new multiplayer client connecting to the given `url`. TLS certificates will be verified against the hostname when connecting using the `wss://` protocol. You can pass the optional `tls_client_options` parameter to customize the trusted certification authorities, or disable the common name verification. See `#TLSOptions.client` and `#TLSOptions.client_unsafe`.
    # **Note:** It is recommended to specify the scheme part of the URL, i.e. the `url` should start with either `ws://` or `wss://`.
    def create_client(url : String, tls_client_options : TLSOptions) : Int64
      if @@mb_create_client.null?
        @@mb_create_client = Bridge.get_method_bind("WebSocketMultiplayerPeer", "create_client", 1966198364_i64)
      end
      str_0 = Bridge.make_string(url)
      arg_0 = str_0
      arg_ptr_1 = tls_client_options ? tls_client_options.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_client, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_create_server : Void* = Pointer(Void).null
    # Starts a new multiplayer server listening on the given `port`. You can optionally specify a `bind_address`, and provide valid `tls_server_options` to use TLS. See `#TLSOptions.server`.
    def create_server(port : Int64, bind_address : String, tls_server_options : TLSOptions) : Int64
      if @@mb_create_server.null?
        @@mb_create_server = Bridge.get_method_bind("WebSocketMultiplayerPeer", "create_server", 2400822951_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      str_1 = Bridge.make_string(bind_address)
      arg_1 = str_1
      arg_ptr_2 = tls_server_options ? tls_server_options.pointer : Pointer(Void).null
      arg_2 = pointerof(arg_ptr_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_server, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_1)
    end
    @@mb_get_peer : Void* = Pointer(Void).null
    # Returns the `WebSocketPeer` associated to the given `peer_id`.
    def get_peer(peer_id : Int64) : WebSocketPeer
      if @@mb_get_peer.null?
        @@mb_get_peer = Bridge.get_method_bind("WebSocketMultiplayerPeer", "get_peer", 1381378851_i64)
      end
      val_0 = peer_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_peer, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      WebSocketPeer.new(ret_ptr)
    end
    @@mb_get_peer_address : Void* = Pointer(Void).null
    # Returns the IP address of the given peer.
    def get_peer_address(id : Int64) : String
      if @@mb_get_peer_address.null?
        @@mb_get_peer_address = Bridge.get_method_bind("WebSocketMultiplayerPeer", "get_peer_address", 844755477_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_peer_port : Void* = Pointer(Void).null
    # Returns the remote port of the given peer.
    def get_peer_port(id : Int64) : Int64
      if @@mb_get_peer_port.null?
        @@mb_get_peer_port = Bridge.get_method_bind("WebSocketMultiplayerPeer", "get_peer_port", 923996154_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_peer_port, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_supported_protocols : Void* = Pointer(Void).null
    def get_supported_protocols() : Void*
      if @@mb_get_supported_protocols.null?
        @@mb_get_supported_protocols = Bridge.get_method_bind("WebSocketMultiplayerPeer", "get_supported_protocols", 1139954409_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_supported_protocols, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_supported_protocols : Void* = Pointer(Void).null
    def set_supported_protocols(protocols : Void*) : Void
      if @@mb_set_supported_protocols.null?
        @@mb_set_supported_protocols = Bridge.get_method_bind("WebSocketMultiplayerPeer", "set_supported_protocols", 4015028928_i64)
      end
      val_0 = protocols
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_supported_protocols, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_handshake_headers : Void* = Pointer(Void).null
    def get_handshake_headers() : Void*
      if @@mb_get_handshake_headers.null?
        @@mb_get_handshake_headers = Bridge.get_method_bind("WebSocketMultiplayerPeer", "get_handshake_headers", 1139954409_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_handshake_headers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_handshake_headers : Void* = Pointer(Void).null
    def set_handshake_headers(protocols : Void*) : Void
      if @@mb_set_handshake_headers.null?
        @@mb_set_handshake_headers = Bridge.get_method_bind("WebSocketMultiplayerPeer", "set_handshake_headers", 4015028928_i64)
      end
      val_0 = protocols
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_handshake_headers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_inbound_buffer_size : Void* = Pointer(Void).null
    def get_inbound_buffer_size() : Int64
      if @@mb_get_inbound_buffer_size.null?
        @@mb_get_inbound_buffer_size = Bridge.get_method_bind("WebSocketMultiplayerPeer", "get_inbound_buffer_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_inbound_buffer_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_inbound_buffer_size : Void* = Pointer(Void).null
    def set_inbound_buffer_size(buffer_size : Int64) : Void
      if @@mb_set_inbound_buffer_size.null?
        @@mb_set_inbound_buffer_size = Bridge.get_method_bind("WebSocketMultiplayerPeer", "set_inbound_buffer_size", 1286410249_i64)
      end
      val_0 = buffer_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_inbound_buffer_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_outbound_buffer_size : Void* = Pointer(Void).null
    def get_outbound_buffer_size() : Int64
      if @@mb_get_outbound_buffer_size.null?
        @@mb_get_outbound_buffer_size = Bridge.get_method_bind("WebSocketMultiplayerPeer", "get_outbound_buffer_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_outbound_buffer_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_outbound_buffer_size : Void* = Pointer(Void).null
    def set_outbound_buffer_size(buffer_size : Int64) : Void
      if @@mb_set_outbound_buffer_size.null?
        @@mb_set_outbound_buffer_size = Bridge.get_method_bind("WebSocketMultiplayerPeer", "set_outbound_buffer_size", 1286410249_i64)
      end
      val_0 = buffer_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_outbound_buffer_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_handshake_timeout : Void* = Pointer(Void).null
    def get_handshake_timeout() : Float64
      if @@mb_get_handshake_timeout.null?
        @@mb_get_handshake_timeout = Bridge.get_method_bind("WebSocketMultiplayerPeer", "get_handshake_timeout", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_handshake_timeout, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_handshake_timeout : Void* = Pointer(Void).null
    def set_handshake_timeout(timeout : Float64) : Void
      if @@mb_set_handshake_timeout.null?
        @@mb_set_handshake_timeout = Bridge.get_method_bind("WebSocketMultiplayerPeer", "set_handshake_timeout", 373806689_i64)
      end
      val_0 = timeout
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_handshake_timeout, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_max_queued_packets : Void* = Pointer(Void).null
    def set_max_queued_packets(max_queued_packets : Int64) : Void
      if @@mb_set_max_queued_packets.null?
        @@mb_set_max_queued_packets = Bridge.get_method_bind("WebSocketMultiplayerPeer", "set_max_queued_packets", 1286410249_i64)
      end
      val_0 = max_queued_packets
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_queued_packets, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_queued_packets : Void* = Pointer(Void).null
    def get_max_queued_packets() : Int64
      if @@mb_get_max_queued_packets.null?
        @@mb_get_max_queued_packets = Bridge.get_method_bind("WebSocketMultiplayerPeer", "get_max_queued_packets", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_queued_packets, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A WebSocket connection.
  #
  # This class represents WebSocket connection, and can be used as a WebSocket client ([$2]($1)-compliant) or as a remote peer of a WebSocket server.
  # You can send WebSocket binary frames using `#PacketPeer.put_packet`, and WebSocket text frames using `#send` (prefer text frames when interacting with text-based API). You can check the frame type of the last packet via `#was_string_packet`.
  # To start a WebSocket client, first call `#connect_to_url`, then regularly call `#poll` (e.g. during `Node` process). You can query the socket state via `#get_ready_state`, get the number of pending packets using `#PacketPeer.get_available_packet_count`, and retrieve them via `#PacketPeer.get_packet`.
  #
  # ```gdscript
  #
  # extends Node
  #
  # var socket = WebSocketPeer.new()
  #
  # func _ready():
  # 	socket.connect_to_url("wss://example.com")
  #
  # func _process(delta):
  # 	socket.poll()
  # 	var state = socket.get_ready_state()
  # 	if state == WebSocketPeer.STATE_OPEN:
  # 		while socket.get_available_packet_count():
  # 			print("Packet: ", socket.get_packet())
  # 	elif state == WebSocketPeer.STATE_CLOSING:
  # 		# Keep polling to achieve proper close.
  # 		pass
  # 	elif state == WebSocketPeer.STATE_CLOSED:
  # 		var code = socket.get_close_code()
  # 		var reason = socket.get_close_reason()
  # 		print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
  # 		set_process(false) # Stop processing.
  #
  # ```
  #
  # To use the peer as part of a WebSocket server refer to `#accept_stream` and the online tutorial.
  class WebSocketPeer < Godot::PacketPeer
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum WriteMode : Int64
      WriteModeText = 0_i64
      WriteModeBinary = 1_i64
    end
    enum State : Int64
      StateConnecting = 0_i64
      StateOpen = 1_i64
      StateClosing = 2_i64
      StateClosed = 3_i64
    end
    @@mb_connect_to_url : Void* = Pointer(Void).null
    # Connects to the given URL. TLS certificates will be verified against the hostname when connecting using the `wss://` protocol. You can pass the optional `tls_client_options` parameter to customize the trusted certification authorities, or disable the common name verification. See `#TLSOptions.client` and `#TLSOptions.client_unsafe`.
    # **Note:** This method is non-blocking, and will return `OK` before the connection is established as long as the provided parameters are valid and the peer is not in an invalid state (e.g. already connected). Regularly call `#poll` (e.g. during `Node` process) and check the result of `#get_ready_state` to know whether the connection succeeds or fails.
    # **Note:** To avoid mixed content warnings or errors in Web, you may have to use a `url` that starts with `wss://` (secure) instead of `ws://`. When doing so, make sure to use the fully qualified domain name that matches the one defined in the server's TLS certificate. Do not connect directly via the IP address for `wss://` connections, as it won't match with the TLS certificate.
    def connect_to_url(url : String, tls_client_options : TLSOptions) : Int64
      if @@mb_connect_to_url.null?
        @@mb_connect_to_url = Bridge.get_method_bind("WebSocketPeer", "connect_to_url", 1966198364_i64)
      end
      str_0 = Bridge.make_string(url)
      arg_0 = str_0
      arg_ptr_1 = tls_client_options ? tls_client_options.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_connect_to_url, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_accept_stream : Void* = Pointer(Void).null
    # Accepts a peer connection performing the HTTP handshake as a WebSocket server. The `stream` must be a valid TCP stream retrieved via `#TCPServer.take_connection`, or a TLS stream accepted via `#StreamPeerTLS.accept_stream`.
    # **Note:** Not supported in Web exports due to browser restrictions.
    def accept_stream(stream : StreamPeer) : Int64
      if @@mb_accept_stream.null?
        @@mb_accept_stream = Bridge.get_method_bind("WebSocketPeer", "accept_stream", 255125695_i64)
      end
      arg_ptr_0 = stream ? stream.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_accept_stream, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_send : Void* = Pointer(Void).null
    # Sends the given `message` using the desired `write_mode`. When sending a `String`, prefer using `#send_text`.
    def send(message : Void*, write_mode : Int64) : Int64
      if @@mb_send.null?
        @@mb_send = Bridge.get_method_bind("WebSocketPeer", "send", 2780360567_i64)
      end
      val_0 = message
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = write_mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_send, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_send_text : Void* = Pointer(Void).null
    # Sends the given `message` using WebSocket text mode. Prefer this method over `#PacketPeer.put_packet` when interacting with third-party text-based API (e.g. when using `JSON` formatted messages).
    def send_text(message : String) : Int64
      if @@mb_send_text.null?
        @@mb_send_text = Bridge.get_method_bind("WebSocketPeer", "send_text", 166001499_i64)
      end
      str_0 = Bridge.make_string(message)
      arg_0 = str_0
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_send_text, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_was_string_packet : Void* = Pointer(Void).null
    # Returns `true` if the last received packet was sent as a text payload. See `WriteMode`.
    def was_string_packet() : Bool
      if @@mb_was_string_packet.null?
        @@mb_was_string_packet = Bridge.get_method_bind("WebSocketPeer", "was_string_packet", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_was_string_packet, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_poll : Void* = Pointer(Void).null
    # Updates the connection state and receive incoming packets. Call this function regularly to keep it in a clean state.
    def poll() : Void
      if @@mb_poll.null?
        @@mb_poll = Bridge.get_method_bind("WebSocketPeer", "poll", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_poll, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_close : Void* = Pointer(Void).null
    # Closes this WebSocket connection.
    # `code` is the status code for the closure (see [$2]($1) for a list of valid status codes). If `code` is negative, the connection will be closed immediately without notifying the remote peer.
    # `reason` is the human-readable reason for closing the connection. It can be any UTF-8 string that's smaller than 123 bytes.
    # **Note:** To achieve a clean closure, you will need to keep polling until `STATE_CLOSED` is reached.
    # **Note:** The Web export might not support all status codes. Please refer to browser-specific documentation for more details.
    def close(code : Int64, reason : String) : Void
      if @@mb_close.null?
        @@mb_close = Bridge.get_method_bind("WebSocketPeer", "close", 1047156615_i64)
      end
      val_0 = code
      arg_0 = pointerof(val_0).as(Void*)
      str_1 = Bridge.make_string(reason)
      arg_1 = str_1
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_close, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_1)
    end
    @@mb_get_connected_host : Void* = Pointer(Void).null
    # Returns the IP address of the connected peer.
    # **Note:** Not available in the Web export.
    def get_connected_host() : String
      if @@mb_get_connected_host.null?
        @@mb_get_connected_host = Bridge.get_method_bind("WebSocketPeer", "get_connected_host", 201670096_i64)
      end
      ""
    end
    @@mb_get_connected_port : Void* = Pointer(Void).null
    # Returns the remote port of the connected peer.
    # **Note:** Not available in the Web export.
    def get_connected_port() : Int64
      if @@mb_get_connected_port.null?
        @@mb_get_connected_port = Bridge.get_method_bind("WebSocketPeer", "get_connected_port", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_connected_port, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_selected_protocol : Void* = Pointer(Void).null
    # Returns the selected WebSocket sub-protocol for this connection or an empty string if the sub-protocol has not been selected yet.
    def get_selected_protocol() : String
      if @@mb_get_selected_protocol.null?
        @@mb_get_selected_protocol = Bridge.get_method_bind("WebSocketPeer", "get_selected_protocol", 201670096_i64)
      end
      ""
    end
    @@mb_get_requested_url : Void* = Pointer(Void).null
    # Returns the URL requested by this peer. The URL is derived from the `url` passed to `#connect_to_url` or from the HTTP headers when acting as server (i.e. when using `#accept_stream`).
    def get_requested_url() : String
      if @@mb_get_requested_url.null?
        @@mb_get_requested_url = Bridge.get_method_bind("WebSocketPeer", "get_requested_url", 201670096_i64)
      end
      ""
    end
    @@mb_set_no_delay : Void* = Pointer(Void).null
    # Disable Nagle's algorithm on the underlying TCP socket (default). See `#StreamPeerTCP.set_no_delay` for more information.
    # **Note:** Not available in the Web export.
    def set_no_delay(enabled : Bool) : Void
      if @@mb_set_no_delay.null?
        @@mb_set_no_delay = Bridge.get_method_bind("WebSocketPeer", "set_no_delay", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_no_delay, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_current_outbound_buffered_amount : Void* = Pointer(Void).null
    # Returns the current amount of data in the outbound websocket buffer. **Note:** Web exports use WebSocket.bufferedAmount, while other platforms use an internal buffer.
    def get_current_outbound_buffered_amount() : Int64
      if @@mb_get_current_outbound_buffered_amount.null?
        @@mb_get_current_outbound_buffered_amount = Bridge.get_method_bind("WebSocketPeer", "get_current_outbound_buffered_amount", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_current_outbound_buffered_amount, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_ready_state : Void* = Pointer(Void).null
    # Returns the ready state of the connection.
    def get_ready_state() : Int64
      if @@mb_get_ready_state.null?
        @@mb_get_ready_state = Bridge.get_method_bind("WebSocketPeer", "get_ready_state", 346482985_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_ready_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_close_code : Void* = Pointer(Void).null
    # Returns the received WebSocket close frame status code, or `-1` when the connection was not cleanly closed. Only call this method when `#get_ready_state` returns `STATE_CLOSED`.
    def get_close_code() : Int64
      if @@mb_get_close_code.null?
        @@mb_get_close_code = Bridge.get_method_bind("WebSocketPeer", "get_close_code", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_close_code, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_close_reason : Void* = Pointer(Void).null
    # Returns the received WebSocket close frame status reason string. Only call this method when `#get_ready_state` returns `STATE_CLOSED`.
    def get_close_reason() : String
      if @@mb_get_close_reason.null?
        @@mb_get_close_reason = Bridge.get_method_bind("WebSocketPeer", "get_close_reason", 201670096_i64)
      end
      ""
    end
    @@mb_get_supported_protocols : Void* = Pointer(Void).null
    def get_supported_protocols() : Void*
      if @@mb_get_supported_protocols.null?
        @@mb_get_supported_protocols = Bridge.get_method_bind("WebSocketPeer", "get_supported_protocols", 1139954409_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_supported_protocols, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_supported_protocols : Void* = Pointer(Void).null
    def set_supported_protocols(protocols : Void*) : Void
      if @@mb_set_supported_protocols.null?
        @@mb_set_supported_protocols = Bridge.get_method_bind("WebSocketPeer", "set_supported_protocols", 4015028928_i64)
      end
      val_0 = protocols
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_supported_protocols, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_handshake_headers : Void* = Pointer(Void).null
    def get_handshake_headers() : Void*
      if @@mb_get_handshake_headers.null?
        @@mb_get_handshake_headers = Bridge.get_method_bind("WebSocketPeer", "get_handshake_headers", 1139954409_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_handshake_headers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_handshake_headers : Void* = Pointer(Void).null
    def set_handshake_headers(protocols : Void*) : Void
      if @@mb_set_handshake_headers.null?
        @@mb_set_handshake_headers = Bridge.get_method_bind("WebSocketPeer", "set_handshake_headers", 4015028928_i64)
      end
      val_0 = protocols
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_handshake_headers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_inbound_buffer_size : Void* = Pointer(Void).null
    def get_inbound_buffer_size() : Int64
      if @@mb_get_inbound_buffer_size.null?
        @@mb_get_inbound_buffer_size = Bridge.get_method_bind("WebSocketPeer", "get_inbound_buffer_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_inbound_buffer_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_inbound_buffer_size : Void* = Pointer(Void).null
    def set_inbound_buffer_size(buffer_size : Int64) : Void
      if @@mb_set_inbound_buffer_size.null?
        @@mb_set_inbound_buffer_size = Bridge.get_method_bind("WebSocketPeer", "set_inbound_buffer_size", 1286410249_i64)
      end
      val_0 = buffer_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_inbound_buffer_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_outbound_buffer_size : Void* = Pointer(Void).null
    def get_outbound_buffer_size() : Int64
      if @@mb_get_outbound_buffer_size.null?
        @@mb_get_outbound_buffer_size = Bridge.get_method_bind("WebSocketPeer", "get_outbound_buffer_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_outbound_buffer_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_outbound_buffer_size : Void* = Pointer(Void).null
    def set_outbound_buffer_size(buffer_size : Int64) : Void
      if @@mb_set_outbound_buffer_size.null?
        @@mb_set_outbound_buffer_size = Bridge.get_method_bind("WebSocketPeer", "set_outbound_buffer_size", 1286410249_i64)
      end
      val_0 = buffer_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_outbound_buffer_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_max_queued_packets : Void* = Pointer(Void).null
    def set_max_queued_packets(buffer_size : Int64) : Void
      if @@mb_set_max_queued_packets.null?
        @@mb_set_max_queued_packets = Bridge.get_method_bind("WebSocketPeer", "set_max_queued_packets", 1286410249_i64)
      end
      val_0 = buffer_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_queued_packets, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_queued_packets : Void* = Pointer(Void).null
    def get_max_queued_packets() : Int64
      if @@mb_get_max_queued_packets.null?
        @@mb_get_max_queued_packets = Bridge.get_method_bind("WebSocketPeer", "get_max_queued_packets", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_queued_packets, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_heartbeat_interval : Void* = Pointer(Void).null
    def set_heartbeat_interval(interval : Float64) : Void
      if @@mb_set_heartbeat_interval.null?
        @@mb_set_heartbeat_interval = Bridge.get_method_bind("WebSocketPeer", "set_heartbeat_interval", 373806689_i64)
      end
      val_0 = interval
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_heartbeat_interval, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_heartbeat_interval : Void* = Pointer(Void).null
    def get_heartbeat_interval() : Float64
      if @@mb_get_heartbeat_interval.null?
        @@mb_get_heartbeat_interval = Bridge.get_method_bind("WebSocketPeer", "get_heartbeat_interval", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_heartbeat_interval, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # XR interface using WebXR.
  #
  # WebXR is an open standard that allows creating VR and AR applications that run in the web browser.
  # As such, this interface is only available when running in Web exports.
  # WebXR supports a wide range of devices, from the very capable (like Valve Index, HTC Vive, Oculus Rift and Quest) down to the much less capable (like Google Cardboard, Oculus Go, GearVR, or plain smartphones).
  # Since WebXR is based on JavaScript, it makes extensive use of callbacks, which means that `WebXRInterface` is forced to use signals, where other XR interfaces would instead use functions that return a result immediately. This makes `WebXRInterface` quite a bit more complicated to initialize than other XR interfaces.
  # Here's the minimum code required to start an immersive VR session:
  # ```gdscript
  #
  # extends Node3D
  #
  # var webxr_interface
  # var vr_supported = false
  #
  # func _ready():
  # 	# We assume this node has a button as a child.
  # 	# This button is for the user to consent to entering immersive VR mode.
  # 	$Button.pressed.connect(self._on_button_pressed)
  #
  # 	webxr_interface = XRServer.find_interface("WebXR")
  # 	if webxr_interface:
  # 		# WebXR uses a lot of asynchronous callbacks, so we connect to various
  # 		# signals in order to receive them.
  # 		webxr_interface.session_supported.connect(self._webxr_session_supported)
  # 		webxr_interface.session_started.connect(self._webxr_session_started)
  # 		webxr_interface.session_ended.connect(self._webxr_session_ended)
  # 		webxr_interface.session_failed.connect(self._webxr_session_failed)
  #
  # 		# This returns immediately - our _webxr_session_supported() method
  # 		# (which we connected to the "session_supported" signal above) will
  # 		# be called sometime later to let us know if it's supported or not.
  # 		webxr_interface.is_session_supported("immersive-vr")
  #
  # func _webxr_session_supported(session_mode, supported):
  # 	if session_mode == 'immersive-vr':
  # 		vr_supported = supported
  #
  # func _on_button_pressed():
  # 	if not vr_supported:
  # 		OS.alert("Your browser doesn't support VR")
  # 		return
  #
  # 	# We want an immersive VR session, as opposed to AR ('immersive-ar') or a
  # 	# simple 3DoF viewer ('viewer').
  # 	webxr_interface.session_mode = 'immersive-vr'
  # 	# 'bounded-floor' is room scale, 'local-floor' is a standing or sitting
  # 	# experience (it puts you 1.6m above the ground if you have 3DoF headset),
  # 	# whereas as 'local' puts you down at the XROrigin.
  # 	# This list means it'll first try to request 'bounded-floor', then
  # 	# fallback on 'local-floor' and ultimately 'local', if nothing else is
  # 	# supported.
  # 	webxr_interface.requested_reference_space_types = 'bounded-floor, local-floor, local'
  # 	# In order to use 'local-floor' or 'bounded-floor' we must also
  # 	# mark the features as required or optional. By including 'hand-tracking'
  # 	# as an optional feature, it will be enabled if supported.
  # 	webxr_interface.required_features = 'local-floor'
  # 	webxr_interface.optional_features = 'bounded-floor, hand-tracking'
  #
  # 	# This will return false if we're unable to even request the session,
  # 	# however, it can still fail asynchronously later in the process, so we
  # 	# only know if it's really succeeded or failed when our
  # 	# _webxr_session_started() or _webxr_session_failed() methods are called.
  # 	if not webxr_interface.initialize():
  # 		OS.alert("Failed to initialize")
  # 		return
  #
  # func _webxr_session_started():
  # 	$Button.visible = false
  # 	# This tells Godot to start rendering to the headset.
  # 	get_viewport().use_xr = true
  # 	# This will be the reference space type you ultimately got, out of the
  # 	# types that you requested above. This is useful if you want the game to
  # 	# work a little differently in 'bounded-floor' versus 'local-floor'.
  # 	print("Reference space type: ", webxr_interface.reference_space_type)
  # 	# This will be the list of features that were successfully enabled
  # 	# (except on browsers that don't support this property).
  # 	print("Enabled features: ", webxr_interface.enabled_features)
  #
  # func _webxr_session_ended():
  # 	$Button.visible = true
  # 	# If the user exits immersive mode, then we tell Godot to render to the web
  # 	# page again.
  # 	get_viewport().use_xr = false
  #
  # func _webxr_session_failed(message):
  # 	OS.alert("Failed to initialize: " + message)
  #
  # ```
  # There are a couple ways to handle "controller" input:
  # - Using `XRController3D` nodes and their `XRController3D.button_pressed` and `XRController3D.button_released` signals. This is how controllers are typically handled in XR apps in Godot, however, this will only work with advanced VR controllers like the Oculus Touch or Index controllers, for example.
  # - Using the `select`, `squeeze` and related signals. This method will work for both advanced VR controllers, and non-traditional input sources like a tap on the screen, a spoken voice command or a button press on the device itself.
  # You can use both methods to allow your game or app to support a wider or narrower set of devices and input methods, or to allow more advanced interactions with more advanced devices.
  class WebXRInterface < Godot::XRInterface
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum TargetRayMode : Int64
      TargetRayModeUnknown = 0_i64
      TargetRayModeGaze = 1_i64
      TargetRayModeTrackedPointer = 2_i64
      TargetRayModeScreen = 3_i64
    end
    @@mb_is_session_supported : Void* = Pointer(Void).null
    # Checks if the given `session_mode` is supported by the user's browser.
    # Possible values come from [$2]($1), including: `"immersive-vr"`, `"immersive-ar"`, and `"inline"`.
    # This method returns nothing, instead it emits the `session_supported` signal with the result.
    def is_session_supported(session_mode : String) : Void
      if @@mb_is_session_supported.null?
        @@mb_is_session_supported = Bridge.get_method_bind("WebXRInterface", "is_session_supported", 83702148_i64)
      end
      str_0 = Bridge.make_string(session_mode)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_is_session_supported, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_set_session_mode : Void* = Pointer(Void).null
    def set_session_mode(session_mode : String) : Void
      if @@mb_set_session_mode.null?
        @@mb_set_session_mode = Bridge.get_method_bind("WebXRInterface", "set_session_mode", 83702148_i64)
      end
      str_0 = Bridge.make_string(session_mode)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_session_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_session_mode : Void* = Pointer(Void).null
    def get_session_mode() : String
      if @@mb_get_session_mode.null?
        @@mb_get_session_mode = Bridge.get_method_bind("WebXRInterface", "get_session_mode", 201670096_i64)
      end
      ""
    end
    @@mb_set_required_features : Void* = Pointer(Void).null
    def set_required_features(required_features : String) : Void
      if @@mb_set_required_features.null?
        @@mb_set_required_features = Bridge.get_method_bind("WebXRInterface", "set_required_features", 83702148_i64)
      end
      str_0 = Bridge.make_string(required_features)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_required_features, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_required_features : Void* = Pointer(Void).null
    def get_required_features() : String
      if @@mb_get_required_features.null?
        @@mb_get_required_features = Bridge.get_method_bind("WebXRInterface", "get_required_features", 201670096_i64)
      end
      ""
    end
    @@mb_set_optional_features : Void* = Pointer(Void).null
    def set_optional_features(optional_features : String) : Void
      if @@mb_set_optional_features.null?
        @@mb_set_optional_features = Bridge.get_method_bind("WebXRInterface", "set_optional_features", 83702148_i64)
      end
      str_0 = Bridge.make_string(optional_features)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_optional_features, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_optional_features : Void* = Pointer(Void).null
    def get_optional_features() : String
      if @@mb_get_optional_features.null?
        @@mb_get_optional_features = Bridge.get_method_bind("WebXRInterface", "get_optional_features", 201670096_i64)
      end
      ""
    end
    @@mb_get_reference_space_type : Void* = Pointer(Void).null
    def get_reference_space_type() : String
      if @@mb_get_reference_space_type.null?
        @@mb_get_reference_space_type = Bridge.get_method_bind("WebXRInterface", "get_reference_space_type", 201670096_i64)
      end
      ""
    end
    @@mb_get_enabled_features : Void* = Pointer(Void).null
    def get_enabled_features() : String
      if @@mb_get_enabled_features.null?
        @@mb_get_enabled_features = Bridge.get_method_bind("WebXRInterface", "get_enabled_features", 201670096_i64)
      end
      ""
    end
    @@mb_set_requested_reference_space_types : Void* = Pointer(Void).null
    def set_requested_reference_space_types(requested_reference_space_types : String) : Void
      if @@mb_set_requested_reference_space_types.null?
        @@mb_set_requested_reference_space_types = Bridge.get_method_bind("WebXRInterface", "set_requested_reference_space_types", 83702148_i64)
      end
      str_0 = Bridge.make_string(requested_reference_space_types)
      arg_0 = str_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_requested_reference_space_types, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_requested_reference_space_types : Void* = Pointer(Void).null
    def get_requested_reference_space_types() : String
      if @@mb_get_requested_reference_space_types.null?
        @@mb_get_requested_reference_space_types = Bridge.get_method_bind("WebXRInterface", "get_requested_reference_space_types", 201670096_i64)
      end
      ""
    end
    @@mb_is_input_source_active : Void* = Pointer(Void).null
    # Returns `true` if there is an active input source with the given `input_source_id`.
    def is_input_source_active(input_source_id : Int64) : Bool
      if @@mb_is_input_source_active.null?
        @@mb_is_input_source_active = Bridge.get_method_bind("WebXRInterface", "is_input_source_active", 1116898809_i64)
      end
      val_0 = input_source_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_input_source_active, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_input_source_tracker : Void* = Pointer(Void).null
    # Gets an `XRControllerTracker` for the given `input_source_id`.
    # In the context of WebXR, an input source can be an advanced VR controller like the Oculus Touch or Index controllers, or even a tap on the screen, a spoken voice command or a button press on the device itself. When a non-traditional input source is used, interpret the position and orientation of the `XRPositionalTracker` as a ray pointing at the object the user wishes to interact with.
    # Use this method to get information about the input source that triggered one of these signals:
    # - `selectstart`
    # - `select`
    # - `selectend`
    # - `squeezestart`
    # - `squeeze`
    # - `squeezestart`
    def get_input_source_tracker(input_source_id : Int64) : XRControllerTracker
      if @@mb_get_input_source_tracker.null?
        @@mb_get_input_source_tracker = Bridge.get_method_bind("WebXRInterface", "get_input_source_tracker", 399776966_i64)
      end
      val_0 = input_source_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_input_source_tracker, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      XRControllerTracker.new(ret_ptr)
    end
    @@mb_get_input_source_target_ray_mode : Void* = Pointer(Void).null
    # Returns the target ray mode for the given `input_source_id`.
    # This can help interpret the input coming from that input source. See [$2]($1) for more information.
    def get_input_source_target_ray_mode(input_source_id : Int64) : Int64
      if @@mb_get_input_source_target_ray_mode.null?
        @@mb_get_input_source_target_ray_mode = Bridge.get_method_bind("WebXRInterface", "get_input_source_target_ray_mode", 2852387453_i64)
      end
      val_0 = input_source_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_input_source_target_ray_mode, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_visibility_state : Void* = Pointer(Void).null
    def get_visibility_state() : String
      if @@mb_get_visibility_state.null?
        @@mb_get_visibility_state = Bridge.get_method_bind("WebXRInterface", "get_visibility_state", 201670096_i64)
      end
      ""
    end
    @@mb_get_display_refresh_rate : Void* = Pointer(Void).null
    # Returns the display refresh rate for the current HMD. Not supported on all HMDs and browsers. It may not report an accurate value until after using `#set_display_refresh_rate`.
    def get_display_refresh_rate() : Float64
      if @@mb_get_display_refresh_rate.null?
        @@mb_get_display_refresh_rate = Bridge.get_method_bind("WebXRInterface", "get_display_refresh_rate", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_display_refresh_rate, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_display_refresh_rate : Void* = Pointer(Void).null
    # Sets the display refresh rate for the current HMD. Not supported on all HMDs and browsers. It won't take effect right away until after `display_refresh_rate_changed` is emitted.
    def set_display_refresh_rate(refresh_rate : Float64) : Void
      if @@mb_set_display_refresh_rate.null?
        @@mb_set_display_refresh_rate = Bridge.get_method_bind("WebXRInterface", "set_display_refresh_rate", 373806689_i64)
      end
      val_0 = refresh_rate
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_display_refresh_rate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_available_display_refresh_rates : Void* = Pointer(Void).null
    # Returns display refresh rates supported by the current HMD. Only returned if this feature is supported by the web browser and after the interface has been initialized.
    def get_available_display_refresh_rates() : Godot::Array
      if @@mb_get_available_display_refresh_rates.null?
        @@mb_get_available_display_refresh_rates = Bridge.get_method_bind("WebXRInterface", "get_available_display_refresh_rates", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_available_display_refresh_rates, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
  end
  # A singleton that allocates some `Thread`s on startup, used to offload tasks to these threads.
  #
  # The `WorkerThreadPool` singleton allocates a set of `Thread`s (called worker threads) on project startup and provides methods for offloading tasks to them. This can be used for simple multithreading without having to create `Thread`s.
  # Tasks hold the `Callable` to be run by the threads. `WorkerThreadPool` can be used to create regular tasks, which will be taken by one worker thread, or group tasks, which can be distributed between multiple worker threads. Group tasks execute the `Callable` multiple times, which makes them useful for iterating over a lot of elements, such as the enemies in an arena.
  # Here's a sample on how to offload an expensive function to worker threads:
  #
  # ```gdscript
  #
  # var enemies = [] # An array to be filled with enemies.
  #
  # func process_enemy_ai(enemy_index):
  # 	var processed_enemy = enemies`enemy_index`
  # 	# Expensive logic...
  #
  # func _process(delta):
  # 	var task_id = WorkerThreadPool.add_group_task(process_enemy_ai, enemies.size())
  # 	# Other code...
  # 	WorkerThreadPool.wait_for_group_task_completion(task_id)
  # 	# Other code that depends on the enemy AI already being processed.
  #
  # ```
  # ```csharp
  #
  # private List<Node> _enemies = new List<Node>(); // A list to be filled with enemies.
  #
  # private void ProcessEnemyAI(int enemyIndex)
  # {
  # 	Node processedEnemy = _enemies`enemyIndex`;
  # 	// Expensive logic here.
  # }
  #
  # public override void _Process(double delta)
  # {
  # 	long taskId = WorkerThreadPool.AddGroupTask(Callable.From<int>(ProcessEnemyAI), _enemies.Count);
  # 	// Other code...
  # 	WorkerThreadPool.WaitForGroupTaskCompletion(taskId);
  # 	// Other code that depends on the enemy AI already being processed.
  # }
  #
  # ```
  #
  # The above code relies on the number of elements in the `enemies` array remaining constant during the multithreaded part.
  # **Note:** Using this singleton could affect performance negatively if the task being distributed between threads is not computationally expensive.
  class WorkerThreadPool < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_add_task : Void* = Pointer(Void).null
    # Adds `action` as a task to be executed by a worker thread. `high_priority` determines if the task has a high priority or a low priority (default). You can optionally provide a `description` to help with debugging.
    # Returns a task ID that can be used by other methods.
    # **Warning:** Every task must be waited for completion using `#wait_for_task_completion` or `#wait_for_group_task_completion` at some point so that any allocated resources inside the task can be cleaned up.
    def add_task(action : Void*, high_priority : Bool, description : String) : Int64
      if @@mb_add_task.null?
        @@mb_add_task = Bridge.get_method_bind("WorkerThreadPool", "add_task", 3745067146_i64)
      end
      val_0 = action
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = high_priority
      arg_1 = pointerof(val_1).as(Void*)
      str_2 = Bridge.make_string(description)
      arg_2 = str_2
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_add_task, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_2)
    end
    @@mb_is_task_completed : Void* = Pointer(Void).null
    # Returns `true` if the task with the given ID is completed.
    # **Note:** You should only call this method between adding the task and awaiting its completion.
    def is_task_completed(task_id : Int64) : Bool
      if @@mb_is_task_completed.null?
        @@mb_is_task_completed = Bridge.get_method_bind("WorkerThreadPool", "is_task_completed", 1116898809_i64)
      end
      val_0 = task_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_task_completed, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_wait_for_task_completion : Void* = Pointer(Void).null
    # Pauses the thread that calls this method until the task with the given ID is completed.
    # Returns [constant @GlobalScope.OK] if the task could be successfully awaited.
    # Returns [constant @GlobalScope.ERR_INVALID_PARAMETER] if a task with the passed ID does not exist (maybe because it was already awaited and disposed of).
    # Returns [constant @GlobalScope.ERR_BUSY] if the call is made from another running task and, due to task scheduling, there's potential for deadlocking (e.g., the task to await may be at a lower level in the call stack and therefore can't progress). This is an advanced situation that should only matter when some tasks depend on others (in the current implementation, the tricky case is a task trying to wait on an older one).
    def wait_for_task_completion(task_id : Int64) : Int64
      if @@mb_wait_for_task_completion.null?
        @@mb_wait_for_task_completion = Bridge.get_method_bind("WorkerThreadPool", "wait_for_task_completion", 844576869_i64)
      end
      val_0 = task_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_wait_for_task_completion, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_caller_task_id : Void* = Pointer(Void).null
    # Returns the task ID of the current thread calling this method, or `-1` if the task is a group task, invalid or the current thread is not part of the thread pool (e.g. the main thread).
    # Can be used by a task to get its own task ID, or to determine whether the current code is running inside the worker thread pool.
    # **Note:** Group tasks have their own IDs, so this method will return `-1` for group tasks.
    def get_caller_task_id() : Int64
      if @@mb_get_caller_task_id.null?
        @@mb_get_caller_task_id = Bridge.get_method_bind("WorkerThreadPool", "get_caller_task_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_caller_task_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_group_task : Void* = Pointer(Void).null
    # Adds `action` as a group task to be executed by the worker threads. The `Callable` will be called a number of times based on `elements`, with the first thread calling it with the value `0` as a parameter, and each consecutive execution incrementing this value by 1 until it reaches `element - 1`.
    # The number of threads the task is distributed to is defined by `tasks_needed`, where the default value `-1` means it is distributed to all worker threads. `high_priority` determines if the task has a high priority or a low priority (default). You can optionally provide a `description` to help with debugging.
    # Returns a group task ID that can be used by other methods.
    # **Warning:** Every task must be waited for completion using `#wait_for_task_completion` or `#wait_for_group_task_completion` at some point so that any allocated resources inside the task can be cleaned up.
    def add_group_task(action : Void*, elements : Int64, tasks_needed : Int64, high_priority : Bool, description : String) : Int64
      if @@mb_add_group_task.null?
        @@mb_add_group_task = Bridge.get_method_bind("WorkerThreadPool", "add_group_task", 1801953219_i64)
      end
      val_0 = action
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = elements
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = tasks_needed
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = high_priority
      arg_3 = pointerof(val_3).as(Void*)
      str_4 = Bridge.make_string(description)
      arg_4 = str_4
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_i64
      Bridge.ptrcall(@@mb_add_group_task, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_4)
    end
    @@mb_is_group_task_completed : Void* = Pointer(Void).null
    # Returns `true` if the group task with the given ID is completed.
    # **Note:** You should only call this method between adding the group task and awaiting its completion.
    def is_group_task_completed(group_id : Int64) : Bool
      if @@mb_is_group_task_completed.null?
        @@mb_is_group_task_completed = Bridge.get_method_bind("WorkerThreadPool", "is_group_task_completed", 1116898809_i64)
      end
      val_0 = group_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_group_task_completed, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_group_processed_element_count : Void* = Pointer(Void).null
    # Returns how many times the `Callable` of the group task with the given ID has already been executed by the worker threads.
    # **Note:** If a thread has started executing the `Callable` but is yet to finish, it won't be counted.
    def get_group_processed_element_count(group_id : Int64) : Int64
      if @@mb_get_group_processed_element_count.null?
        @@mb_get_group_processed_element_count = Bridge.get_method_bind("WorkerThreadPool", "get_group_processed_element_count", 923996154_i64)
      end
      val_0 = group_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_group_processed_element_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_wait_for_group_task_completion : Void* = Pointer(Void).null
    # Pauses the thread that calls this method until the group task with the given ID is completed.
    def wait_for_group_task_completion(group_id : Int64) : Void
      if @@mb_wait_for_group_task_completion.null?
        @@mb_wait_for_group_task_completion = Bridge.get_method_bind("WorkerThreadPool", "wait_for_group_task_completion", 1286410249_i64)
      end
      val_0 = group_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_wait_for_group_task_completion, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_caller_group_id : Void* = Pointer(Void).null
    # Returns the task group ID of the current thread calling this method, or `-1` if invalid or the current thread is not part of a task group.
    def get_caller_group_id() : Int64
      if @@mb_get_caller_group_id.null?
        @@mb_get_caller_group_id = Bridge.get_method_bind("WorkerThreadPool", "get_caller_group_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_caller_group_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A resource that holds all components of a 2D world, such as a canvas and a physics space.
  #
  # Class that has everything pertaining to a 2D world: A physics space, a canvas, and a sound space. 2D nodes register their resources into the current 2D world.
  class World2D < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_canvas : Void* = Pointer(Void).null
    def get_canvas() : Int64
      if @@mb_get_canvas.null?
        @@mb_get_canvas = Bridge.get_method_bind("World2D", "get_canvas", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_canvas, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_navigation_map : Void* = Pointer(Void).null
    def get_navigation_map() : Int64
      if @@mb_get_navigation_map.null?
        @@mb_get_navigation_map = Bridge.get_method_bind("World2D", "get_navigation_map", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_map, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_space : Void* = Pointer(Void).null
    def get_space() : Int64
      if @@mb_get_space.null?
        @@mb_get_space = Bridge.get_method_bind("World2D", "get_space", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_space, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_direct_space_state : Void* = Pointer(Void).null
    def get_direct_space_state() : PhysicsDirectSpaceState2D
      if @@mb_get_direct_space_state.null?
        @@mb_get_direct_space_state = Bridge.get_method_bind("World2D", "get_direct_space_state", 2506717822_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_direct_space_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      PhysicsDirectSpaceState2D.new(ret_ptr)
    end
  end
  # A resource that holds all components of a 3D world, such as a visual scenario and a physics space.
  #
  # Class that has everything pertaining to a world: A physics space, a visual scenario, and a sound space. 3D nodes register their resources into the current 3D world.
  class World3D < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_space : Void* = Pointer(Void).null
    def get_space() : Int64
      if @@mb_get_space.null?
        @@mb_get_space = Bridge.get_method_bind("World3D", "get_space", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_space, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_navigation_map : Void* = Pointer(Void).null
    def get_navigation_map() : Int64
      if @@mb_get_navigation_map.null?
        @@mb_get_navigation_map = Bridge.get_method_bind("World3D", "get_navigation_map", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_map, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_scenario : Void* = Pointer(Void).null
    def get_scenario() : Int64
      if @@mb_get_scenario.null?
        @@mb_get_scenario = Bridge.get_method_bind("World3D", "get_scenario", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_scenario, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_environment : Void* = Pointer(Void).null
    def set_environment(env : Environment) : Void
      if @@mb_set_environment.null?
        @@mb_set_environment = Bridge.get_method_bind("World3D", "set_environment", 4143518816_i64)
      end
      arg_ptr_0 = env ? env.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_environment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_environment : Void* = Pointer(Void).null
    def get_environment() : Environment
      if @@mb_get_environment.null?
        @@mb_get_environment = Bridge.get_method_bind("World3D", "get_environment", 3082064660_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_environment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Environment.new(ret_ptr)
    end
    @@mb_set_fallback_environment : Void* = Pointer(Void).null
    def set_fallback_environment(env : Environment) : Void
      if @@mb_set_fallback_environment.null?
        @@mb_set_fallback_environment = Bridge.get_method_bind("World3D", "set_fallback_environment", 4143518816_i64)
      end
      arg_ptr_0 = env ? env.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fallback_environment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fallback_environment : Void* = Pointer(Void).null
    def get_fallback_environment() : Environment
      if @@mb_get_fallback_environment.null?
        @@mb_get_fallback_environment = Bridge.get_method_bind("World3D", "get_fallback_environment", 3082064660_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_fallback_environment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Environment.new(ret_ptr)
    end
    @@mb_set_camera_attributes : Void* = Pointer(Void).null
    def set_camera_attributes(attributes : CameraAttributes) : Void
      if @@mb_set_camera_attributes.null?
        @@mb_set_camera_attributes = Bridge.get_method_bind("World3D", "set_camera_attributes", 2817810567_i64)
      end
      arg_ptr_0 = attributes ? attributes.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_camera_attributes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_camera_attributes : Void* = Pointer(Void).null
    def get_camera_attributes() : CameraAttributes
      if @@mb_get_camera_attributes.null?
        @@mb_get_camera_attributes = Bridge.get_method_bind("World3D", "get_camera_attributes", 3921283215_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_camera_attributes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      CameraAttributes.new(ret_ptr)
    end
    @@mb_get_direct_space_state : Void* = Pointer(Void).null
    def get_direct_space_state() : PhysicsDirectSpaceState3D
      if @@mb_get_direct_space_state.null?
        @@mb_get_direct_space_state = Bridge.get_method_bind("World3D", "get_direct_space_state", 2069328350_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_direct_space_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      PhysicsDirectSpaceState3D.new(ret_ptr)
    end
  end
  # A 2D world boundary (half-plane) shape used for physics collision.
  #
  # A 2D world boundary shape, intended for use in physics. `WorldBoundaryShape2D` works like an infinite straight line that forces all physics bodies to stay above it. The line's normal determines which direction is considered as "above" and in the editor, the smaller line over it represents this direction. It can for example be used for endless flat floors.
  class WorldBoundaryShape2D < Godot::Shape2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_normal : Void* = Pointer(Void).null
    def set_normal(normal : Vector2) : Void
      if @@mb_set_normal.null?
        @@mb_set_normal = Bridge.get_method_bind("WorldBoundaryShape2D", "set_normal", 743155724_i64)
      end
      val_0 = normal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_normal, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_normal : Void* = Pointer(Void).null
    def get_normal() : Vector2
      if @@mb_get_normal.null?
        @@mb_get_normal = Bridge.get_method_bind("WorldBoundaryShape2D", "get_normal", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_normal, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_distance : Void* = Pointer(Void).null
    def set_distance(distance : Float64) : Void
      if @@mb_set_distance.null?
        @@mb_set_distance = Bridge.get_method_bind("WorldBoundaryShape2D", "set_distance", 373806689_i64)
      end
      val_0 = distance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_distance : Void* = Pointer(Void).null
    def get_distance() : Float64
      if @@mb_get_distance.null?
        @@mb_get_distance = Bridge.get_method_bind("WorldBoundaryShape2D", "get_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A 3D world boundary (half-space) shape used for physics collision.
  #
  # A 3D world boundary shape, intended for use in physics. `WorldBoundaryShape3D` works like an infinite plane that forces all physics bodies to stay above it. The `plane`'s normal determines which direction is considered as "above" and in the editor, the line over the plane represents this direction. It can for example be used for endless flat floors.
  # **Note:** When the physics engine is set to **Jolt Physics** in the project settings ([member ProjectSettings.physics/3d/physics_engine]), `WorldBoundaryShape3D` has a finite size (centered at the shape's origin). It can be adjusted by changing [member ProjectSettings.physics/jolt_physics_3d/limits/world_boundary_shape_size].
  class WorldBoundaryShape3D < Godot::Shape3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_plane : Void* = Pointer(Void).null
    def set_plane(plane : Plane) : Void
      if @@mb_set_plane.null?
        @@mb_set_plane = Bridge.get_method_bind("WorldBoundaryShape3D", "set_plane", 3505987427_i64)
      end
      val_0 = plane
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_plane, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_plane : Void* = Pointer(Void).null
    def get_plane() : Plane
      if @@mb_get_plane.null?
        @@mb_get_plane = Bridge.get_method_bind("WorldBoundaryShape3D", "get_plane", 2753500971_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_plane, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Plane.new(ret_ptr)
    end
  end
  # Default environment properties for the entire scene (post-processing effects, lighting and background settings).
  #
  # The `WorldEnvironment` node is used to configure the default `Environment` for the scene.
  # The parameters defined in the `WorldEnvironment` can be overridden by an `Environment` node set on the current `Camera3D`. Additionally, only one `WorldEnvironment` may be instantiated in a given scene at a time.
  # The `WorldEnvironment` allows the user to specify default lighting parameters (e.g. ambient lighting), various post-processing effects (e.g. SSAO, DOF, Tonemapping), and how to draw the background (e.g. solid color, skybox). Usually, these are added in order to improve the realism/color balance of the scene.
  class WorldEnvironment < Godot::Node
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_environment : Void* = Pointer(Void).null
    def set_environment(env : Environment) : Void
      if @@mb_set_environment.null?
        @@mb_set_environment = Bridge.get_method_bind("WorldEnvironment", "set_environment", 4143518816_i64)
      end
      arg_ptr_0 = env ? env.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_environment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_environment : Void* = Pointer(Void).null
    def get_environment() : Environment
      if @@mb_get_environment.null?
        @@mb_get_environment = Bridge.get_method_bind("WorldEnvironment", "get_environment", 3082064660_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_environment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Environment.new(ret_ptr)
    end
    @@mb_set_camera_attributes : Void* = Pointer(Void).null
    def set_camera_attributes(camera_attributes : CameraAttributes) : Void
      if @@mb_set_camera_attributes.null?
        @@mb_set_camera_attributes = Bridge.get_method_bind("WorldEnvironment", "set_camera_attributes", 2817810567_i64)
      end
      arg_ptr_0 = camera_attributes ? camera_attributes.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_camera_attributes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_camera_attributes : Void* = Pointer(Void).null
    def get_camera_attributes() : CameraAttributes
      if @@mb_get_camera_attributes.null?
        @@mb_get_camera_attributes = Bridge.get_method_bind("WorldEnvironment", "get_camera_attributes", 3921283215_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_camera_attributes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      CameraAttributes.new(ret_ptr)
    end
    @@mb_set_compositor : Void* = Pointer(Void).null
    def set_compositor(compositor : Compositor) : Void
      if @@mb_set_compositor.null?
        @@mb_set_compositor = Bridge.get_method_bind("WorldEnvironment", "set_compositor", 1586754307_i64)
      end
      arg_ptr_0 = compositor ? compositor.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_compositor, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_compositor : Void* = Pointer(Void).null
    def get_compositor() : Compositor
      if @@mb_get_compositor.null?
        @@mb_get_compositor = Bridge.get_method_bind("WorldEnvironment", "get_compositor", 3647707413_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_compositor, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Compositor.new(ret_ptr)
    end
  end
  # An X509 certificate (e.g. for TLS).
  #
  # The X509Certificate class represents an X509 certificate. Certificates can be loaded and saved like any other `Resource`.
  # They can be used as the server certificate in `#StreamPeerTLS.accept_stream` (along with the proper `CryptoKey`), and to specify the only certificate that should be accepted when connecting to a TLS server via `#StreamPeerTLS.connect_to_stream`.
  class X509Certificate < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_save : Void* = Pointer(Void).null
    # Saves a certificate to the given `path` (should be a "*.crt" file).
    def save(path : String) : Int64
      if @@mb_save.null?
        @@mb_save = Bridge.get_method_bind("X509Certificate", "save", 166001499_i64)
      end
      str_0 = Bridge.make_string(path)
      arg_0 = str_0
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_save, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_load : Void* = Pointer(Void).null
    # Loads a certificate from `path` ("*.crt" file).
    def load(path : String) : Int64
      if @@mb_load.null?
        @@mb_load = Bridge.get_method_bind("X509Certificate", "load", 166001499_i64)
      end
      str_0 = Bridge.make_string(path)
      arg_0 = str_0
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_load, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_save_to_string : Void* = Pointer(Void).null
    # Returns a string representation of the certificate, or an empty string if the certificate is invalid.
    def save_to_string() : String
      if @@mb_save_to_string.null?
        @@mb_save_to_string = Bridge.get_method_bind("X509Certificate", "save_to_string", 2841200299_i64)
      end
      ""
    end
    @@mb_load_from_string : Void* = Pointer(Void).null
    # Loads a certificate from the given `string`.
    def load_from_string(string : String) : Int64
      if @@mb_load_from_string.null?
        @@mb_load_from_string = Bridge.get_method_bind("X509Certificate", "load_from_string", 166001499_i64)
      end
      str_0 = Bridge.make_string(string)
      arg_0 = str_0
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_load_from_string, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
  end
  # Provides a low-level interface for creating parsers for XML files.
  #
  # Provides a low-level interface for creating parsers for [$2]($1) files. This class can serve as base to make custom XML parsers.
  # To parse XML, you must open a file with the `#open` method or a buffer with the `#open_buffer` method. Then, the `#read` method must be called to parse the next nodes. Most of the methods take into consideration the currently parsed node.
  # Here is an example of using `XMLParser` to parse an SVG file (which is based on XML), printing each element and its attributes as a dictionary:
  #
  # ```gdscript
  #
  # var parser = XMLParser.new()
  # parser.open("path/to/file.svg")
  # while parser.read() != ERR_FILE_EOF:
  # 	if parser.get_node_type() == XMLParser.NODE_ELEMENT:
  # 		var node_name = parser.get_node_name()
  # 		var attributes_dict = {}
  # 		for idx in range(parser.get_attribute_count()):
  # 			attributes_dict[parser.get_attribute_name(idx)] = parser.get_attribute_value(idx)
  # 		print("The ", node_name, " element has the following attributes: ", attributes_dict)
  #
  # ```
  # ```csharp
  #
  # var parser = new XmlParser();
  # parser.Open("path/to/file.svg");
  # while (parser.Read() != Error.FileEof)
  # {
  # 	if (parser.GetNodeType() == XmlParser.NodeType.Element)
  # 	{
  # 		var nodeName = parser.GetNodeName();
  # 		var attributesDict = new Godot.Collections.Dictionary();
  # 		for (int idx = 0; idx < parser.GetAttributeCount(); idx++)
  # 		{
  # 			attributesDict[parser.GetAttributeName(idx)] = parser.GetAttributeValue(idx);
  # 		}
  # 		GD.Print($"The {nodeName} element has the following attributes: {attributesDict}");
  # 	}
  # }
  #
  # ```
  class XMLParser < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum NodeType : Int64
      NodeNone = 0_i64
      NodeElement = 1_i64
      NodeElementEnd = 2_i64
      NodeText = 3_i64
      NodeComment = 4_i64
      NodeCdata = 5_i64
      NodeUnknown = 6_i64
    end
    @@mb_read : Void* = Pointer(Void).null
    # Parses the next node in the file. This method returns an error code.
    def read() : Int64
      if @@mb_read.null?
        @@mb_read = Bridge.get_method_bind("XMLParser", "read", 166280745_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_read, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_node_type : Void* = Pointer(Void).null
    # Returns the type of the current node. Compare with `NodeType` constants.
    def get_node_type() : Int64
      if @@mb_get_node_type.null?
        @@mb_get_node_type = Bridge.get_method_bind("XMLParser", "get_node_type", 2984359541_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_node_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_node_name : Void* = Pointer(Void).null
    # Returns the name of a node. This method will raise an error if the currently parsed node is a text node.
    # **Note:** The content of a `NODE_CDATA` node and the comment string of a `NODE_COMMENT` node are also considered names.
    def get_node_name() : String
      if @@mb_get_node_name.null?
        @@mb_get_node_name = Bridge.get_method_bind("XMLParser", "get_node_name", 201670096_i64)
      end
      ""
    end
    @@mb_get_node_data : Void* = Pointer(Void).null
    # Returns the contents of a text node. This method will raise an error if the current parsed node is of any other type.
    def get_node_data() : String
      if @@mb_get_node_data.null?
        @@mb_get_node_data = Bridge.get_method_bind("XMLParser", "get_node_data", 201670096_i64)
      end
      ""
    end
    @@mb_get_node_offset : Void* = Pointer(Void).null
    # Returns the byte offset of the currently parsed node since the beginning of the file or buffer. This is usually equivalent to the number of characters before the read position.
    def get_node_offset() : Int64
      if @@mb_get_node_offset.null?
        @@mb_get_node_offset = Bridge.get_method_bind("XMLParser", "get_node_offset", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_node_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_attribute_count : Void* = Pointer(Void).null
    # Returns the number of attributes in the currently parsed element.
    # **Note:** If this method is used while the currently parsed node is not `NODE_ELEMENT` or `NODE_ELEMENT_END`, this count will not be updated and will still reflect the last element.
    def get_attribute_count() : Int64
      if @@mb_get_attribute_count.null?
        @@mb_get_attribute_count = Bridge.get_method_bind("XMLParser", "get_attribute_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_attribute_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_attribute_name : Void* = Pointer(Void).null
    # Returns the name of an attribute of the currently parsed element, specified by the `idx` index.
    def get_attribute_name(idx : Int64) : String
      if @@mb_get_attribute_name.null?
        @@mb_get_attribute_name = Bridge.get_method_bind("XMLParser", "get_attribute_name", 844755477_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_attribute_value : Void* = Pointer(Void).null
    # Returns the value of an attribute of the currently parsed element, specified by the `idx` index.
    def get_attribute_value(idx : Int64) : String
      if @@mb_get_attribute_value.null?
        @@mb_get_attribute_value = Bridge.get_method_bind("XMLParser", "get_attribute_value", 844755477_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_has_attribute : Void* = Pointer(Void).null
    # Returns `true` if the currently parsed element has an attribute with the `name`.
    def has_attribute(name : String) : Bool
      if @@mb_has_attribute.null?
        @@mb_has_attribute = Bridge.get_method_bind("XMLParser", "has_attribute", 3927539163_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_attribute, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_named_attribute_value : Void* = Pointer(Void).null
    # Returns the value of an attribute of the currently parsed element, specified by its `name`. This method will raise an error if the element has no such attribute.
    def get_named_attribute_value(name : String) : String
      if @@mb_get_named_attribute_value.null?
        @@mb_get_named_attribute_value = Bridge.get_method_bind("XMLParser", "get_named_attribute_value", 3135753539_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      ""
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_named_attribute_value_safe : Void* = Pointer(Void).null
    # Returns the value of an attribute of the currently parsed element, specified by its `name`. This method will return an empty string if the element has no such attribute.
    def get_named_attribute_value_safe(name : String) : String
      if @@mb_get_named_attribute_value_safe.null?
        @@mb_get_named_attribute_value_safe = Bridge.get_method_bind("XMLParser", "get_named_attribute_value_safe", 3135753539_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      ""
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_is_empty : Void* = Pointer(Void).null
    # Returns `true` if the currently parsed element is empty, e.g. `<element />`.
    def is_empty() : Bool
      if @@mb_is_empty.null?
        @@mb_is_empty = Bridge.get_method_bind("XMLParser", "is_empty", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_empty, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_current_line : Void* = Pointer(Void).null
    # Returns the current line in the parsed file, counting from 0.
    def get_current_line() : Int64
      if @@mb_get_current_line.null?
        @@mb_get_current_line = Bridge.get_method_bind("XMLParser", "get_current_line", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_current_line, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_skip_section : Void* = Pointer(Void).null
    # Skips the current section. If the currently parsed node contains more inner nodes, they will be ignored and the cursor will go to the closing of the current element.
    def skip_section() : Void
      if @@mb_skip_section.null?
        @@mb_skip_section = Bridge.get_method_bind("XMLParser", "skip_section", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_skip_section, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_seek : Void* = Pointer(Void).null
    # Moves the buffer cursor to a certain offset (since the beginning) and reads the next node there. This method returns an error code.
    def seek(position : Int64) : Int64
      if @@mb_seek.null?
        @@mb_seek = Bridge.get_method_bind("XMLParser", "seek", 844576869_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_seek, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_open : Void* = Pointer(Void).null
    # Opens an XML `file` for parsing. This method returns an error code.
    def open(file : String) : Int64
      if @@mb_open.null?
        @@mb_open = Bridge.get_method_bind("XMLParser", "open", 166001499_i64)
      end
      str_0 = Bridge.make_string(file)
      arg_0 = str_0
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_open, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_open_buffer : Void* = Pointer(Void).null
    # Opens an XML raw `buffer` for parsing. This method returns an error code.
    def open_buffer(buffer : Void*) : Int64
      if @@mb_open_buffer.null?
        @@mb_open_buffer = Bridge.get_method_bind("XMLParser", "open_buffer", 680677267_i64)
      end
      val_0 = buffer
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_open_buffer, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  # A 3D node that has its position automatically updated by the `XRServer`.
  #
  # This node can be bound to a specific pose of an `XRPositionalTracker` and will automatically have its `Node3D.transform` updated by the `XRServer`. Nodes of this type must be added as children of the `XROrigin3D` node.
  class XRNode3D < Godot::Node3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_tracker : Void* = Pointer(Void).null
    def set_tracker(tracker_name : String) : Void
      if @@mb_set_tracker.null?
        @@mb_set_tracker = Bridge.get_method_bind("XRNode3D", "set_tracker", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(tracker_name)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tracker, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_tracker : Void* = Pointer(Void).null
    def get_tracker() : String
      if @@mb_get_tracker.null?
        @@mb_get_tracker = Bridge.get_method_bind("XRNode3D", "get_tracker", 2002593661_i64)
      end
      ""
    end
    @@mb_set_pose_name : Void* = Pointer(Void).null
    def set_pose_name(pose : String) : Void
      if @@mb_set_pose_name.null?
        @@mb_set_pose_name = Bridge.get_method_bind("XRNode3D", "set_pose_name", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(pose)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pose_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_pose_name : Void* = Pointer(Void).null
    def get_pose_name() : String
      if @@mb_get_pose_name.null?
        @@mb_get_pose_name = Bridge.get_method_bind("XRNode3D", "get_pose_name", 2002593661_i64)
      end
      ""
    end
    @@mb_set_show_when_tracked : Void* = Pointer(Void).null
    def set_show_when_tracked(show : Bool) : Void
      if @@mb_set_show_when_tracked.null?
        @@mb_set_show_when_tracked = Bridge.get_method_bind("XRNode3D", "set_show_when_tracked", 2586408642_i64)
      end
      val_0 = show
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_when_tracked, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_show_when_tracked : Void* = Pointer(Void).null
    def get_show_when_tracked() : Bool
      if @@mb_get_show_when_tracked.null?
        @@mb_get_show_when_tracked = Bridge.get_method_bind("XRNode3D", "get_show_when_tracked", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_show_when_tracked, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_is_active : Void* = Pointer(Void).null
    # Returns `true` if the `tracker` has been registered and the `pose` is being tracked.
    def get_is_active() : Bool
      if @@mb_get_is_active.null?
        @@mb_get_is_active = Bridge.get_method_bind("XRNode3D", "get_is_active", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_is_active, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_has_tracking_data : Void* = Pointer(Void).null
    # Returns `true` if the `tracker` has current tracking data for the `pose` being tracked.
    def get_has_tracking_data() : Bool
      if @@mb_get_has_tracking_data.null?
        @@mb_get_has_tracking_data = Bridge.get_method_bind("XRNode3D", "get_has_tracking_data", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_has_tracking_data, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_pose : Void* = Pointer(Void).null
    # Returns the `XRPose` containing the current state of the pose being tracked. This gives access to additional properties of this pose.
    def get_pose() : XRPose
      if @@mb_get_pose.null?
        @@mb_get_pose = Bridge.get_method_bind("XRNode3D", "get_pose", 2806551826_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_pose, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      XRPose.new(ret_ptr)
    end
    @@mb_trigger_haptic_pulse : Void* = Pointer(Void).null
    # Triggers a haptic pulse on a device associated with this interface.
    # `action_name` is the name of the action for this pulse.
    # `frequency` is the frequency of the pulse, set to `0.0` to have the system use a default frequency.
    # `amplitude` is the amplitude of the pulse between `0.0` and `1.0`.
    # `duration_sec` is the duration of the pulse in seconds.
    # `delay_sec` is a delay in seconds before the pulse is given.
    def trigger_haptic_pulse(action_name : String, frequency : Float64, amplitude : Float64, duration_sec : Float64, delay_sec : Float64) : Void
      if @@mb_trigger_haptic_pulse.null?
        @@mb_trigger_haptic_pulse = Bridge.get_method_bind("XRNode3D", "trigger_haptic_pulse", 508576839_i64)
      end
      str_0 = Bridge.make_string(action_name)
      arg_0 = str_0
      val_1 = frequency
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = amplitude
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = duration_sec
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = delay_sec
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_trigger_haptic_pulse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string(str_0)
    end
  end
  # An anchor point in AR space.
  #
  # The `XRAnchor3D` point is an `XRNode3D` that maps a real world location identified by the AR platform to a position within the game world. For example, as long as plane detection in ARKit is on, ARKit will identify and update the position of planes (tables, floors, etc.) and create anchors for them.
  # This node is mapped to one of the anchors through its unique ID. When you receive a signal that a new anchor is available, you should add this node to your scene for that anchor. You can predefine nodes and set the ID; the nodes will simply remain on `(0, 0, 0)` until a plane is recognized.
  # Keep in mind that, as long as plane detection is enabled, the size, placing and orientation of an anchor will be updated as the detection logic learns more about the real world out there especially if only part of the surface is in view.
  class XRAnchor3D < Godot::XRNode3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_size : Void* = Pointer(Void).null
    # Returns the estimated size of the plane that was detected. Say when the anchor relates to a table in the real world, this is the estimated size of the surface of that table.
    def get_size() : Vector3
      if @@mb_get_size.null?
        @@mb_get_size = Bridge.get_method_bind("XRAnchor3D", "get_size", 3360562783_i64)
      end
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_plane : Void* = Pointer(Void).null
    # Returns a plane aligned with our anchor; handy for intersection testing.
    def get_plane() : Plane
      if @@mb_get_plane.null?
        @@mb_get_plane = Bridge.get_method_bind("XRAnchor3D", "get_plane", 2753500971_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_plane, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Plane.new(ret_ptr)
    end
  end
  # A node for driving body meshes from `XRBodyTracker` data.
  #
  # This node uses body tracking data from an `XRBodyTracker` to pose the skeleton of a body mesh.
  # Positioning of the body is performed by creating an `XRNode3D` ancestor of the body mesh driven by the same `XRBodyTracker`.
  # The body tracking position-data is scaled by `Skeleton3D.motion_scale` when applied to the skeleton, which can be used to adjust the tracked body to match the scale of the body model.
  class XRBodyModifier3D < Godot::SkeletonModifier3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum BodyUpdate : Int64
      BodyUpdateUpperBody = 1_i64
      BodyUpdateLowerBody = 2_i64
      BodyUpdateHands = 4_i64
    end
    enum BoneUpdate : Int64
      BoneUpdateFull = 0_i64
      BoneUpdateRotationOnly = 1_i64
      BoneUpdateMax = 2_i64
    end
    @@mb_set_body_tracker : Void* = Pointer(Void).null
    def set_body_tracker(tracker_name : String) : Void
      if @@mb_set_body_tracker.null?
        @@mb_set_body_tracker = Bridge.get_method_bind("XRBodyModifier3D", "set_body_tracker", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(tracker_name)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_body_tracker, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_body_tracker : Void* = Pointer(Void).null
    def get_body_tracker() : String
      if @@mb_get_body_tracker.null?
        @@mb_get_body_tracker = Bridge.get_method_bind("XRBodyModifier3D", "get_body_tracker", 2002593661_i64)
      end
      ""
    end
    @@mb_set_body_update : Void* = Pointer(Void).null
    def set_body_update(body_update : Int64) : Void
      if @@mb_set_body_update.null?
        @@mb_set_body_update = Bridge.get_method_bind("XRBodyModifier3D", "set_body_update", 2211199417_i64)
      end
      val_0 = body_update
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_body_update, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_body_update : Void* = Pointer(Void).null
    def get_body_update() : Int64
      if @@mb_get_body_update.null?
        @@mb_get_body_update = Bridge.get_method_bind("XRBodyModifier3D", "get_body_update", 2642335328_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_body_update, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bone_update : Void* = Pointer(Void).null
    def set_bone_update(bone_update : Int64) : Void
      if @@mb_set_bone_update.null?
        @@mb_set_bone_update = Bridge.get_method_bind("XRBodyModifier3D", "set_bone_update", 3356796943_i64)
      end
      val_0 = bone_update
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bone_update, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bone_update : Void* = Pointer(Void).null
    def get_bone_update() : Int64
      if @@mb_get_bone_update.null?
        @@mb_get_bone_update = Bridge.get_method_bind("XRBodyModifier3D", "get_bone_update", 1309305964_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_bone_update, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A tracked body in XR.
  #
  # A body tracking system will create an instance of this object and add it to the `XRServer`. This tracking system will then obtain skeleton data, convert it to the Godot Humanoid skeleton and store this data on the `XRBodyTracker` object.
  # Use `XRBodyModifier3D` to animate a body mesh using body tracking data.
  class XRBodyTracker < Godot::XRPositionalTracker
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum BodyFlags : Int64
      BodyFlagUpperBodySupported = 1_i64
      BodyFlagLowerBodySupported = 2_i64
      BodyFlagHandsSupported = 4_i64
    end
    enum Joint : Int64
      JointRoot = 0_i64
      JointHips = 1_i64
      JointSpine = 2_i64
      JointChest = 3_i64
      JointUpperChest = 4_i64
      JointNeck = 5_i64
      JointHead = 6_i64
      JointHeadTip = 7_i64
      JointLeftShoulder = 8_i64
      JointLeftUpperArm = 9_i64
      JointLeftLowerArm = 10_i64
      JointRightShoulder = 11_i64
      JointRightUpperArm = 12_i64
      JointRightLowerArm = 13_i64
      JointLeftUpperLeg = 14_i64
      JointLeftLowerLeg = 15_i64
      JointLeftFoot = 16_i64
      JointLeftToes = 17_i64
      JointRightUpperLeg = 18_i64
      JointRightLowerLeg = 19_i64
      JointRightFoot = 20_i64
      JointRightToes = 21_i64
      JointLeftHand = 22_i64
      JointLeftPalm = 23_i64
      JointLeftWrist = 24_i64
      JointLeftThumbMetacarpal = 25_i64
      JointLeftThumbPhalanxProximal = 26_i64
      JointLeftThumbPhalanxDistal = 27_i64
      JointLeftThumbTip = 28_i64
      JointLeftIndexFingerMetacarpal = 29_i64
      JointLeftIndexFingerPhalanxProximal = 30_i64
      JointLeftIndexFingerPhalanxIntermediate = 31_i64
      JointLeftIndexFingerPhalanxDistal = 32_i64
      JointLeftIndexFingerTip = 33_i64
      JointLeftMiddleFingerMetacarpal = 34_i64
      JointLeftMiddleFingerPhalanxProximal = 35_i64
      JointLeftMiddleFingerPhalanxIntermediate = 36_i64
      JointLeftMiddleFingerPhalanxDistal = 37_i64
      JointLeftMiddleFingerTip = 38_i64
      JointLeftRingFingerMetacarpal = 39_i64
      JointLeftRingFingerPhalanxProximal = 40_i64
      JointLeftRingFingerPhalanxIntermediate = 41_i64
      JointLeftRingFingerPhalanxDistal = 42_i64
      JointLeftRingFingerTip = 43_i64
      JointLeftPinkyFingerMetacarpal = 44_i64
      JointLeftPinkyFingerPhalanxProximal = 45_i64
      JointLeftPinkyFingerPhalanxIntermediate = 46_i64
      JointLeftPinkyFingerPhalanxDistal = 47_i64
      JointLeftPinkyFingerTip = 48_i64
      JointRightHand = 49_i64
      JointRightPalm = 50_i64
      JointRightWrist = 51_i64
      JointRightThumbMetacarpal = 52_i64
      JointRightThumbPhalanxProximal = 53_i64
      JointRightThumbPhalanxDistal = 54_i64
      JointRightThumbTip = 55_i64
      JointRightIndexFingerMetacarpal = 56_i64
      JointRightIndexFingerPhalanxProximal = 57_i64
      JointRightIndexFingerPhalanxIntermediate = 58_i64
      JointRightIndexFingerPhalanxDistal = 59_i64
      JointRightIndexFingerTip = 60_i64
      JointRightMiddleFingerMetacarpal = 61_i64
      JointRightMiddleFingerPhalanxProximal = 62_i64
      JointRightMiddleFingerPhalanxIntermediate = 63_i64
      JointRightMiddleFingerPhalanxDistal = 64_i64
      JointRightMiddleFingerTip = 65_i64
      JointRightRingFingerMetacarpal = 66_i64
      JointRightRingFingerPhalanxProximal = 67_i64
      JointRightRingFingerPhalanxIntermediate = 68_i64
      JointRightRingFingerPhalanxDistal = 69_i64
      JointRightRingFingerTip = 70_i64
      JointRightPinkyFingerMetacarpal = 71_i64
      JointRightPinkyFingerPhalanxProximal = 72_i64
      JointRightPinkyFingerPhalanxIntermediate = 73_i64
      JointRightPinkyFingerPhalanxDistal = 74_i64
      JointRightPinkyFingerTip = 75_i64
      JointLowerChest = 76_i64
      JointLeftScapula = 77_i64
      JointLeftWristTwist = 78_i64
      JointRightScapula = 79_i64
      JointRightWristTwist = 80_i64
      JointLeftFootTwist = 81_i64
      JointLeftHeel = 82_i64
      JointLeftMiddleFoot = 83_i64
      JointRightFootTwist = 84_i64
      JointRightHeel = 85_i64
      JointRightMiddleFoot = 86_i64
      JointMax = 87_i64
    end
    enum JointFlags : Int64
      JointFlagOrientationValid = 1_i64
      JointFlagOrientationTracked = 2_i64
      JointFlagPositionValid = 4_i64
      JointFlagPositionTracked = 8_i64
    end
    @@mb_set_has_tracking_data : Void* = Pointer(Void).null
    def set_has_tracking_data(has_data : Bool) : Void
      if @@mb_set_has_tracking_data.null?
        @@mb_set_has_tracking_data = Bridge.get_method_bind("XRBodyTracker", "set_has_tracking_data", 2586408642_i64)
      end
      val_0 = has_data
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_has_tracking_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_has_tracking_data : Void* = Pointer(Void).null
    def get_has_tracking_data() : Bool
      if @@mb_get_has_tracking_data.null?
        @@mb_get_has_tracking_data = Bridge.get_method_bind("XRBodyTracker", "get_has_tracking_data", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_has_tracking_data, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_body_flags : Void* = Pointer(Void).null
    def set_body_flags(flags : Int64) : Void
      if @@mb_set_body_flags.null?
        @@mb_set_body_flags = Bridge.get_method_bind("XRBodyTracker", "set_body_flags", 2103235750_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_body_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_body_flags : Void* = Pointer(Void).null
    def get_body_flags() : Int64
      if @@mb_get_body_flags.null?
        @@mb_get_body_flags = Bridge.get_method_bind("XRBodyTracker", "get_body_flags", 3543166366_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_body_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_joint_flags : Void* = Pointer(Void).null
    # Sets flags about the validity of the tracking data for the given body joint.
    def set_joint_flags(joint : Int64, flags : Int64) : Void
      if @@mb_set_joint_flags.null?
        @@mb_set_joint_flags = Bridge.get_method_bind("XRBodyTracker", "set_joint_flags", 592144999_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = flags
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_joint_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joint_flags : Void* = Pointer(Void).null
    # Returns flags about the validity of the tracking data for the given body joint.
    def get_joint_flags(joint : Int64) : Int64
      if @@mb_get_joint_flags.null?
        @@mb_get_joint_flags = Bridge.get_method_bind("XRBodyTracker", "get_joint_flags", 1030162609_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_joint_flags, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_joint_transform : Void* = Pointer(Void).null
    # Sets the transform for the given body joint.
    def set_joint_transform(joint : Int64, transform : Transform3D) : Void
      if @@mb_set_joint_transform.null?
        @@mb_set_joint_transform = Bridge.get_method_bind("XRBodyTracker", "set_joint_transform", 2635424328_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_joint_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joint_transform : Void* = Pointer(Void).null
    # Returns the transform for the given body joint.
    def get_joint_transform(joint : Int64) : Transform3D
      if @@mb_get_joint_transform.null?
        @@mb_get_joint_transform = Bridge.get_method_bind("XRBodyTracker", "get_joint_transform", 3474811534_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_joint_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  # A camera node which automatically positions itself based on XR tracking data.
  #
  # A camera node which automatically positions itself based on XR tracking data.
  # In contrast to `XRController3D`, the render thread has access to more up-to-date tracking data, and the location of the `XRCamera3D` node can lag a few milliseconds behind what is used for rendering.
  # **Note:** If `Viewport.use_xr` is `true`, most of the camera properties are overridden by the active `XRInterface`. The only properties that can be trusted are the near and far planes.
  class XRCamera3D < Godot::Camera3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A 3D node representing a spatially-tracked controller.
  #
  # This is a helper 3D node that is linked to the tracking of controllers. It also offers several handy passthroughs to the state of buttons and such on the controllers.
  # Controllers are linked by their ID. You can create controller nodes before the controllers are available. If your game always uses two controllers (one for each hand), you can predefine the controllers with ID 1 and 2; they will become active as soon as the controllers are identified. If you expect additional controllers to be used, you should react to the signals and add XRController3D nodes to your scene.
  # The position of the controller node is automatically updated by the `XRServer`. This makes this node ideal to add child nodes to visualize the controller.
  # The current `XRInterface` defines the names of inputs. In the case of OpenXR, these are the names of actions in the current action set from the OpenXR action map.
  class XRController3D < Godot::XRNode3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_is_button_pressed : Void* = Pointer(Void).null
    # Returns `true` if the button with the given `name` is pressed.
    # **Note:** The current `XRInterface` defines the `name` for each input. In the case of OpenXR, these are the names of actions in the current action set.
    def is_button_pressed(name : String) : Bool
      if @@mb_is_button_pressed.null?
        @@mb_is_button_pressed = Bridge.get_method_bind("XRController3D", "is_button_pressed", 2619796661_i64)
      end
      sn_0 = Bridge.make_string_name(name)
      arg_0 = sn_0
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_button_pressed, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_input : Void* = Pointer(Void).null
    # Returns a `Variant` for the input with the given `name`. This works for any input type, the variant will be typed according to the actions configuration.
    # **Note:** The current `XRInterface` defines the `name` for each input. In the case of OpenXR, these are the names of actions in the current action set.
    def get_input(name : String) : Void*
      if @@mb_get_input.null?
        @@mb_get_input = Bridge.get_method_bind("XRController3D", "get_input", 2760726917_i64)
      end
      sn_0 = Bridge.make_string_name(name)
      arg_0 = sn_0
      args = [arg_0]
      ret_var = StaticArray(UInt8, 24).new(0_u8)
      Bridge.ptrcall(@@mb_get_input, @pointer, args.to_unsafe.as(Void**), ret_var.to_unsafe.as(Void*))
      ret_ptr = Pointer(Void).null
      Bridge.type_from_variant(24, pointerof(ret_ptr).as(Void*), ret_var.to_unsafe.as(Void*))
      ret_ptr
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_float : Void* = Pointer(Void).null
    # Returns a numeric value for the input with the given `name`. This is used for triggers and grip sensors.
    # **Note:** The current `XRInterface` defines the `name` for each input. In the case of OpenXR, these are the names of actions in the current action set.
    def get_float(name : String) : Float64
      if @@mb_get_float.null?
        @@mb_get_float = Bridge.get_method_bind("XRController3D", "get_float", 2349060816_i64)
      end
      sn_0 = Bridge.make_string_name(name)
      arg_0 = sn_0
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_float, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_vector2 : Void* = Pointer(Void).null
    # Returns a `Vector2` for the input with the given `name`. This is used for thumbsticks and thumbpads found on many controllers.
    # **Note:** The current `XRInterface` defines the `name` for each input. In the case of OpenXR, these are the names of actions in the current action set.
    def get_vector2(name : String) : Vector2
      if @@mb_get_vector2.null?
        @@mb_get_vector2 = Bridge.get_method_bind("XRController3D", "get_vector2", 3100822709_i64)
      end
      sn_0 = Bridge.make_string_name(name)
      arg_0 = sn_0
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_vector2, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_tracker_hand : Void* = Pointer(Void).null
    # Returns the hand holding this controller, if known.
    def get_tracker_hand() : Int64
      if @@mb_get_tracker_hand.null?
        @@mb_get_tracker_hand = Bridge.get_method_bind("XRController3D", "get_tracker_hand", 4181770860_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tracker_hand, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A tracked controller.
  #
  # An instance of this object represents a controller that is tracked.
  # As controllers are turned on and the `XRInterface` detects them, instances of this object are automatically added to this list of active tracking objects accessible through the `XRServer`.
  # The `XRController3D` consumes objects of this type and should be used in your project.
  class XRControllerTracker < Godot::XRPositionalTracker
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  # A node for driving standard face meshes from `XRFaceTracker` weights.
  #
  # This node applies weights from an `XRFaceTracker` to a mesh with supporting face blend shapes.
  # The [$2]($1) blend shapes are supported, as well as ARKit and SRanipal blend shapes.
  # The node attempts to identify blend shapes based on name matching. Blend shapes should match the names listed in the [$2]($1) chart.
  class XRFaceModifier3D < Godot::Node3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_face_tracker : Void* = Pointer(Void).null
    def set_face_tracker(tracker_name : String) : Void
      if @@mb_set_face_tracker.null?
        @@mb_set_face_tracker = Bridge.get_method_bind("XRFaceModifier3D", "set_face_tracker", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(tracker_name)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_face_tracker, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_face_tracker : Void* = Pointer(Void).null
    def get_face_tracker() : String
      if @@mb_get_face_tracker.null?
        @@mb_get_face_tracker = Bridge.get_method_bind("XRFaceModifier3D", "get_face_tracker", 2002593661_i64)
      end
      ""
    end
    @@mb_set_target : Void* = Pointer(Void).null
    def set_target(target : NodePath) : Void
      if @@mb_set_target.null?
        @@mb_set_target = Bridge.get_method_bind("XRFaceModifier3D", "set_target", 1348162250_i64)
      end
      val_0 = target
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target : Void* = Pointer(Void).null
    def get_target() : NodePath
      if @@mb_get_target.null?
        @@mb_get_target = Bridge.get_method_bind("XRFaceModifier3D", "get_target", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_target, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
  end
  # A tracked face.
  #
  # An instance of this object represents a tracked face and its corresponding blend shapes. The blend shapes come from the [$2]($1) standard, and contain extended details and visuals for each blend shape. Additionally the [$2]($1) page documents the relationship between Unified Expressions and other standards.
  # As face trackers are turned on they are registered with the `XRServer`.
  class XRFaceTracker < Godot::XRTracker
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum BlendShapeEntry : Int64
      FtEyeLookOutRight = 0_i64
      FtEyeLookInRight = 1_i64
      FtEyeLookUpRight = 2_i64
      FtEyeLookDownRight = 3_i64
      FtEyeLookOutLeft = 4_i64
      FtEyeLookInLeft = 5_i64
      FtEyeLookUpLeft = 6_i64
      FtEyeLookDownLeft = 7_i64
      FtEyeClosedRight = 8_i64
      FtEyeClosedLeft = 9_i64
      FtEyeSquintRight = 10_i64
      FtEyeSquintLeft = 11_i64
      FtEyeWideRight = 12_i64
      FtEyeWideLeft = 13_i64
      FtEyeDilationRight = 14_i64
      FtEyeDilationLeft = 15_i64
      FtEyeConstrictRight = 16_i64
      FtEyeConstrictLeft = 17_i64
      FtBrowPinchRight = 18_i64
      FtBrowPinchLeft = 19_i64
      FtBrowLowererRight = 20_i64
      FtBrowLowererLeft = 21_i64
      FtBrowInnerUpRight = 22_i64
      FtBrowInnerUpLeft = 23_i64
      FtBrowOuterUpRight = 24_i64
      FtBrowOuterUpLeft = 25_i64
      FtNoseSneerRight = 26_i64
      FtNoseSneerLeft = 27_i64
      FtNasalDilationRight = 28_i64
      FtNasalDilationLeft = 29_i64
      FtNasalConstrictRight = 30_i64
      FtNasalConstrictLeft = 31_i64
      FtCheekSquintRight = 32_i64
      FtCheekSquintLeft = 33_i64
      FtCheekPuffRight = 34_i64
      FtCheekPuffLeft = 35_i64
      FtCheekSuckRight = 36_i64
      FtCheekSuckLeft = 37_i64
      FtJawOpen = 38_i64
      FtMouthClosed = 39_i64
      FtJawRight = 40_i64
      FtJawLeft = 41_i64
      FtJawForward = 42_i64
      FtJawBackward = 43_i64
      FtJawClench = 44_i64
      FtJawMandibleRaise = 45_i64
      FtLipSuckUpperRight = 46_i64
      FtLipSuckUpperLeft = 47_i64
      FtLipSuckLowerRight = 48_i64
      FtLipSuckLowerLeft = 49_i64
      FtLipSuckCornerRight = 50_i64
      FtLipSuckCornerLeft = 51_i64
      FtLipFunnelUpperRight = 52_i64
      FtLipFunnelUpperLeft = 53_i64
      FtLipFunnelLowerRight = 54_i64
      FtLipFunnelLowerLeft = 55_i64
      FtLipPuckerUpperRight = 56_i64
      FtLipPuckerUpperLeft = 57_i64
      FtLipPuckerLowerRight = 58_i64
      FtLipPuckerLowerLeft = 59_i64
      FtMouthUpperUpRight = 60_i64
      FtMouthUpperUpLeft = 61_i64
      FtMouthLowerDownRight = 62_i64
      FtMouthLowerDownLeft = 63_i64
      FtMouthUpperDeepenRight = 64_i64
      FtMouthUpperDeepenLeft = 65_i64
      FtMouthUpperRight = 66_i64
      FtMouthUpperLeft = 67_i64
      FtMouthLowerRight = 68_i64
      FtMouthLowerLeft = 69_i64
      FtMouthCornerPullRight = 70_i64
      FtMouthCornerPullLeft = 71_i64
      FtMouthCornerSlantRight = 72_i64
      FtMouthCornerSlantLeft = 73_i64
      FtMouthFrownRight = 74_i64
      FtMouthFrownLeft = 75_i64
      FtMouthStretchRight = 76_i64
      FtMouthStretchLeft = 77_i64
      FtMouthDimpleRight = 78_i64
      FtMouthDimpleLeft = 79_i64
      FtMouthRaiserUpper = 80_i64
      FtMouthRaiserLower = 81_i64
      FtMouthPressRight = 82_i64
      FtMouthPressLeft = 83_i64
      FtMouthTightenerRight = 84_i64
      FtMouthTightenerLeft = 85_i64
      FtTongueOut = 86_i64
      FtTongueUp = 87_i64
      FtTongueDown = 88_i64
      FtTongueRight = 89_i64
      FtTongueLeft = 90_i64
      FtTongueRoll = 91_i64
      FtTongueBlendDown = 92_i64
      FtTongueCurlUp = 93_i64
      FtTongueSquish = 94_i64
      FtTongueFlat = 95_i64
      FtTongueTwistRight = 96_i64
      FtTongueTwistLeft = 97_i64
      FtSoftPalateClose = 98_i64
      FtThroatSwallow = 99_i64
      FtNeckFlexRight = 100_i64
      FtNeckFlexLeft = 101_i64
      FtEyeClosed = 102_i64
      FtEyeWide = 103_i64
      FtEyeSquint = 104_i64
      FtEyeDilation = 105_i64
      FtEyeConstrict = 106_i64
      FtBrowDownRight = 107_i64
      FtBrowDownLeft = 108_i64
      FtBrowDown = 109_i64
      FtBrowUpRight = 110_i64
      FtBrowUpLeft = 111_i64
      FtBrowUp = 112_i64
      FtNoseSneer = 113_i64
      FtNasalDilation = 114_i64
      FtNasalConstrict = 115_i64
      FtCheekPuff = 116_i64
      FtCheekSuck = 117_i64
      FtCheekSquint = 118_i64
      FtLipSuckUpper = 119_i64
      FtLipSuckLower = 120_i64
      FtLipSuck = 121_i64
      FtLipFunnelUpper = 122_i64
      FtLipFunnelLower = 123_i64
      FtLipFunnel = 124_i64
      FtLipPuckerUpper = 125_i64
      FtLipPuckerLower = 126_i64
      FtLipPucker = 127_i64
      FtMouthUpperUp = 128_i64
      FtMouthLowerDown = 129_i64
      FtMouthOpen = 130_i64
      FtMouthRight = 131_i64
      FtMouthLeft = 132_i64
      FtMouthSmileRight = 133_i64
      FtMouthSmileLeft = 134_i64
      FtMouthSmile = 135_i64
      FtMouthSadRight = 136_i64
      FtMouthSadLeft = 137_i64
      FtMouthSad = 138_i64
      FtMouthStretch = 139_i64
      FtMouthDimple = 140_i64
      FtMouthTightener = 141_i64
      FtMouthPress = 142_i64
      FtMax = 143_i64
    end
    @@mb_get_blend_shape : Void* = Pointer(Void).null
    # Returns the requested face blend shape weight.
    def get_blend_shape(blend_shape : Int64) : Float64
      if @@mb_get_blend_shape.null?
        @@mb_get_blend_shape = Bridge.get_method_bind("XRFaceTracker", "get_blend_shape", 330010046_i64)
      end
      val_0 = blend_shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_blend_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_blend_shape : Void* = Pointer(Void).null
    # Sets a face blend shape weight.
    def set_blend_shape(blend_shape : Int64, weight : Float64) : Void
      if @@mb_set_blend_shape.null?
        @@mb_set_blend_shape = Bridge.get_method_bind("XRFaceTracker", "set_blend_shape", 2352588791_i64)
      end
      val_0 = blend_shape
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = weight
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_blend_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_blend_shapes : Void* = Pointer(Void).null
    def get_blend_shapes() : Void*
      if @@mb_get_blend_shapes.null?
        @@mb_get_blend_shapes = Bridge.get_method_bind("XRFaceTracker", "get_blend_shapes", 675695659_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_blend_shapes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_blend_shapes : Void* = Pointer(Void).null
    def set_blend_shapes(weights : Void*) : Void
      if @@mb_set_blend_shapes.null?
        @@mb_set_blend_shapes = Bridge.get_method_bind("XRFaceTracker", "set_blend_shapes", 2899603908_i64)
      end
      val_0 = weights
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_blend_shapes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  # A node for driving hand meshes from `XRHandTracker` data.
  #
  # This node uses hand tracking data from an `XRHandTracker` to pose the skeleton of a hand mesh.
  # Positioning of hands is performed by creating an `XRNode3D` ancestor of the hand mesh driven by the same `XRHandTracker`.
  # The hand tracking position-data is scaled by `Skeleton3D.motion_scale` when applied to the skeleton, which can be used to adjust the tracked hand to match the scale of the hand model.
  class XRHandModifier3D < Godot::SkeletonModifier3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum BoneUpdate : Int64
      BoneUpdateFull = 0_i64
      BoneUpdateRotationOnly = 1_i64
      BoneUpdateMax = 2_i64
    end
    @@mb_set_hand_tracker : Void* = Pointer(Void).null
    def set_hand_tracker(tracker_name : String) : Void
      if @@mb_set_hand_tracker.null?
        @@mb_set_hand_tracker = Bridge.get_method_bind("XRHandModifier3D", "set_hand_tracker", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(tracker_name)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hand_tracker, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_hand_tracker : Void* = Pointer(Void).null
    def get_hand_tracker() : String
      if @@mb_get_hand_tracker.null?
        @@mb_get_hand_tracker = Bridge.get_method_bind("XRHandModifier3D", "get_hand_tracker", 2002593661_i64)
      end
      ""
    end
    @@mb_set_bone_update : Void* = Pointer(Void).null
    def set_bone_update(bone_update : Int64) : Void
      if @@mb_set_bone_update.null?
        @@mb_set_bone_update = Bridge.get_method_bind("XRHandModifier3D", "set_bone_update", 3635701455_i64)
      end
      val_0 = bone_update
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bone_update, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bone_update : Void* = Pointer(Void).null
    def get_bone_update() : Int64
      if @@mb_get_bone_update.null?
        @@mb_get_bone_update = Bridge.get_method_bind("XRHandModifier3D", "get_bone_update", 2873665691_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_bone_update, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # A tracked hand in XR.
  #
  # A hand tracking system will create an instance of this object and add it to the `XRServer`. This tracking system will then obtain skeleton data, convert it to the Godot Humanoid hand skeleton and store this data on the `XRHandTracker` object.
  # Use `XRHandModifier3D` to animate a hand mesh using hand tracking data.
  class XRHandTracker < Godot::XRPositionalTracker
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum HandTrackingSource : Int64
      HandTrackingSourceUnknown = 0_i64
      HandTrackingSourceUnobstructed = 1_i64
      HandTrackingSourceController = 2_i64
      HandTrackingSourceNotTracked = 3_i64
      HandTrackingSourceMax = 4_i64
    end
    enum HandJoint : Int64
      HandJointPalm = 0_i64
      HandJointWrist = 1_i64
      HandJointThumbMetacarpal = 2_i64
      HandJointThumbPhalanxProximal = 3_i64
      HandJointThumbPhalanxDistal = 4_i64
      HandJointThumbTip = 5_i64
      HandJointIndexFingerMetacarpal = 6_i64
      HandJointIndexFingerPhalanxProximal = 7_i64
      HandJointIndexFingerPhalanxIntermediate = 8_i64
      HandJointIndexFingerPhalanxDistal = 9_i64
      HandJointIndexFingerTip = 10_i64
      HandJointMiddleFingerMetacarpal = 11_i64
      HandJointMiddleFingerPhalanxProximal = 12_i64
      HandJointMiddleFingerPhalanxIntermediate = 13_i64
      HandJointMiddleFingerPhalanxDistal = 14_i64
      HandJointMiddleFingerTip = 15_i64
      HandJointRingFingerMetacarpal = 16_i64
      HandJointRingFingerPhalanxProximal = 17_i64
      HandJointRingFingerPhalanxIntermediate = 18_i64
      HandJointRingFingerPhalanxDistal = 19_i64
      HandJointRingFingerTip = 20_i64
      HandJointPinkyFingerMetacarpal = 21_i64
      HandJointPinkyFingerPhalanxProximal = 22_i64
      HandJointPinkyFingerPhalanxIntermediate = 23_i64
      HandJointPinkyFingerPhalanxDistal = 24_i64
      HandJointPinkyFingerTip = 25_i64
      HandJointMax = 26_i64
    end
    enum HandJointFlags : Int64
      HandJointFlagOrientationValid = 1_i64
      HandJointFlagOrientationTracked = 2_i64
      HandJointFlagPositionValid = 4_i64
      HandJointFlagPositionTracked = 8_i64
      HandJointFlagLinearVelocityValid = 16_i64
      HandJointFlagAngularVelocityValid = 32_i64
    end
    @@mb_set_has_tracking_data : Void* = Pointer(Void).null
    def set_has_tracking_data(has_data : Bool) : Void
      if @@mb_set_has_tracking_data.null?
        @@mb_set_has_tracking_data = Bridge.get_method_bind("XRHandTracker", "set_has_tracking_data", 2586408642_i64)
      end
      val_0 = has_data
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_has_tracking_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_has_tracking_data : Void* = Pointer(Void).null
    def get_has_tracking_data() : Bool
      if @@mb_get_has_tracking_data.null?
        @@mb_get_has_tracking_data = Bridge.get_method_bind("XRHandTracker", "get_has_tracking_data", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_has_tracking_data, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_hand_tracking_source : Void* = Pointer(Void).null
    def set_hand_tracking_source(source : Int64) : Void
      if @@mb_set_hand_tracking_source.null?
        @@mb_set_hand_tracking_source = Bridge.get_method_bind("XRHandTracker", "set_hand_tracking_source", 2958308861_i64)
      end
      val_0 = source
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hand_tracking_source, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hand_tracking_source : Void* = Pointer(Void).null
    def get_hand_tracking_source() : Int64
      if @@mb_get_hand_tracking_source.null?
        @@mb_get_hand_tracking_source = Bridge.get_method_bind("XRHandTracker", "get_hand_tracking_source", 2475045250_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_hand_tracking_source, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_hand_joint_flags : Void* = Pointer(Void).null
    # Sets flags about the validity of the tracking data for the given hand joint.
    def set_hand_joint_flags(joint : Int64, flags : Int64) : Void
      if @@mb_set_hand_joint_flags.null?
        @@mb_set_hand_joint_flags = Bridge.get_method_bind("XRHandTracker", "set_hand_joint_flags", 3028437365_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = flags
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_hand_joint_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hand_joint_flags : Void* = Pointer(Void).null
    # Returns flags about the validity of the tracking data for the given hand joint.
    def get_hand_joint_flags(joint : Int64) : Int64
      if @@mb_get_hand_joint_flags.null?
        @@mb_get_hand_joint_flags = Bridge.get_method_bind("XRHandTracker", "get_hand_joint_flags", 1730972401_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_hand_joint_flags, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_hand_joint_transform : Void* = Pointer(Void).null
    # Sets the transform for the given hand joint.
    def set_hand_joint_transform(joint : Int64, transform : Transform3D) : Void
      if @@mb_set_hand_joint_transform.null?
        @@mb_set_hand_joint_transform = Bridge.get_method_bind("XRHandTracker", "set_hand_joint_transform", 2529959613_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_hand_joint_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hand_joint_transform : Void* = Pointer(Void).null
    # Returns the transform for the given hand joint.
    def get_hand_joint_transform(joint : Int64) : Transform3D
      if @@mb_get_hand_joint_transform.null?
        @@mb_get_hand_joint_transform = Bridge.get_method_bind("XRHandTracker", "get_hand_joint_transform", 1090840196_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_hand_joint_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_hand_joint_radius : Void* = Pointer(Void).null
    # Sets the radius of the given hand joint.
    def set_hand_joint_radius(joint : Int64, radius : Float64) : Void
      if @@mb_set_hand_joint_radius.null?
        @@mb_set_hand_joint_radius = Bridge.get_method_bind("XRHandTracker", "set_hand_joint_radius", 2723659615_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = radius
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_hand_joint_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hand_joint_radius : Void* = Pointer(Void).null
    # Returns the radius of the given hand joint.
    def get_hand_joint_radius(joint : Int64) : Float64
      if @@mb_get_hand_joint_radius.null?
        @@mb_get_hand_joint_radius = Bridge.get_method_bind("XRHandTracker", "get_hand_joint_radius", 3400025734_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_hand_joint_radius, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_hand_joint_linear_velocity : Void* = Pointer(Void).null
    # Sets the linear velocity for the given hand joint.
    def set_hand_joint_linear_velocity(joint : Int64, linear_velocity : Vector3) : Void
      if @@mb_set_hand_joint_linear_velocity.null?
        @@mb_set_hand_joint_linear_velocity = Bridge.get_method_bind("XRHandTracker", "set_hand_joint_linear_velocity", 1978646737_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = linear_velocity
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_hand_joint_linear_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hand_joint_linear_velocity : Void* = Pointer(Void).null
    # Returns the linear velocity for the given hand joint.
    def get_hand_joint_linear_velocity(joint : Int64) : Vector3
      if @@mb_get_hand_joint_linear_velocity.null?
        @@mb_get_hand_joint_linear_velocity = Bridge.get_method_bind("XRHandTracker", "get_hand_joint_linear_velocity", 547240792_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_hand_joint_linear_velocity, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_hand_joint_angular_velocity : Void* = Pointer(Void).null
    # Sets the angular velocity for the given hand joint.
    def set_hand_joint_angular_velocity(joint : Int64, angular_velocity : Vector3) : Void
      if @@mb_set_hand_joint_angular_velocity.null?
        @@mb_set_hand_joint_angular_velocity = Bridge.get_method_bind("XRHandTracker", "set_hand_joint_angular_velocity", 1978646737_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = angular_velocity
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_hand_joint_angular_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hand_joint_angular_velocity : Void* = Pointer(Void).null
    # Returns the angular velocity for the given hand joint.
    def get_hand_joint_angular_velocity(joint : Int64) : Vector3
      if @@mb_get_hand_joint_angular_velocity.null?
        @@mb_get_hand_joint_angular_velocity = Bridge.get_method_bind("XRHandTracker", "get_hand_joint_angular_velocity", 547240792_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_hand_joint_angular_velocity, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  # Base class for XR interface extensions (plugins).
  #
  # External XR interface plugins should inherit from this class.
  class XRInterfaceExtension < Godot::XRInterface
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_color_texture : Void* = Pointer(Void).null
    def get_color_texture() : Int64
      if @@mb_get_color_texture.null?
        @@mb_get_color_texture = Bridge.get_method_bind("XRInterfaceExtension", "get_color_texture", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_color_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_depth_texture : Void* = Pointer(Void).null
    def get_depth_texture() : Int64
      if @@mb_get_depth_texture.null?
        @@mb_get_depth_texture = Bridge.get_method_bind("XRInterfaceExtension", "get_depth_texture", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_depth_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_velocity_texture : Void* = Pointer(Void).null
    def get_velocity_texture() : Int64
      if @@mb_get_velocity_texture.null?
        @@mb_get_velocity_texture = Bridge.get_method_bind("XRInterfaceExtension", "get_velocity_texture", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_velocity_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_blit : Void* = Pointer(Void).null
    # Blits our render results to screen optionally applying lens distortion. This can only be called while processing `_commit_views`.
    def add_blit(render_target : Int64, src_rect : Rect2, dst_rect : Rect2i, use_layer : Bool, layer : Int64, apply_lens_distortion : Bool, eye_center : Vector2, k1 : Float64, k2 : Float64, upscale : Float64, aspect_ratio : Float64) : Void
      if @@mb_add_blit.null?
        @@mb_add_blit = Bridge.get_method_bind("XRInterfaceExtension", "add_blit", 258596971_i64)
      end
      val_0 = render_target
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = src_rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = dst_rect
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = use_layer
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = layer
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = apply_lens_distortion
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = eye_center
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = k1
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = k2
      arg_8 = pointerof(val_8).as(Void*)
      val_9 = upscale
      arg_9 = pointerof(val_9).as(Void*)
      val_10 = aspect_ratio
      arg_10 = pointerof(val_10).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9, arg_10]
      Bridge.ptrcall(@@mb_add_blit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_render_target_texture : Void* = Pointer(Void).null
    # Returns a valid `RID` for a texture to which we should render the current frame if supported by the interface.
    def get_render_target_texture(render_target : Int64) : Int64
      if @@mb_get_render_target_texture.null?
        @@mb_get_render_target_texture = Bridge.get_method_bind("XRInterfaceExtension", "get_render_target_texture", 41030802_i64)
      end
      val_0 = render_target
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_render_target_texture, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  # The origin point in AR/VR.
  #
  # This is a special node within the AR/VR system that maps the physical location of the center of our tracking space to the virtual location within our game world.
  # Multiple origin points can be added to the scene tree, but only one can used at a time. All the `XRCamera3D`, `XRController3D`, and `XRAnchor3D` nodes should be direct children of this node for spatial tracking to work correctly.
  # It is the position of this node that you update when your character needs to move through your game world while we're not moving in the real world. Movement in the real world is always in relation to this origin point.
  # For example, if your character is driving a car, the `XROrigin3D` node should be a child node of this car. Or, if you're implementing a teleport system to move your character, you should change the position of this node.
  class XROrigin3D < Godot::Node3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_world_scale : Void* = Pointer(Void).null
    def set_world_scale(world_scale : Float64) : Void
      if @@mb_set_world_scale.null?
        @@mb_set_world_scale = Bridge.get_method_bind("XROrigin3D", "set_world_scale", 373806689_i64)
      end
      val_0 = world_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_world_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_world_scale : Void* = Pointer(Void).null
    def get_world_scale() : Float64
      if @@mb_get_world_scale.null?
        @@mb_get_world_scale = Bridge.get_method_bind("XROrigin3D", "get_world_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_world_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_current : Void* = Pointer(Void).null
    def set_current(enabled : Bool) : Void
      if @@mb_set_current.null?
        @@mb_set_current = Bridge.get_method_bind("XROrigin3D", "set_current", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_current, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_current : Void* = Pointer(Void).null
    def is_current() : Bool
      if @@mb_is_current.null?
        @@mb_is_current = Bridge.get_method_bind("XROrigin3D", "is_current", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_current, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  # This object contains all data related to a pose on a tracked object.
  #
  # XR runtimes often identify multiple locations on devices such as controllers that are spatially tracked.
  # Orientation, location, linear velocity and angular velocity are all provided for each pose by the XR runtime. This object contains this state of a pose.
  class XRPose < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum TrackingConfidence : Int64
      XrTrackingConfidenceNone = 0_i64
      XrTrackingConfidenceLow = 1_i64
      XrTrackingConfidenceHigh = 2_i64
    end
    @@mb_set_has_tracking_data : Void* = Pointer(Void).null
    def set_has_tracking_data(has_tracking_data : Bool) : Void
      if @@mb_set_has_tracking_data.null?
        @@mb_set_has_tracking_data = Bridge.get_method_bind("XRPose", "set_has_tracking_data", 2586408642_i64)
      end
      val_0 = has_tracking_data
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_has_tracking_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_has_tracking_data : Void* = Pointer(Void).null
    def get_has_tracking_data() : Bool
      if @@mb_get_has_tracking_data.null?
        @@mb_get_has_tracking_data = Bridge.get_method_bind("XRPose", "get_has_tracking_data", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_has_tracking_data, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_name : Void* = Pointer(Void).null
    def set_name(name : String) : Void
      if @@mb_set_name.null?
        @@mb_set_name = Bridge.get_method_bind("XRPose", "set_name", 3304788590_i64)
      end
      sn_0 = Bridge.make_string_name(name)
      arg_0 = sn_0
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_name : Void* = Pointer(Void).null
    def get_name() : String
      if @@mb_get_name.null?
        @@mb_get_name = Bridge.get_method_bind("XRPose", "get_name", 2002593661_i64)
      end
      ""
    end
    @@mb_set_transform : Void* = Pointer(Void).null
    def set_transform(transform : Transform3D) : Void
      if @@mb_set_transform.null?
        @@mb_set_transform = Bridge.get_method_bind("XRPose", "set_transform", 2952846383_i64)
      end
      val_0 = transform
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_transform : Void* = Pointer(Void).null
    def get_transform() : Transform3D
      if @@mb_get_transform.null?
        @@mb_get_transform = Bridge.get_method_bind("XRPose", "get_transform", 3229777777_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_transform, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_adjusted_transform : Void* = Pointer(Void).null
    # Returns the `transform` with world scale and our reference frame applied. This is the transform used to position `XRNode3D` objects.
    def get_adjusted_transform() : Transform3D
      if @@mb_get_adjusted_transform.null?
        @@mb_get_adjusted_transform = Bridge.get_method_bind("XRPose", "get_adjusted_transform", 3229777777_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_adjusted_transform, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_linear_velocity : Void* = Pointer(Void).null
    def set_linear_velocity(velocity : Vector3) : Void
      if @@mb_set_linear_velocity.null?
        @@mb_set_linear_velocity = Bridge.get_method_bind("XRPose", "set_linear_velocity", 3460891852_i64)
      end
      val_0 = velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_linear_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_linear_velocity : Void* = Pointer(Void).null
    def get_linear_velocity() : Vector3
      if @@mb_get_linear_velocity.null?
        @@mb_get_linear_velocity = Bridge.get_method_bind("XRPose", "get_linear_velocity", 3360562783_i64)
      end
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_linear_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_angular_velocity : Void* = Pointer(Void).null
    def set_angular_velocity(velocity : Vector3) : Void
      if @@mb_set_angular_velocity.null?
        @@mb_set_angular_velocity = Bridge.get_method_bind("XRPose", "set_angular_velocity", 3460891852_i64)
      end
      val_0 = velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_angular_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_angular_velocity : Void* = Pointer(Void).null
    def get_angular_velocity() : Vector3
      if @@mb_get_angular_velocity.null?
        @@mb_get_angular_velocity = Bridge.get_method_bind("XRPose", "get_angular_velocity", 3360562783_i64)
      end
      ret = Vector3.new
      Bridge.ptrcall(@@mb_get_angular_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tracking_confidence : Void* = Pointer(Void).null
    def set_tracking_confidence(tracking_confidence : Int64) : Void
      if @@mb_set_tracking_confidence.null?
        @@mb_set_tracking_confidence = Bridge.get_method_bind("XRPose", "set_tracking_confidence", 4171656666_i64)
      end
      val_0 = tracking_confidence
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tracking_confidence, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tracking_confidence : Void* = Pointer(Void).null
    def get_tracking_confidence() : Int64
      if @@mb_get_tracking_confidence.null?
        @@mb_get_tracking_confidence = Bridge.get_method_bind("XRPose", "get_tracking_confidence", 2064923680_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tracking_confidence, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Server for AR and VR features.
  #
  # The AR/VR server is the heart of our Advanced and Virtual Reality solution and handles all the processing.
  class XRServer < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum TrackerType : Int64
      TrackerHead = 1_i64
      TrackerController = 2_i64
      TrackerBasestation = 4_i64
      TrackerAnchor = 8_i64
      TrackerHand = 16_i64
      TrackerBody = 32_i64
      TrackerFace = 64_i64
      TrackerAnyKnown = 127_i64
      TrackerUnknown = 128_i64
      TrackerAny = 255_i64
    end
    enum RotationMode : Int64
      ResetFullRotation = 0_i64
      ResetButKeepTilt = 1_i64
      DontResetRotation = 2_i64
    end
    @@mb_get_world_scale : Void* = Pointer(Void).null
    def get_world_scale() : Float64
      if @@mb_get_world_scale.null?
        @@mb_get_world_scale = Bridge.get_method_bind("XRServer", "get_world_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_world_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_world_scale : Void* = Pointer(Void).null
    def set_world_scale(scale : Float64) : Void
      if @@mb_set_world_scale.null?
        @@mb_set_world_scale = Bridge.get_method_bind("XRServer", "set_world_scale", 373806689_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_world_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_world_origin : Void* = Pointer(Void).null
    def get_world_origin() : Transform3D
      if @@mb_get_world_origin.null?
        @@mb_get_world_origin = Bridge.get_method_bind("XRServer", "get_world_origin", 3229777777_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_world_origin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_world_origin : Void* = Pointer(Void).null
    def set_world_origin(world_origin : Transform3D) : Void
      if @@mb_set_world_origin.null?
        @@mb_set_world_origin = Bridge.get_method_bind("XRServer", "set_world_origin", 2952846383_i64)
      end
      val_0 = world_origin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_world_origin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_reference_frame : Void* = Pointer(Void).null
    # Returns the reference frame transform. Mostly used internally and exposed for GDExtension build interfaces.
    def get_reference_frame() : Transform3D
      if @@mb_get_reference_frame.null?
        @@mb_get_reference_frame = Bridge.get_method_bind("XRServer", "get_reference_frame", 3229777777_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_reference_frame, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_clear_reference_frame : Void* = Pointer(Void).null
    # Clears the reference frame that was set by previous calls to `#center_on_hmd`.
    def clear_reference_frame() : Void
      if @@mb_clear_reference_frame.null?
        @@mb_clear_reference_frame = Bridge.get_method_bind("XRServer", "clear_reference_frame", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_reference_frame, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_center_on_hmd : Void* = Pointer(Void).null
    # This is an important function to understand correctly. AR and VR platforms all handle positioning slightly differently.
    # For platforms that do not offer spatial tracking, our origin point `(0, 0, 0)` is the location of our HMD, but you have little control over the direction the player is facing in the real world.
    # For platforms that do offer spatial tracking, our origin point depends very much on the system. For OpenVR, our origin point is usually the center of the tracking space, on the ground. For other platforms, it's often the location of the tracking camera.
    # This method allows you to center your tracker on the location of the HMD. It will take the current location of the HMD and use that to adjust all your tracking data; in essence, realigning the real world to your player's current position in the game world.
    # For this method to produce usable results, tracking information must be available. This often takes a few frames after starting your game.
    # You should call this method after a few seconds have passed. For example, when the user requests a realignment of the display holding a designated button on a controller for a short period of time, or when implementing a teleport mechanism.
    def center_on_hmd(rotation_mode : Int64, keep_height : Bool) : Void
      if @@mb_center_on_hmd.null?
        @@mb_center_on_hmd = Bridge.get_method_bind("XRServer", "center_on_hmd", 1450904707_i64)
      end
      val_0 = rotation_mode
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = keep_height
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_center_on_hmd, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hmd_transform : Void* = Pointer(Void).null
    # Returns the primary interface's transformation.
    def get_hmd_transform() : Transform3D
      if @@mb_get_hmd_transform.null?
        @@mb_get_hmd_transform = Bridge.get_method_bind("XRServer", "get_hmd_transform", 4183770049_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_hmd_transform, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_camera_locked_to_origin : Void* = Pointer(Void).null
    def set_camera_locked_to_origin(enabled : Bool) : Void
      if @@mb_set_camera_locked_to_origin.null?
        @@mb_set_camera_locked_to_origin = Bridge.get_method_bind("XRServer", "set_camera_locked_to_origin", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_camera_locked_to_origin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_camera_locked_to_origin : Void* = Pointer(Void).null
    def is_camera_locked_to_origin() : Bool
      if @@mb_is_camera_locked_to_origin.null?
        @@mb_is_camera_locked_to_origin = Bridge.get_method_bind("XRServer", "is_camera_locked_to_origin", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_camera_locked_to_origin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_add_interface : Void* = Pointer(Void).null
    # Registers an `XRInterface` object.
    def add_interface(interface : XRInterface) : Void
      if @@mb_add_interface.null?
        @@mb_add_interface = Bridge.get_method_bind("XRServer", "add_interface", 1898711491_i64)
      end
      arg_ptr_0 = interface ? interface.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_interface, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_interface_count : Void* = Pointer(Void).null
    # Returns the number of interfaces currently registered with the AR/VR server. If your project supports multiple AR/VR platforms, you can look through the available interface, and either present the user with a selection or simply try to initialize each interface and use the first one that returns `true`.
    def get_interface_count() : Int64
      if @@mb_get_interface_count.null?
        @@mb_get_interface_count = Bridge.get_method_bind("XRServer", "get_interface_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_interface_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_interface : Void* = Pointer(Void).null
    # Removes this `interface`.
    def remove_interface(interface : XRInterface) : Void
      if @@mb_remove_interface.null?
        @@mb_remove_interface = Bridge.get_method_bind("XRServer", "remove_interface", 1898711491_i64)
      end
      arg_ptr_0 = interface ? interface.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_interface, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_interface : Void* = Pointer(Void).null
    # Returns the interface registered at the given `idx` index in the list of interfaces.
    def get_interface(idx : Int64) : XRInterface
      if @@mb_get_interface.null?
        @@mb_get_interface = Bridge.get_method_bind("XRServer", "get_interface", 4237347919_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_interface, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      XRInterface.new(ret_ptr)
    end
    @@mb_get_interfaces : Void* = Pointer(Void).null
    # Returns a list of available interfaces the ID and name of each interface.
    def get_interfaces() : Godot::Array
      if @@mb_get_interfaces.null?
        @@mb_get_interfaces = Bridge.get_method_bind("XRServer", "get_interfaces", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_interfaces, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_find_interface : Void* = Pointer(Void).null
    # Finds an interface by its `name`. For example, if your project uses capabilities of an AR/VR platform, you can find the interface for that platform by name and initialize it.
    def find_interface(name : String) : XRInterface
      if @@mb_find_interface.null?
        @@mb_find_interface = Bridge.get_method_bind("XRServer", "find_interface", 1395192955_i64)
      end
      str_0 = Bridge.make_string(name)
      arg_0 = str_0
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_find_interface, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      XRInterface.new(ret_ptr)
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_add_tracker : Void* = Pointer(Void).null
    # Registers a new `XRTracker` that tracks a physical object.
    def add_tracker(tracker : XRTracker) : Void
      if @@mb_add_tracker.null?
        @@mb_add_tracker = Bridge.get_method_bind("XRServer", "add_tracker", 684804553_i64)
      end
      arg_ptr_0 = tracker ? tracker.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_tracker, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_tracker : Void* = Pointer(Void).null
    # Removes this `tracker`.
    def remove_tracker(tracker : XRTracker) : Void
      if @@mb_remove_tracker.null?
        @@mb_remove_tracker = Bridge.get_method_bind("XRServer", "remove_tracker", 684804553_i64)
      end
      arg_ptr_0 = tracker ? tracker.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_tracker, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_trackers : Void* = Pointer(Void).null
    # Returns a dictionary of trackers for `tracker_types`.
    def get_trackers(tracker_types : Int64) : Void*
      if @@mb_get_trackers.null?
        @@mb_get_trackers = Bridge.get_method_bind("XRServer", "get_trackers", 3554694381_i64)
      end
      val_0 = tracker_types
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_trackers, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_tracker : Void* = Pointer(Void).null
    # Returns the positional tracker with the given `tracker_name`.
    def get_tracker(tracker_name : String) : XRTracker
      if @@mb_get_tracker.null?
        @@mb_get_tracker = Bridge.get_method_bind("XRServer", "get_tracker", 147382240_i64)
      end
      sn_0 = Bridge.make_string_name(tracker_name)
      arg_0 = sn_0
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_tracker, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      XRTracker.new(ret_ptr)
    ensure
      Bridge.free_string_name(sn_0)
    end
    @@mb_get_primary_interface : Void* = Pointer(Void).null
    def get_primary_interface() : XRInterface
      if @@mb_get_primary_interface.null?
        @@mb_get_primary_interface = Bridge.get_method_bind("XRServer", "get_primary_interface", 2143545064_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_primary_interface, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      XRInterface.new(ret_ptr)
    end
    @@mb_set_primary_interface : Void* = Pointer(Void).null
    def set_primary_interface(interface : XRInterface) : Void
      if @@mb_set_primary_interface.null?
        @@mb_set_primary_interface = Bridge.get_method_bind("XRServer", "set_primary_interface", 1898711491_i64)
      end
      arg_ptr_0 = interface ? interface.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_primary_interface, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  # Helper class for XR interfaces that generates VRS images.
  #
  # This class is used by various XR interfaces to generate VRS textures that can be used to speed up rendering.
  class XRVRS < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_vrs_min_radius : Void* = Pointer(Void).null
    def get_vrs_min_radius() : Float64
      if @@mb_get_vrs_min_radius.null?
        @@mb_get_vrs_min_radius = Bridge.get_method_bind("XRVRS", "get_vrs_min_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_vrs_min_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_vrs_min_radius : Void* = Pointer(Void).null
    def set_vrs_min_radius(radius : Float64) : Void
      if @@mb_set_vrs_min_radius.null?
        @@mb_set_vrs_min_radius = Bridge.get_method_bind("XRVRS", "set_vrs_min_radius", 373806689_i64)
      end
      val_0 = radius
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vrs_min_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_vrs_strength : Void* = Pointer(Void).null
    def get_vrs_strength() : Float64
      if @@mb_get_vrs_strength.null?
        @@mb_get_vrs_strength = Bridge.get_method_bind("XRVRS", "get_vrs_strength", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_vrs_strength, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_vrs_strength : Void* = Pointer(Void).null
    def set_vrs_strength(strength : Float64) : Void
      if @@mb_set_vrs_strength.null?
        @@mb_set_vrs_strength = Bridge.get_method_bind("XRVRS", "set_vrs_strength", 373806689_i64)
      end
      val_0 = strength
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vrs_strength, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_vrs_render_region : Void* = Pointer(Void).null
    def get_vrs_render_region() : Rect2i
      if @@mb_get_vrs_render_region.null?
        @@mb_get_vrs_render_region = Bridge.get_method_bind("XRVRS", "get_vrs_render_region", 410525958_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_vrs_render_region, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2i.new(ret_ptr)
    end
    @@mb_set_vrs_render_region : Void* = Pointer(Void).null
    def set_vrs_render_region(render_region : Rect2i) : Void
      if @@mb_set_vrs_render_region.null?
        @@mb_set_vrs_render_region = Bridge.get_method_bind("XRVRS", "set_vrs_render_region", 1763793166_i64)
      end
      val_0 = render_region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vrs_render_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_make_vrs_texture : Void* = Pointer(Void).null
    # Generates the VRS texture based on a render `target_size` adjusted by our VRS tile size. For each eyes focal point passed in `eye_foci` a layer is created. Focal point should be in NDC.
    # The result will be cached, requesting a VRS texture with unchanged parameters and settings will return the cached RID.
    def make_vrs_texture(target_size : Vector2, eye_foci : Void*) : Int64
      if @@mb_make_vrs_texture.null?
        @@mb_make_vrs_texture = Bridge.get_method_bind("XRVRS", "make_vrs_texture", 3647044786_i64)
      end
      val_0 = target_size
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = eye_foci
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_make_vrs_texture, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  # Allows the creation of ZIP files.
  #
  # This class implements a writer that allows storing the multiple blobs in a ZIP archive. See also `ZIPReader` and `PCKPacker`.
  # ```gdscript
  #
  # # Create a ZIP archive with a single file at its root.
  # func write_zip_file():
  # 	var writer = ZIPPacker.new()
  # 	var err = writer.open("user://archive.zip")
  # 	if err != OK:
  # 		return err
  # 	writer.start_file("hello.txt")
  # 	writer.write_file("Hello World".to_utf8_buffer())
  # 	writer.close_file()
  #
  # 	writer.close()
  # 	return OK
  #
  # ```
  class ZIPPacker < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ZipAppend : Int64
      AppendCreate = 0_i64
      AppendCreateafter = 1_i64
      AppendAddinzip = 2_i64
    end
    enum CompressionLevel : Int64
      CompressionDefault = -1_i64
      CompressionNone = 0_i64
      CompressionFast = 1_i64
      CompressionBest = 9_i64
    end
    @@mb_open : Void* = Pointer(Void).null
    # Opens a zip file for writing at the given path using the specified write mode.
    # This must be called before everything else.
    def open(path : String, append : Int64) : Int64
      if @@mb_open.null?
        @@mb_open = Bridge.get_method_bind("ZIPPacker", "open", 1936816515_i64)
      end
      str_0 = Bridge.make_string(path)
      arg_0 = str_0
      val_1 = append
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_open, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_set_compression_level : Void* = Pointer(Void).null
    def set_compression_level(compression_level : Int64) : Void
      if @@mb_set_compression_level.null?
        @@mb_set_compression_level = Bridge.get_method_bind("ZIPPacker", "set_compression_level", 1286410249_i64)
      end
      val_0 = compression_level
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_compression_level, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_compression_level : Void* = Pointer(Void).null
    def get_compression_level() : Int64
      if @@mb_get_compression_level.null?
        @@mb_get_compression_level = Bridge.get_method_bind("ZIPPacker", "get_compression_level", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_compression_level, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_directory : Void* = Pointer(Void).null
    # Adds directory to the archive. If `modified_time` is set to `0`, current system time is used.
    # **Note:** Directories are automatically created when `#start_file` is called, use this function before adding files to create directories with custom permissions and modification time.
    def add_directory(path : String, permissions : Int64, modified_time : Int64) : Int64
      if @@mb_add_directory.null?
        @@mb_add_directory = Bridge.get_method_bind("ZIPPacker", "add_directory", 934773537_i64)
      end
      str_0 = Bridge.make_string(path)
      arg_0 = str_0
      val_1 = permissions
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = modified_time
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_add_directory, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_start_file : Void* = Pointer(Void).null
    # Starts writing to a file within the archive. Only one file can be written at the same time. If `modified_time` is set to `0`, current system time is used.
    # Must be called after `#open`.
    def start_file(path : String, permissions : Int64, modified_time : Int64) : Int64
      if @@mb_start_file.null?
        @@mb_start_file = Bridge.get_method_bind("ZIPPacker", "start_file", 4260848715_i64)
      end
      str_0 = Bridge.make_string(path)
      arg_0 = str_0
      val_1 = permissions
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = modified_time
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_start_file, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_write_file : Void* = Pointer(Void).null
    # Write the given `data` to the file.
    # Needs to be called after `#start_file`.
    def write_file(data : Void*) : Int64
      if @@mb_write_file.null?
        @@mb_write_file = Bridge.get_method_bind("ZIPPacker", "write_file", 680677267_i64)
      end
      val_0 = data
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_write_file, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_close_file : Void* = Pointer(Void).null
    # Stops writing to a file within the archive.
    # It will fail if there is no open file.
    def close_file() : Int64
      if @@mb_close_file.null?
        @@mb_close_file = Bridge.get_method_bind("ZIPPacker", "close_file", 166280745_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_close_file, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_close : Void* = Pointer(Void).null
    # Closes the underlying resources used by this instance.
    def close() : Int64
      if @@mb_close.null?
        @@mb_close = Bridge.get_method_bind("ZIPPacker", "close", 166280745_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_close, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  # Allows reading the content of a ZIP file.
  #
  # This class implements a reader that can extract the content of individual files inside a ZIP archive. See also `ZIPPacker`.
  # ```gdscript
  #
  # # Read a single file from a ZIP archive.
  # func read_zip_file():
  # 	var reader = ZIPReader.new()
  # 	var err = reader.open("user://archive.zip")
  # 	if err != OK:
  # 		return PackedByteArray()
  # 	var res = reader.read_file("hello.txt")
  # 	reader.close()
  # 	return res
  #
  # # Extract all files from a ZIP archive, preserving the directories within.
  # # This acts like the "Extract all" functionality from most archive managers.
  # func extract_all_from_zip():
  # 	var reader = ZIPReader.new()
  # 	reader.open("res://archive.zip")
  #
  # 	# Destination directory for the extracted files (this folder must exist before extraction).
  # 	# Not all ZIP archives put everything in a single root folder,
  # 	# which means several files/folders may be created in `root_dir` after extraction.
  # 	var root_dir = DirAccess.open("user://")
  #
  # 	var files = reader.get_files()
  # 	for file_path in files:
  # 		# If the current entry is a directory.
  # 		if file_path.ends_with("/"):
  # 			root_dir.make_dir_recursive(file_path)
  # 			continue
  #
  # 		# Write file contents, creating folders automatically when needed.
  # 		# Not all ZIP archives are strictly ordered, so we need to do this in case
  # 		# the file entry comes before the folder entry.
  # 		root_dir.make_dir_recursive(root_dir.get_current_dir().path_join(file_path).get_base_dir())
  # 		var file = FileAccess.open(root_dir.get_current_dir().path_join(file_path), FileAccess.WRITE)
  # 		var buffer = reader.read_file(file_path)
  # 		file.store_buffer(buffer)
  #
  # ```
  class ZIPReader < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_open : Void* = Pointer(Void).null
    # Opens the zip archive at the given `path` and reads its file index.
    def open(path : String) : Int64
      if @@mb_open.null?
        @@mb_open = Bridge.get_method_bind("ZIPReader", "open", 166001499_i64)
      end
      str_0 = Bridge.make_string(path)
      arg_0 = str_0
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_open, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_close : Void* = Pointer(Void).null
    # Closes the underlying resources used by this instance.
    def close() : Int64
      if @@mb_close.null?
        @@mb_close = Bridge.get_method_bind("ZIPReader", "close", 166280745_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_close, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_files : Void* = Pointer(Void).null
    # Returns the list of names of all files in the loaded archive.
    # Must be called after `#open`.
    def get_files() : Void*
      if @@mb_get_files.null?
        @@mb_get_files = Bridge.get_method_bind("ZIPReader", "get_files", 2981934095_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_files, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_read_file : Void* = Pointer(Void).null
    # Loads the whole content of a file in the loaded zip archive into memory and returns it.
    # Must be called after `#open`.
    def read_file(path : String, case_sensitive : Bool) : Void*
      if @@mb_read_file.null?
        @@mb_read_file = Bridge.get_method_bind("ZIPReader", "read_file", 740857591_i64)
      end
      str_0 = Bridge.make_string(path)
      arg_0 = str_0
      val_1 = case_sensitive
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_read_file, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_file_exists : Void* = Pointer(Void).null
    # Returns `true` if the file exists in the loaded zip archive.
    # Must be called after `#open`.
    def file_exists(path : String, case_sensitive : Bool) : Bool
      if @@mb_file_exists.null?
        @@mb_file_exists = Bridge.get_method_bind("ZIPReader", "file_exists", 35364943_i64)
      end
      str_0 = Bridge.make_string(path)
      arg_0 = str_0
      val_1 = case_sensitive
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_file_exists, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    ensure
      Bridge.free_string(str_0)
    end
    @@mb_get_compression_level : Void* = Pointer(Void).null
    # Returns the compression level of the file in the loaded zip archive. Returns `-1` if the file doesn't exist or any other error occurs. Must be called after `#open`.
    def get_compression_level(path : String, case_sensitive : Bool) : Int64
      if @@mb_get_compression_level.null?
        @@mb_get_compression_level = Bridge.get_method_bind("ZIPReader", "get_compression_level", 3694577386_i64)
      end
      str_0 = Bridge.make_string(path)
      arg_0 = str_0
      val_1 = case_sensitive
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_compression_level, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    ensure
      Bridge.free_string(str_0)
    end
  end
end

import 'package:flutter/foundation.dart';
import 'package:mdsflutter_example/DeviceConnectionStatus.dart';

class Device {
  String? _address;
  String? _name;
  String? _serial;
  DeviceConnectionStatus _connectionStatus =
      DeviceConnectionStatus.NOT_CONNECTED;

  Device(String? name, String? address) {
    _name = name;
    _address = address;
  }

  String? get name => _name != null ? _name : "";
  String? get address => _address != null ? _address : "";
  String? get serial => _serial != null ? _serial : "";
  DeviceConnectionStatus get connectionStatus => _connectionStatus;

  void onConnecting() => _connectionStatus = DeviceConnectionStatus.CONNECTING;
  void onBleConnected(String address) {
    debugPrint("Device: onBleConnected $address");
    _connectionStatus = DeviceConnectionStatus.BLE_CONNECTED;
  }

  void onMdsConnected(String serial) {
    debugPrint("onMdsConnected, serial: $serial");
    _serial = serial;
    _connectionStatus = DeviceConnectionStatus.CONNECTED;
  }

  void onDisconnected() =>
      _connectionStatus = DeviceConnectionStatus.NOT_CONNECTED;

  bool operator ==(o) =>
      o is Device && o._address == _address && o._name == _name;
  int get hashCode => _address.hashCode * _name.hashCode;
}

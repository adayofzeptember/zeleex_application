import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../Plate.dart';
// 'version.securityPatch': build.version.securityPatch,
// 'version.sdkInt': build.version.sdkInt,
// 'version.release': build.version.release,
// 'version.previewSdkInt': build.version.previewSdkInt,
// 'version.incremental': build.version.incremental,
// 'version.codename': build.version.codename,
// 'version.baseOS': build.version.baseOS,
// 'board': build.board,
// 'bootloader': build.bootloader,
// 'brand': build.brand,
// 'device': build.device,
// 'display': build.display,
// 'fingerprint': build.fingerprint,
// 'hardware': build.hardware,
// 'host': build.host,
// 'id': build.id,
// 'manufacturer': build.manufacturer,
// 'model': build.model,
// 'product': build.product,
// 'supported32BitAbis': build.supported32BitAbis,
// 'supported64BitAbis': build.supported64BitAbis,
// 'supportedAbis': build.supportedAbis,
// 'tags': build.tags,
// 'type': build.type,
// 'isPhysicalDevice': build.isPhysicalDevice,
// 'androidId': build.androidId,
// 'systemFeatures': build.systemFeatures,

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String appVersion = "";
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    setState(() {
      _deviceData = deviceData;
      appVersion = version;
    });
    print(deviceData['Android Version']);
    print(appName);
    print(packageName);
    print(version);
    print(buildNumber);
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      //       'version.securityPatch': build.version.securityPatch,
      // 'version.sdkInt': build.version.sdkInt,
      // 'version.release': build.version.release,
      // 'version.previewSdkInt': build.version.previewSdkInt,
      // 'version.incremental': build.version.incremental,
      // 'version.codename': build.version.codename,
      // 'version.baseOS': build.version.baseOS,
      // 'board': build.board,
      // 'bootloader': build.bootloader,
      // 'brand': build.brand,
      // 'device': build.device,
      // 'display': build.display,
      // 'fingerprint': build.fingerprint,
      // 'hardware': build.hardware,
      // 'host': build.host,
      // 'id': build.id,
      //
      // 'manufacturer': build.manufacturer,
      // 'model': build.model,
      // 'product': build.product,
      // 'supported32BitAbis': build.supported32BitAbis,
      // 'supported64BitAbis': build.supported64BitAbis,
      // 'supportedAbis': build.supportedAbis,
      // 'tags': build.tags,
      // 'type': build.type,
      // 'isPhysicalDevice': build.isPhysicalDevice,
      // 'androidId': build.androidId,
      // 'systemFeatures': build.systemFeatures,
      'version.sdkInt': build.version.sdkInt,
      'Android Version': build.version.release,
      'version.release': build.version.release,
      'device': build.device,
      'device id': build.id,
      'model': build.model,
      'androidId': build.androidId,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.kToDark,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Palette.kToDark,
          ),
          title: Text("test" // Platform.isAndroid
              //     ? 'Android Device Info'
              //     : Platform.isIOS
              //         ? 'iOS Device Info'
              //         : '',
              ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("zeleex เวอร์ชั่น: " + appVersion),
            Expanded(
              child: ListView(
                children: _deviceData.keys.map(
                  (String property) {
                    return Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            property,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, 
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                          child: Text('${_deviceData[property]}',
                              maxLines: 10, overflow: TextOverflow.ellipsis),
                        )),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

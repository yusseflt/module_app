import 'package:battery_plus/battery_plus.dart';
import 'package:disk_space/disk_space.dart';
import 'package:rxdart/subjects.dart';
import 'package:system_info/system_info.dart';

class TaskManagerBloc {
  PublishSubject<Map>? _taskManagerSubject;
  Stream get stream => _taskManagerSubject!.stream;
  static const int MEGABYTE = 1024 * 1024;

  TaskManagerBloc() {
    _taskManagerSubject = PublishSubject<Map>();
  }

  Future getSystemData() async {
    Battery battery = Battery();

    print('Battery: ${await battery.batteryLevel}');
    var processors = SysInfo.processors;
    print("Number of processors    : ${processors.length}");
    print(
        "Total physical memory   : ${SysInfo.getTotalVirtualMemory() ~/ MEGABYTE} MB");
    print(
        "Free physical memory    : ${(SysInfo.getFreePhysicalMemory() + SysInfo.getFreeVirtualMemory()) ~/ MEGABYTE} MB");
    print('Disk: ${(await DiskSpace.getFreeDiskSpace)!.toInt() / 1000} GB');
  }
}

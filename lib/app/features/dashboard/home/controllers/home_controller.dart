part of home;

class HomeController extends GetxController {
  final user = const _User(name: "Suraj");
  
  RxInt totalFree = 40000000.obs;
  RxInt totalUsed = 100000000.obs;

  // Map<Directory, double> _directorySpace = {};

  @override
  void onInit() {
    initDiskSpacePlus();
    super.onInit();
  }

  Future<void> initDiskSpacePlus() async {
    double diskFreeSpace = 0;
    double diskTotalSpace = 0;
    double diskUsedSpace = 0;

    diskFreeSpace = await DiskSpacePlus.getFreeDiskSpace ?? 0;
    diskTotalSpace = await DiskSpacePlus.getTotalDiskSpace ?? 0;

    diskUsedSpace = diskTotalSpace - diskFreeSpace;

    totalFree = diskFreeSpace.toInt().obs;
    totalUsed = diskUsedSpace.toInt().obs;
  }

  final recent = [
    const FileDetail(
      name: "powerpoint.pptx",
      size: 5000000,
      type: FileType.msPowerPoint,
    ),
    const FileDetail(
      name: "word.docx",
      size: 10000000,
      type: FileType.msWord,
    ),
    const FileDetail(
      name: "access.accdb",
      size: 2000000,
      type: FileType.msAccess,
    ),
    const FileDetail(
      name: "excel.xlsx ",
      size: 3000000,
      type: FileType.msExcel,
    ),
    const FileDetail(
      name: "outlook.pst",
      size: 400000,
      type: FileType.msOutlook,
    ),
    const FileDetail(
      name: "videos.mp4",
      size: 4090000,
      type: FileType.other,
    ),
  ];
}

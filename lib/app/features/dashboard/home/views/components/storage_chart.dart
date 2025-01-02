part of home;

class _StorageChart extends StatelessWidget {
  const _StorageChart({
    required this.totalFree,
    required this.totalUsed,
    this.radius = 200,
    Key? key,
  }) : super(key: key);

  final int totalFree;
  final int totalUsed;
  
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // chart
        CircularPercentIndicator(
          radius: radius,
          lineWidth: 25,
          animation: true,
          percent: getUsedPercent() / 100,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _percentText(),
              _subtitleText("used"),
            ],
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.grey[300]!,
        ),

        const SizedBox(height: kDefaultSpacing),

        Row(
          children: [
            const Spacer(),
            Flexible(
              flex: 4,
              child: _indicatorUsage(
                color: Colors.grey[300]!,
                // title: filesize(totalFree, 0),
                title: "${totalFree ~/ 1024} GB",
                subtitle: "free",
              ),
            ),
            Flexible(
              flex: 4,
              child: _indicatorUsage(
                color: Theme.of(context).primaryColor,
                // title: filesize(totalUsed, 0),
                title: "${totalUsed ~/ 1024} GB",
                subtitle: "used",
              ),
            ),
            const Spacer(),
          ],
        )
      ],
    );
  }

  Widget _percentText() {
    return Text(
      "${getUsedPercent().toInt()}%",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Theme.of(Get.context!).primaryColor,
      ),
    );
  }

  Widget _indicatorUsage({
    required Color color,
    required String title,
    required String subtitle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 8,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            // Text(subtitle, style: Theme.of(Get.context!).textTheme.caption),
            Text(subtitle, style: Theme.of(Get.context!).textTheme.bodySmall),
          ],
        )
      ],
    );
  }

  Widget _subtitleText(String text) {
    return Text(
      text,
      // style: Theme.of(Get.context!).textTheme.caption?.copyWith(fontSize: 14),
      style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(fontSize: 14),
    );
  }

  double getUsedPercent() {
    int maxStorage = totalFree + totalUsed;
    return (totalUsed / maxStorage) * 100;
  }
}

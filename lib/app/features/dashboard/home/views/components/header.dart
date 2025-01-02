part of home;

class _Header extends StatelessWidget {
  const _Header({required this.user, Key? key}) : super(key: key);

  final _User user;
  final double _maxWidthForUsername = 200.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              const SizedBox(height: 5),
              Row(
                children: [
                  _subtitle(),
                  const SizedBox(width: 10),
                  _emoji(),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: kDefaultSpacing),
        SearchButton(onPressed: () {}),
      ],
    );
  }

  Widget _title() {
    return const Text(
      "Hi There",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget _subtitle() {
    return Container(
      constraints: BoxConstraints(maxWidth: _maxWidthForUsername),
      child: Text(
        user.name.capitalizeFirst!,
        style: const TextStyle(fontSize: 20),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _emoji() {
    return SizedBox(
      width: 20,
      child: Image.asset(
        ImageRaster.wavingHandEmoji,
        height: 20,
        width: 20,
      ),
    );
  }
}

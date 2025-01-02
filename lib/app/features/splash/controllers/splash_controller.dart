part of splash;

class SplashController extends GetxController {
  final isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();

    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    goToDashboard();
  }

  static final Uri _url = Uri.parse("https://www.youtube.com/channel/UCvD_LJniZfhF6ELHFhB1fPw");

  void goToDashboard() => Get.offNamed(Routes.dashboard);

  void goToYoutubeChannel() async => await canLaunchUrl(_url)
      ? await launchUrl(_url)
      : throw 'Could not launch $_url';
}

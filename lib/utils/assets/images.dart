/// A class that contains the paths to various image assets used in the app.
/// 
/// How to define a new image:
/// 1. Add the image to the assets/images folder.
///  - Example: assets/images/logo.png
/// 2. Add the image path to this file.
///  - Example: static const String logo = 'assets/images/logo.png';
/// 3. Use the image in the app.
///  - Example: Image.asset(AppImages.logo)
/// 
class AppImages {
  AppImages._();

  static const String logo = 'assets/logo/app_logo.svg';
  static const String introBackground = 'assets/svg/intro_image.svg';
  static const String emptyState = 'assets/svg/empty_state.svg';
}

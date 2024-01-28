import 'package:chatme/features/auth/presentation/pages/login_page.dart';
import 'package:chatme/features/bottom_nav_bar/presentation/pages/bottom_nav_screen.dart';
import 'package:chatme/features/home/presentation/pages/chat_screen.dart';
import 'package:get/get.dart';

class RouteName {
  static const String login = '/login';
  static const String home = '/home';
  static const String bottomNavScreen = '/bottomNavScreen';
  static const String chatScreen = '/chatScreen';
}

List<GetPage> routes = [
  GetPage(name: RouteName.login, page: () => const LoginPage()),
  GetPage(name: RouteName.bottomNavScreen, page: () => const BottomNavScreen()),
  GetPage(name: RouteName.chatScreen, page: () => const ChatScreen()),
];

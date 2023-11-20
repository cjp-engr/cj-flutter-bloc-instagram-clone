import 'package:cj_flutter_riverpod_instagram_clone/common/routes/app_route_name.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/nav_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/home.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_chat/messaging_chat.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_list/messaging_list.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/notification/notification.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/posts/posts.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> notificationTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> messagingListTabNavigatorKey =
      GlobalKey<NavigatorState>();
  // static final GlobalKey<NavigatorState> messagingChatTabNavigatorKey =
  //     GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> postsTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> profileTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static const String signUpPath = '/signUp';
  static const String signInPath = '/signIn';
  static const String detailPath = '/detail';
  static const String rootDetailPath = '/rootDetail';

  static const String homePath = '/home';
  static const String settingsPath = '/settings';
  static const String searchPath = '/search';

  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          _home(),
          _notification(),
          _posts(),
          _messagingList(),
          _profile(),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: InstaNavBar(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: AppRouteName.profile,
        pageBuilder: (context, state) {
          return getPage(
            child: const ProfilePage(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: AppRouteName.messagingChat,
        pageBuilder: (context, state) {
          return getPage(
            child: const MessagingChatPage(),
            state: state,
          );
        },
      ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: AppRouteName.profile,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

  StatefulShellBranch _home() {
    return StatefulShellBranch(
      navigatorKey: homeTabNavigatorKey,
      routes: [
        GoRoute(
          path: AppRouteName.home,
          pageBuilder: (context, GoRouterState state) {
            return getPage(
              child: const HomePage(),
              state: state,
            );
          },
        ),
      ],
    );
  }

  StatefulShellBranch _notification() {
    return StatefulShellBranch(
      navigatorKey: notificationTabNavigatorKey,
      routes: [
        GoRoute(
          path: AppRouteName.notification,
          pageBuilder: (context, state) {
            return getPage(
              child: const NotificationPage(),
              state: state,
            );
          },
        ),
      ],
    );
  }

  StatefulShellBranch _posts() {
    return StatefulShellBranch(
      navigatorKey: postsTabNavigatorKey,
      routes: [
        GoRoute(
          path: AppRouteName.posts,
          pageBuilder: (context, state) {
            return getPage(
              child: const PostsPage(),
              state: state,
            );
          },
        ),
      ],
    );
  }

  StatefulShellBranch _messagingList() {
    return StatefulShellBranch(
      navigatorKey: messagingListTabNavigatorKey,
      routes: [
        GoRoute(
          path: AppRouteName.messagingList,
          pageBuilder: (context, state) {
            return getPage(
              child: const MessagingListPage(),
              state: state,
            );
          },
        ),
      ],
    );
  }

  StatefulShellBranch _profile() {
    return StatefulShellBranch(
      navigatorKey: profileTabNavigatorKey,
      routes: [
        GoRoute(
          path: AppRouteName.profile,
          pageBuilder: (context, state) {
            return getPage(
              child: const ProfilePage(),
              state: state,
            );
          },
        ),
      ],
    );
  }
}

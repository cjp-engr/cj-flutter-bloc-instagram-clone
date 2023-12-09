// private navigators
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/navigation_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/add_post_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/home_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/login/login_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/notification/notification_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/profile_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/register/register_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorHomeKey');
final _shellNavigatorNotificationKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorNotificationKey');
final _shellNavigatorPostsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorPostsKey');
// final _shellNavigatorMessagingKey =
//     GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorMessagingKey');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorProfileKey');

final goRouter = GoRouter(
  initialLocation: '/${InstaRouteNames.profile}',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    _login(),
    _register(),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return InstaNavigationBar(navigationShell: navigationShell);
      },
      branches: [
        _home(),
        _notification(),
        _post(),
        _profile(),
      ],
    ),
  ],
);

StatefulShellBranch _profile() {
  return StatefulShellBranch(
    navigatorKey: _shellNavigatorProfileKey,
    routes: [
      GoRoute(
        path: '/${InstaRouteNames.profile}',
        name: InstaRouteNames.profile,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ProfilePage(),
        ),
      ),
      GoRoute(
        path: '/${InstaRouteNames.settings}',
        name: InstaRouteNames.settings,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SettingsPage(),
        ),
      ),
    ],
  );
}

StatefulShellBranch _home() {
  return StatefulShellBranch(
    navigatorKey: _shellNavigatorHomeKey,
    routes: [
      GoRoute(
        path: '/${InstaRouteNames.home}',
        name: InstaRouteNames.home,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomePage(),
        ),
      ),
      GoRoute(
        path: '/${InstaRouteNames.userDetails}/:id',
        name: InstaRouteNames.userDetails,
        builder: (context, state) {
          return ProfilePage(id: state.pathParameters['id']!);
        },
      ),
    ],
  );
}

StatefulShellBranch _notification() {
  return StatefulShellBranch(
    navigatorKey: _shellNavigatorNotificationKey,
    routes: [
      GoRoute(
        path: '/${InstaRouteNames.notification}',
        name: InstaRouteNames.notification,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: NotificationPage(),
        ),
      ),
    ],
  );
}

StatefulShellBranch _post() {
  return StatefulShellBranch(
    navigatorKey: _shellNavigatorPostsKey,
    routes: [
      GoRoute(
        path: '/${InstaRouteNames.addPost}',
        name: InstaRouteNames.addPost,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AddPostPage(),
        ),
      ),
    ],
  );
}

GoRoute _login() {
  return GoRoute(
    path: '/${InstaRouteNames.login}',
    name: InstaRouteNames.login,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: LoginPage(),
    ),
  );
}

GoRoute _register() {
  return GoRoute(
    path: '/${InstaRouteNames.register}',
    name: InstaRouteNames.register,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: RegisterPage(),
    ),
  );
}

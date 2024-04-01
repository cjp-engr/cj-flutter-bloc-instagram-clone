import 'package:cj_flutter_riverpod_instagram_clone/repository/auth/auth_repository_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/add_post_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/edit_post/edit_post_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/edit_profile/edit_profile_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/user_home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// private navigators
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/navigation_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/home_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/login/login_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/notification/notification_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/profile_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/register/register_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/settings/settings_page.dart';

// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes_provider.g.dart';

GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorHomeKey');
GlobalKey<NavigatorState> _shellNavigatorNotificationKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorNotificationKey');
GlobalKey<NavigatorState> _shellNavigatorPostsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorPostsKey');
GlobalKey<NavigatorState> _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorProfileKey');

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authStateStreamProvider);
  return GoRouter(
    initialLocation: '/${InstaRouteNames.login}',
    redirect: (context, state) {
      if (state.matchedLocation != '/${InstaRouteNames.register}') {
        final authenticated = authState.valueOrNull != null;
        final authenticating =
            (state.matchedLocation == '/${InstaRouteNames.login}');

        if (authenticated == false) {
          return authenticating ? null : '/${InstaRouteNames.login}';
        }
        return authenticating ? '/${InstaRouteNames.home}' : null;
      }
      return null;
    },
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      _login(),
      _register(),
      _editProfile(),
      _userHome(),
      _settings(),
      _editPost(),
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
}

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

GoRoute _editProfile() {
  return GoRoute(
    path: '/${InstaRouteNames.editProfile}',
    name: InstaRouteNames.editProfile,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: EditProfilePage(),
    ),
  );
}

GoRoute _userHome() {
  return GoRoute(
    path: '/${InstaRouteNames.userHomePage}',
    name: InstaRouteNames.userHomePage,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: UserHomePage(),
    ),
  );
}

GoRoute _settings() {
  return GoRoute(
    path: '/${InstaRouteNames.settings}',
    name: InstaRouteNames.settings,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: SettingsPage(),
    ),
  );
}

GoRoute _editPost() {
  return GoRoute(
    path: '/${InstaRouteNames.editPost}/:id',
    name: InstaRouteNames.editPost,
    builder: (context, state) {
      return EditPostPage(id: state.pathParameters['id']!);
    },
  );
}

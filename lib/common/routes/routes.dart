// private navigators
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/nav_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/add_post_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/home_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_chat/messaging_chat_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_list/messaging_list_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/notification/notification_page.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorHomeKey');
final _shellNavigatorNotificationKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorNotificationKey');
final _shellNavigatorPostsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorPostsKey');
final _shellNavigatorMessagingKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorMessagingKey');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorProfileKey');

final goRouter = GoRouter(
  initialLocation: '/${InstaRouteNames.profile}',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return InstaNavigationBar(navigationShell: navigationShell);
      },
      branches: [
        _home(),
        _notification(),
        _post(),
        _messaging(),
        _profile(),
      ],
    ),
  ],
);

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

StatefulShellBranch _messaging() {
  return StatefulShellBranch(
    navigatorKey: _shellNavigatorMessagingKey,
    routes: [
      GoRoute(
        path: '/${InstaRouteNames.messagingList}',
        name: InstaRouteNames.messagingList,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MessagingListPage(),
          );
        },
      ),
      GoRoute(
        path: '/${InstaRouteNames.messagingChat}/:id',
        name: InstaRouteNames.messagingChat,
        builder: (context, state) =>
            MessagingChatPage(id: state.pathParameters['id']!),
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
          child: ProfilePage(id: ''),
        ),
      ),
    ],
  );
}

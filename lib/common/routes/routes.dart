// private navigators
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/nav_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/home.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_chat/messaging_chat.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_list/messaging_list.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/notification/notification.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/posts/posts.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/profile.dart';
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
  initialLocation: '/profile',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return InstaNavigationBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorNotificationKey,
          routes: [
            GoRoute(
              path: '/notification',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: NotificationPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorPostsKey,
          routes: [
            GoRoute(
              path: '/posts',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PostsPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMessagingKey,
          routes: [
            // Messaging
            GoRoute(
              path: '/messaging-list',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: MessagingListPage(),
                );
              },
            ),
            GoRoute(
              path: '/messaging-chat/:id',
              name: 'messaging-chat',
              builder: (context, state) {
                return MessagingChatPage(id: state.pathParameters['id']!);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfilePage(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

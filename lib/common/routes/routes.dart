import 'package:cj_flutter_riverpod_instagram_clone/common/routes/app_route_name.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/home.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_chat/messaging_chat.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_list/messaging_list.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/notification/notification.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRouteName.base,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfilePage();
      },
    ),
    GoRoute(
      path: AppRouteName.profile,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfilePage();
      },
    ),
    GoRoute(
      path: AppRouteName.messagingList,
      builder: (BuildContext context, GoRouterState state) {
        return const MessagingListPage();
      },
    ),
    GoRoute(
      path: AppRouteName.messagingChat,
      builder: (BuildContext context, GoRouterState state) {
        return const MessagingChatPage();
      },
    ),
    GoRoute(
      path: AppRouteName.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: AppRouteName.notification,
      builder: (BuildContext context, GoRouterState state) {
        return const NotificationPage();
      },
    ),
  ],
);

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router/router.gr.dart';

class SettingsPage extends StatefulWidget {
  final String tab;

  SettingsPage({Key? key, @pathParam required this.tab}) : super(key: key) {
    print('constrocitng settings page');
  }

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with AutoRouteAware {
  @override
  void didInitTabRoute(TabPageRoute? previousRoute) {
    print('settings tab inited');
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    super.didChangeTabRoute(previousRoute);
    print('Changed to settings tab from ${previousRoute.name}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final observer = RouterScope.of(context)?.firstObserverOfType<AutoRouteObserver>();
    if (observer != null) {
      observer.subscribe(this, context.routeData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Settings/${widget.tab}'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // context.tabsRouter.pushChild(BookDetailsRoute(id: 4));
              //
              // context.navigateTo(
              //   HomeRoute(
              //     children: [
              //       ProfileTab(children: [
              //         MyBooksRoute(),
              //       ]),
              //     ],
              //   ),
              // );

              context.router.navigateNamed('/profile/my-books?filter=changed', includePrefixMatches: true);
            },
            child: Text('navigateNamed to profile/my-books'),
          )
        ],
      ),
    );
  }
}

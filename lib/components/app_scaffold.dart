import 'package:flutter/material.dart';
import 'package:oms/components/navigation_bottom_bar.dart';
import 'package:oms/components/navigation_drawer_bar.dart';
import 'package:oms/components/navigation_rail_bar.dart';
import 'package:oms/utilities/router.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String path = router.routeInformationProvider.value.uri.toString();
  String viewportType = 'mobile';

  @override
  void initState() {
    super.initState();

    router.routeInformationProvider.addListener(updatePath);
  }

  @override
  void dispose() {
    super.dispose();

    router.routeInformationProvider.removeListener(updatePath);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    String newViewportType = calculateViewportType();

    if (viewportType != newViewportType) {
      setState(() {
        viewportType = newViewportType;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (viewportType == 'desktop') return buildDesktop(context);
    if (viewportType == 'tablet') return buildTablet(context);

    return buildMobile(context);
  }

  Widget buildMobile(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: createPage(),
      drawer: NavigationDrawerBar(
        path: path,
        isMobile: true,
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2,
      drawerEnableOpenDragGesture: true,
      bottomNavigationBar: NavigationBottomBar(
        openDrawer: openDrawer,
        path: path,
      ),
    );
  }

  Widget buildTablet(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: NavigationDrawerBar(
        path: path,
        isMobile: true,
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2,
      drawerEnableOpenDragGesture: true,
      body: Row(
        children: [
          NavigationRailBar(
            openDrawer: openDrawer,
            path: path,
          ),
          createPage()
        ],
      ),
    );
  }

  Widget buildDesktop(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: [
          NavigationDrawerBar(
            path: path,
            isMobile: false,
          ),
          createPage()
        ],
      ),
    );
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.closeDrawer();
  }

  void updatePath() {
    setState(() {
      path = router.routeInformationProvider.value.uri.toString();
    });

    Future.delayed(Durations.medium1, () {
      closeDrawer();
    });
  }

  Widget createPage() {
    return Expanded(
      child: SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            children: [widget.child],
          ),
        ),
      ),
    );
  }

  String calculateViewportType() {
    double width = MediaQuery.of(context).size.width;

    if (width > 1024) return 'desktop';
    if (width > 768) return 'tablet';

    return 'mobile';
  }
}

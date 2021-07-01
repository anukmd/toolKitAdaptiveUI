import 'package:adaptive_user_interface_app/screens/AccessibilityMenuScreen.dart';
import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/view/action_view.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/view/centered_view.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/view/collection_view.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/view/exploreoptions_view.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/view/footer_view.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/view/getapp_view.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/view/header_view.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/view/leaderboard_view.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/view/location_view.dart';
import 'package:provider/provider.dart';

class ZomatoHomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _ZomatoHomeScreenState createState() => _ZomatoHomeScreenState();
}

class _ZomatoHomeScreenState extends State<ZomatoHomeScreen> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
          child: SizedBox(
        width: 1000,
        child: AccessibilityMenuScreen(),
      )),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(),
            CenteredView(
                child: Column(
              children: [
                if(Provider.of<AdaptiveWidgetsViewModel>(context).getImageColorFilterToggle)
                  ColorFiltered(
                    colorFilter: AdaptiveColorFilter.getAdaptiveColorFilter(context),
                    child: Image.asset('images/home_banner.png'))
                else
                  Image.asset('images/home_banner.png'),    
                SizedBox(
                  height: 20,
                ),
                FullActionCardPanel(),
                FullCollectionPanel(),
                FullLeaderboardPanel(),
                FullLocationPanel(),
              ],
            )),
            GetAppView(),
            ExploreOptionsView(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

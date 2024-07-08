import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kk_information_system/services/auth_service.dart';
import 'package:kk_information_system/sub-screens/account.dart';
import 'package:kk_information_system/sub-screens/dashboard.dart';
import 'package:kk_information_system/sub-screens/records.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void logout() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return DefaultTabController(
      length: 3, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: 70,
            child: Image.asset("lib/assets/logo_transparent.png"),
          ),
          actions: [
            IconButton(
              onPressed: logout,
              icon: FaIcon(
                FontAwesomeIcons.arrowRightFromBracket,
                size: 16,
              ),
            ),
          ],
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black87,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(
                child: FaIcon(
                  FontAwesomeIcons.chartPie,
                  size: 20,
                ),
              ),
              Tab(
                child: FaIcon(
                  FontAwesomeIcons.solidFileLines,
                  size: 20,
                ),
              ),
              Tab(
                child: FaIcon(
                  FontAwesomeIcons.userLarge,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Dashboard(),
            ),
            Center(
              child: Records(),
            ),
            Center(
              child: Account(),
            ),
          ],
        ),
      ),
    );
  }
}

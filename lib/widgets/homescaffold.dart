import 'package:flutter/material.dart';
import 'package:quikmath/widgets/inputgrid.dart';
import 'package:quikmath/widgets/mathscreen.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],

      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple[500],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,

          // - Menu header -
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple[500],
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'QuikMath',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),

            // - Menu list -

            // Preferences
            ListTile(
              title: Text('Preferences'),
              leading: const Icon(Icons.settings_applications),
              onTap: () {
                Navigator.pushNamed(context, "/preferences");
              },
            ),

            // Analytics
            ListTile(
              enabled: false,
              leading: const Icon(Icons.analytics),
              title: Text('Analytics (Coming soon)'),
              onTap: () {
                // Handle tap
              },
            ),

            // About
            ListTile(
              title: Text('About'),
              leading: const Icon(Icons.help_center),
              onTap: () {
                Navigator.pushNamed(context, "/about");
              },
            ),
          ],
        ),
      ),

      // body
      body: Column(
        verticalDirection: VerticalDirection.down,
        children: const [
          Expanded(
            flex: 3,
            child: MathScreen(),
          ),
          Expanded(
            flex: 5,
            child: InputGrid(),
          ),
        ],
      ),
    );
  }
}

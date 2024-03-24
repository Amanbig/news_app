import 'package:flutter/material.dart';
import 'News.dart'; // Ensure this is correctly imported

class SideNav extends StatelessWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: [
                Icon(
                  Icons.monitor_heart,
                  size: 34,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'News App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          _drawerItem(
            icon: Icons.business,
            text: 'Business',
            onTap: () => _navigateTo(context, "business"),
          ),
          _drawerItem(
            icon: Icons.movie,
            text: 'Entertainment',
            onTap: () => _navigateTo(context, "entertainment"),
          ),
          _drawerItem(
            icon: Icons.fastfood,
            text: 'Food',
            onTap: () => _navigateTo(context, "food"),
          ),
          _drawerItem(
            icon: Icons.style,
            text: 'Lifestyle',
            onTap: () => _navigateTo(context, "lifestyle"),
          ),
          _drawerItem(
            icon: Icons.gavel,
            text: 'Politics',
            onTap: () => _navigateTo(context, "politics"),
          ),
          _drawerItem(
            icon: Icons.local_hospital,
            text: 'Health',
            onTap: () => _navigateTo(context, "health"),
          ),
          // Add more items here
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
            onTap: () {
              // Handle your onTap here
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem({required IconData icon, required String text, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, String types) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => News(types: types)),
    );
  }
}

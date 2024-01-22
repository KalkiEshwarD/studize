import 'package:flutter/material.dart';
import 'package:studize/constants/constants.dart';
import 'package:studize/constants/routes.dart';

Drawer primaryDrawer(context) => Drawer(
      shape: const Border(),
      child: ListView(
        children: [
          const ListTile(
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: PaddingDist.drawerDistance),
                  child: Icon(Icons.task_alt_sharp),
                ),
                Text('Tasks overview'),
              ],
            ),
          ),
          const ListTile(
            title: Divider(),
          ),
          ListTile(
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: PaddingDist.drawerDistance),
                  child: Icon(Icons.announcement),
                ),
                Text('Report an issue'),
              ],
            ),
            onTap: () {
              //TODO: Complete on tap
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: PaddingDist.drawerDistance),
                  child: Icon(Icons.contact_page),
                ),
                Text('About Us'),
              ],
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, aboutScreen, (route) => false);
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: PaddingDist.drawerDistance),
                  child: Icon(Icons.settings),
                ),
                Text('Settings'),
              ],
            ),
            onTap: () {
              //TODO: Complete on tap
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: PaddingDist.drawerDistance),
                  child: Icon(Icons.logout),
                ),
                Text('Sign Out'),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Sign Out'),
                    content: const Text('Do you want to sign out?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Close the dialog when the button is pressed
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, signInScreen, (route) => false);
                        },
                        child: const Text('Sign Out'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );

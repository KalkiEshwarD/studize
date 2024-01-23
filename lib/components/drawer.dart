import 'package:flutter/material.dart';
import 'package:studize/constants/constants.dart';
import 'package:studize/constants/routes.dart';

Drawer primaryDrawer(context) => Drawer(
      shape: const Border(),
      child: ListView(
        children: [
          ListTile(
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: PaddingDist.drawerDistance),
                  child: Icon(Icons.calendar_month_outlined),
                ),
                Text('My calendar'),
              ],
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, homeScreen, (route) => false);
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: PaddingDist.drawerDistance),
                  child: Icon(Icons.task_alt_sharp),
                ),
                Text('Tasks overview'),
              ],
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, tasksOverviewScreen, (route) => false);
            },
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
        ],
      ),
    );

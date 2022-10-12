import 'package:flutter/material.dart';
import 'package:sewain_aku/views/components/P4rofile.dart';
import 'package:sewain_aku/views/components/k.dart';
import 'package:sewain_aku/views/components/asset.dart';
import 'package:sewain_aku/views/components/form.dart';
import 'package:sewain_aku/views/components/P4rofile.dart';
import 'package:sewain_aku/views/components/checkout.dart';
import 'package:sewain_aku/views/components/listview.dart';
import 'package:sewain_aku/views/masuk.dart';
import 'package:sewain_aku/views/components/listview.dart';




class NavBar extends StatelessWidget {
  const NavBar({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Checkout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodCheckoutOnePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sepatu()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginDemo()),
              );
            },
          ),
        ],
      ),
    );
  }
}
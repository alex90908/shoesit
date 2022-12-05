import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
      children: [
        Column(
          children: [
            // Container(
            //   width: MediaQuery.of(context).size.width/1.2,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     // color: Color(0xFFff9934),
            //     border: Border.all(
            //       color: Color(0xFFff9934),
            //       width: 1.4
            //       ),
            //     borderRadius: BorderRadius.circular(45)
            //   ),
            //   child: Center(
            //     child: TextField(
            //       decoration: InputDecoration(
            //           prefixIcon: Icon(
            //             Icons.search,
            //             ),

            //           // suffixIcon: IconButton(
            //           //   icon: Icon(Icons.clear),
            //           //   onPressed: () {
            //           //     /* Clear the search field */
            //           //   },
            //           // ),
            //           hintText: "Cari Favorit...",
            //           hintStyle: TextStyle(
            //             ),
            //           border: InputBorder.none),
            //     ),
            //   ),
            // ),

            // Divider(
            //   thickness: 0.5,
            //   indent: MediaQuery.of(context).size.width/18,
            //   endIndent: MediaQuery.of(context).size.width/18,
            //   color: Color(0xFFff9934),
            //   height: 40,
            // ),

            Container(
              child: ClipOval(
                child: Image.network(
                  "https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png",
                  width: MediaQuery.of(context).size.width/1.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width/1.2,
              child: Column(
                children: [
                  //row for each deatails
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("Something@gmail.com"),
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("1234567890"),
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("SomeWhere"),
                  )
                ],
              ),
            ),

            Container(
              height: 20,
            ),

          ],
        ),
      ],
    );
  }
}
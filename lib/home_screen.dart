import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:labourspot/chat_screen.dart';
import 'package:labourspot/cutomalert.dart';
import 'package:labourspot/sign_Screen.dart';
import 'package:labourspot/worker_profile.dart';

import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required String title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;         //firebase auth
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
                                             //drawer is here 
      drawer:  Drawer(
        child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
            onTap: () {
              // Handle myProfile click event
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Account Holder Name"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              // Handle logout button click event
              auth.signOut().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignScreen() ));
              }).onError((error, stackTrace) {
                Column(mainAxisAlignment: MainAxisAlignment.center);

                CustomToast.show(context, " Netork Error ");

              });
            },
          ),
        ],
      ),
      ),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.account_circle_rounded,color: Colors.grey,size: 30,),

          )

        ],
        backgroundColor: Colors.white10,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),

        elevation: 0,
        title: const Text("Labour Spot",style: TextStyle(
          fontSize: 25,
          color: Colors.black,
        ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 44,
            ),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffF1F1F1),
            suffixIcon: Icon(Icons.search,size: 25,color: Colors.grey,),
            prefixIcon: CircleAvatar(
              backgroundColor: Colors.white10,
                child: Image.asset("assets/labourspoticons.png",scale: 5,)),
            contentPadding: EdgeInsets.all(0),
            labelText: "Search Worker",
            labelStyle: TextStyle(color: Colors.grey.shade300),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
          ),
        ),


        const SizedBox(height: 30,),
            const Row(
              children: [
                Text("Nearby Workers",style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w600
                ),),
              ],
            ),
             const SizedBox(height: 20,),
             Expanded(
               child:ListView.builder(
                 itemCount: 4,
                 itemBuilder: (BuildContext context, int index) {
                   return Column(
                     children: [
                       ListTile(
                         contentPadding: EdgeInsets.all(0),
                         leading: const CircleAvatar(
                           radius: 30,
                           backgroundImage: AssetImage("assets/labourspotprofilepic.png"),
                           backgroundColor: Colors.black45,
                         ),
                         trailing:  SizedBox(
                           width: 90, // Set the desired width
                           child: Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Padding(
                                 padding: EdgeInsets.only(right: 10),
                                 child: InkWell(
                                   child: CircleAvatar(
                                     radius: 18,
                                     backgroundColor: Colors.grey,
                                     backgroundImage: AssetImage("assets/labourspotphoneicons.png"),
                                   ),
                                   onTap: () async {
                                     launchUrlString("tel://21213123123");
                                   },
                                 ),
                               ),
                               InkWell(
                                 child: CircleAvatar(
                                   radius: 18,
                                   backgroundColor: Colors.grey,
                                   backgroundImage: AssetImage('assets/labourspotmessageicon.png'),
                                 ),
                                 onTap: (){
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => const LabourspotChatScreen()),
                                   );
                                 },
                               ),
                             ],
                           ),
                         ),
                         title: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Row(
                               children: [
                                 Text(
                                   "Zubair Ahmed ",
                                   style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                 ),
                                 Text(
                                   "(Plumber)",
                                   style: TextStyle(fontSize: 13, color: Colors.blueAccent),
                                 ),
                               ],
                             ),

                             Text(
                               "Azadi Chowk Phase 8",
                               style: TextStyle(fontSize: 10, color: Colors.grey),
                             ),
                             Text(
                               "Bahria Town. ( 5 km )",
                               style: TextStyle(fontSize: 10, color: Colors.grey),
                             ),
                             Text(
                               "1000/day",
                               style: TextStyle(fontSize: 10, color: Colors.blueAccent),
                             ),
                           ],
                         ),
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => const WorkerProfile()),
                           );
                         },
                         minVerticalPadding: 10,
                         horizontalTitleGap: 5,

                       ),
                       Divider(
                         color: Color(0xffC8E5FF),
                         thickness: 1.0,
                       ),
                     ],
                   );
                 },
               ),
             ),
            

          ],
        ),
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffF1F1F1),
      ),
    );
  }
}

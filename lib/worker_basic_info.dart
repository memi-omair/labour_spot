

import 'package:flutter/material.dart';
import 'package:labourspot/home_screen.dart';

class WorkerBasicInfo extends StatefulWidget {
  const WorkerBasicInfo({super.key, required String title});

  @override
  State<WorkerBasicInfo> createState() => _WorkerBasicInfoState();
}

class _WorkerBasicInfoState extends State<WorkerBasicInfo> {

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title:  Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            child: const Text("Skip",style: TextStyle(
              fontSize: 15,
              color: Colors.grey,

            ),),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const HomeScreen(title: 'login',)));
            },
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/labourspotprofilepic.png',),
                      backgroundColor: Colors.black45,

                      ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blueAccent,
                          child: Icon(Icons.camera_alt,color: Colors.white,)
                      ),
                    ),


                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  children: [
                    Text("Name",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  
                  decoration: InputDecoration(
                    labelText: "Name",
                    enabledBorder: buildOutlineInputBorder(),
                    focusedBorder: buildOutlineInputBorder(),
                  ),
                ),
              




                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text("Contact Number",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  
                  decoration: InputDecoration(
                    labelText: "contact Number",
                    enabledBorder: buildOutlineInputBorder(),
                    focusedBorder: buildOutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text("Address",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Address",
                    enabledBorder: buildOutlineInputBorder(),
                    focusedBorder: buildOutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 75),

                            child: Text("Country",style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 125,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Country",
                                enabledBorder: buildOutlineInputBorder(),
                                focusedBorder: buildOutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 95),
                              child: Text("City",style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 125,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "City",
                                  enabledBorder: buildOutlineInputBorder(),
                                  focusedBorder: buildOutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text("About Me",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 5,
                 initialValue: "Employee will write about his experience in his job",
                  decoration: InputDecoration(
                    labelText: "About",
                    enabledBorder: buildOutlineInputBorder(),
                    focusedBorder: buildOutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 56,
                  width: 370,
                  decoration: BoxDecoration(
                      color: const Color(0xff068BFF),
                      borderRadius: BorderRadius.circular(8)),
                  child:  Center(
                    child: InkWell(
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const HomeScreen(title: 'login',)));
                      },
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xff007BFF),
      ),
    );
  }
}

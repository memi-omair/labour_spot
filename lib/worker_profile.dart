import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class WorkerProfile extends StatefulWidget {
  const WorkerProfile({super.key});

  @override
  State<WorkerProfile> createState() => _WorkerProfileState();
}

class _WorkerProfileState extends State<WorkerProfile> {
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(child: const Icon(Icons.arrow_back,color: Colors.black,),
          onTap: (){
          Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text("Profile",style: TextStyle(
          fontSize: 20,
          color: Colors.black,

        ),),
      ),
      body:   Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
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
                  height: 20,
                ),
                const Text("Zubair Ahmed",style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                Text("Contact Number",style: TextStyle(
                           fontSize: 13,
                           color: Colors.grey,
                         ),),
                          SizedBox(
                            height: 40,
                          ),
                Text("Address",style: TextStyle(
                           fontSize: 13,
                           color: Colors.grey,
                         ),),
                          SizedBox(
                            height: 40,
                          ),
                          Text("City",style: TextStyle(
                                   fontSize: 13,
                                   color: Colors.grey,
                                 ),),
                          SizedBox(
                            height: 40,
                          ),
                          Text("Country",style: TextStyle(
                                   fontSize: 13,
                                   color: Colors.grey,
                                 ),),
                          SizedBox(
                            height: 40,
                          ),
                          Text("Service Category",style: TextStyle(
                                   fontSize: 13,
                                   color: Colors.grey,
                                 ),),
                          SizedBox(
                            height: 40,
                          ),
                          Text("Availability",style: TextStyle(
                                   fontSize: 13,
                                   color: Colors.grey,
                                 ),),
                          SizedBox(
                            height: 40,
                          ),
                          Text("Pay Rate",style: TextStyle(
                                   fontSize: 13,
                                   color: Colors.grey,
                                 ),),
                          SizedBox(
                            height: 40,
                          ),

                        ],
                      ),
                    ),


                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("03074240740",style: TextStyle(
                                     fontSize: 13,
                                     color: Colors.black,
                                       fontWeight: FontWeight.w600,

                                   ),),
                          SizedBox(
                            height: 40,
                          ),
                          Text("Sector 50, Bahria town, Islamabad",style: TextStyle(
                                     fontSize: 13,
                                     color: Colors.black,
                                     fontWeight: FontWeight.w600,

                                   ),),
                          SizedBox(
                            height: 40,
                          ),
                          Text("Rawalpindi",style: TextStyle(
                                    fontSize: 13,
                                     color: Colors.black,
                                     fontWeight: FontWeight.w600,

                                   ),),
                          SizedBox(
                            height: 40,
                          ),
                          Text("Pakistan",style: TextStyle(
                                     fontSize: 13,
                                     color: Colors.black,
                                     fontWeight: FontWeight.w600,

                                   ),),
                          SizedBox(
                            height: 40,
                          ),
                          Text("Electrician",style: TextStyle(
                                     fontSize: 13,
                                     color: Colors.black,
                                     fontWeight: FontWeight.w600,

                                   ),),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text("9:00 AM",style: TextStyle(
                                         fontSize: 13,
                                         color: Colors.black,
                                         fontWeight: FontWeight.w600,

                                       ),),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text("to",style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,

                                ),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text("6:00 PM",style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,

                                ),),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                               children: [

                            Text("500/day",style: TextStyle(
                             fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,

                            ),),
                                 Padding(
                                   padding: EdgeInsets.only(left: 20),
                                   child: Text("to",style: TextStyle(
                                     fontSize: 13,
                                     color: Colors.grey,
                                     fontWeight: FontWeight.w600,

                                   ),),
                                 ),
                                 Padding(
                                   padding: EdgeInsets.only(left: 20),
                                   child: Text("1000/day",style: TextStyle(
                                     fontSize: 13,
                                     color: Colors.black,
                                     fontWeight: FontWeight.w600,

                                   ),),
                                 ),
                               ],
                             ),
                          SizedBox(
                            height: 40,
                          ),



                        ],
                      ),
                    ),
                  ],
                ),
                 const Row(
                  children: [
                    Text("About Me",style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),),
                  ],
                ),

                Container(
                height: 117,
                 width: 360,
                 color: const Color(0xffF8F8F8),
                 child:  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Expanded(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Employee will write about his experience in his job",style: TextStyle(
                           fontSize: 13,
                           color: Colors.black,
                           fontWeight: FontWeight.w600,

                         ),),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             SmoothStarRating(
                               rating: rating,
                               color: Colors.amber,
                               size: 30,
                               starCount: 5,
                               onRatingChanged: (value){
                                 setState(() {
                                   rating = value;
                                 });

                               },
                             ),
                           ],
                         )
                       ],
                     ),
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
}

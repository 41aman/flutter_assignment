import 'package:dexter1/models/user.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User user = User(
    name: 'Little Butterfly',
    designation: 'Product Designer',
    location: 'Kathmandu',
    likes: 285,
    comments: 3025,
    favourites: 650,
    emailID: 'butterfly.little@gmail.com',
    areaCode: 997,
    phoneNumber: 9815225566,
    website: 'https://www.littlebutterfly.com',
    profilePicture:
        'https://cdn.i-scmp.com/sites/default/files/d8/images/methode/2020/05/12/27bc124c-90e1-11ea-a674-527cfdef49ee_image_hires_160918.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Image(
                  image: NetworkImage(user.profilePicture),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3 - 20,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.275,
                                      bottom: 20,
                                      top: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.name,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          height: 15,
                                        ),
                                        Text(
                                          user.designation,
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          user.location,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      numberStat(user.likes, 'Likes'),
                                      numberStat(user.comments, 'Comments'),
                                      numberStat(user.favourites, 'Favourites'),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 12,
                          ),
                          Card(
                            elevation: 2,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'User Information',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: ListTile(
                                            leading: Icon(Icons.email),
                                            title: Text('Email'),
                                            subtitle: Text(user.emailID),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: ListTile(
                                            leading: Icon(Icons.phone),
                                            title: Text('Phone'),
                                            subtitle: Text('+' +
                                                user.areaCode.toString() +
                                                '-' +
                                                user.phoneNumber.toString()),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: ListTile(
                                            leading: Icon(Icons.web),
                                            title: Text('Website'),
                                            subtitle: Text(user.website),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -10,
                      right: MediaQuery.of(context).size.width * 0.675,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            'https://cdn.i-scmp.com/sites/default/files/d8/images/methode/2020/05/12/27bc124c-90e1-11ea-a674-527cfdef49ee_image_hires_160918.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget numberStat(int num, String stat) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('$num'),
        Text(stat),
      ],
    );
  }
}

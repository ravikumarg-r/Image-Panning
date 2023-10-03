import 'package:flutter/material.dart';
import 'package:image_panning/customized_screen.dart';
import 'package:image_panning/profile_screen.dart';
import 'package:image_panning/repo/mydata_provider.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // late CustomCard customCard;
  @override
  Widget build(BuildContext context) {
    final myDataProvider = Provider.of<MyDataProvider>(context);
    setState(() {
      myDataProvider.fetchMyData();
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Custom Image Card',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              myDataProvider.myData != null
                  ? Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Image.network(
                        myDataProvider.myData!.profileBannerImageURL,
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      'assets/4.jpeg',
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.red,
                  ),
                  label: const Text(
                    "Customize",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomizedScreen()),
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/me.png"),
                          ),
                          Positioned(
                              bottom: 10,
                              right: -20,
                              child: RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: const Color(0xFFF5F6F9),
                                padding: const EdgeInsets.all(10.0),
                                shape: const CircleBorder(),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Sridhar G",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Visakhapatnam",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            // height: 100, //height of button
            width: 300, //width of button
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:app/components/GradientContainer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/constants/colors.dart';
import 'package:geolocator/geolocator.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  XFile? image;

  Future<bool> _handleLocationPermission() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location services are disabled. Please enable the services')));
        return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permissions are denied')));
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location permissions are permanently denied, we cannot request permissions.')));
        return false;
      }
      return true;
    }

    String? _currentAddress;
    Position? _currentPosition;
    double _currentLatitude = 0.0;
    double _currentLongitude = 0.0;


  Future<void> _getCurrentPosition() async {
      final hasPermission = await _handleLocationPermission();
      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        setState(() => _currentPosition = position);
        setState(() {
          _currentLatitude = position.latitude;
          _currentLongitude = position.longitude;
        });

        print('CURRENT POS: $_currentPosition');
      }).catchError((e) {
        debugPrint(e);
      });
    }


   @override
    void initState() {
      _getCurrentPosition();
      super.initState();
      
    }

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select: '),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    
    
   

    return Scaffold(
      appBar: AppBar(
        title: Text('Upload the Image'),
      ),
      body: GradientContainer(
        colors: const [PrimaryColor, PrimaryColor, SecondaryColor],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, bottom: 60, top: 60),
                child: const Center(
                  child: Text(
                      'Please take a photo of the problem and upload it here!',
                      style: TextStyle(fontSize: 20, color: White)),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _getCurrentPosition();
                  myAlert();
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                ),
                icon: Icon(Icons.upload),
                label: Text('Upload Photo',
                    style: TextStyle(fontSize: 20, color: PrimaryColor)),
              ),
              SizedBox(
                height: 40,
              ),
              //if image not null show the image
              //if image null show text
              image != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          //to show image, you type like this.
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        ),
                      ),
                    )
                  : const Text(
                      "No Image",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: White),
                    ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Latitude: " +
                    _currentLatitude.toString() +
                    " Longitude: " +
                    _currentLongitude.toString(),
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: White),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

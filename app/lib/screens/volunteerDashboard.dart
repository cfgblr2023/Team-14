import 'package:app/components/GradientContainer.dart';
import 'package:flutter/material.dart';
import 'package:app/constants/colors.dart';

class VolunteerDashboard extends StatelessWidget {
  const VolunteerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer Dashboard'),
      ),
      body: const GradientContainer(
          colors: [PrimaryColor, PrimaryColor, SecondaryColor],
          child: SingleChildScrollView(
            child: Column(
              children: [
                EntryCard(),
                EntryCard(),
                EntryCard(),
              ],
            ),
          )),
    );
  }
}

class EntryCard extends StatelessWidget {
  const EntryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Open a Modal

        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return ApprovalModal();
            });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                      "https://images.pexels.com/photos/17115830/pexels-photo-17115830/free-photo-of-woman-in-coat.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Column(children: [
                    Text(
                      'Category: ...............................',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Column(children: [
                    Text(
                      'Description: ...............................',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_down, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up, color: Colors.green),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ApprovalModal extends StatelessWidget {
  const ApprovalModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: const Column(children: [
              Text(
                'Category: ...............................',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: const Column(children: [
              Text(
                'Description: ...............................',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_down, color: Colors.red),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up, color: Colors.green),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  double? forReview;

  void deleteDatas(docId) {
    _items.doc(docId).delete();
  }

  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    super.initState();
    _stream = _items.snapshots(); // Initialize the stream here
  }

  String? status;

  final CollectionReference _items =
      FirebaseFirestore.instance.collection('review');

  @override
  Widget build(BuildContext context) {
    Widget paymentMethod(
      final paymntText,
      final subtxt,
      Function() action,
    ) {
      return RadioListTile(
        activeColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            status = value;
          });
        },
        value: paymntText,
        groupValue: status,
        title: AppText(
          txt: paymntText,
          size: 13,
        ),
        subtitle: AppText(
          txt: subtxt,
          size: 11,
          color: Colors.grey,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Customers Report'),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('some error occured${snapshot.error}'),
              );
            }
            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> document = querySnapshot.docs;

              List<Map> _items = document.map((e) => e.data() as Map).toList();

              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot itemSnap = snapshot.data.docs[index];
                    Map thisItems = _items[index];

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Slidable(
                          startActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: ((context) {
                                    deleteDatas(itemSnap.id);
                                  }),
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                ),
                              ]),
                          child: Card(
                            color: Colors.yellow.shade200,
                            child: Column(
                              children: [
                                Text(
                                  'Customer Details',
                                  style: HeadingStyle,
                                ),
                                const Divider(
                                  thickness: 2,
                                  color: Colors.black,
                                  indent: 100,
                                  endIndent: 100,
                                ),
                                serviceDetails(
                                    'Name', '${thisItems['username']}'),
                                serviceDetails(
                                    'Phone', '${thisItems['userphone']}'),
                                serviceDetails(
                                    'Address', '${thisItems['address']}'),
                                gyap(heightgyap: 50),
                                Text(
                                  'Service Details',
                                  style: HeadingStyle,
                                ),
                                const Divider(
                                  thickness: 2,
                                  color: Colors.black,
                                  indent: 100,
                                  endIndent: 100,
                                ),
                                serviceDetails('Name', '${thisItems['name']}'),
                                serviceDetails(
                                    'Category', '${thisItems['types']}'),
                                serviceDetails(
                                    'Price', '${thisItems['price']}'),
                                serviceDetails(
                                  'Date',
                                  thisItems['date'] != null
                                      ? DateFormat.yMEd()
                                          .format(thisItems['date'].toDate())
                                          .toString()
                                      : 'Date not available',
                                ),
                                serviceDetails(
                                    'Start Time', '${thisItems['starttime']}'),
                                serviceDetails(
                                    'End Time', '${thisItems['endtime']}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}

serviceDetails(name, info) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          name,
          style: subHeadingStyle,
        ),
        gyap(widthgyap: 5),
        Text(
          ':',
          style: subHeadingStyle,
        ),
        gyap(widthgyap: 50),
        Expanded(
          child: Text(
            info,
            style: buttonStyle,
          ),
        )
      ],
    ),
  );
}

Widget scheduleDateTime(
  buttonAction,
  buttonIcon,
  String buttonText,
) {
  return OutlinedButton.icon(
    style: const ButtonStyle(),
    onPressed: buttonAction,
    icon: buttonIcon,
    label: Text(
      (buttonText).toString(),
    ),
  );
}

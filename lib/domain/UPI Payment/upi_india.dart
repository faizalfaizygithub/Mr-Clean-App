import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class UPIPayment extends StatefulWidget {
  @override
  _UPIPaymentState createState() => _UPIPaymentState();
}

class _UPIPaymentState extends State<UPIPayment> {
  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "9847959648@ybl",
      receiverName: 'Mr Clean.Com',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1.00,
      flexibleAmount: true,
    );
  }

  Widget displayUpiApps() {
    if (apps == null)
      return const Center(child: CircularProgressIndicator());
    else if (apps!.length == 0)
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else
      // ignore: curly_braces_in_flow_control_structures
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Preferred Payment Methods',
          style: subHeadingStyle,
        ),
      ),
      body: Card(
        margin: EdgeInsets.all(10),
        color: Colors.grey.shade100,
        child: Column(
          children: <Widget>[
            gyap(heightgyap: 40),
            Expanded(
              child: displayUpiApps(),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'Choose your UPI apps',
                style: hintStyle,
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _transaction,
                builder: (BuildContext context,
                    AsyncSnapshot<UpiResponse> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          _upiErrorHandler(snapshot.error.runtimeType),
                          style: header,
                        ), // Print's text message on screen
                      );
                    }

                    // If we have data then definitely we will have UpiResponse.
                    // It cannot be null
                    UpiResponse _upiResponse = snapshot.data!;

                    // Data in UpiResponse can be null. Check before printing
                    String txnId = _upiResponse.transactionId ?? 'N/A';
                    String resCode = _upiResponse.responseCode ?? 'N/A';
                    String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                    String status = _upiResponse.status ?? 'N/A';
                    String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                    _checkTxnStatus(status);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          displayTransactionData('Transaction Id', txnId),
                          displayTransactionData('Response Code', resCode),
                          displayTransactionData('Reference Id', txnRef),
                          displayTransactionData(
                              'Status', status.toUpperCase()),
                          displayTransactionData('Approval No', approvalRef),
                        ],
                      ),
                    );
                  } else
                    return const Center(
                      child: Text(''),
                    );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.yellow.shade400,
        child: TextButton.icon(
          label: Text(
            'Back',
            style: buttonStyle,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}

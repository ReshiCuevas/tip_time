import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/tip_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.room_service,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Cost of service',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                            onChanged: (service) {
                              context
                                  .read<TipTimeProvider>()
                                  .addService(service);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text('How was the service?'),
                      ],
                    ),
                  ],
                ),
                RadioListTile(
                  title: Text("Amazing - 20%"),
                  groupValue: 1,
                  activeColor: Colors.green,
                  value: 0.20,
                  onChanged: (value) {
                    context.read<TipTimeProvider>().calcTip(value);
                  },
                ),
                RadioListTile(
                  title: Text("Good - 18%"),
                  activeColor: Colors.green,
                  groupValue: 1,
                  value: 0.18,
                  onChanged: (value) {
                    context.read<TipTimeProvider>().calcTip(value);
                  },
                ),
                RadioListTile(
                  title: Text("Okay - 15%"),
                  groupValue: 1,
                  value: 0.15,
                  onChanged: (value) {
                    context.read<TipTimeProvider>().calcTip(value);
                  },
                  activeColor: Colors.green,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5),
                    Text('Round up tip?'),
                    SizedBox(width: 175),
                    Switch(
                      value: isSwitched,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                        context.read<TipTimeProvider>().roundUp(value);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                MaterialButton(
                    child: Text('CALCULATE'),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      context.read<TipTimeProvider>().showTip();
                    }),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Tip amount: \$${context.watch<TipTimeProvider>().getTip.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

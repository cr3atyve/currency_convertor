import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController controller = TextEditingController();
  String? errorText;
  String ronValue = '';
  String e = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Currency convertor'),
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.network(
                      'https://kodytechnolab.com/img/blog/small/develop-currency-exchange-and-money-converter-app1.jpg'),
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'enter the amount to convert to lei',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  helperText: 'please enter a number',
                  errorText: errorText,
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      controller.clear();
                    },
                  ),
                ),
                onChanged: (String? value) {
                  final double? doubleValue = double.tryParse(value!);
                  setState(() {
                    if (doubleValue == null) {
                      errorText = 'this is not a number';
                    } else {
                      errorText = null;
                    }
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                    ),
                    onPressed: () {
                      double? price;
                      setState(() {
                        if (controller.text == '') {
                          e = 'you must enter a numeric value';
                          ronValue = '';
                        } else {
                          e = '';
                          price = double.tryParse(controller.text)! * 5;
                          ronValue = price!.toStringAsFixed(2);
                          ronValue += ' Lei';
                        }
                      });
                    },
                    child: const Text('Convert'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    ronValue,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32.0,
                    ),
                  ),
                  Text(e,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 22.0,
                      )),
                ],
              ),
              // Expanded(child: Row()),
            ],
          ),
        ),
      ),
    );
  }
}

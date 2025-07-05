import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy Traders',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _billController = TextEditingController();
  final List<bool> _selected = [true, false, false, false];
  double tipAmount = 0.0;
  double billAmount = 0.0;
  double totalBillAmount = 0.0;
  double tipPercent = 0.0;
  int tipIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Happy Traders",
            style: GoogleFonts.aBeeZee(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
          child: Column(children: [
            Text("Enter Bill Amount",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _billController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: '\$100'),
              ),
            ),
            const SizedBox(height: 15),
            Text("Choose Tip",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            //////////////////////////  TOGGLE BUTTON
            ToggleButtons(
              isSelected: _selected,
              selectedColor: Colors.white,
              fillColor: Colors.orange,
              borderRadius: BorderRadius.circular(30),
              onPressed: (int selectedIndex) {
                for (int index = 0; index < _selected.length; index++) {
                  setState(() {
                    _selected[index] = selectedIndex == index;
                  });
                }
              },
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('10%'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('15%'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('20%'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('30%'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ///////////////////////////////   CALCULATE BUTTON
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent),
                onPressed: () {
                  tipIndex = _selected.indexWhere((element) => element);
                  tipPercent = [0.1, 0.15, 0.2, 0.30][tipIndex];
                  billAmount = double.parse(_billController.text.trim());
                  setState(() {
                    tipAmount = double.parse(
                        (billAmount * tipPercent).toStringAsFixed(2));

                    totalBillAmount = double.parse(
                        (billAmount + tipAmount).toStringAsFixed(2));
                  });
                },
                child: Text('Calculate',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
            const SizedBox(height: 15),
            Text("Total Amount",
                style: GoogleFonts.aBeeZee(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey)),
            const SizedBox(height: 15),
            Text("\$$totalBillAmount",
                style: GoogleFonts.aBeeZee(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            const SizedBox(height: 15),
            Text("Tip Amount",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey)),
            const SizedBox(height: 15),
            Text("\$$tipAmount",
                style: GoogleFonts.aBeeZee(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.black)),
            const SizedBox(height: 15),
          ]),
        ),
      ),
    );
  }
}

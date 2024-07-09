import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class CalculationHistory {
  final String numberFirst;
  final String numberSecond;
  final String operation;
  final String result;

  CalculationHistory({
    required this.numberFirst,
    required this.numberSecond,
    required this.operation,
    required this.result,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Simple Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var numberFirst = TextEditingController() ;
  var numberSecond = TextEditingController() ;
  var resultShow = "" ;
  List<CalculationHistory> historyList = [];

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    numberFirst.dispose();
    numberSecond.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.grey,
          actions: [
            IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                _showHistoryDialog(context);
              },
            ),
          ],
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: numberFirst,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 27 ,fontWeight: FontWeight.w700,color: Colors.grey),
                    decoration: InputDecoration(
                        hintText: 'Input number 1',
                        hintStyle: TextStyle(color: Colors.grey ,fontWeight: FontWeight.w100 ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Colors.deepPurple,
                              width: 2
                          ),
                        )
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  TextField(
                    controller: numberSecond,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700 ,color: Colors.grey),
                    decoration: InputDecoration(
                      hintText: 'Input number 2',
                      hintStyle: TextStyle(color: Colors.grey ,fontWeight: FontWeight.w100 ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Colors.deepPurple,
                              width: 2
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //result show box
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      height: 120,
                      width: double.infinity,

                      decoration: BoxDecoration(

                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(12) ,
                          border: Border.all(color: Colors.deepPurple ,width: 3)

                      ),

                      child: Text("$resultShow" , style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: 25 ,color: Colors.deepPurple),)) ,
                  SizedBox(
                    height: 5,
                  ),



                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          //add button
                          Container(
                            width: 90,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white10,
                                  foregroundColor: Colors.black,
                                ),

                                onPressed: (){
                                  var num1 = int.parse(numberFirst.text.toString());
                                  var num2 = int.parse(numberSecond.text.toString());

                                  var sum = num1 + num2 ;
                                  resultShow = sum.toStringAsFixed(2);

                                  setState(() {

                                    historyList.add(CalculationHistory(
                                      numberFirst: numberFirst.text,
                                      numberSecond: numberSecond.text,
                                      operation: "+",
                                      result: resultShow,
                                    ));
                                  });

                                }, child: Text("+",style: TextStyle(fontSize: 35,color: Colors.grey),)),
                          ),

                          //Multiply button
                          Container(
                            width: 90,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white10,
                                  foregroundColor: Colors.black,
                                ),

                                onPressed: (){
                                  var num1 = int.parse( numberFirst.text.toString());
                                  var num2 = int.parse( numberSecond.text.toString());

                                  var mul = num1 * num2;
                                  resultShow = mul.toStringAsFixed(2);
                                  setState(() {

                                    historyList.add(CalculationHistory(
                                      numberFirst: numberFirst.text,
                                      numberSecond: numberSecond.text,
                                      operation: "*",
                                      result: resultShow,
                                    ));
                                  });
                                }, child: Text("x", style: TextStyle(fontSize: 35, color: Colors.deepPurple),)),
                          ),

                          Container(

                            width: 90,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white10,
                                  foregroundColor: Colors.black,
                                ),

                                onPressed: (){
                                  var num1 = int.parse( numberFirst.text.toString());
                                  var num2 = int.parse( numberSecond.text.toString());

                                  var min = num1 - num2;
                                  resultShow = min.toStringAsFixed(2);
                                  setState(() {

                                    historyList.add(CalculationHistory(
                                      numberFirst: numberFirst.text,
                                      numberSecond: numberSecond.text,
                                      operation: "-",
                                      result: resultShow,
                                    ));
                                  });
                                }, child: Text("-", style: TextStyle(fontSize: 35, color: Colors.deepPurple),)),
                          ),

                          //division button
                          Container(

                            width: 90,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white10,
                                  foregroundColor: Colors.black,
                                ),

                                onPressed: (){
                                  var num1 = int.parse( numberFirst.text.toString());
                                  var num2 = int.parse( numberSecond.text.toString());

                                  var div = num1 / num2;
                                  resultShow = div.toStringAsFixed(2);
                                  setState(() {

                                    historyList.add(CalculationHistory(
                                      numberFirst: numberFirst.text,
                                      numberSecond: numberSecond.text,
                                      operation: "/",
                                      result: resultShow,
                                    ));
                                  });
                                }, child: Text("/", style: TextStyle(fontSize: 35, color: Colors.grey),)),
                          ),
                        ],
                      ),



                    ],
                  )
                ],
              ),
            )
        )


      );



  }
  void _showHistoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Calculation History'),
          backgroundColor: Colors.deepPurple.shade100,
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                var historyEntry = historyList[index];
                return ListTile(
                  title: Text(
                    '${historyEntry.numberFirst} ${historyEntry.operation} ${historyEntry.numberSecond} = ${historyEntry.result}',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}







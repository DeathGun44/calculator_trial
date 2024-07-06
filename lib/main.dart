import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
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


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: numberFirst,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 27 ,fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.black38,
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
                height: 20,
              ),

              TextField(
                controller: numberSecond,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.black38,
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
                height: 20,
              ),

              Container(
                alignment: Alignment.center,
                height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12) ,
                    border: Border.all(color: Colors.deepPurple ,width: 3)

                  ),
                  child: Text("" , style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: 25
                  ),)) ,
              SizedBox(
                height: 10,
              ),



              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      //add button
                      Container(
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white10,
                              foregroundColor: Colors.black,
                            ),

                            onPressed: (){
                              var num1 = int.parse(numberFirst.text.toString());
                              var num2 = int.parse(numberSecond.text.toString());

                              var sum = num1 + num2 ;
                              resultShow = sum.toString();

                              setState(() {});
                            }, child: Text("$resultShow",style: TextStyle(fontSize: 40,color: Colors.black87),)),
                      ),

                      //Multiply button
                      Container(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white10,
                            foregroundColor: Colors.black,
                          ),

                          onPressed: (){}, child: Text("x", style: TextStyle(fontSize: 40, color: Colors.black87),)),
                      ),
                        ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //subtract button
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 150,
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white10,
                      foregroundColor: Colors.black,
                    ),

                    onPressed: (){}, child: Text("-", style: TextStyle(fontSize: 40, color: Colors.black87),)),
                  ),

                      //division button
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white10,
                            foregroundColor: Colors.black,
                          ),

                          onPressed: (){}, child: Text("/", style: TextStyle(fontSize: 40, color: Colors.black87),)),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      )

    );
  }
}






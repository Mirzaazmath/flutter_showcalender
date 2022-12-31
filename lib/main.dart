import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String date1="";
  String date2="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              showCalender(context);
            }, child: const Text("ShowCalender")),
           const  SizedBox(height: 20,),
            Text(date1),
            const  SizedBox(height: 100,),
            ElevatedButton(onPressed: (){
              showcupertiocalender(context);
            },
                child: const
                Text("ShowCupertinocalender")),
            const   SizedBox(height: 20,),
            Text(date2)
          ],
        ),
      ),

    );
  }
  void showcupertiocalender(context){


      showCupertinoModalPopup(
          context: context,
          builder: (_) =>
              Container(
                height: 200,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: CupertinoDatePicker(
                          initialDateTime: DateTime.now(),
                          onDateTimeChanged: (val) {
                            setState(() {
                              date2 = val.toString();
                            });
                          }),
                    ),
                  ],
                ),
              ));
    }


  void showCalender(context){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate:   DateTime(2019, 1),
        lastDate: DateTime.now()).then((value) {
          setState(() {
            date1=value.toString();
          });

    });
  }
}

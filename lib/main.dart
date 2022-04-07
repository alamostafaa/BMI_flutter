import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: AppBAR(),
    );
  }

}

class AppBAR extends StatelessWidget {
  const AppBAR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xff03031D),//0xff03031D
      appBar: AppBar(
        title: const Text("BMI Calculator", style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xff191934),
        centerTitle: true,
        leading:const Icon(Icons.settings,textDirection: TextDirection.ltr,),
        ),
      body: const Home(),
      );

  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool male = false, female = false;
  TextEditingController? height =  TextEditingController();
  TextEditingController? weight =  TextEditingController();
  double? bmi=0;
  String yourBState ="";

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column( children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () { setState(() {
                    female =!female;
                    if (male = true)
                      {
                        male=false;
                      }
                  });
                  },
                  child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          border: Border.all(width: .5,color:
                          female == false? Colors.transparent: Colors.pink
                          ),
                          color:Colors.white10,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child: Image.asset("imgs/2000px-Pink_Venus_symbol.svg_.png",
                          width:80, height:80)),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      male = !male;
                      if(female =true)
                        {
                          female = false;
                        }
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration:  BoxDecoration(
                          border: Border.all(width: 1,color:
                          male == false? Colors.transparent: Colors.indigo),
                          color:Colors.white10,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child:  Image.asset("imgs/male_symbol.png", width:80, height:80)),
                ),

                //const SizedBox(width:20),

              ],),
            Container(
                margin: const EdgeInsets.only(top: 50),
                height: 90,
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child:
                TextFormField(
                  controller: height,
                  cursorColor: Colors.white10,
                  cursorHeight: 30,
                  keyboardType:TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900,
                      color: Colors.white),
                  decoration: const InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    border: InputBorder.none,

                    labelText: "Your height in Cm",
                    labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                        color: Colors.white),

                  ),
                )
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                height: 90,
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child:
                TextFormField(
                  controller: weight,
                  cursorColor: Colors.white10,
                  cursorHeight: 30,
                  keyboardType:TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900,
                      color: Colors.white),
                  decoration: const InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    border: InputBorder.none,
                    labelText: "Your weight in Kg",
                    labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                        color: Colors.white),

                  ),
                )
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: const Text("Your BMI", style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold, color: Colors.white),),
            ),

          Container(
            padding: const EdgeInsets.all(5),
              child: Text("$bmi",style: const TextStyle(color: Colors.white, fontSize: 50), textAlign: TextAlign.center,),
              width: 150,
              height: 65,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child:  Text("$yourBState", style: const TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
            ),
            MaterialButton(
              minWidth: double.infinity,
              padding: const EdgeInsets.all(10),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  double? kg, cm, bBmi;
                  kg = double.parse("${weight?.text}");
                  cm = double.parse("${height?.text}")*0.01;
                  bBmi = kg/(cm*cm);
                  bmi = double.parse((bBmi).toStringAsFixed(1));
                  if (bmi! < 18.6)
                    {
                      yourBState = "under weight";
                    }
                  else if(bmi! < 30)
                    {
                      yourBState="normal weight";
                    }
                  else
                    {
                      yourBState ="over weight";
                    }
                });
              }, child: const Text("Calculate",
                style: TextStyle(fontSize: 20, color: Colors.white)
                ,

              ),
            ),

          ]
          )
        )
        );


  }
}
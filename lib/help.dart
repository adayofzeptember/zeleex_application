import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zeleex_application/API/Read%20All/helps_API.dart';
import 'Others/Plate.dart';

class HelpCenterPage extends StatefulWidget {
  HelpCenterPage({Key? key}) : super(key: key);

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  late Future<List<Data2>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = fetch_HelpCenter();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
              statusBarColor: Colors.white),
          backgroundColor: Colors.white,
          centerTitle: true,
            title: const Text(
              "ศูนย์ช่วยเหลือ",
              style:
                  TextStyle(color: Color.fromARGB(255, 51, 51, 51), fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color.fromARGB(255, 51, 51, 51),
              ),
            )),
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.059,
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(
                        Icons.search,
                        color: ZeleexColor.zeleexGreen,
                        size: 20,
                      ),
                      hintStyle: TextStyle(color: ZeleexColor.zeleexGreen),
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 230, 228, 228),
                            width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 0),
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
              child: Text(
                "คำถามที่พบบ่อย",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 192, 192, 192),
                    fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder<List<Data2>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Data2>? data = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      // border: Border.all(
                                      //     color: Color.fromARGB(255, 233, 233, 233))
                                      border: Border(
                                    top: BorderSide(
                                        color:
                                            Color.fromARGB(255, 245, 245, 245)),
                                  )),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data![index].title.toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 130, 130, 130),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color:
                                            Color.fromARGB(255, 130, 130, 130),
                                      )
                                    ],
                                  )),
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}

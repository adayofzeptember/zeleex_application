import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../API/Read All/career_readall_api.dart';
import 'Others/Plate.dart';
import 'career_detail.dart';

class CareerPage extends StatefulWidget {
  CareerPage({Key? key}) : super(key: key);
  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  late Future<List<Data_Read_Careers>> fetched_data_career_readAll;
  @override
  void initState() {
    super.initState();
    fetched_data_career_readAll = fetch_career_readAll();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              statusBarColor: ZeleexColor.zeleexGreen),
          backgroundColor: ZeleexColor.zeleexGreen,
          elevation: 0,
      centerTitle: true,
            title: const Text(
              "ร่วมงานกับเรา",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            )),
        
        body: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/career.svg',
                      color: const Color.fromARGB(255, 51, 51, 51)),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "ตำแหน่งงาน",
                    style: TextStyle(
                        color: Color.fromARGB(
                          255,
                          51,
                          51,
                          51,
                        ),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder<List<Data_Read_Careers>>(
                future: fetched_data_career_readAll,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Data_Read_Careers>? data = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                      builder: (context) => new Career_Detail(
                                        gotText: data[index].id.toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 206, 206, 206))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data![index].title.toString() +
                                              "\t" +
                                              "(${data[index].id.toString()} ตำแหน่ง)",
                                          style: TextStyle(
                                              color: ZeleexColor.zeleexGreen,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                          decoration: BoxDecoration(
                                            color: ZeleexColor.zeleexGreen,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: const Text(
                                            "รายละเอียด >",
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ));
  }
}

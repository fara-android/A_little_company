import 'package:employee/custom/constants.dart';
import 'package:employee/models/EmployeeList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class DetailScreen extends StatefulWidget {
  final int index;
  DetailScreen({Key key, this.index}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                color: Color(0xffE5E5E5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Container(
                height: 400,
                padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Позвонить",
                          style: ConstTextStyle.style24,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.close),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(32)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    buildNSF(ConstTextStyle.style20Wb, MainAxisAlignment.start,
                        Alignment.centerLeft),
                    SizedBox(
                      height: 32,
                    ),
                    InkWell(
                      onTap: () {
                        _callnumber(
                            list.employeesList[widget.index].employeeMainPhone);
                      },
                      child: buildPhoneInfo("Основной Телефон",
                          list.employeesList[widget.index].employeeMainPhone),
                    ),
                    InkWell(
                      onTap: () {
                        _callnumber(
                            list.employeesList[widget.index].employeeWorkPhone);
                      },
                      child: buildPhoneInfo(
                        "Рабочий Телефон",
                        list.employeesList[widget.index].employeeWorkPhone,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _callnumber(
                            list.employeesList[widget.index].employeeWhatsAppPhone);
                      },
                      child: buildPhoneInfo(
                        "WhatsApp",
                        list.employeesList[widget.index].employeeWhatsAppPhone,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  EmployeeList list = new EmployeeList();
  @override
  Widget build(BuildContext context) {
    print(widget.index);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/backButton.png",
                  width: 22,
                  height: 22,
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                list.employeesList[widget.index].employeeImage,
                width: 114,
                height: 114,
              ),
            ),
            SizedBox(height: 22),
            buildNSF(ConstTextStyle.style24, MainAxisAlignment.center,
                Alignment.center),
            SizedBox(height: 12),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text(list.employeesList[widget.index].employeePosition,
                  style: ConstTextStyle.style20bl),
            ),
            SizedBox(
              height: 44,
            ),
            buildInfo(
              "Направление",
              list.employeesList[widget.index].employeeNavigation,
            ),
            buildInfo(
              "Отдел",
              list.employeesList[widget.index].employeeDepartment,
            ),
            buildInfo(
              "Email",
              list.employeesList[widget.index].employeeEmail,
            ),
            buildInfo(
              "Дата рождения",
              list.employeesList[widget.index].employeeBirthday,
            ),
            buildInfo(
              "Email",
              list.employeesList[widget.index].employeeEmail,
            ),
            InkWell(
                onTap: () {
                  _showModalBottomSheet(context);
                },
                child: buildPhoneInfo("Основной Телефон",
                    list.employeesList[widget.index].employeeMainPhone)),
            InkWell(
              onTap: () {
                _showModalBottomSheet(context);
              },
              child: buildPhoneInfo(
                "Рабочий Телефон",
                list.employeesList[widget.index].employeeWorkPhone,
              ),
            ),
            InkWell(
              onTap: () {
                _showModalBottomSheet(context);
              },
              child: buildPhoneInfo(
                "WhatsApp",
                list.employeesList[widget.index].employeeWhatsAppPhone,
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget buildNSF(TextStyle style, MainAxisAlignment mainAxisAlignment,
      Alignment alignment) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                  "${list.employeesList[widget.index].employeeSurname}  ",
                  style: style),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("${list.employeesList[widget.index].employeeName}  ",
                  style: style),
            ),
          ],
        ),
        Container(
          alignment: alignment,
          child: Text(
              "${list.employeesList[widget.index].employeeFatherName}  ",
              style: style),
        ),
      ],
    );
  }

  void _callnumber(String number1) async {
    String number = number1;
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  Widget buildPhoneInfo(String title, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildInfo(title, info),
        Icon(
          Icons.phone,
          color: Colors.green,
        )
      ],
    );
  }

  Widget buildInfo(
    String title,
    String info,
  ) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 14,
        ),
        Text(
          title,
          style: ConstTextStyle.style14,
        ),
        SizedBox(height: 4),
        Text(info.toString(), style: ConstTextStyle.style20),
        SizedBox(
          height: 14,
        ),
        Container(
          color: Colors.grey[300],
          height: 1,
        )
      ]),
    ]);
  }
}

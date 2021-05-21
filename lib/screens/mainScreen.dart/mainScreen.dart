import 'package:employee/models/EmployeeList.dart';
import 'package:employee/screens/detailScreen/detailScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = -1;
  EmployeeList list = new EmployeeList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 44),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Сотрудники",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[350],
                            prefixIcon: Icon(Icons.search),
                            hintText: "Поиск",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE8E8E8)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE8E8E8)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "У кого сегодня день рождение",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ]),
              ),
              SizedBox(height: 14),
              Container(
                height: 60,
                
                 
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < list.employeesList.length; i++)
                        buildCircleAvatar(list, i, context),
                    ],
                  ),
                
              ),
              SizedBox(
                height: 23,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 32,
                child: Text(
                  "У кого завтра день рождение",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 14),
              Container(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 1; i <= 3; i++) buildCircleAvatar(list, i, context)
                  ],
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 32,
                child: Text(
                  "Все сотрудники",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              for (int i = 0; i < list.employeesList.length; i++)
                buildAllEmployees(list, i, context),
              SizedBox(
                height: 89,
              )
            ],
          ),
        ));
  }
}

Widget buildCircleAvatar(EmployeeList list, int index, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(index: index)));
    },
      child: CircleAvatar(
      radius: 40,
      child: Image.asset(
        list.employeesList[index].employeeImage,
        height: 60,
        width: 60,
      ),
    ),
  );
}

Widget buildAllEmployees(EmployeeList list, int index, BuildContext context) {
  return InkWell(
    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(index: index)));},
      child: Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              list.employeesList[index].employeeImage,
              height: 60,
              width: 60,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text("${list.employeesList[index].employeeSurname}  ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        )),
                    Text(list.employeesList[index].employeeName,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ))
                  ],
                ),
                Text(list.employeesList[index].employeeFatherName,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ))
              ],
            ),
            Icon(
              Icons.phone,
              color: Colors.green,
            )
          ],
        ),
      ),
    ),
  );
}


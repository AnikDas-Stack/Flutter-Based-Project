import 'package:flutter/material.dart';

class home extends StatelessWidget {
  List<String> Names = [
    'Anik Das', 'Nazifa Khanom', 'Onez Chowdhury', 'Sadia Sharmin Upama',
    'Shourove Sutradhar Dip', 'Hossain Shahriar Kabir', 'Jayed Nahian',
    'Joy Barman', 'Kamruzzaman', 'Fardeen Ehsan Rifat', 'Sabbir Khan',
    'Mabrur', 'Nur-ul Momen Tohin', 'Noman', 'Nuhash', 'Omy Sabbir',
    'Rafsan Billah', 'Rakibul Yeasin', 'Samiul Islam Abir', 'Anik Dey'
  ];
  List<String> Number = [
    '00000000000', '11111111111', '22222222222', '33333333333', '44444444444',
    '55555555555', '66666666666', '77777777777', '88888888888', '99999999999',
    '10101010101', '20202020202', '30303030303', '40404040404', '50505050505',
    '60606060606', '70707070707', '80808080808', '90909090909', '01010101010'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,

      body: Container(
        child: ListView.builder(
          itemCount: Names.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Name: ' + Names[index], style: TextStyle(color: Colors.black, fontSize: 16.0)),
                    Text('Phone: ' + Number[index], style: TextStyle(color: Colors.black, fontSize: 16.0)),
                    Text('Company: Mechanic Koi', style: TextStyle(color: Colors.black, fontSize: 16.0))
                  ],
                ),
              ),
            );
          },
        ),
      ),

      appBar: AppBar(
          title: Text('List of Intern', style: TextStyle(color: Colors.white, fontSize: 20.0),),
          centerTitle: true,
          backgroundColor: Colors.black12
      )
   );
  }
}
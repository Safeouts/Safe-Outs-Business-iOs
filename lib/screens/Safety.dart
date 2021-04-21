import 'package:flutter/material.dart';

class Safety extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Safety> {
  bool _flutter = false;
  bool _contactless = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Divider(
                  height: 10,
                  thickness:10),
              ListTile(
                title: Text(
                  'Safety measures',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Card(
                color: Colors.white,
                child: SwitchListTile(
                  title: Text('Employees wearing masks',
                  ),
                  value: _flutter,
                  activeColor: Colors.teal,
                  inactiveTrackColor: Colors.grey,
                  onChanged: (bool value) {
                    setState(() {
                      _flutter = value;
                    });
                  },
                ),
              ),
              Card(
                color: Colors.white,
                child: SwitchListTile(
                  title: Text('Contactless ordering',
                  ),
                  value: _contactless,
                  activeColor: Colors.teal,
                  inactiveTrackColor: Colors.grey,
                  onChanged: (bool value) {
                    setState(() {
                      _contactless = value;
                    });
                  },
                ),
              ),
                 Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Sanitization frequency',
                        style: TextStyle(
                          fontSize: 17,

                        ),
                      ),
                    ),

                    Expanded(child: TextField(
                      keyboardType: TextInputType.number,
                      maxLines: null,
                      onChanged: (String value) {
                        // food.Pcop = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '00',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                        contentPadding: EdgeInsets.only(left: 130),
                      ),
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),

                    )
                    ),
                  ]
              ),
              Divider(
                  height: 1,
                  thickness:1),

              // Card(
              //   child:ListTile(
              //     leading: Text('Sanitization frequency',),
              //     title: TextField(
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 25,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // ),

              ListTile(
                title: Text(
                  'Other checks',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Card(
                child:ListTile(
                  title: Text("fkjhgdkfngkdnfkngfndkfgndkjg"),
                ),
              ),
              Card(
                child:ListTile(
                  title: Text("jfdgnkjdnfgkjdnfvkdfnkvndfkvnk"),
                ),
              ),
              Card(
                child:ListTile(
                  title: Text("ndgjdnfjkvndfkgndkjfgkgkgndfk"),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 300),
                      child:   FloatingActionButton(
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                        // onPressed: () async {
                        //   Navigator.of(context).pushReplacement(
                        //       MaterialPageRoute(
                        //           builder: (BuildContext context) => Dialogs()
                        //       )
                        //   );
                        // },
                        backgroundColor: new Color(0xFF00BFA5),
                      ),
                    ),
                  ]
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  Future _asyncInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter current team'),
          content: new Row(
            children: [
              new Expanded(
                  child: new TextField(
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),
                    onChanged: (value) {
                      teamName = value;
                    },
                  ))
            ],
          ),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(teamName);
              },
            ),
          ],
        );
      },
    );
  }


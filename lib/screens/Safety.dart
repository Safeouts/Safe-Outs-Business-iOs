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
                        // onPressed:
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
void _showAlert() {
  AlertDialog dialog = new AlertDialog(
    content: new Container(
      width: 260.0,
      height: 230.0,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFFFFFF),
        borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // dialog top
          new Expanded(
            child: new Row(
              children: <Widget>[
                new Container(
                  // padding: new EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                  ),
                  child: new Text(
                    'Rate',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // dialog centre
          new Expanded(
            child: new Container(
                child: new TextField(
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    filled: false,
                    contentPadding: new EdgeInsets.only(
                        left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                    hintText: ' add review',
                    hintStyle: new TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12.0,
                      fontFamily: 'helvetica_neue_light',
                    ),
                  ),
                )),
            flex: 2,
          ),

          // dialog bottom
          new Expanded(
            child: new Container(
              padding: new EdgeInsets.all(16.0),
              decoration: new BoxDecoration(
                color: const Color(0xFF33b17c),
              ),
              child: new Text(
                'Rate product',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  showDialog(context: context, child: dialog);
}

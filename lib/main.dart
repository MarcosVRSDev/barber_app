import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:intl/intl.dart';

//void main() => runApp(BarberDetailsPage());
void main() {
  runApp(MaterialApp(
    title: 'Aplicativo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => LoginPage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/barber_page': (context) => BarberPage(),
    },
  ));
}

// PAGINA DE LOGIN
class LoginPage extends StatelessWidget {
  //static final String path = "lib/src/pages/login/login3.dart";
  final TextEditingController _controladorUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            color: Colors.black54,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Color(0xFF79FF00), Colors.greenAccent.shade200],
                    [Colors.black12, Colors.green.shade200],
                  ],
                  durations: [19440, 10800],
                  heightPercentages: [0.20, 0.25],
                  blur: MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 0,
                size: Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*Text("Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0)),*/
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 15, left: 5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage('assets/images/logo.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 60),
                      elevation: 11,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        controller: _controladorUser,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black26,
                            ),
                            hintText: "Usuário",
                            hintStyle: TextStyle(color: Colors.black26),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 16.0)),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                      elevation: 11,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black26,
                            ),
                            hintText: "Senha",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 16.0)),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        color: Colors.red,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BarberPage(),
                            ),
                          );
                        },
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0))),
                        child: Text("Acessar",
                            style: TextStyle(color: Colors.white70)),
                      ),
                    ),
                    Text("Esqueceu sua senha?",
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
              SizedBox(
                height: 180,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "ou, conecte-se com:",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: RaisedButton(
                            child: Text("Facebook"),
                            textColor: Colors.white,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              this.openInWebview('https://facebook.com');
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: RaisedButton(
                            child: Text("Twitter"),
                            textColor: Colors.white,
                            color: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Não tem uma conta?",
                          style: TextStyle(color: Colors.white),
                        ),
                        FlatButton(
                          child: Text(
                            "Cadastra-se",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          textColor: Colors.indigo,
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  Future<Null> openInWebview(String url) async {
    if (await url_launcher.canLaunch(url)) {
      MaterialPageRoute(
        // **Note**: if got "ERR_CLEARTEXT_NOT_PERMITTED", modify
        // AndroidManifest.xml.
        // Cf. https://github.com/flutter/flutter/issues/30368#issuecomment-480300618
        builder: (ctx) => WebviewScaffold(
          initialChild: Center(child: CircularProgressIndicator()),
          url: url,
        ),
      );
    } else {
      SnackBar(
        content: Text('URL $url can not be launched.'),
      );
    }
  }
}

// Webview Twitter e Facebook

// PAGINA HOME PÓS LOGIN
class BarberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BarberList(),
      ),
    );
  }
}

class BarberList extends StatefulWidget {
  BarberList({Key key}) : super(key: key);

  // static final String path = "lib/src/pages/lists/list2.dart";
  _BarberListState createState() => _BarberListState();
}

class _BarberListState extends State<BarberList> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xFF63736B);
  final secondary = Color(0xFF0C0E0B);
  final green = Color(0xFF79FF00);

  final List<Map> barberLists = [
    {
      "name": "Barbearia do Laender",
      "location": "Rua Paraná, 184 - Cidade de Deus",
      "type": "De 09h ás 18h - Seg. à Sex.",
      "phone": "(37) 99122-3338",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png",
      "description":
          "Barbaria conceituada que está no mercado de trabalho a mais de 10 anos e com vários clientes satisfeitos",
      "details":
          "Detalhes como produtos a serem vendidas e serviços adicionais: \n* Corte de Barba: R\$15,00 \n*Pomoda modeladora: R\$50,00",
      "detailImage":
          "https://cdn.pixabay.com/photo/2019/09/17/18/52/barbershop-4484297__340.jpg",
      "prices": "R\$15,00-R\$40,00"
    },
    {
      "name": "Barbearia do PA",
      "location": "Rua Paraná, 184 - Cidade de Deus",
      "type": "De 09h ás 18h - Seg. à Sex.",
      "phone": "(37) 99122-3338",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Barbearia do PA",
      "location": "Rua Paraná, 184 - Cidade de Deus",
      "type": "De 09h ás 18h - Seg. à Sex.",
      "phone": "(37) 99122-3338",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Barbearia do PA",
      "location": "Rua Paraná, 184 - Cidade de Deus",
      "type": "De 09h ás 18h - Seg. à Sex.",
      "phone": "(37) 99122-3338",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Barbearia do PA",
      "location": "Rua Paraná, 184 - Cidade de Deus",
      "type": "De 09h ás 18h - Seg. à Sex.",
      "phone": "(37) 99122-3338",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Barbearia do PA",
      "location": "Rua Paraná, 184 - Cidade de Deus",
      "type": "De 09h ás 18h - Seg. à Sex.",
      "phone": "(37) 99122-3338",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Barbearia do PA",
      "location": "Rua Paraná, 184 - Cidade de Deus",
      "type": "De 09h ás 18h - Seg. à Sex.",
      "phone": "(37) 99122-3338",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Barbearia do PA",
      "location": "Rua Paraná, 184 - Cidade de Deus",
      "type": "De 09h ás 18h - Seg. à Sex.",
      "phone": "(37) 99122-3338",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff0f0f0),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 145),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: barberLists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildList(context, index);
                      }),
                ),
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          textColor: Colors.black,
                          minWidth: 0,
                          height: 40,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                        ),
                        Text(
                          "Barbearias",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: TextField(
                            // controller: TextEditingController(text: locations[0]),
                            cursorColor: Theme.of(context).primaryColor,
                            style: dropdownMenuItem,
                            decoration: InputDecoration(
                                hintText: "Procurar Barbearias",
                                hintStyle: TextStyle(
                                    color: Colors.black38, fontSize: 16),
                                prefixIcon: Material(
                                  elevation: 0.0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Icon(Icons.search),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
        onTap: () {
          /*Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(index.toString()),
          ));*/
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BarberDetailsPage(detailData: barberLists[index]),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              margin: EdgeInsets.only(right: 15, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 3, color: secondary),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        barberLists[index]['logoText']),
                    fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    barberLists[index]['name'],
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: secondary,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(barberLists[index]['location'],
                          style: TextStyle(
                              color: primary, fontSize: 13, letterSpacing: .3)),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: secondary,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(barberLists[index]['type'],
                          style: TextStyle(
                              color: primary, fontSize: 13, letterSpacing: .3)),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.call_end,
                        color: secondary,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(barberLists[index]['phone'],
                          style: TextStyle(
                              color: primary, fontSize: 13, letterSpacing: .3)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Tela de Detalhes
class BarberDetailsPage extends StatelessWidget {
  //static final String path = "lib/src/pages/ecommerce/ecommerce_detail3.dart";

  final Map detailData;

  BarberDetailsPage({Key key, @required this.detailData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          CachedNetworkImageProvider(detailData["detailImage"]),
                      fit: BoxFit.fill)),
            ),
            SafeArea(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    MaterialButton(
                      padding: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      textColor: Colors.black,
                      minWidth: 0,
                      height: 40,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ]),
                ),
                Spacer(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 30.0),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    detailData["name"],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Text(
                                    detailData["description"],
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                ),
                                ExpansionTile(
                                  title: Text(
                                    "Detalhes",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(detailData["details"]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(32.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            color: Color(0xFF79FF00),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                detailData["prices"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              const SizedBox(width: 20.0),
                              Spacer(),
                              RaisedButton(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AgendaPage(),
                                    ),
                                  );
                                },
                                color: Colors.black,
                                textColor: Colors.white,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "Agendar",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    const SizedBox(width: 20.0),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                        size: 16.0,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class AgendaPage extends StatelessWidget {
  final int selected = 1;
  final List<String> weekDays = ["S", "T", "Q", "Q", "S", "S", "D"];

  //final Map<int, String> weekDaysMap = weekDays.asMap();
  final List<int> dates = [5, 6, 7, 8, 9, 10, 11];
  final List<String> hourTaskAM = [
    "09:00 - 09:30AM",
    "09:30 - 10:00AM",
    "10:00 - 10:30AM",
    "10:30 - 11:00AM",
    "11:00 - 11:30AM",
    "11:30 - 12:00PM"
  ]; //Index = 0-5
  final List<String> hourTaskPM = [
    "01:00 - 01:30PM",
    "01:30 - 02:00PM",
    "02:00 - 02:30PM",
    "02:30 - 03:00PM",
    "03:00 - 03:30PM",
    "03:30 - 04:00PM",
    "04:00 - 04:30PM",
    "04:30 - 05:00PM",
  ]; //Index 0-7

  final bool reservado = true;
  final bool free = false;
  static int selectedIndex = 1;

  final TextStyle selectedText = TextStyle(
    color: Colors.deepOrange,
    fontWeight: FontWeight.bold,
  );
  final TextStyle daysText = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade800,
  );

  // final int date = this.dates.indexOf(selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('My Week'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: HeaderWidget(
        header: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Dezembro".toUpperCase(),
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      letterSpacing: 2.0),
                ),
              ),
              Row(
                children: weekDays.map((w) {
                  return Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: weekDays.indexOf(w) == selected
                              ? Colors.orange.shade100
                              : Colors.transparent,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30.0))),
                      padding: const EdgeInsets.only(top: 20, bottom: 8.0),
                      child: Text(
                        w,
                        style: weekDays.indexOf(w) == selected
                            ? selectedText
                            : daysText,
                      ),
                    ),
                  );
                }).toList(),
              ),
              Row(
                children: dates.map((d) {
                  return Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: dates.indexOf(d) == selected
                              ? Colors.orange.shade100
                              : Colors.transparent,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30.0))),
                      padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                      child: Text("$d",
                          style: dates.indexOf(d) == selected
                              ? selectedText
                              : daysText),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchedulingPage(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTaskWithDate(hourTaskAM[0]),
                const SizedBox(height: 20.0),
                _buildTask(hourTaskAM[1]),
                const SizedBox(height: 20.0),
                _buildTask(hourTaskAM[2]),
                const SizedBox(height: 20.0),
                _buildTaskWithDate(hourTaskAM[3]),
                const SizedBox(height: 20.0),
                _buildTask(hourTaskAM[4]),
                const SizedBox(height: 20.0),
                _buildTask(hourTaskAM[5]),
                const SizedBox(height: 20.0),
                _buildTask(hourTaskPM[0]),
                const SizedBox(height: 20.0),
                _buildTaskWithDate(hourTaskPM[1]),
                const SizedBox(height: 20.0)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTaskWithDate(String hour) {
    return Row(
      children: <Widget>[
        Text(
          "DEZ\n6",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              color: Colors.white70,
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  hour,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                      color: Colors.black),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "Reservado",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 16.0),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _buildTask(String hour) {
    return Container(
      padding: const EdgeInsets.only(left: 70.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            hour,
            style: TextStyle(
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const SizedBox(height: 5.0),
          Text(
            "Disponível",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.0),
          ),
          Text(
            "Agendar",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final Widget body;
  final Widget header;
  final Color headerColor;
  final Color backColor;
  static const mainColor = Color(0xFF79FF00);

  const HeaderWidget(
      {Key key,
      this.body,
      this.header,
      this.headerColor = Colors.white,
      this.backColor = mainColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Stack _buildBody() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          top: 0,
          width: 10,
          height: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: backColor,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(20.0))),
          ),
        ),
        Positioned(
          right: 0,
          top: 100,
          width: 50,
          bottom: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backColor,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            if (header != null)
              Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(20.0)),
                    color: headerColor,
                  ),
                  child: header),
            if (body != null)
              Expanded(
                child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30.0))),
                    elevation: 0,
                    color: backColor,
                    child: body),
              ),
          ],
        ),
      ],
    );
  }
}

class MyData {
  String name = '';
  String phone = '';
  String email = '';
  String age = '';
  DateTime date;
  TimeOfDay time;
}

class SchedulingPage extends StatelessWidget {
  final green = Color(0xFF79FF00);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    MaterialButton(
                      padding: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      textColor: Colors.black,
                      minWidth: 0,
                      height: 20,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 45),
                    child: Text(
                      "Agendamento",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    ),],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: new StepperBody(),
              ),
            ),

            /*children: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              new StepperBody(),),*/
          ],
        ),
      ),
    );
  }
}

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => new _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  int currStep = 0;
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static MyData data = new MyData();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<Step> steps = [
    new Step(
        title: const Text('Name'),
        //subtitle: const Text('Enter your name'),
        isActive: true,
        //state: StepState.error,
        state: StepState.indexed,
        content: new TextFormField(
          focusNode: _focusNode,
          keyboardType: TextInputType.text,
          autocorrect: false,
          onSaved: (String value) {
            data.name = value;
          },
          maxLines: 1,
          //initialValue: 'Aseem Wangoo',
          validator: (value) {
            if (value.isEmpty || value.length < 1) {
              return 'Please enter name';
            }
          },
          decoration: new InputDecoration(
              labelText: 'Enter your name',
              hintText: 'Enter a name',
              //filled: true,
              icon: const Icon(Icons.person),
              labelStyle:
                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('Phone'),
        //subtitle: const Text('Subtitle'),
        isActive: true,
        //state: StepState.editing,
        state: StepState.indexed,
        content: new TextFormField(
          keyboardType: TextInputType.phone,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty || value.length < 10) {
              return 'Please enter valid number';
            }
          },
          onSaved: (String value) {
            data.phone = value;
          },
          maxLines: 1,
          decoration: new InputDecoration(
              labelText: 'Enter your number',
              hintText: 'Enter a number',
              icon: const Icon(Icons.phone),
              labelStyle:
                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('Email'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        // state: StepState.disabled,
        content: new TextFormField(
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty || !value.contains('@')) {
              return 'Please enter valid email';
            }
          },
          onSaved: (String value) {
            data.email = value;
          },
          maxLines: 1,
          decoration: new InputDecoration(
              labelText: 'Enter your email',
              hintText: 'Enter a email address',
              icon: const Icon(Icons.email),
              labelStyle:
                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('Age'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        content: new TextFormField(
          keyboardType: TextInputType.number,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty || value.length > 2) {
              return 'Please enter valid age';
            }
          },
          maxLines: 1,
          onSaved: (String value) {
            data.age = value;
          },
          decoration: new InputDecoration(
              labelText: 'Enter your age',
              hintText: 'Enter age',
              icon: const Icon(Icons.explicit),
              labelStyle:
                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    // new Step(
    //     title: const Text('Fifth Step'),
    //     subtitle: const Text('Subtitle'),
    //     isActive: true,
    //     state: StepState.complete,
    //     content: const Text('Enjoy Step Fifth'))
  ];

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context)
          .showSnackBar(new SnackBar(content: new Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Please enter correct data');
      } else {
        formState.save();
        print("Name: ${data.name}");
        print("Phone: ${data.phone}");
        print("Email: ${data.email}");
        print("Age: ${data.age}");

        showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text("Details"),
              //content: new Text("Hello World"),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text("Name : " + data.name),
                    new Text("Phone : " + data.phone),
                    new Text("Email : " + data.email),
                    new Text("Age : " + data.age),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      }
    }

    return new Container(
        child: new Form(
      key: _formKey,
      child: new ListView(
        children: <Widget>[
          new Stepper(
            steps: steps,
            type: StepperType.vertical,
            currentStep: this.currStep,
            onStepContinue: () {
              setState(() {
                if (currStep < steps.length - 1) {
                  currStep = currStep + 1;
                } else {
                  currStep = 0;
                }
                // else {
                // Scaffold
                //     .of(context)
                //     .showSnackBar(new SnackBar(content: new Text('$currStep')));

                // if (currStep == 1) {
                //   print('First Step');
                //   print('object' + FocusScope.of(context).toStringDeep());
                // }

                // }
              });
            },
            onStepCancel: () {
              setState(() {
                if (currStep > 0) {
                  currStep = currStep - 1;
                } else {
                  currStep = 0;
                }
              });
            },
            onStepTapped: (step) {
              setState(() {
                currStep = step;
              });
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30.0),
            child: RaisedButton(
              padding: const EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: new Text(
                'Agendar',
                style: new TextStyle(color: Colors.white),
              ),
              onPressed: _submitDetails,
              color: Colors.red,
            ),
          ),
        ],
      ),
    ));
  }
}

class DateTimePicker extends StatelessWidget {
  const DateTimePicker(
      {Key key,
        this.labelText,
        this.selectedDate,
        this.selectedTime,
        this.selectDate,
        this.selectTime})
      : super(key: key);

  final String labelText;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> selectDate;
  final ValueChanged<TimeOfDay> selectTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: new DateTime(1970),
        lastDate: new DateTime(2101));
    if (picked != null && picked != selectedDate) selectDate(picked);
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
    await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) selectTime(picked);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.body1;
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 4,
          child: new _InputDropdown(
            labelText: labelText,
            valueText: new DateFormat.yMMMd().format(selectedDate),
            valueStyle: valueStyle,
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        const SizedBox(width: 12.0),
        new Expanded(
          flex: 3,
          child: new _InputDropdown(
            valueText: selectedTime.format(context),
            valueStyle: valueStyle,
            onPressed: () {
              _selectTime(context);
            },
          ),
        ),
      ],
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key,
        this.child,
        this.labelText,
        this.valueText,
        this.valueStyle,
        this.onPressed})
      : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText, style: valueStyle),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}

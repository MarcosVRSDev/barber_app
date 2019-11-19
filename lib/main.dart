import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                    //height: double.infinity,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0)),
                        Card(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 60),
                          elevation: 11,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  40))),
                          child: TextField(
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
                              borderRadius: BorderRadius.all(Radius.circular(
                                  40))),
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
                              Navigator.pushNamed(context, '/barber_page');
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
                                  FocusScope.of(context).requestFocus(
                                      FocusNode());
                                  this._openInWebview('https://facebook.com');
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

  // ignore: unused_element
  Future<Null> _openInWebview(String url) async {
    if (await url_launcher.canLaunch(url)) {
      MaterialPageRoute(
        // **Note**: if got "ERR_CLEARTEXT_NOT_PERMITTED", modify
        // AndroidManifest.xml.
        // Cf. https://github.com/flutter/flutter/issues/30368#issuecomment-480300618
        builder: (ctx) =>
            WebviewScaffold(
              initialChild: Center(child: CircularProgressIndicator()),
              url: url,
              appBar: AppBar(title: Text(url)),
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
      "description": "Barbaria conceituada que está no mercado de trabalho a mais de 10 anos e com vários clientes satisfeitos",
      "detailImage": "https://cdn.pixabay.com/photo/2015/11/01/19/43/barber-1017457_960_720.jpg"
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
        backgroundColor: Color(0xfff0f0f0),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 145),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
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
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
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
                            cursorColor: Theme
                                .of(context)
                                .primaryColor,
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
              builder: (context) => BarberDetailsPage(detailData: barberLists[index]),
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
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(detailData["detailImage"]),
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
                                        "Hand-stitched finish. Flexible pebble sole. Made of brown leather with a textured effect",
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
                                          child: Text(
                                              detailData["description"]),
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
                                    "R\$15,00-R\$40,00",
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
                                        borderRadius: BorderRadius.circular(
                                            10.0)),
                                    onPressed: () {},
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
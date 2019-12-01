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

// Menu

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

//Alert Menu

class PNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width, height;

  const PNetworkImage(this.image, {Key key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
      fit: fit,
      width: width,
      height: height,
    );
  }
}

_alertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return BeautifulAlertDialog();
      });
}

class BeautifulAlertDialog extends StatelessWidget {
  final String infoIcon =
      'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2Finfo-icon.png?alt=media';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  bottomLeft: Radius.circular(75),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey.shade200,
                child: PNetworkImage(
                  infoIcon,
                  width: 60,
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Alerta!",
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(height: 10.0),
                    Flexible(
                      child: Text(
                          "Você tem certeza que quer deslogar a sua conta?"),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            child: Text("Não"),
                            color: Colors.red,
                            colorBrightness: Brightness.dark,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: RaisedButton(
                            child: Text("Sim"),
                            color: Colors.green,
                            colorBrightness: Brightness.dark,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BeautifulAlertDialogManutencao extends StatelessWidget {
  final String infoIcon =
      'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2Finfo-icon.png?alt=media';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          height: 180,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  bottomLeft: Radius.circular(75),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey.shade200,
                child: PNetworkImage(
                  infoIcon,
                  width: 60,
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Alerta!",
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(height: 10.0),
                    Flexible(
                      child: Text(
                          "Devido a problemas internos com servidor, essa página não poderá ser exibida!"),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            child: Text("OK"),
                            color: Colors.red,
                            colorBrightness: Brightness.dark,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                        SizedBox(width: 10.0),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
  _BarberListState createState() => _BarberListState();
}

class _BarberListState extends State<BarberList> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final primary = Color(0xFF63736B);
  final secondary = Color(0xFF0C0E0B);
  final green = Color(0xFF79FF00);
  final Color active = Colors.white;
  final Color divider = Colors.grey.shade600;

  final String image =
      'https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png';

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
      "name": "Garagem Barbearia",
      "location": "Av. Agami, 183 - Moema",
      "type": "De 08h ás 18h - Seg. à Sex.",
      "phone": "(11) 3215-6398",
      "logoText":
      "https://cdn.pixabay.com/photo/2018/07/06/04/36/barber-shop-3519744_960_720.png",
      "description": "Uma das primeiras tematizadas na cidade de São Paulo. O espaço conta com um ambiente charmoso, com uma decoração levemente voltada para as antigas barbearias dos anos 50.",
      "details": "Detalhes como produtos a serem vendidas e serviços adicionais: \n* Corte de Barba: R\$10,00 \n*Pomoda modeladora: R\$45,00",
      "detailImage": "https://i.pinimg.com/236x/8c/e4/b4/8ce4b4ef3ea77472d84e0021b00484fe.jpg",
      "prices": "R\$25,00-R\$30,00"
    },
    {
      "name": "Barbearia Rico Vallente",
      "location": "Rua Antonio de Barros, 1875 - Tatuapé",
      "type": "De 10h ás 21h - Seg. à Sex. 09h ás 21h - Sab.",
      "phone": "(11) 2097-7338",
      "logoText":
      "https://i.pinimg.com/564x/f7/6c/34/f76c34a9ac22e5d84ddddddc52e58ac1.jpg",
      "description": "A Barbearia RicoVallente conta com um espaço amplo, resguardando a privacidade do cliente, com cadeiras Van de Velde, visando o máximo conforto, porém sempre presando pela alta qualidade dos produtos utilizados em todos os nossos serviços.",
      "details": "Detalhes como produtos a serem vendidas e serviços adicionais: \n* Corte de Barba: R\$55,00 \n*Luzes: R\$99,00 \n*Progressiva: R\$99,00",
    "detailImage": "https://i.pinimg.com/236x/3f/9d/11/3f9d11d2e45d9ee18cdef30cf1f87345.jpg",
      "prices": "R\$39,00-R\$120,00"
    },

    {
      "name": "Barbearia Bar",
      "location": "Shopping West Plaza 1° piso.",
      "type": "De 10h ás 22h - Sab. à Sex. 12h ás 20h Dom e Feriados.",
      "phone": "(11) 2537-8461",
      "logoText":
      "https://i.pinimg.com/236x/af/5e/31/af5e3133b178eb7f6ab1202552d2a87a.jpg",
      "description": "Primeiro conceito híbrido de mini bar e barbearia da América Latina. O espaço é dedicado exclusivamente ao universo masculino, oferecendo cuidados estéticos e um minibar.",
      "details": "Detalhes como produtos a serem vendidas e serviços adicionais: \n* Corte de Barba: R\$30,00 \n*Pomoda modeladora: R\$20,00 \n*Coloração: R\$80,00 \n*Hidratação: R\$60,00",
      "detailImage": "https://i.pinimg.com/236x/dc/59/1f/dc591f9d1fb17c93f042a6316a19141c.jpg",
      "prices": "R\$20,00-R\$100,00"
    },
    {
      "name": "Ganza Barbearia",
      "location": "Rua dos Três Irmãos, 408 - Vila Progredior",
      "type": "De 09h ás 21h - Seg. à Sab.",
      "phone": "(11)3589-1760",
      "logoText":
      "https://i.pinimg.com/236x/0a/e8/12/0ae812dcbaba456cc0a3579a7a7e5403.jpg",
      "description": "O nome “Ganza” vem do sufixo da palavra “Eleganza”, elegância, em português. O conceito da Ganza Barbearia é muito simples, ofertar excelência no atendimento e nos serviços, para a satisfação de um público vaidoso, moderno e que preze pela elegância.",
      "details": "Detalhes como produtos a serem vendidas e serviços adicionais: \n* Corte de Barba: R\$40,00 \n*Hidratação: R\$50,00 \n*Coloração Barba: R\$35,00 \n*Coloração Cabelo: R\$50,00 \n*Depilação: R\$30,00",
      "detailImage": "https://i.pinimg.com/236x/68/e7/a4/68e7a49c7c4adcd80767222386f863f8.jpg",
      "prices": "R\$30,00-R\$102,00"
    },
    {
      "name": "Corleone Barbearia",
      "location": "Rua Dr. Renato Paes de Barros, 390 - Itaim",
      "type": "De 09h ás 18h - Seg. à Sex.",
      "phone": "(11) 2538 8009",
      "logoText":
      "https://i.pinimg.com/236x/97/ff/fa/97fffa43efadee20fa961361ecae4433.jpg",
      "description": "Inspirada nas antigas barbearias nova-iorquinas típicas de filmes da máfia das décadas de 40, 50 e 60, a Barbearia Corleone chega com a intenção de resgatar a cultura masculina.",
      "details": "Detalhes como produtos a serem vendidas e serviços adicionais: \n* Corte de Barba: R\$70,00 \n*Corte de Cabelo: R\$120,00 \n*Combo: R\$170,00",
      "detailImage": "https://i.pinimg.com/236x/3b/12/2d/3b122d07e036b42eed16d6c5036aff58.jpg",
      "prices": "R\$70,00-R\$170,00"
    },
    {
      "name": "Barbearia Big Boss",
      "location": "R. Madre de Deus, 530 - Mooca",
      "type": "De 08h ás 22h - Seg. à Sex, 06h ás 16h Dom e Feriados.",
      "phone": "(11) 2713-6445",
      "logoText":
      "https://i.pinimg.com/236x/44/77/ea/4477ea957f5dc610a5c3b0aa39bb73f1.jpg",
      "description": "Modelo de origem Oriental passou por vários processos de descoloração até atingir a cor necessária, e só aí foi feito a matiz ação (correção de cor). O corte estilo Undercut baixo ou conhecido também como corte capa é em estilo bem versátil pois possibilita vários tipos de uso",
      "details": "Detalhes como produtos a serem vendidas e serviços adicionais: \n* Corte de Barba: R\$55,00 \n*Manicure: R\$30,00 \n*Redução de Grisalhos: R\$90,00 \n*Coloração: R\$140,00 \n*Hidratação: R\$90,00",
      "detailImage": "https://i.pinimg.com/236x/82/a9/60/82a960ae36908d58818cdd9e341b332b.jpg",
      "prices": "R\$20,00-R\$160,00"
    },
    {
      "name": "Barbearia Napoles",
      "location": "Rua do Comércio, 40 - Centro",
      "type": "De 09h ás 19h - Seg. à Sex.",
      "phone": "(11) 3106-2111",
      "logoText":
      "https://i.pinimg.com/236x/52/72/e1/5272e1d139193872760ab684002bec21.jpg",
      "description": "A Barbearia Nápoles surgiu depois de uma separação de sociedade, trazendo para São Paulo um novo conceito de barbearia tradicional e clássica.",
      "details": "Detalhes como produtos a serem vendidas e serviços adicionais: \n* Corte de Barba: R\$40,00 \n*Corte Cabelo: R\$70,00 \n*Hidratação Facial: R\$80,00",
      "detailImage": "https://i.pinimg.com/236x/df/80/b0/df80b00850b2e6ba7903b3c5b63a8921.jpg",
      "prices": "R\$30,00-R\$100,00"
    },
    {
      "name": "Garagem Estética",
      "location": "R. Dos Bandeirantes Cambui, 120 - Campinas",
      "type": "De 09h ás 21h - Seg. à Sex. 09h ás 19h - Sab.",
      "phone": "(19) 3255-1477",
      "logoText":
      "https://i.pinimg.com/236x/44/da/9a/44da9a1e04bdfbf3e2944da53f34de22.jpg",
      "description": "Temos como objetivo oferecer serviços específicos ao homem contemporâneo, procurando proporcionar excelentes resultados em um ambiente exclusivo voltado ao seu Bem-Estar.",
      "details": "Detalhes como produtos a serem vendidas e serviços adicionais: \n* Corte de Barba: R\$30,00 \n* Tintura Barba: R\$40,00 \n* Depilação Barba: R\$70,00 \n*Limpeza de Pele: R\$85,00 \n* Corte Adulto: R\$65,00",
      "detailImage": "https://i.pinimg.com/236x/82/b3/09/82b3090b013c01432fc470f06dce6455.jpg",
      "prices": "R\$25,00-R\$200,00"
    },
    {
      "name": "Barbearia Good Barber",
      "location": "Rua Azevedo Soares, 805 - Tatuapé",
      "type": "De 10h ás 20h - Seg. à Sex. 09h ás 19h Sab.",
      "phone": "(11) 2536-9563",
      "logoText":
      "https://i.pinimg.com/236x/52/bd/34/52bd343164fc77b87ee62f35eb3a7e25.jpg",
      "description": "Já foi o tempo que vaidade era característica única das mulheres. Hoje o homem moderno está cada vez mais exigente quando o assunto é se sentir bem consigo mesmo e ficar de olho nas tendências de cuidado pessoal.",
      "details": "Detalhes como produtos a serem vendidas e serviços adicionais: \n* Corte de Barba: R\$55,00 \n* Corte Simples: R\$40,00 \n* Corte e Barba: R\$85,00 \n* Tratamento de Pele: R\$70,00",
      "detailImage": "https://i.pinimg.com/236x/3f/21/21/3f2121a2b50516dad382535fb1f6046e.jpg",
      "prices": "R\$40,00-R\$120,00"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        key: _key,
        drawer: _buildDrawer(),
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
                          child: Icon(Icons.menu),
                          color: Colors.white,
                          textColor: Colors.black,
                          minWidth: 0,
                          height: 40,
                          onPressed: () {
                            _key.currentState.openDrawer();
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

  _buildDrawer() {
    final String image =
        'https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png';
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: new Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: green, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () => _alertDialog(context),
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.deepOrange])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(image),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "Marcos Rezende",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "@marcos.Dev",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.home, "Home", BarberPage()),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Meu Perfil", ProfilePage()),
                  _buildDivider(),
                  _buildRow(Icons.notifications, "Notificações", BeautifulAlertDialogManutencao(),
                      showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.archive, "Histórico", HistoricPage()),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "Sobre", AboutPage()),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title, Widget page,
      {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: active,
            ),
            SizedBox(width: 10.0),
            Text(
              title,
              style: tStyle,
            ),
            Spacer(),
            if (showBadge)
              Material(
                color: Colors.deepOrange,
                elevation: 5.0,
                shadowColor: Colors.red,
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    "10+",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
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
                              color: primary, fontSize: 13, letterSpacing: .3),  overflow: TextOverflow.clip),
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
                              color: primary, fontSize: 13, letterSpacing: .3), overflow: TextOverflow.clip),
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
  final List<int> dates = [2, 3, 4, 5, 6, 7, 8];
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
            onVerticalDragCancel: () {
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
                            builder: (context) => BarberPage(),
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
                    ),
                  ],
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
        title: const Text('Data'),
        //subtitle: const Text('Enter your name'),
        isActive: true,
        //state: StepState.error,
        state: StepState.indexed,
        content: new TextFormField(
          focusNode: _focusNode,
          keyboardType: TextInputType.datetime,
          autocorrect: false,
          onSaved: (String value) {
            data.name = value;
          },
          maxLines: 1,
          //initialValue: 'Aseem Wangoo',
          validator: (value) {
            if (value.isEmpty ||
                value.length < 10 ||
                value.length > 11 ||
                !value.contains('/')) {
              return 'Por favor, informe uma data válida';
            }
          },
          decoration: new InputDecoration(
              labelText: 'Digite uma data',
              hintText: '01/01/1999',
              //filled: true,
              icon: const Icon(Icons.calendar_today),
              labelStyle:
                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('Hora'),
        //subtitle: const Text('Subtitle'),
        isActive: true,
        //state: StepState.editing,
        state: StepState.indexed,
        content: new TextFormField(
          keyboardType: TextInputType.datetime,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty ||
                value.length < 5 ||
                value.length > 6 ||
                !value.contains(':')) {
              return 'Por favor, informe uma hora válida';
            }
          },
          onSaved: (String value) {
            data.phone = value;
          },
          maxLines: 1,
          decoration: new InputDecoration(
              labelText: 'Informe uma hora',
              hintText: '00:00',
              icon: const Icon(Icons.alarm),
              labelStyle:
                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('CPF'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        // state: StepState.disabled,
        content: new TextFormField(
          keyboardType: TextInputType.number,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty ||
                value.length < 11 ||
                value.length > 12 ||
                !value.contains('-')) {
              return 'Por favor, informe um CPF válido';
            }
          },
          onSaved: (String value) {
            data.email = value;
          },
          maxLines: 1,
          decoration: new InputDecoration(
              labelText: 'Digite o CPF do cartão de crédito',
              hintText: '000000000-00',
              icon: const Icon(Icons.fingerprint),
              labelStyle:
                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
      title: const Text('Cartão de Crédito'),
      // subtitle: const Text('Subtitle'),
      isActive: true,
      state: StepState.indexed,
      content: new TextFormField(
        keyboardType: TextInputType.number,
        autocorrect: false,
        validator: (value) {
          if (value.isEmpty || value.length > 19 || value.length < 18) {
            return 'Por favor, digite um cartão de crédito válido';
          }
        },
        maxLines: 1,
        onSaved: (String value) {
          data.age = value;
        },
        decoration: new InputDecoration(
            labelText: 'Digite o cartão de crédito',
            hintText: '0000 0000 0000 0000',
            icon: const Icon(Icons.credit_card),
            labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
      ),
    ),
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
        showSnackBarMessage('Por favor, informe todos os dados corretamente');
      } else {
        formState.save();
        print("Data: ${data.name}");
        print("Hora: ${data.phone}");
        print("CPF: ${data.email}");
        print("Cartão: ${data.age}");

        showDialog(
            context: context,
            child: new AlertDialog(
              title: Text("Agendamento realizado com sucesso!"),
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              //content: new Text("Hello World"),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text("Data : " + data.name),
                    new Text("Hora : " + data.phone),
                    new Text("CPF : " + data.email),
                    new Text("Cartão : " + data.age),
                  ],
                ),
              ),
              actions: <Widget>[
                new RaisedButton(
                  child: Text("Cancelar"),
                  color: Colors.red,
                  textColor: Colors.white,
                  colorBrightness: Brightness.dark,
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                new RaisedButton(
                  child: Text("Confirmar"),
                  textColor: Colors.white,
                  color: Colors.green,
                  colorBrightness: Brightness.dark,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BarberPage(),
                      ),
                    );
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
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
              color: Colors.blue,
            ),
          ),
        ],
      ),
    ));
  }
}

class ProfilePage extends StatelessWidget {
  final String image =
      'https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png';
  final green = Color(0xFF79FF00);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, .9),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 330,
                    color: green,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 300),
                        child: MaterialButton(
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
                      ),
                      Container(
                          height: 90,
                          margin: EdgeInsets.only(top: 0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: PNetworkImage(image),
                          )),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      Text(
                        "Marcos Rezende",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      Text(
                        "@marcos.Dev",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 77),
                        padding: EdgeInsets.all(10),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 5),
                                      child: Text("Reputação",
                                          style: TextStyle(
                                              color: Colors.black54))),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          "5,0",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Icon(Icons.star,
                                            color: Colors.amber),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 5),
                                      child: Text(
                                          "Agendamentos\n    Realizados",
                                          style: TextStyle(
                                              color: Colors.black54))),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: Text("50",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16))),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 5),
                                      child: Text(
                                          "Agendamentos\n    Finalizados",
                                          style: TextStyle(
                                              color: Colors.black54))),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Text("49",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      UserInfo()
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "User Information",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Container(
                      child: Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: Icon(Icons.my_location),
                        title: Text("Cidade"),
                        subtitle: Text("Divinópolis"),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text("marcosvrs.dev@gmail.com"),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Telefone"),
                        subtitle: Text("(99) 9 9876-8556"),
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Sobre mim"),
                        subtitle: Text(
                            "Campo para descrição da Biografia do usuário, detalhes e experiências com app."),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HistoricPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: HistoricList(),
      ),
    );
  }
}

class HistoricList extends StatefulWidget {
  HistoricList({Key key}) : super(key: key);

  // static final String path = "lib/src/pages/lists/list2.dart";
  _HistoricListState createState() => _HistoricListState();
}

class _HistoricListState extends State<HistoricList> {
  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.black, fontSize: 18);
  final primary = Color(0xFF63736B);
  final secondary = Color(0xFF0C0E0B);
  final green = Color(0xFF79FF00);

  final List<Map> barberLists = [
    {
      "name": "Barbearia do PA",
      "location": "Rua Paraná, 184 - Cidade de Deus",
      "horario": "03/12/19 - 09:00 ás 09:30",
      "status": "Finalizado",
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
                                builder: (context) => BarberPage(),
                              ),
                            );
                          },
                        ),
                        Text(
                          "Histórico",
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
                                hintText: "Procurar",
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
                      Text(barberLists[index]['horario'],
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
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(barberLists[index]['status'],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: .3)),
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

class AboutPage extends StatelessWidget {

  final String image = "https://cdn.pixabay.com/photo/2016/06/12/21/41/barber-1453064_960_720.jpg";
  @override
  Widget build(BuildContext context) {

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.content_cut,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 250.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          "Scheduling Barber",
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: CachedNetworkImageProvider(image),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      "Sobre o aplicativo: \n \n \n \nO Scheduling Barber é feito de pessoas que acreditam no nosso projeto. Hoje, temos mais de 40 mil estabelecimentos de beleza cadastrados e aumentando suas receitas com o uso eficiente do sistema de gestão e marketing do Scheduling Barber.",
      style: TextStyle(fontSize: 18.0),
    );
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
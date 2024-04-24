import 'package:flutter/material.dart';
import 'package:travel_plan_app/presentation/screens/login_screen.dart';
import 'package:travel_plan_app/presentation/widgets/card_custom_popular.dart';
import 'package:travel_plan_app/presentation/widgets/generic_card.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController destinyController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    void _login() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Localização Atual',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                )),
            Row(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'São Paulo,',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'SP',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            IgnorePointer(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 15, right: 20),
                      child: TextField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.drag_handle_outlined),
                          hintText: 'Procurar Destino',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        controller: destinyController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {},
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, left: 15, right: 20),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Favoritos',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 25, left: 15, right: 20),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Ver tudo',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 160),
              height: 300,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GenericCard(
                    title: 'Rio de Janeiro',
                    description: 'Cidade Maravilhosa',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/a/a1/1_cristor_redentor_2014.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GenericCard(
                    title: 'São Paulo',
                    description: 'Selva de Pedra',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/b/ba/Museu_de_Arte_de_S%C3%A3o_Paulo_%28MASP%29.jpg',
                  ),
                )
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 460, left: 15, right: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Destinos Populares',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 465, left: 15, right: 20),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Ver tudo',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 500, left: 4),
              height: 240,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CardCustomPopular(
                    title: 'São Paulo',
                    description: 'R\$1900,00',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/b/ba/Museu_de_Arte_de_S%C3%A3o_Paulo_%28MASP%29.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CardCustomPopular(
                    title: 'Salvador',
                    description: 'R\$3500,00',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/f/f5/Elevador_Lacerda_7610.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CardCustomPopular(
                    title: 'Rio de Janeiro',
                    description: 'R\$2300,00',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/a/a1/1_cristor_redentor_2014.jpg',
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.people_alt_outlined),
                onPressed: _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:adventure_ai/language/languages.dart';
import 'package:adventure_ai/localization/constant.dart';
import 'package:adventure_ai/model/language_model.dart';
import 'package:adventure_ai/screen/home_screen.dart';
import 'package:flutter/material.dart';

class SelecionarIdiomaScreen extends StatefulWidget {
  const SelecionarIdiomaScreen({super.key});

  @override
  State<StatefulWidget> createState() => SelecionarIdiomaScreenState();
}

class SelecionarIdiomaScreenState extends State<SelecionarIdiomaScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 180,
                ),
                Text(
                  Languages.of(context)!.welcomeText,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  Languages.of(context)!.appDescription,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 70,
                ),
                _createLanguageDropDown()
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xff0875b3),
          child: InkWell(
            onTap: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
              child: Text(
                'Continuar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );

  _createLanguageDropDown() {
    return DropdownButton<LanguageModel>(
      iconSize: 30,
      hint: Text(Languages.of(context)!.selectLanguage),
      onChanged: (LanguageModel? language) {
        changeLanguage(context, language!.languageCode);
      },
      items: LanguageModel.languageList()
          .map<DropdownMenuItem<LanguageModel>>(
            (e) => DropdownMenuItem<LanguageModel>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.country,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(e.languageName)
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

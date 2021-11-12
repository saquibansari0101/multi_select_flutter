import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Multi Select',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        errorColor: Colors.red
      ),
      home: MyHomePage(title: 'Flutter Multi Select'),
    );
  }
}

class Animal {
  final int id;
  final String name;

  Animal({
    this.id,
    this.name,
  });
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormFieldState> _nameFormKey = GlobalKey<FormFieldState>();
  TextEditingController controller = TextEditingController();
  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  List<String> _selectedValues = [];
  final formKey = GlobalKey<FormState>();
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              //################################################################################################
              // Rounded blue MultiSelectDialogField
              //################################################################################################
              Form(
                key: formKey,
                child: MultiSelectDialogField(
                  searchable: true,
                  validator: (value){
                    return "shit";
                  },
                  chipDisplay: MultiSelectChipDisplay(),
                  items: _items,
                  key: _multiSelectKey,
                  formKey: _nameFormKey,
                  title: Text("Animals"),
                  validatorFunction: (value) {
                    log(value);
                    RegExp regex = new RegExp(r"\[]");
                    return controller.text == "[]"
                        ? "LocaleKeys.text_enter_valid_contact_number.tr()"
                        : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      formKey.currentState.validate();
                    });
                  },
                  selectedColor: Colors.black,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(15),
                          gapPadding: 8),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).errorColor),
                          borderRadius: BorderRadius.circular(15),
                          gapPadding: 8),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).errorColor),
                          borderRadius: BorderRadius.circular(15),
                          gapPadding: 8),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Theme.of(context).accentColor),
                          borderRadius: BorderRadius.circular(15),
                          gapPadding: 8),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(15),
                          gapPadding: 8),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).accentColor),
                          borderRadius: BorderRadius.circular(15),
                          gapPadding: 8),
                      suffixStyle: Theme.of(context).textTheme.subtitle2,
                      hintText: "hintText",
                      labelText: "labelText",
                      hintStyle: Theme.of(context).textTheme.subtitle1),
                  controller: controller,
                  onConfirm: (results) {
                    List<Animal> _selectedAnimals = [];
                    _selectedAnimals = results.cast<Animal>();

                    // results.forEach((element) {
                    //   _selectedAnimals.add(element as Animal);
                    // });
                    _selectedValues.clear();
                    _selectedAnimals.forEach((element) {_selectedValues.add(element.name);});
                    controller.text = _selectedValues.toString();
                    log(_selectedValues.toString());
                    setState(() {
                      formKey.currentState.validate();
                    });
                    // log(_nameFormKey.currentState.validate().toString());
                    // log(_nameFormKey.currentState.isValid.toString());
                    // _nameFormKey.currentState.isValid = false;
                  },
                ),
              ),
              SizedBox(height: 50),
              //################################################################################################
              // This MultiSelectBottomSheetField has no decoration, but is instead wrapped in a Container that has
              // decoration applied. This allows the ChipDisplay to render inside the same Container.
              //################################################################################################
            ],
          ),
        ),
      ),
    );
  }
}

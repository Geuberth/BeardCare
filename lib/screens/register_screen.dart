import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:image_picker/image_picker.dart';

// definition of the widget Login screen
class RegisterScreen extends StatefulWidget {
  final String? userType;
  static String id = 'Login';
  const RegisterScreen({Key? key, required this.userType}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

//Login screen
class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<XFile> imageFileList = [];
  String? cellPhone = '';
  String? email = '';
  String? userName = '';
  String? firstName = '';
  String? lastName = '';
  String? password = '';

  Future pickImage(BuildContext context) async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images!.isNotEmpty) {
      setState(() {
        imageFileList.clear();
        imageFileList.addAll(images);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Awesome Snackbar!'),
          action: SnackBarAction(
            label: 'Action',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Image.asset(
                          'Assets/beardL.png',
                          height: 250,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          onSaved: (String? value) {
                            setState(() {
                              email = value;
                            });
                          },
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Nickname',
                            labelText: 'Nickname',
                          ),
                          validator: (value) {
                            if(value == "souta" || value == "benito"){
                              return null;
                            }else{
                              if (value!.isEmpty) {
                                return 'No ingresaste un nickname';
                              }else{
                                return 'El nickname no existe en la base de datos';
                              }
                            }
                          },
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        /*IntlPhoneField(
                          initialCountryCode: 'CO',
                          onSaved: (PhoneNumber? value) {
                            setState(() {
                              cellPhone = value?.number;
                            });
                          },
                          textAlignVertical: const TextAlignVertical(y: 1),
                          decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              border: InputBorder.none),
                        ),
                        TextFormField(
                          onSaved: (String? value) {
                            setState(() {
                              userName = value;
                            });
                          },
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Nick Name',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'No ingresaste nick name';
                            }
                            return null;
                          },
                        ),*/
                        const SizedBox(
                          height: 8,
                        ),
                        /*TextFormField(
                          onSaved: (String? value) {
                            setState(() {
                              firstName = value;
                            });
                          },
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'First Name',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'No ingresaste nick name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),*/
                        TextFormField(
                          onSaved: (String? value) {
                            setState(() {
                              password = value;
                            });
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Password',
                            labelText: 'Password',
                          ),
                          validator: (String? value) {
                            if (value == "canela" ||
                                value == "trabajador123"){
                              return null;
                            } else {
                              if (value!.isEmpty) {
                                return 'No ingresaste password';
                              } else {
                                return 'La password no es correcta';
                              }
                            }
                          }
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  /*if (widget.userType == 'Barber')
                    ElevatedButton.icon(
                      icon: const Icon(Icons.camera),
                      label: const Text('Pick citizenship card Photos'),
                      onPressed: () {
                        pickImage(context);
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                    ),
                  const SizedBox(
                    height: 30,
                  ),*/
                  MaterialButton(
                    color: Colors.amber,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                    onPressed: () {
                      //onPressed: () {
                      if(_formKey.currentState!.validate() && widget.userType == 'Client' ){
                        Navigator.pushNamed(context, '/BarberList');
                      }else if(_formKey.currentState!.validate() && widget.userType == 'Barber'){
                        Navigator.pushNamed(context, '/Mostrar');
                      }
                      //},
                      //if (_formKey.currentState!.validate()) {
                        //_formKey.currentState?.save();
                      //}
                    },
                    child: const Text('Iniciar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

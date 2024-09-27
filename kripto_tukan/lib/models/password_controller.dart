import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField ({
    Key key,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);

  @override
  _PasswordField createState() => _PasswordField();
}

class _PasswordField extends State<PasswordField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: _isObscure,
        controller: widget.controller,
      //   validator:(String? value) {
      //   if (value!.isEmpty) {
      //     return "* Required";
      //   } else if (value.length < 8) {
      //     return "La contraseña debe tener más de 8 caracteres";
      //   } else if (value.length >= 15) {
      //     return "Contraseña valida";
      //   } else
      //     return null;
      // },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)
          ),
          hintText: 'Contraseña',
          
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Color(0xFF0dba0e),
          ),
          suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility_off_outlined :Icons.visibility_outlined ,color: Colors.black,),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          
        ),
      ),
    );
  }
}

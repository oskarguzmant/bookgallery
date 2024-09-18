import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  bool _isPasswordObscure = true;
  bool _isRepPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/book.png'),
                width: 128,
                height: 128,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                    prefixIcon: Icon(Icons.person)),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo electrónico",
                    prefixIcon: Icon(Icons.email),
                    helperText: "Campo obligatorio"),
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    value!.isValidEmail() ? null : "Correo inválido",
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _password,
                obscureText: _isPasswordObscure,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Contraseña",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                    ),
                    helperText: "Campo obligatorio"),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _repPassword,
                obscureText: false,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Repita la contraseña",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_isRepPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isRepPasswordObscure = !_isRepPasswordObscure;
                        });
                      },
                    ),
                    helperText: "Campo obligatorio"),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFB000),
                    Color(0xFFB7C8D9),
                    Color(0xFF061126),
                  ],
                  stops: [0.0, 0.45, 1.0],
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.8, 0.05),
                  radius: 1.0,
                  colors: [
                    const Color(0xFF006BFF).withOpacity(0.95),
                    const Color(0xFF006BFF).withOpacity(0.65),
                    const Color(0xFF006BFF).withOpacity(0.0),
                  ],
                  stops: const [0.0, 0.45, 1.0],
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.8, -0.9),
                  radius: 0.9,
                  colors: [
                    const Color(0xFFFFB000).withOpacity(1.0),
                    const Color(0xFFFFB000).withOpacity(0.75),
                    const Color(0xFFFFB000).withOpacity(0.0),
                  ],
                  stops: const [0.0, 0.45, 1.0],
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    const Color(0xFF020817).withOpacity(0.95),
                  ],
                  stops: const [0.45, 0.65, 1.0],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      const SizedBox(height: 50),

                      Image.asset(
                        'lib/assets/images/logo.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),

                      const SizedBox(height: 60),

                      // USUÁRIO
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Usuário',
                          hintText: 'Digite seu usuário',

                          hintStyle: const TextStyle(color: Colors.white70),

                          labelStyle: const TextStyle(color: Colors.white),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),

                      const SizedBox(height: 20),

                      // SENHA
                      TextField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          hintText: 'Digite sua senha',

                          hintStyle: const TextStyle(color: Colors.white70),

                          labelStyle: const TextStyle(color: Colors.white),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.white),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      // BOTÃO
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            context.go('/home');
                          },
                          child: const Text('Entrar'),
                        ),
                      ),
                    ],
                  ),
                ),

                // ESQUECI A SENHA
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Esqueci minha senha'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

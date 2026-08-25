import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gg_entregas/providers/app_providers.dart';
import 'package:go_router/go_router.dart';

class LoginScreens extends ConsumerStatefulWidget {
  const LoginScreens({super.key});

  @override
  ConsumerState<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends ConsumerState<LoginScreens> {
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

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
                    const Color(0xFF006BFF).withValues(alpha: 0.95),
                    const Color(0xFF006BFF).withValues(alpha: 0.65),
                    const Color(0xFF006BFF).withValues(alpha: 0.0),
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
                    const Color(0xFFFFB000).withValues(alpha: 1.0),
                    const Color(0xFFFFB000).withValues(alpha: 0.75),
                    const Color(0xFFFFB000).withValues(alpha: 0.0),
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
                    const Color(0xFF020817).withValues(alpha: 0.95),
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
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          hintText: 'Digite seu nome',

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

                      // SENHA
                      const SizedBox(height: 50),

                      // BOTÃO
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (nameController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Por favor, digite seu nome.'),
                                ),
                              );
                              return;
                            }
                            if (nameController.text.trim().length < 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'O nome deve ter pelo menos 3 caracteres.',
                                  ),
                                ),
                              );
                              return;
                            }

                            ref
                                .read(nameProvider.notifier)
                                .setName(nameController.text);
                            if (context.mounted) {
                              context.go('/home');
                            }
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
                  onPressed: () async {},
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

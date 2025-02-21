import 'package:flutter/material.dart';
import 'package:greengrocer_app/src/view/auth/components/custom_text_field.dart';
import 'package:greengrocer_app/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Usuário', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            initialValue: app_data.user.email,
            prefixIcon: Icons.email,
            label: 'Email',
            readOnly: true,
          ),
          CustomTextField(
            initialValue: app_data.user.name,
            prefixIcon: Icons.person,
            label: 'Nome',
            readOnly: true,
          ),
          CustomTextField(
            initialValue: app_data.user.phone,
            prefixIcon: Icons.phone,
            label: 'Celular',
            readOnly: true,
          ),
          CustomTextField(
            initialValue: app_data.user.cpf,
            prefixIcon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
            readOnly: true,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Atualizar Senha',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Atualização da Senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      prefixIcon: Icons.lock,
                      label: 'Senha Atual',
                      isSecret: true,
                    ),
                    CustomTextField(
                      prefixIcon: Icons.lock_outline,
                      label: 'Nova Senha',
                      isSecret: true,
                    ),
                    CustomTextField(
                      prefixIcon: Icons.lock_outline,
                      label: 'Confirmar Nova Senha',
                      isSecret: true,
                    ),

                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Atualizar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

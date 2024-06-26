import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/pages/dashboard_page.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/assets/assets.gen.dart';
import '../../../../../core/components/buttons.dart';
import '../../../../../core/components/spaces.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/router/app_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          children: [
            const Text(
              'Login Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Hello, welcome back to our account',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SpaceHeight(50.0),
            const SpaceHeight(60.0),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email ID',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Assets.icons.email.svg(),
                ),
              ),
            ),
            const SpaceHeight(20.0),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Assets.icons.password.svg(),
                ),
              ),
            ),
            const SpaceHeight(50.0),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loaded: (authResponseModel) {
                    AuthLocalDatasource().saveAuthData(authResponseModel);
                    if (authResponseModel.user!.roles == 'owner' ||
                        authResponseModel.user!.roles == 'kasir') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPosPage(),
                        ),
                      );
                    } else {
                      context.goNamed(RouteConstants.root,
                          pathParameters: PathParameters().toMap());
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: AppColors.primary,
                        content: Text("Login Berhasil"),
                      ),
                    );
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(message),
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return Button.filled(
                      onPressed: () {
                        // context.goNamed(
                        //   RouteConstants.root,
                        //   pathParameters: PathParameters().toMap(),
                        // );
                        context.read<LoginBloc>().add(LoginEvent.login(
                            email: emailController.text,
                            password: passwordController.text));
                      },
                      label: 'Login',
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),

            // const Row(
            //   children: [
            //     Flexible(child: Divider()),
            //     SizedBox(width: 14.0),
            //     Text('OR'),
            //     SizedBox(width: 14.0),
            //     Flexible(child: Divider()),
            //   ],
            // ),
            // const SpaceHeight(50.0),
            // Button.outlined(
            //   onPressed: () {},
            //   label: 'Login with Google',
            //   icon: Assets.images.google.image(height: 20.0),
            // ),
            const SpaceHeight(50.0),
            InkWell(
              onTap: () {
                context.goNamed(RouteConstants.register);
              },
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Not Registered yet? ',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: 'Create an Account',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/assets/assets.gen.dart';
import '../../../../../core/components/buttons.dart';
import '../../../../../core/components/spaces.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/router/app_router.dart';
import '../bloc/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          children: [
            const Text(
              'Register Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Hello, please complete the data below to register a new account',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SpaceHeight(60.0),
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Assets.icons.email.svg(),
                ),
              ),
            ),
            const SpaceHeight(20.0),
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
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone',
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
            // const SpaceHeight(20.0),
            // TextFormField(
            //   controller: confirmPasswordController,
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     labelText: 'Confirm Password',
            //     prefixIcon: Padding(
            //       padding: const EdgeInsets.all(12.0),
            //       child: Assets.icons.password.svg(),
            //     ),
            //   ),
            // ),
            const SpaceHeight(50.0),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (authResponseModel) {
                    AuthLocalDatasource().saveAuthData(authResponseModel);
                    context.goNamed(RouteConstants.root,
                        pathParameters: PathParameters().toMap());
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
                        context.read<RegisterBloc>().add(RegisterEvent.register(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            password: passwordController.text));
                      },
                      label: 'Register',
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),

            const SpaceHeight(50.0),
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
            //   label: 'Register with Google',
            //   icon: Assets.images.google.image(height: 20.0),
            // ),
            // const SpaceHeight(50.0),
            InkWell(
              onTap: () {
                context.goNamed(RouteConstants.login);
              },
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already Account? ',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: 'Login Now',
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

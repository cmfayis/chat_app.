import 'package:chat_app/application/feature/auth/auth_bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/heading.dart';
import '../widget/sizedbox.dart';

class RegisterPageWrapper extends StatelessWidget {
  const RegisterPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginButtonClickedState) {
          Navigator.pushNamed(context, '/Login');
        } else if (state is SignUpButtonClickedState) {
          Navigator.pushNamed(context, '/SignUp');
        }
        if (state is GoogleButtonState) {
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
        }
      },
      
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                  decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter ,end: Alignment.bottomCenter, colors: [
              Color.fromARGB(255, 8, 211, 247),
              Color.fromARGB(255, 93, 201, 209),
              Color.fromARGB(255, 161, 252, 252)
            ])),
              ),
           
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizedBox(
                    hieght: 50,
                  ),            
                  CustomSizedBox(hieght: 45,),
                  const HeadingText(),
                  const CustomSizedBox(
                    hieght: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print('clicked facebook');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                          child: CircleAvatar(
                              radius: 17,
                              child: Image.asset('asset/images/face.webp')),
                        ),
                      ),
                      const CustomSizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(GoogleButtonEvent());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                          child: CircleAvatar(
                              radius: 16,
                              child: Image.asset('asset/images/ggg.png')),
                        ),
                      ),
                    ],
                  ),
                  const CustomSizedBox(
                    hieght: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 162,
                        color: const Color.fromARGB(255, 55, 55, 55),
                      ),
                      const CustomSizedBox(
                        width: 10,
                      ),
                      const Text(
                        'or',
                        style: TextStyle(color: Colors.white),
                      ),
                      const CustomSizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 2,
                        width: 162,
                        color: const Color.fromARGB(255, 55, 55, 55),
                      )
                    ],
                  ),
                  const CustomSizedBox(
                    hieght: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(SignUpButtonClickedEvent());
                      },
                      child: Container(
                        width: 385,
                        height: 45,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Center(
                          child: Text(
                            "Sign up with Email",
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const CustomSizedBox(
                    hieght: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Existing account ? ',
                          style: TextStyle(
                            color: Colors.grey,
                          )),
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(LoginButtonClickedEvent());
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

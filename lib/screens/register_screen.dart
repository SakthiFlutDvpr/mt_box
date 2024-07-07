import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mt_box/providers/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late GlobalKey<FormState> formKey;
  _RegisterScreenState() {
    formKey = GlobalKey<FormState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff855CAC),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [mobileTextField(), submitButton()],
            ),
          )),
    );
  }

  Widget mobileTextField() {
    return TextFormField(
      controller: context.read<RegisterProvider>().mobileController,
      onChanged: (value) {
        context.read<RegisterProvider>().changeMobileNum(value);
      },
      validator: (value) {
        if (value.toString().isEmpty) {
          return "please enter your mobile number";
        } else if (value.toString().length < 10) {
          return "please enter a valid mobile number";
        } else {
          return null;
        }
      },
      onSaved: (value) {},
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 10,
      minLines: 1,
      cursorColor: Colors.white,
      showCursor: true,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.mobile_friendly_outlined),
          prefixIconColor: Colors.white,
          prefixText: "91+ ",
          prefixStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          counterStyle: TextStyle(color: Colors.transparent),
          hintText: "Enter Your Mobile ...",
          hintStyle: TextStyle(fontSize: 14, color: Colors.white),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }

  Widget submitButton() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
          onPressed: context.watch<RegisterProvider>().mobileNumber.length >= 10
              ? () {
                  debugPrint(context.read<RegisterProvider>().mobileNumber);
                }
              : null,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((state) {
              if (state.contains(WidgetState.disabled)) {
                return Colors.transparent;
              }

              return Colors.transparent;
            }),
            foregroundColor: WidgetStateProperty.resolveWith((state) {
              if (state.contains(WidgetState.disabled)) {
                return Colors.white;
              }

              return Colors.white;
            }),
            shape: WidgetStateProperty.resolveWith((state) {
              if (state.contains(WidgetState.disabled)) {
                return const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(width: 1.5, color: Colors.white));
              }
              return const RoundedRectangleBorder(
                side: BorderSide(width: 2.5, color: Color(0xff90E4C1)),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              );
            }),
            shadowColor: WidgetStateProperty.resolveWith((state) {
              if (state.contains(WidgetState.disabled)) {
                return Colors.transparent;
              }

              return const Color(0xff90E4C1);
            }),
          ),
          child: const Text(
            "Register",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.25),
          )),
    );
  }
}

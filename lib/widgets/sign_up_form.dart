import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:write_app/config/config.dart';
import 'package:write_app/widgets/social_media_button.dart';
import 'package:write_app/widgets/text_form_field.dart';

final _formKey = GlobalKey<FormState>();

TextEditingController? _nameTextEditingController = TextEditingController();
TextEditingController? _emailTextEditingController = TextEditingController();
TextEditingController? _passwordTextEditingController = TextEditingController();

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          FormFieldText(
            hintText: 'Name',
            textEditingController: _nameTextEditingController,
            validation: (val) {
              if (val!.isEmpty || val == null) {
                return 'Please fill your Name';
              }
              return null;
            },
          ),
          SizedBox(height: 25.0),
          FormFieldText(
            hintText: 'Email',
            textEditingController: _emailTextEditingController,
            validation: (val) {
              if (val!.isEmpty || val == null) {
                return 'Please fill your Email';
              }
              return null;
            },
          ),
          SizedBox(height: 25.0),
          FormFieldText(
            hintText: 'Pasword',
            textEditingController: _passwordTextEditingController,
            obscure: true,
            validation: (val) {
              if (val!.isEmpty || val == null) {
                return 'Please fill your Password';
              }
              return null;
            },
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialMediaButton(
                text: 'Continue with Twitter',
                fontAwesomeIcons: FontAwesomeIcons.twitter,
              ),
              SizedBox(width: 12.0),
              SocialMediaButton(
                text: 'Continue with Facebook',
                fontAwesomeIcons: FontAwesomeIcons.facebookF,
              ),
            ],
          ),
          SizedBox(height: 25.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
              _nameTextEditingController!.clear();
              _emailTextEditingController!.clear();
              _passwordTextEditingController!.clear();
              Navigator.of(context).pushNamed(Config.user);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Sign up',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}

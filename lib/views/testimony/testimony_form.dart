import 'package:cama_mod/generated/assets.dart';
import 'package:cama_mod/views/shared/KButton.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:cama_mod/views/shared/KFormField.dart';

class TestimonyForm extends StatefulWidget {
  const TestimonyForm({super.key});

  @override
  State<TestimonyForm> createState() => _TestimonyFormState();
}

class _TestimonyFormState extends State<TestimonyForm> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Image.asset(Assets.imagesTestimony),
          SizedBox(height: MediaQuery.of(context).size.height * .05),
          Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).size.height * .2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please share your testimonies with us!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                _buildForm()
              ],
            ),
          )
        ]))
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        KFormField(label: 'Fullname', icon: Icons.person, controller: TextEditingController()),
        const SizedBox(height: 20),
        _buildCountry(),
        const SizedBox(height: 20),
        KFormField(label: 'Email', icon: Icons.person, controller: TextEditingController()),
        const SizedBox(height: 20),
        KFormField(label: 'Phone', icon: Icons.person, controller: TextEditingController()),
        const SizedBox(height: 20),
        KFormField(label: 'Testimony', icon: Icons.person, controller: TextEditingController()),
        const SizedBox(height: 20),
        KButton(onPressed: () {})
      ],
    );
  }

  Widget _buildCountry() {
    return Builder(
      builder: (BuildContext context) {
        return TextField(
          onTap: () {
            showCountryPicker(
                context: context,
                onSelect: (country) {
                  print(country.name);
                });
          },
          controller: TextEditingController(),
          style: const TextStyle(fontSize: 14),
          readOnly: true,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(width: 1, color: Colors.grey.withOpacity(.5))),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.5), width: 1))),
        );
      },
    );
  }
}

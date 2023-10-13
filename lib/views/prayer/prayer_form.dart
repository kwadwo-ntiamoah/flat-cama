import 'package:cama_mod/generated/assets.dart';
import 'package:cama_mod/views/shared/KButton.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:cama_mod/config/colors.dart';
import 'package:cama_mod/views/shared/KFormField.dart';

class PrayerForm extends StatefulWidget {
  const PrayerForm({super.key});

  @override
  State<PrayerForm> createState() => _PrayerFormState();
}

class _PrayerFormState extends State<PrayerForm> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Image.asset(Assets.imagesPrayer),
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
                Text('Prayer Request',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: KColors.kDarkColor)),
                const SizedBox(height: 20),
                const Text(
                  'I want to pray with you! Please share your prayer needs so we can agree together',
                  style: TextStyle(fontSize: 16),
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
        KFormField(label: 'Prayer Request', icon: Icons.person, controller: TextEditingController()),
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

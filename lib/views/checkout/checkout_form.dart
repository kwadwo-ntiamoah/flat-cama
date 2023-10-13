part of 'checkout.dart';

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({super.key});

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController additionalInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<StoreModel, CartModel>(builder: (ctx, store, cart, _) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KFormField(label: 'Firstname', controller: firstnameController, validate: true),
            const SizedBox(height: 20),
            KFormField(label: 'Lastname', controller: lastnameController, validate: true),
            const SizedBox(height: 20),
            KFormField(label: 'Phone', controller: phoneController, validate: true),
            const SizedBox(height: 20),
            KFormField(label: 'Email (optional)', controller: emailController),
            const SizedBox(height: 20),
            KFormField(label: 'Country', controller: countryController, validate: true),
            const SizedBox(height: 20),
            KFormField(label: 'Region/State', controller: regionController, validate: true),
            const SizedBox(height: 20),
            KFormField(label: 'Address', controller: addressController, validate: true),
            const SizedBox(height: 20),
            KFormField(label: 'Additional Info', controller: additionalInfoController, validate: true),
            const SizedBox(height: 30),
            Text('SubTotal: GHS ${cart.cartTotalAmount}',
                style: TextStyle(color: KColors.kPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Billing: GHS 20.00',
                style: TextStyle(color: KColors.kPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            KButton(
                onPressed: () {},
                label: 'Confirm Order | GHS ${(cart.cartTotalAmount + 20).toStringAsFixed(2)}',
                showIcon: false)
          ],
        ),
      );
    });
  }
}

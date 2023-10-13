import 'package:cama_mod/views/models/contact_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactModel extends ChangeNotifier {
  bool _hasCallSupport = false;
  final String _phoneNumber = "0540609437";
  final String _email = "mnnlthmpsn@outlook.com";

  void checkCanLaunchUrlStatus() {
    canLaunchUrl(Uri(scheme: 'tel', path: _phoneNumber))
        .then((value) => _hasCallSupport = value);

    notifyListeners();
  }

  Future _makePhoneCall() async {
    final url = Uri(scheme: 'tel', path: _phoneNumber);
    await launchUrl(url);
  }

  Future _sendSMS() async {
    final url = Uri(scheme: 'sms', path: _phoneNumber);
    await launchUrl(url);
  }

  Future _sendEmail() async {
    final url = Uri(scheme: 'mailto', path: _email);
    await launchUrl(url);
  }

  Future _sendWhatsapp() async {
    final url = Uri.parse('whatsapp://send?phone=$_phoneNumber');
    await launchUrl(url);
  }

  Future handler(ContactButton button) async {
    switch(button.target) {
      case 'phone':
        if (_hasCallSupport) {
          _makePhoneCall();
        }
        break;
      case 'sms':
        _sendSMS();
        break;
      case 'email':
        _sendEmail();
        break;
      case 'whatsapp' || 'record':
        _sendWhatsapp();
        break;
      default:
        break;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class MyDrawerController {
  Future<void> toWhatsApp(BuildContext context) async {
    const String phoneNumber = "+2348086652587";
    const String message = "Trips Guard customer enquiries prompt";
    final Uri whatsappUri = Uri.parse(
        'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}'); //('whatsapp://send?phone=$phoneNumber&text=$message') ;

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }

  Future<void> makePhoneCall(BuildContext context) async {
    const String phoneNumber = "+2348086652587";
    final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Phone app not installed")));
      }
    }
  }
}

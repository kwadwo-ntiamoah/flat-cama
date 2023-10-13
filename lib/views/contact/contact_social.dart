part of 'contact.dart';

class ContactSocial extends StatefulWidget {
  const ContactSocial({super.key});

  @override
  State<ContactSocial> createState() => _ContactSocialState();
}

class _ContactSocialState extends State<ContactSocial> {
  final List<ContactButton> contactItems = [
    const ContactButton(
        title: "Call Us",
        target: "phone",
        icon: Icons.phone_in_talk_rounded,
        isImage: false),
    const ContactButton(
        title: "Send SMS",
        target: "sms",
        icon: Icons.messenger_rounded,
        isImage: false),
    const ContactButton(
        title: "Email Us", target: "email", icon: Icons.mail, isImage: false),
    const ContactButton(
        title: "Whatsapp Us",
        target: "whatsapp",
        image: Assets.iconsWhatsapLine),
    const ContactButton(
        title: "Record Message",
        target: "record",
        image: Assets.iconsRecordMessage),
    const ContactButton(
        title: "Visit Site", target: "site", icon: Icons.tv, isImage: false),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var contactVM = context.read<ContactModel>();

      contactVM.checkCanLaunchUrlStatus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, i) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.white, KColors.kLightColor.withOpacity(.6)]),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.1),
                    spreadRadius: 8,
                    blurRadius: 60,
                    offset: const Offset(0, 0))
              ]),
          child: ListTile(
              onTap: () {},
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * .3),
                  contactItems[i].isImage
                      ? Image.asset(
                          contactItems[i].image!,
                          color: KColors.kDarkColor,
                          height: 35,
                          width: 35,
                        )
                      : Icon(
                          contactItems[i].icon,
                          color: KColors.kDarkColor,
                          size: 30,
                        ),
                  const SizedBox(width: 16),
                  Text(
                    contactItems[i].title,
                    style: const TextStyle(fontSize: 14),
                  )
                ],
              )),
        );
      },
      itemCount: contactItems.length,
    );
  }
}

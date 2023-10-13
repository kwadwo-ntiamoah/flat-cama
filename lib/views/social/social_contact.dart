part of 'social.dart';

class ContactSocial extends StatefulWidget {
  const ContactSocial({super.key});

  @override
  State<ContactSocial> createState() => _ContactSocialState();
}

class _ContactSocialState extends State<ContactSocial> {
  final List<SocialButton> contactItems = [
    const SocialButton(
        title: "Facebook",
        image: Assets.socialFacebook,
        link: "https://facebook.com/prophetasantemensah"),
    const SocialButton(
        title: "Twitter",
        image: Assets.socialTwitter,
        link: "https://twitter.com/revasantemensah"),
    const SocialButton(
        title: "Tiktok",
        image: Assets.socialTiktok,
        link: "https://www.tiktok.com/@chrisasanteministries"),
    const SocialButton(
        title: "Youtube",
        image: Assets.socialYoutube,
        link: "https://www.youtube.com/channel/UCCawkgDRQGkkuOq9iMq75XQ"),
    const SocialButton(
        title: "Instagram",
        image: Assets.socialInstagram,
        link: "https://www.instagram.com/prophetasantemensah/"),
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
                  Image.asset(contactItems[i].image,
                      color: KColors.kDarkColor, height: 35, width: 35),
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

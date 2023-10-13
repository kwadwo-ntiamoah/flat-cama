import 'package:cama_mod/views/about/about.dart';
import 'package:cama_mod/views/archives/archives.dart';
import 'package:cama_mod/views/bible/bible.dart';
import 'package:cama_mod/views/cama/cama.dart';
import 'package:cama_mod/views/checkout/checkout.dart';
import 'package:cama_mod/views/contact/contact.dart';
import 'package:cama_mod/views/dashboard/dashboard.dart';
import 'package:cama_mod/views/events/events.dart';
import 'package:cama_mod/views/give/give.dart';
import 'package:cama_mod/views/models/Item/item.dart';
import 'package:cama_mod/views/not_found.dart';
import 'package:cama_mod/views/partner/partner.dart';
import 'package:cama_mod/views/prayer/prayer.dart';
import 'package:cama_mod/views/radio/radio.dart';
import 'package:cama_mod/views/social/social.dart';
import 'package:cama_mod/views/store/item_details.dart';
import 'package:cama_mod/views/store/store.dart';
import 'package:cama_mod/views/testimony/testimony.dart';
import 'package:cama_mod/views/tv/tv.dart';
import 'package:cama_mod/views/tv/tv_full_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: "/",
      name: "dashboard",
      builder: (ctx, state) => const DashboardView()),
  GoRoute(
      path: "/prayer",
      name: "prayer",
      builder: (ctx, state) => const PrayerView()),
  GoRoute(
      path: "/events",
      name: "events",
      builder: (ctx, state) => const EventsView()),
  GoRoute(
      path: "/contact",
      name: "contact",
      builder: (ctx, state) => const ContactView()),
  GoRoute(
      path: "/about",
      name: "about",
      builder: (ctx, state) => const AboutView()),
  GoRoute(
      path: "/testimony",
      name: "testimony",
      builder: (ctx, state) => const TestimonyView()),
  GoRoute(
      path: "/social",
      name: "social",
      builder: (ctx, state) => const SocialView()),
  GoRoute(
      path: "/archives",
      name: "archives",
      builder: (ctx, state) => const ArchivesView()),
  GoRoute(
      path: "/bible",
      name: "bible",
      builder: (ctx, state) => const BibleView()),
  GoRoute(
      path: "/store",
      name: "store",
      builder: (ctx, state) => const StoreView()),
  GoRoute(
      path: "/checkout",
      name: "checkout",
      builder: (ctx, state) => const CheckoutView()),
  GoRoute(
      path: "/radio",
      name: "radio",
      builder: (ctx, state) => const RadioView()),
  GoRoute(
      path: "/partner",
      name: "partner",
      builder: (ctx, state) => const PartnerView()),
  GoRoute(
      path: "/give",
      name: "give",
      builder: (ctx, state) => const GiveView()),
  GoRoute(
      path: "/cama",
      name: "cama",
      builder: (ctx, state) => const CamaView()),
  GoRoute(path: "/tv", name: "tv", builder: (ctx, state) => const TvView()),
  GoRoute(path: "/tvFullScreen", name: "tvFullScreen", builder: (ctx, state) {
    String url = state.extra as String;
    return TvFullScreenView(url: url);
  }),
  GoRoute(
      path: "/item",
      name: "item",
      builder: (ctx, state) {
        Item item = state.extra as Item;
        return ItemDetailsView(item: item);
      }),
], initialLocation: '/', errorBuilder: (ctx, state) => const NotFoundView());

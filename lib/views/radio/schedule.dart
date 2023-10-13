part of 'radio.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  void initState() {
    getDays();
    super.initState();
  }

  Future getDays() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var radioModel = context.read<RadioModel>();
      await radioModel.getProgrammeDays();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioModel>(builder: (ctx, state, _) {
      if (state.isLoading) {
        return Center(
          child: CircularProgressIndicator(color: KColors.kPrimaryColor),
        );
      } else {
        return RefreshIndicator(
          color: KColors.kPrimaryColor,
          onRefresh: () => state.getProgrammeDays(),
          child: ListView.builder(
              itemCount: state.days.length,
              itemBuilder: (BuildContext context, int i) {
                return Column(
                  children: [
                    GFAccordion(
                        margin: const EdgeInsets.all(0),
                        titlePadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        expandedTitleBackgroundColor: Colors.white,
                        titleChild: Text(state.days[i].name,
                            style: TextStyle(
                                color: KColors.kPrimaryColor, fontSize: 22)),
                        collapsedIcon: Icon(Icons.add_circle_outline_outlined,
                            color: KColors.kPrimaryColor, size: 26),
                        expandedIcon: Icon(Icons.remove_circle_outline,
                            color: KColors.kPrimaryColor, size: 26),
                        contentChild: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: state.days[i].programmes.isEmpty
                              ? const Text('No programmes for this day')
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.days[i].programmes.length,
                                  itemBuilder: (BuildContext context, int j) {
                                    return Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                state
                                                    .days[i].programmes[j].name,
                                                style: const TextStyle(
                                                    fontSize: 18)),
                                            Text(state
                                                .days[i].programmes[j].time)
                                          ],
                                        )),
                                        const SizedBox(width: 24),
                                        Column(
                                          children: [
                                            Switch.adaptive(
                                                value: false,
                                                onChanged: (val) {}),
                                            Text('Remind me',
                                                style: TextStyle(
                                                    color:
                                                        KColors.kPrimaryColor))
                                          ],
                                        )
                                      ],
                                    );
                                  }),
                        )),
                    const Divider()
                  ],
                );
              }),
        );
      }
    });
  }
}

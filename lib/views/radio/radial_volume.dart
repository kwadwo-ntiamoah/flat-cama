import 'package:cama_mod/models/radio_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../config/colors.dart';

class RadialVolume extends StatelessWidget {
  const RadialVolume({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioModel>(builder: (ctx, data, _) {
      return SfRadialGauge(
        title: GaugeTitle(
            text: data.isVolumeChanging == true
                ? 'Vol ${data.volumeValue.ceil().toString()} %'
                : ''),
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            startAngle: 270,
            endAngle: 270,
            showLabels: false,
            showTicks: false,
            radiusFactor: .55,
            axisLineStyle: AxisLineStyle(
                cornerStyle: CornerStyle.bothFlat,
                color: Colors.black12.withOpacity(.06),
                thickness: 5),
            pointers: <GaugePointer>[
              RangePointer(
                  value: data.volumeValue,
                  cornerStyle: CornerStyle.bothFlat,
                  width: 5,
                  sizeUnit: GaugeSizeUnit.logicalPixel,
                  color: Colors.orangeAccent,
                  gradient: const SweepGradient(
                      colors: <Color>[Color(0XFFF9D405), Color(0XFFF93505)],
                      stops: <double>[0.25, 0.75])),
              WidgetPointer(
                value: data.volumeValue,
                enableDragging: true,
                onValueChanged: (val) => data.onVolumeChange(val),
                onValueChangeEnd: (val) => data.onVolumeEnd(val),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffE7E9E8),
                        border: Border.all(color: KColors.kLightColor, width: .5),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(.2),
                              spreadRadius: .8,
                              blurRadius: .8,
                              offset: const Offset(1, 2))
                        ]),
                    padding: const EdgeInsets.all(3),
                    child: const Icon(
                      Icons.volume_up_outlined,
                      size: 18,
                      color: Colors.black45,
                    )),
              )
            ],
          )
        ],
      );
    });
  }
}

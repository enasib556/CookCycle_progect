import 'package:flutter/material.dart';

import '../utilis/color.dart';

import '../widgets/object_detection-widgets/detailsOfSuggested_widgets/DetailsOfSuggestedBody.dart';
import '../widgets/general_widgets/custom_appbar_for_objectDe.dart';


class DetailsOfSuggestedScreen extends StatelessWidget {
  const DetailsOfSuggestedScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: DetailsOfSuggestedBody(),);
  }
}

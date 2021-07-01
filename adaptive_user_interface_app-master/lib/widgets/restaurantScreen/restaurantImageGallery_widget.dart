import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantImageGalleryWidget extends StatelessWidget {
  const RestaurantImageGalleryWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
        height: 300,
        width: queryData.size.width * 0.8,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(3.0),
                height: 300,
                 child: Provider.of<AdaptiveWidgetsViewModel>(context).getImageColorFilterToggle ?
                    ColorFiltered(
                        colorFilter: AdaptiveColorFilter.getAdaptiveColorFilter(context),
                        child: Image(
                          image: AssetImage('assets/images/McDonaldsFood.png'),
                        ),
                    )
                    :
                    Image(
                      image: AssetImage('assets/images/McDonaldsFood.png'),
                    ),
              ),
            ),
            Column(children: [
              Expanded(
                flex: 1,
                child: Container(
                  //height: 140,
                  padding: const EdgeInsets.all(3.0),
                  child: Provider.of<AdaptiveWidgetsViewModel>(context).getImageColorFilterToggle ?
                    ColorFiltered(
                      colorFilter: AdaptiveColorFilter.getAdaptiveColorFilter(context),
                      child: Image(
                        image: AssetImage('assets/images/BigMac.jpeg'),
                      ),
                    )
                    :
                    Image(
                      image: AssetImage('assets/images/BigMac.jpeg'),
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  //height: 140,
                  padding: const EdgeInsets.all(3.0),
                  child: Provider.of<AdaptiveWidgetsViewModel>(context).getImageColorFilterToggle ?
                    ColorFiltered(
                      colorFilter: AdaptiveColorFilter.getAdaptiveColorFilter(context),
                        child: Image(
                          image: AssetImage('assets/images/ChickenNuggets.jpeg'),
                        ),
                    )
                    :
                    Image(
                      image: AssetImage('assets/images/ChickenNuggets.jpeg'),
                    ),
                ),
              ),
            ]),
            Column(children: [
              Expanded(
                flex: 1,
                child: Container(
                  //height: 140,
                  padding: const EdgeInsets.all(3.0),
                  child: Provider.of<AdaptiveWidgetsViewModel>(context).getImageColorFilterToggle ?
                    ColorFiltered(
                      colorFilter: AdaptiveColorFilter.getAdaptiveColorFilter(context),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/BigMac.jpeg'),
                      ),
                    )
                    :
                    Image(
                      fit: BoxFit.cover,
                      image: AssetImage('images/mcdonalds_1.png'),
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  //height: 140,
                  padding: const EdgeInsets.all(3.0),
                  child: Provider.of<AdaptiveWidgetsViewModel>(context).getImageColorFilterToggle ?
                    ColorFiltered(
                      colorFilter: AdaptiveColorFilter.getAdaptiveColorFilter(context),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('images/mcdonalds_2.png'),
                        ),
                    )
                    :
                    Image(
                      fit: BoxFit.cover,
                      image: AssetImage('images/mcdonalds_2.png'),
                    ),
                  ),
                ),

            ]),
          ],
        ));
  }
}

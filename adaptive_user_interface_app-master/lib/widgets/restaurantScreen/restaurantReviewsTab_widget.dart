import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/zomatoRateExperience_widget.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/zomatoUserReview_widget.dart';
import 'package:flutter/material.dart';

class RestaurantReviewsTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //Primary Review Column
        //All Reviews
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Expanded(
                flex: 1,
                child: AdaptiveText(
                  "Reviews",
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1.0,
                    color: Theme.of(context).textTheme.bodyText2.color,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SortReviewsDropdown(),
                    Container(
                      child: Row(children: [
                        Icon(Icons.sort, size: 16, color: Colors.grey),
                        SortReviewsDateDropdown()
                      ]),
                    )
                  ],
                ),
              ),

              //Reviews
              Expanded(flex: 8, child: ZomatoUserReview(3)),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),

              //User Review 2
              Expanded(flex: 8, child: ZomatoUserReview(3)),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),

              //User Review 3
              Expanded(flex: 8, child: ZomatoUserReview(3)),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),

              //User Review 4
              Expanded(flex: 8, child: ZomatoUserReview(3)),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),

              Spacer(flex: 20)
            ],
          ),
        ),

        Expanded(
          flex: 1,
          child: Column(
            children: [SizedBox(height: 8), ZomatoRateExperienceWidget()],
          ),
        )
      ],
    );
  }
}

class SortReviewsDropdown extends StatefulWidget {
  SortReviewsDropdown({Key key}) : super(key: key);

  @override
  _SortReviewsDropdown createState() => _SortReviewsDropdown();
}

class _SortReviewsDropdown extends State<SortReviewsDropdown> {
  String dropdownValue = 'All Reviews (43)';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 14,
      elevation: 16,
      style: TextStyle(
        fontSize: 18,
        letterSpacing: 1.0,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        "All Reviews (43)",
        "Following",
        "Popular",
        "Bloggers",
        "My Reviews",
        "Order Reviews"
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value, child: AdaptiveText(value));
      }).toList(),
    ));
  }
}

class SortReviewsDateDropdown extends StatefulWidget {
  SortReviewsDateDropdown({Key key}) : super(key: key);

  @override
  _SortReviewsDateDropdown createState() => _SortReviewsDateDropdown();
}

class _SortReviewsDateDropdown extends State<SortReviewsDateDropdown> {
  String dropdownValue = 'Newest First';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 14,
      elevation: 16,
      style: TextStyle(
        fontSize: 18,
        letterSpacing: 1.0,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        "Newest First",
        "Oldest First",
        "Highest Rated",
        "Lowest Rated"
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child:
                // Row(children:[
                //  Padding(
                //    padding: const EdgeInsets.all(8.0),
                //    child: Icon(Icons.list_alt, color: Colors.grey),
                //  ),
                AdaptiveText(value)
            //  ])
            );
      }).toList(),
    ));
  }
}

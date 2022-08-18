import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdaptiveColorFilter {
  /* CANT EXTEND COLORFILTER CLASS
    COMPILE ERROR: Superclass has no constructor named "ColorFilter.mode" 
      Super class doesn't have the constructor super.mode when it clearly does
      I think this is a flutter bug. 
  */

  //AdaptiveColorFilter.mode(Color color, BlendMode blendMode) : super.mode(color, blendMode);
  // AdaptiveColorFilter.adaptiveImage(this.context, Color color, BlendMode blendMode) : super.mode(color, blendMode);
  // AdaptiveColorFilter(this.context) : super.mode(getColour(),getBlendMode());

  BuildContext context;
  Color colour;


  static ColorFilter getAdaptiveColorFilter(context){

    bool getImageColorFilter = Provider.of<AdaptiveWidgetsViewModel>(context).getImageColorFilterToggle;
    Color imageFilterColor = Provider.of<AdaptiveWidgetsViewModel>(context).getImageFilterColor;

    if (getImageColorFilter){
      return ColorFilter.mode(imageFilterColor,BlendMode.modulate);
    }
    //dstIn produces no changes to image when used with a colour 
    else{
      return ColorFilter.mode(imageFilterColor,BlendMode.dst);
    }
 
  }  
}
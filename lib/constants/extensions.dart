import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension EmptyPadding on num{
  SizedBox get height => SizedBox(height: toDouble(),);
  SizedBox get width => SizedBox(width: toDouble(),);
}

extension Context on BuildContext {
//Customly call a provider for read method only
  //It will be helpful for us for calling the read function
  //without Consumer,ConsumerWidget or ConsumerStatefulWidget
  //Incase if you face any issue using this then please wrap your widget
  //with consumer and then call your provider

  T read<T>(ProviderBase<T> provider) {
    return ProviderScope.containerOf(this, listen: false).read(provider);
  }
}
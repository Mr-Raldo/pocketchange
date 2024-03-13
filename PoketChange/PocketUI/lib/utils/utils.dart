import 'package:PocketChn/pages/screens.dart';

void showSnackBar(BuildContext context, String content){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      ),
      );
}
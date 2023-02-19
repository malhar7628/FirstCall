import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*class ProgressDialogWidget extends StatefulWidget {
  const ProgressDialogWidget({Key? key}) : super(key: key);

  @override
  State<ProgressDialogWidget> createState() => _ProgressDialogWidgetState();
}*/

/*class _ProgressDialogWidgetState extends State<ProgressDialogWidget> {
   Subscription? subscription;
  double? progress;

  @override
  void inistate(){
    subscription = VideoCompress.compressProgress$
    .subscribe((progress)=> setState(()=>
      this.progress = progress
    ));
    super.initState();
  }

  @override
  void dispose(){
    VideoCompress.cancelCompression();
    subscription?.unsubscribe();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final value = progress == null ? progress : progress! / 1000;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Compressing video',
          style: TextStyle(
            fontSize: 20
          ),
          ),
          SizedBox(height: 24),
          LinearProgressIndicator(value: value, minHeight: 12,),
          SizedBox(height: 16),
          ElevatedButton(
              onPressed: ()=>VideoCompress.cancelCompression(),
              child: Text('Cancel'))
        ],
      ),
    );
  }
}*/

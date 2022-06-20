package com.example.flutter_native_dialog

import android.app.Dialog
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    val channel = "DIALOG"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
     val messanger = flutterEngine.dartExecutor.binaryMessenger
     MethodChannel(messanger, channel).setMethodCallHandler { call, result ->
         if(call.method == "SHOWDIALOG"){
             // TODO CODE OF SHOW DIALOG
             var dialogMessage = call.arguments.toString()

          val dialog = Dialog(activity)
             dialog.setTitle(dialogMessage)
             dialog.show()

             
         }
     }
    }


}

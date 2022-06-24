package com.example.flutter_native_dialog

import android.app.Dialog
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    val channel = "DIALOG"
    private  var methodResult: MethodChannel.Result? = null

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
             sendSuccessResultData();
             methodResult = result;

         }else{
             sendErrorResultData()
             methodResult = result;

         }
     }
    }
    private fun sendSuccessResultData() {
        var resultData = "Success Data from native result"
        methodResult?.success(resultData)

    }

    private fun sendErrorResultData(){
        var errorData = "Error Data from native result"
        methodResult?.error("0", errorData, "");
    }

}

import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      
    let channel = "DIALOG"
    let messanger = controller.binaryMessenger
      let methodChannel = FlutterMethodChannel(name: channel, binaryMessenger: messanger)
      
      methodChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          if(call.method == "SHOWDIALOG"){
              var message = call.arguments as! String;
              
              DispatchQueue.main.async {
                  let alert = UIAlertController(title: "From iOS ", message: message, preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                  
                  UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
              }
      
          }
      })
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

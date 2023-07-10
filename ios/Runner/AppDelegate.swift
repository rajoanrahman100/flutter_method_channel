import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      setMethodChannel()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    func setMethodChannel(){
        let controller:FlutterViewController=window?.rootViewController as! FlutterViewController
        let CHANNEL=FlutterMethodChannel(name: "my.channel.dialog", binaryMessenger: controller as! FlutterBinaryMessenger)
        
        CHANNEL.setMethodCallHandler{[unowned self] (methodCall,result) in
            if methodCall.method=="callDialog"{
                showDialogWithTitle(title: "Hello from IOS")
            }else{
                result("not working")
            }
        }
        
    }
    
    func showDialogWithTitle(title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}

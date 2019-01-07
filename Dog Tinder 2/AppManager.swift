import UIKit
import Firebase
import FirebaseAuth

class AppManager {
    
    static let shared = AppManager()
    
    let storyboard = UIStoryboard (name: "main", bundle: nil)
    
    var appContainer: AppContainerViewController!
    
    private init () {}
    
    func showApp(){
        
        var viewController: UIViewController
        if Auth.auth().currentUser == nil {
            viewcontroller = storyboard.instantiateViewController(withIdentifier: "LoginViewContoller")
        } else {
            
            viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
            
            appContainer.present(viewController, animated: true, completion: nil)
            }
        
        func logout() {
            try! Auth.auth().signOut()
            appContainer.presentedViewController?.dismiss(animated: true, completion: nil)
        }
        
    }
}

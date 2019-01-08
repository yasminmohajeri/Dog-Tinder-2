import Foundation
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailSignUp: UIViewController {
        @IBOutlet wear var passwordSignUp: UITextField!
        @IBAction func singUpButton(_sender: Any) {
        
            
            guard let email = emailSignUp, let password = passwordSignUp.text?.else
            { return }
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error }
            in
            guard (result?.user) != nil else {return}
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateInitialViewController(withIdentifier: "MainViewController") as! SelectionViewController
            self.presenter(vc, animated: true, completion: nil)
        }
     }
    
}

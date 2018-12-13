import UIKit
import Firebase

class AddDogViewController: UIViewController {
  

  //select an image google UIImagePickercontroller
  //send that image off to the database rather than the test image
  //fill in the data below with info from textfields.
  
  
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    let ref = Firestore.firestore().collection("dogs").document()
    
    let image = UIImage(named: "test")!
  
    upload(image: image, uid: ref.documentID) {
      let data: [String: Any] = [
        "name": "fido",
        "age": 5,
        "breed": "Test",
        "gender": "Male",
        "image": "dsafghj"
      ]
      
      ref.setData(data) { error in
        
      }
    }

  }
  
  
  func upload(image: UIImage, uid: String, compleation: @escaping () -> ()) {
    // Create a root reference
    let storageRef = Storage.storage().reference()
    
    // Create a reference to "mountains.jpg"
    let testsRef = storageRef.child(uid)
    
    let metadata = StorageMetadata()
    metadata.contentType = "image/jpeg"
    
    
    // Data in memory
    let imageData = image.jpegData(compressionQuality: 0.1)
    testsRef.putData(imageData!, metadata: metadata) { metadata, error in
        guard let _ = metadata else {
            return
        }
      compleation()
    }
  }
  
  
}


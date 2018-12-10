//
//  ViewController.swift
//  Dog Tinder 2
//
//  Created by Yasmin Mohajeri (s5129439) on 04/12/2018.
//  Copyright © 2018 Yasmin Mohajeri (s5129439). All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a root reference
        let storageRef = Storage.storage().reference()
        
        // Create a reference to "mountains.jpg"
        let testsRef = storageRef.child("test.jpg")
        
        // Create a reference to 'images/mountains.jpg'
        let testImagesRef = storageRef.child("images/tests.jpg")
        
        // While the file names are the same, the references point to different files
        testsRef.name == testImagesRef.name;  // true
        testsRef.fullPath == testImagesRef.fullPath;  //false
        
        let image = UIImage(named: "test")!
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        // Data in memory
        let imageData = image.jpegData(compressionQuality: 0)
        
     
        testImagesRef.putData(imageData!, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                print(error?.localizedDescription)
                return
            }
            
            let size = metadata.size
            // You can also access to download URL after upload.
            print(size)
            
        }
        

    }


}


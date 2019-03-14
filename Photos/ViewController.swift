//
//  ViewController.swift
//  Photos
//
//  Created by Austin Terranova on 3/13/19.
//  Copyright © 2019 Austin Terranova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagePicker.delegate = self
    }
    
    @IBAction func openCamera(_ sender: UIBarButtonItem) {
         takingPhoto()
}
    
    
    @IBAction func gallery(_ sender: UIBarButtonItem) {
        
        
    }
    
   
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        defer {
            picker.dismiss(animated: true)
        }
        
        print(info)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        defer {
            picker.dismiss(animated: true)
        }
        
        print("did cancel")
    }
    
    
    func takingPhoto() {
        if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {
            print("hi")
        } else {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
}


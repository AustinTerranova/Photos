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
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagePicker.delegate = self
    }
    
    @IBAction func openCamera(_ sender: UIBarButtonItem) {
         takingPhoto()
}
    
    
    @IBAction func gallery(_ sender: UIBarButtonItem) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("can't open photo library")
            return
        }

        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self

        present(imagePicker, animated: true)
        
        //openGallary()
        
    }
    
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func openGalleryClosure() {
        print("picked photo")
    }
    
   

    
   
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        defer {
//            picker.dismiss(animated: true)
//        }
//
//        // get the image
//        guard let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage else {
//            return
//        }
//
//        // do something with it
//        imageView.image = image
//
//        print(info)
//    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        defer {
            picker.dismiss(animated: true)
        }
        
        print("did cancel")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {


        // get the image
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("image was nil")
            return
        }

        // do something with it
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
        print("assigned image")
    }
    
    
    
    
    func takingPhoto() {
        if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {
            print("You do not have a camera right now")
        } else {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
}


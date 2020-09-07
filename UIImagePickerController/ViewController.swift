//
//  ViewController.swift
//  UIImagePickerController
//
//  Created by ivk on 04/09/2020.
//  Copyright © 2020 irr. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    let imagePickerController : UIImagePickerController = UIImagePickerController()
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        // Do any additional setup after loading the view.
    }

    @IBAction func chooseImage(_ sender: UIButton) {
        

        
        imagePickerController.delegate = (self as  UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        
        
        let actionSheet = UIAlertController(title: "Photo Gallery", message: "Choose your Image", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            self.imagePickerController.sourceType = .camera
            
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Galery", style: .default, handler: { (action:UIAlertAction) in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: false, completion: nil)
        
    }
    func imagePickerController (_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey: Any]){
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        ImageView.image = image
        
        dismiss(animated: true, completion: nil)
    }
}


//
//  ViewController.swift
//  StudentCoreData
//
//  Created by Boss on 4/17/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var txtname: UITextField!
    
    @IBOutlet weak var txtage: UITextField!
    
    
    @IBOutlet weak var txtphone: UITextField!
    
    
    var student: Student?
    var indexPath: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if student != nil {
            txtname.text = student?.name
            txtage.text = String(student!.age)
            txtphone.text = String(student!.phone)
            images.image = UIImage(data: student?.image as! Data)
            
        }
    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func Save(_ sender: Any) {
        if indexPath != nil{
           student?.name = txtname.text
            student?.age = Int64(txtage.text!)!
            student?.phone = Int64(txtphone.text!)!
            student?.image = images.image?.pngData() as NSObject?
            
        }else{
            let student = Student(context: AppDelegate.context)
            student.name = txtname.text
            student.age = Int64(txtage.text!)!
            student.phone = Int64(txtphone.text!)!
            student.image = images.image?.pngData() as NSObject?
            
        }
        
        AppDelegate.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        images.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}


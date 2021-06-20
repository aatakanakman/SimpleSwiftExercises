//
//  UploadViewController.swift
//  ParseApp
//
//  Created by Ali Atakan AKMAN on 20.06.2021.
//

import UIKit
import Parse
 
class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeTheKeyboard))
        
        view.addGestureRecognizer(keyboardRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        shareButton.isEnabled = false
        
    }
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image =  info[.originalImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil)
        
        shareButton.isEnabled = true
    }
    
    
    
    
    @IBAction func shareButton(_ sender: Any) {
        
        shareButton.isEnabled = false
        
        let post = PFObject(className: "Post")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        
        if let data = data {
            
            if PFUser.current() != nil {
                
                let parseImage = PFFileObject(name: "image.jpg", data: data)
                post["comment"] = commentTextField.text!
                post["postUser"] = PFUser.current()?.username!
                post["image"] = parseImage
                
            }
        }
        
        post.saveInBackground { (success, error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(okButton)
                
            }else {
                
                self.imageView.image = UIImage(named: "select")
                self.commentTextField.text = ""
                self.tabBarController?.selectedIndex = 0
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue : "yeniPost"), object: nil)
                
            }
        }
    }
    
    
    
    @objc func closeTheKeyboard(){
        
        view.endEditing(true)
        
    }
    
    
    @objc func selectImage(){
            
        let pickerController = UIImagePickerController()
        
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    
        
    }
    
}

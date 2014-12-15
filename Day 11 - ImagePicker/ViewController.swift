//
//  ViewController.swift
//  Day 11 - ImagePicker
//
//  Created by Annemarie Ketola on 12/11/14.
//  Copyright (c) 2014 Up Early, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imagesButtonPressed(sender: AnyObject) {
        
        var imagePicker = UIImagePickerController() // <- method we are calling to do stuff with pictures
        
        var sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum // <- tells where to get the images from
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {    // <- says what to do if you pick an image
            imagePicker.sourceType = sourceType   // <- calls that source
            imagePicker.delegate = self           // <- calls the ????
            
            //shows a screeen
            
            presentViewController(imagePicker, animated: true, completion: nil) // <- shows the screen, and pops it up with animation, doesn't require you to do anything else (the nil part)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        
        
        var image = info[UIImagePickerControllerOriginalImage] as UIImage  // <- tells what format to present the image as
        imageView.image = image // <- loads the image
        
        dismissViewControllerAnimated(true, completion: nil) // <- makes the photolibrary go away when you pick the image, with animation
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("cancel")
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}



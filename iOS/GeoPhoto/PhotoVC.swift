//
//  PhotoVC.swift
//  Map My Day
//
//  Created by Mollie on 3/13/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import Photos

class PhotoVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @IBAction func openPhotoLibrary(sender: AnyObject) {
        
        let libraryPickerController = UIImagePickerController()
        libraryPickerController.delegate = self
        libraryPickerController.sourceType = .PhotoLibrary
        
        presentViewController(libraryPickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func takePhoto(sender: AnyObject) {
        
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
//    
//    let asset: AnyObject? = nil
//    
//    if let asset = asset as? PHAsset {
//        let location = asset.location
//    }
//    
    
//    - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//    {
//    
//    PHAsset *asset;
//    if ([info[@"UIImagePickerControllerMediaType"] isEqualToString:@"public.movie"]) {
//    // Video
//    asset = [[PHAsset fetchAssetsWithALAssetURLs:@[info[@"UIImagePickerControllerReferenceURL"]] options:nil] lastObject];
//    
//    } else if ([info[@"UIImagePickerControllerMediaType"] isEqualToString:@"public.image"]) {
//    // Photo
//    PHFetchResult *result = [PHAsset fetchAssetsWithALAssetURLs:@[info[@"UIImagePickerControllerReferenceURL"]] options:nil];
//    asset = [[PHAsset fetchAssetsWithALAssetURLs:@[info[@"UIImagePickerControllerReferenceURL"]] options:nil] lastObject];
//    }
//    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        // if it's from the camera, go ahead and grab the location now
        
        // if it's from the library, grab location from data, if available
        println(info)
        var imageURL = info[UIImagePickerControllerReferenceURL] as! NSURL
        println(imageURL)
        // get PHAsset of image
//        info[UIImagePickerControllerMediaMetadata]
//        PHAsset.fetchAssetsWithLocalIdentifiers(<#identifiers: [AnyObject]!#>, options: <#PHFetchOptions!#>)
        let asset = PHAsset.fetchAssetsWithALAssetURLs([imageURL], options: nil).lastObject as! PHAsset
        
//        var inputImage = CIImage(contentsOfURL: imageURL)
//        
//        for (key, value) in inputImage.properties() {
//            println("key: \(key)")
//            println("value: \(value)")
//        }
        
        var image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        Image.sharedInstance.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func cancelImage(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
//    func resizeImage(image: UIImage, withSize size: CGSize) -> UIImage {
//        
//        // make square
//        
//        //        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
//        UIGraphicsBeginImageContext(size)
//        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return newImage
//        
//    }
    
    @IBAction func saveImage(sender: AnyObject) {
        
//        var newImage = PFObject(className: "Image") // Media or Image
//        newImage["user"] = PFUser.currentUser()
//        
//        let location = manager.location
//        
//        newImage["location"] = ["latitude":location.coordinate.latitude,
//            "longitude":location.coordinate.longitude,
//            "altitude":location.altitude,
//            "horizontalAccuracy":location.horizontalAccuracy,
//            "verticalAccuracy":location.verticalAccuracy,
//            "time":dateformatterTime(location.timestamp)]
//        newImage["time"] = NSDate()
//        
//        let width = 540 * imageView.image!.size.width / imageView.image!.size.height
//        let image = resizeImage(imageView.image!, withSize: CGSizeMake(width, 540.0))
//        
//        // turn UIImage into PFFile
//        let imageFile = PFFile(name: "image.png", data: UIImagePNGRepresentation(image))
//        newImage["image"] = imageFile
//        
//        newImage.saveInBackgroundWithBlock { (success, error) -> Void in
//            photos.append(newImage.objectId)
//            media.append(["type": "photo", "objectId": newImage.objectId])
//        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}

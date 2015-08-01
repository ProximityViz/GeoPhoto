//
//  LayoutVC.swift
//  GeoPhoto
//
//  Created by Mollie on 8/1/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

class LayoutVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var mapImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func toggleButtonTitle(button: UIButton, buttonShownText: String, hide: Bool) {
        
        if hide {
            // make button invisible but still clickable
            button.setTitle("", forState: .Normal)
            button.setTitle("", forState: .Highlighted)
        } else {
            button.setTitle(buttonShownText, forState: .Normal)
            button.setTitle(buttonShownText, forState: .Highlighted)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        titleLabel.text = Image.sharedInstance.title
        titleLabel.font = UIFont(name: Image.sharedInstance.font, size: 42.0)
        toggleButtonTitle(titleButton, buttonShownText: "Choose Title", hide: Image.sharedInstance.title != "")
        
        photoImageView.image = Image.sharedInstance.image
        toggleButtonTitle(photoButton, buttonShownText: "Choose Photo", hide: Image.sharedInstance.image != nil)
    }
    
    @IBAction func layoutButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func titleButtonTapped(sender: AnyObject) {
        
        let textStoryboard = UIStoryboard(name: "Text", bundle: nil)
        let vc = textStoryboard.instantiateInitialViewController() as! TextVC
        
        presentViewController(vc, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

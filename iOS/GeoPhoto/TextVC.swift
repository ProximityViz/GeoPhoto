//
//  TextVC.swift
//  GeoPhoto
//
//  Created by Mollie on 7/31/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

class TextVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fontPicker: UIPickerView!
    
    let pickerOptions = [ ["Avenir", "Baskerville", "Didot", "Georgia", "Helvetica Neue", "Palatino", "San Francisco", "Trebuchet", "Bradley Hand", "Chalkboard", "Marker Felt", "Noteworthy", "Papyrus", "Snell Roundhand", "Zapfino"],
    ["UltraLight", "Light", "Regular", "Medium", "Bold", "Heavy"] ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fontPicker.dataSource = self
        fontPicker.delegate = self
        
        titleField.addTarget(self, action: "titleFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        titleField.text = Image.sharedInstance.title
        if (Image.sharedInstance.title == "") {
            titleLabel.text = "Sample Title"
        } else {
            titleLabel.text = Image.sharedInstance.title
        }
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
    }
    
    func titleFieldDidChange(textField: UITextField) {
        
        titleLabel.text = titleField.text
        
    }
    
    // picker should open to selected option
    
    // MARK: Font Picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerOptions.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerOptions[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        Image.sharedInstance.changeFont(pickerOptions[component][row], component: component)
        titleLabel.font = UIFont(name: Image.sharedInstance.font, size: 20.0)
    }
    
    @IBAction func donePressed(sender: AnyObject) {
        Image.sharedInstance.title = titleField.text
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
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

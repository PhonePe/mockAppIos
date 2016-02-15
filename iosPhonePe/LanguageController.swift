//
//  LanguageController.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 15/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import UIKit


class LanguageViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    //MARK : Properties
    @IBOutlet weak var languagePicker: UIPickerView!
    
    let pickerData = ["English", "हिंदी","தமிழ்","বাঙালি","తెలుగు","ಕನ್ನಡ","मराठी","ਪੰਜਾਬੀ ਦੇ","ગુજરાતી" ]
    
    //MARK : Actions

  
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(
        pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
        ) -> Int {
            return pickerData.count
    }
    
    func pickerView(
        pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int)
    {
    
    }
    
    func pickerView(
        pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
        ) -> String? {
            return pickerData[row]
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languagePicker.delegate = self
        languagePicker.dataSource = self
        
    }
    
    
    
    
}
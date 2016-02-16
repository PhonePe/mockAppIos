//
//  ViewController.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 14/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: Properties
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var lblResponse: UILabel!
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    var bankslist = [BankData]()
    let cellIdentifier = "cell"
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bankslist.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        cell.textLabel?.text = self.bankslist[indexPath.row].bankName
        
        return cell
    }
    
   func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Banks"
    }
    
    @IBAction func getUserDetails(sender: UIButton) {
    }
    @IBAction func getDetails(sender: UIButton) {
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtUserId.delegate = self
        
        
        // MARK: UITableViewDelegate
        Alamofire.request(.GET, "http://stage.phonepe.com/banks").responseArray("banks") { (response: Response<[BankDto], NSError>) in
            
            
            let bankDtoList = response.result.value
            if let bankDtoList = bankDtoList
            {
                
                for bankDto in bankDtoList {
                    
                    self.bankslist.append(BankData(bankName:bankDto.bankName!, bankId:bankDto.bankId!, ifscPrefix: bankDto.ifscPrefix!,  isPartner:bankDto.isPartner!,isPremier: bankDto.isPremier!, priority:bankDto.priority!,banklogo:"")!)
                }
                
                self.do_table_refresh()
            }
        }

        
        self.bankslist.append(BankData(bankName:"HDFC",bankId:12, ifscPrefix:"HDFC",  isPartner:false,isPremier:false, priority:1,banklogo:"")!)
   
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        lblResponse.text = textField.text
    }
    
    
    
    @IBAction func userDetails(sender: UIButton) {
        let userId = self.txtUserId.text
        let trimmedUserId = userId!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet())
     
        
        
        Alamofire.request(.GET, "http://stage.phonepe.com/user/status/" + trimmedUserId  ).responseObject { (response: Response<UserDto, NSError>) in
            let user = response.result.value
            self.lblResponse.text = user?.name
        }
        
    }
    
    
    
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
}


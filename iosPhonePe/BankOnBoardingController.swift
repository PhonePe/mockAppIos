//
//  BankOnBoardingController.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 15/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class BankOnBoardingController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtAccount: UITextField!
    @IBOutlet weak var txtIFSC: UITextField!
    @IBOutlet weak var addBank: UIButton!
    
    let userId = 4
    let limitAccountLength = 16
    var bankslist = [BankData]()
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankslist.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       let cellIdentifier = "BankTableViewCell"
       let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BankTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let bank = bankslist[indexPath.row]
        
        cell.bankName.text = bank.bankName
        cell.bankCheckBox.isChecked = bank.isSelected!
       
        let url  = NSURL(string: bank.bankLogo!)
        let data = NSData(contentsOfURL: url!)
        
        if data !== nil
        {
            cell.bankLogo.image = UIImage(data: data!)
        }
        
        
        return cell
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        txtAccount.delegate = self
        txtIFSC.delegate = self;
        
        self.tableView.tableHeaderView = nil
     
        
        // MARK: UITableViewDelegate
        Alamofire.request(.GET, "http://stage.phonepe.com/banks?partnerOnly=true").responseArray("banks") { (response: Response<[BankDto], NSError>) in
            
            
            let bankDtoList = response.result.value
            if let bankDtoList = bankDtoList
            {
                
                for bankDto in bankDtoList {
                    
                    let banklogoString = "http://stage.phonepe.com/images/banks/" + String(bankDto.bankId!) + ".png"
                    self.bankslist.append(BankData(bankName:bankDto.bankName!, bankId:bankDto.bankId!, ifscPrefix: bankDto.ifscPrefix!,  isPartner:bankDto.isPartner!,isPremier: bankDto.isPremier!, priority:bankDto.priority!, banklogo:banklogoString)!)
                }
                
                self.do_table_refresh()
            }
        }
        
        
    }
    
    
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }
    
    
    func textField(txtAccount: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = txtAccount.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitAccountLength
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(txtAccount: UITextField) -> Bool {
        // Hide the keyboard.
        txtAccount.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    @IBAction func addBankClick(sender: UIButton) {
//        
//    let createAccountDto = CreateAccountDto(accountName:String(userId), ifsc:self.txtIFSC.text!, accountNo:Int(self.txtAccount.text!)!, nickname:"random")!
//    
//        let JSONString = Mapper().toJSON(createAccountDto)
//        
//        Alamofire.request(.POST, "http://stage.phonepe.com//user/" + String(userId) + "/account", parameters: JSONString, encoding: .JSON)
//     
//      
//    }
    
     
        


        
    

}
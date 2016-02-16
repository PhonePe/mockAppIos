//
//  AccountManagementController.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 16/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//
import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class AccountManagement: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    var accountsList = [AccountData]()
    let userId = "4"
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountsList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AccountTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! AccountTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let account = accountsList[indexPath.row]
        
        cell.accountNumber.text = account.accountNo
    
        
        let url  = NSURL(string: account.bankLogo!)
        let data = NSData(contentsOfURL: url!)
        
        if data !== nil
        {
            cell.bankLogo.image = UIImage(data: data!)
        }
        
        if account.isLinked ==  true
        {
            cell.lintUnlinkButton.setTitle("Unlink",forState: UIControlState.Normal)
        }
        else
        {
            cell.lintUnlinkButton.setTitle("Link",forState: UIControlState.Normal)
        }
        
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = nil
        tableView.tableFooterView = nil
        
        // MARK: UITableViewDelegate
        Alamofire.request(.GET, "http://stage.phonepe.com/user/"+userId + "/accounts").responseArray("accounts") { (response: Response<[AccountDto], NSError>) in
            
            
            let accountsDtoList = response.result.value
            if let accountsDtoList = accountsDtoList
            {
                
                for accountDto in accountsDtoList {
                    
                     let banklogoString = "http://stage.phonepe.com/images/banks/" + String(accountDto.bank!.bankId!) + ".png"
                    
                    //    init?(bankName:String, accountNo:Int, bankId:Int, isActive:Bool, isLinked:bool, balance:int, accountId:Int, isDefault:Bool, banklogo:String)
                    
                    self.accountsList.append(AccountData(bankName:accountDto.bank!.bankName!,accountNo: accountDto.accountNo!, bankId: accountDto.bank!.bankId!,  isActive: accountDto.isActive!, isLinked: accountDto.isLinked!, balance:accountDto.balance!, accountId:accountDto.accountId!, isDefault:accountDto.isPrimary!, banklogo: banklogoString )! )
                    
                        
                    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

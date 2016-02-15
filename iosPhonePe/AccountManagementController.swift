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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // MARK: UITableViewDelegate
        Alamofire.request(.GET, "http://stage.phonepe.com/banks?partnerOnly=true").responseArray("banks") { (response: Response<[BankDto], NSError>) in
            
            
            let bankDtoList = response.result.value
            if let bankDtoList = bankDtoList
            {
                
                for bankDto in bankDtoList {
                    
                    self.bankslist.append(BankData(bankName:bankDto.bankName!, bankId:bankDto.bankId!, ifscPrefix: bankDto.ifscPrefix!,  isPartner:bankDto.isPartner!,isPremier: bankDto.isPremier!, priority:bankDto.priority!)!)
                }
                
                self.do_table_refresh()
            }
        }
        
        
        self.bankslist.append(BankData(bankName:"HDFC",bankId:12, ifscPrefix:"HDFC",  isPartner:false,isPremier:false, priority:1)!)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
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

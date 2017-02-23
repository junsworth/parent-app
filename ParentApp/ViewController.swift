//
//  ViewController.swift
//  ParentApp
//
//  Created by Jonathan Unsworth on 2017/02/12.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import UIKit

import Alamofire
import AppOneApp
import AppOneLib
import CoreLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let namedUser = User.init(id:2, firstName: "Jonathan", lastName: "Unsworth")
        
        print("BUNDLE \(NSLocalizedString(Keyword.bundleIdentifier, comment: ""))")
        
        print("\(namedUser!.getId()) \(namedUser!.getFirstName()) \(namedUser!.getLastName())")
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request!)  // original URL request
            print(response.response!) // HTTP URL response
            print(response.data!)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)\n")
            }
        }
        
        print(AlamofireController.sharedInstance.getURLRequestWorker(url: "https://httpbin.org/get"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


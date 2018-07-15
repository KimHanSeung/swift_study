//
//  MomoDetailController.swift
//  Memo_bill
//
//  Created by user on 2018. 7. 8..
//  Copyright © 2018년 user. All rights reserved.
//

import UIKit

class MomoDetailController: UIViewController {
    @IBOutlet weak var MemoText: UITextView!
    
    var MemoData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let MemoNo = UserDefaults.standard.object(forKey: "no") as! Int

        if MemoNo == -1 {
            MemoData = (UserDefaults.standard.object(forKey: "data") as? [String])!
            MemoText.text = "...";
        }else{
            MemoData = (UserDefaults.standard.object(forKey: "data") as? [String])!
            MemoText.text = MemoData[MemoNo]
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func save(_ sender: Any) {
        let MemoNo = UserDefaults.standard.object(forKey: "no") as! Int
        
        if(MemoNo == -1){
            MemoData.insert(MemoText.text, at: 0)
            UserDefaults.standard.set(MemoData, forKey: "data")
        }else{
            MemoData.remove(at: MemoNo)
            MemoData.insert(MemoText.text, at: MemoNo)
            
            UserDefaults.standard.set(MemoData, forKey: "data")
        }
        
        print("save : ", MemoNo, MemoText.text)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

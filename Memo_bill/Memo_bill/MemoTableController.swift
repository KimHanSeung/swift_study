//
//  MemoTableController.swift
//  Memo_bill
//
//  Created by user on 2018. 7. 14..
//  Copyright © 2018년 user. All rights reserved.
//

import UIKit

class MemoTableController: UITableViewController {
    
    @IBOutlet var MemoView: UITableView!
    var MemoData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // section 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // data row.. count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MemoData = UserDefaults.standard.object(forKey: "data") as? [String] ?? [String]()
        print(MemoData.count);
        return MemoData.count
    }

    // data row.. content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        cell.textLabel?.text = MemoData[indexPath.row]
        print(" row num : ", indexPath.row , MemoData[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "no")
        print("select")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "memoDetail") as! MomoDetailController;
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func plusBtn(_ sender: Any) {
        print("plushBtn")
        UserDefaults.standard.set(-1, forKey: "no")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "memoDetail") as! MomoDetailController;
        self.present(vc, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            MemoData.remove(at: indexPath.row)
            print("delete : ", indexPath.row)
            UserDefaults.standard.set(MemoData, forKey: "data")
            MemoView.reloadData()
        } else if editingStyle == .insert {
            print("insert")
        }
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        MemoView.reloadData()
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("prepare")
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
 
}

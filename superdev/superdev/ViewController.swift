//
//  ViewController.swift
//  superdev
//
//  Created by user on 2018. 6. 24..
//  Copyright © 2018년 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var temp1 : Int = 0;
    var temp2 : Int = 0;
    var type : Int = 0;
    @IBOutlet weak var txlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnClick(_ sender: UIButton) {
        
        var input = sender.titleLabel?.text;
        if(input == "AC"){
            txlabel.text = "0";
            temp1 = 0;
            temp2 = 0;
        }else if(input == "+"){
            selet(val:1);
        }else if(input == "-"){
            selet(val:2);
        }else if(input == "x"){
            selet(val:3);
        }else if(input == "/"){
             selet(val:4);
        }else if(input == "="){
            calcul();
        }else {
            let tempNum : Int? = Int((txlabel?.text)! + (sender.titleLabel?.text)!);
            temp2 = tempNum!;
            // inputVal(val:tempNum!);
            txlabel.text = String(tempNum!);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inputVal(){
        if(temp2 != 0){
            temp1 = temp2;
            temp2 = 0;
        }
    }
    
    func calcul(){
        if(type == 1){
            temp1 = temp1 + temp2;
            txlabel.text = String(temp1);
        }else if(type == 2){
            temp1 = temp1 - temp2;
            txlabel.text = String(temp1);
        }else if(type == 3){
            temp1 = temp1 * temp2;
            txlabel.text = String(temp1);
        }else if(type == 4){
            temp1 = temp1 / temp2;
            txlabel.text = String(temp1);
        }
        
    }
    
    func selet(val:Int){
        type = val;
        temp2 = Int((txlabel?.text)!)!
        txlabel.text = "";
        inputVal();
    }

}

/* 처음 입력 1 -> 연산자 -> 입력 2 ->
*/

//
//  ViewController.swift
//  TLEmoticonManger
//
//  Created by corepress on 2019/3/8.
//  Copyright © 2019年 LuckHand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var emoticonVC = TLEmoticonViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func emoticonBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        changeBtnStatues(btn: sender)

        
    }
    
}

extension ViewController {
    
    func changeBtnStatues(btn : UIButton) -> Void {
        
        textView.resignFirstResponder()
        textView.inputView = btn.isSelected ? emoticonVC.view : nil
        textView.becomeFirstResponder()
    }
    
    
}


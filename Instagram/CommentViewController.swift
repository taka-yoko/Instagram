//
//  CommentViewController.swift
//  Instagram
//
//  Created by tyoko on 2016/10/01.
//  Copyright © 2016年 TakayoshiYokoyama. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {

    @IBOutlet weak var commentText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func handleCommentButton(sender: AnyObject) {
        if commentText.text! != "" {
            let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH)
            
            let postData = ["comment": commentText.text!]
        }
        
        
        
        
        
    }
    
    @IBAction func handleCancelButton(sender: AnyObject) {
        // 画面を閉じる
        dismissViewControllerAnimated(true, completion: nil)
    }

}

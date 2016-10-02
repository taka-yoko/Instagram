//
//  CommentViewController.swift
//  Instagram
//
//  Created by tyoko on 2016/10/01.
//  Copyright © 2016年 TakayoshiYokoyama. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CommentViewController: UIViewController {

    var postData:PostData!
    
    @IBOutlet weak var commentText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する。
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(CommentViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func handleCommentButton(sender: AnyObject) {
        if commentText.text! != "" {
            //Firebaseに保存するデータの準備
            //現在のユーザーのユニークIDを取得
            if let uid = FIRAuth.auth()?.currentUser?.uid {
                if let displayName = FIRAuth.auth()?.currentUser?.displayName {
                    let comment = ["uid": uid, "name": displayName, "comment": commentText.text!]
                    
                    postData.comments.append(comment)
                    let imageString = postData.imageString
                    let name = postData.name
                    let caption = postData.caption
                    let time = (postData.date?.timeIntervalSinceReferenceDate)! as NSTimeInterval
                    let likes = postData.likes
                    let comments = postData.comments
                    
                    //辞書を作成してFirebaseに保存する
                    let post = ["caption": caption!, "image": imageString!, "name": name!, "time": time, "likes": likes, "comments": comments]
                    
                    //print(postData.comments)
                    
                    let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH)
                    postRef.child(postData.id!).setValue(post)
                    
                }
            }
            //commentViewControllerを閉じる
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func handleCancelButton(sender: AnyObject) {
        // 画面を閉じる
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dismissKeyboard(){
        //キーボードを閉じる
        view.endEditing(true)
    }

}

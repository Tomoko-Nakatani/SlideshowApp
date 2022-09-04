//
//  ViewController.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI555 on 2022/08/30.
//

import UIKit

class ViewController: UIViewController {
        
    //画像をoutlet接続
    @IBOutlet weak var outputimage: UIImageView!
    //進むボタンのoutlet接続
    @IBOutlet weak var nextbutton: UIButton!
    //戻るボタンのoutlet接続
    @IBOutlet weak var backbutton: UIButton!
    //再生停止ボタンをoutlet接続
    @IBOutlet weak var stoprestart: UIButton!
    
    var timer: Timer!
    
    //画像を配列に入れる
    let imagenum = ["img1", "img2", "img3", "img4"]
    //変数を宣言
    var chnimgnum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //segueから遷移先のnextviewcontrollerを取得する
        let kakudaiimage = segue.destination as! kakudaiViewController
        //timerを止める
        timer.invalidate()
        timer = nil
        //遷移先のkakudaiviewcontrollerで宣言しているkakudaiimageにデータを渡す
        kakudaiimage.kakudaiview = outputimage.image
        
        
    }
    
    
    //進むボタンのイベント登録
    @IBAction func next(_ sender: Any) {
        //画像の分岐
        /*if chnimgnum == 0 {
            chnimgnum = 1
        } else if chnimgnum == 1 {
            chnimgnum = 2
        } else if chnimgnum == 2 {
            chnimgnum = 3
        } else if chnimgnum == 3 {
                chnimgnum = 0
        }*/
        chnimgnum += 1
        if chnimgnum > imagenum.count - 1 {
            chnimgnum = 0
        }
        //呼び出すoutputimage
        let name = imagenum[chnimgnum]
        outputimage.image = UIImage(named: name)
    }
    
    //戻るボタンのイベント登録
    @IBAction func back(_ sender: Any) {
        
        //画像の分岐は進むの逆
        /*if chnimgnum == 0 {
            chnimgnum = 3
        } else if chnimgnum == 1 {
            chnimgnum = 0
        } else if chnimgnum == 2 {
            chnimgnum = 1
        } else if chnimgnum == 3 {
            chnimgnum = 2
        }*/
        
        chnimgnum -= 1
        if chnimgnum < 0 {
            chnimgnum = 3
        }
     //呼び出すoutputimage
        let name = imagenum[chnimgnum]
        outputimage.image = UIImage(named: name)
        
    }
    
    //再生停止ボタンのイベント登録
    @IBAction func stoprestart(_ sender: Any) {
        //タイマーをセット
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
            
            //タイマーの表示切り替え
            stoprestart.setTitle("停止", for: .normal)
            //進む戻るボタンの無効化
            nextbutton.isEnabled = false
            backbutton.isEnabled = false
            
        } else {
            timer.invalidate()
            timer = nil
            stoprestart.setTitle("再生", for: .normal)
            //進む戻るボタンの有効化
            nextbutton.isEnabled = true
            backbutton.isEnabled = true
        }
        
    }

    @objc func update() {
        
            /*if chnimgnum == 0 {
                chnimgnum = 1
            } else if chnimgnum == 1 {
                chnimgnum = 2
            } else if chnimgnum == 2 {
                chnimgnum = 3
            } else if chnimgnum == 3 {
                    chnimgnum = 0
            }*/
        
        chnimgnum += 1
        if chnimgnum > imagenum.count - 1 {
            chnimgnum = 0
        }
                
        let name = imagenum[chnimgnum]
        outputimage.image = UIImage(named: name)
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue){
        //timerを再開させる
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
}


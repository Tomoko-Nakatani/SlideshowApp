//
//  kakudaiViewController.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI555 on 2022/09/01.
//

import UIKit

class kakudaiViewController: UIViewController {
    
    //imageviewをoutlet接続
    @IBOutlet weak var kakudaiimage: UIImageView!
    //受け渡される画像の変数
    var kakudaiview: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kakudaiimage.image = kakudaiview

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

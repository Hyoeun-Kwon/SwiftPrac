//
//  CheckIdViewController.swift
//  starbucksLogin_P
//
//  Created by HyoEun Kwon on 2021/08/05.
//

import UIKit

class CheckIdViewController: UIViewController {

    
    
    @IBOutlet weak var lblCheckId: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Next _ page ")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        lblCheckId.text = "고객님의 아이디는 \(Share.searchUserId) 입니다."
    }
}

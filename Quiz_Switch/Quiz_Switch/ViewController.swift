//
//  ViewController.swift
//  Quiz_Switch
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblZoom: UILabel!
    
    // img에 값이 없을 수도 있으므로 Optional 타입을 지정해주자!
    var imgOn: UIImage? //켜진 전구 이미지
    var imgOff: UIImage? //꺼진 전구 이미지
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지 넣는게 반복되므로 이를 변수로 받아 두기
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        
        // 켜진 전구 이미지 넣기
        imgView.image = imgOn
    }

    
    // 전구 확대 축소
    @IBAction func switchZoom(_ sender: UISwitch) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        switch sender.isOn {
        case true:
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            lblZoom.text = "전구 축소"
        default:
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            lblZoom.text = "전구 확대"
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
    }//switchZoom
    
    
    @IBAction func switchOnOff(_ sender: UISwitch) {
        
        switch sender.isOn {
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
    }// switchOnOff

}//ViewController


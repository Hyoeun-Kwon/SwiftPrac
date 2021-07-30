//
//  ViewController.swift
//  Quiz_TimerImage_p
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblImgName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    // 배열사용 (이름, 번호)
    var imgCount = 0
    var imgName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    // Timer
    var interval = 3.0
    var imgSelector: Selector = #selector(ViewController.imgChange)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // 이름 label에 적기, imageView에 이미지 넣기
//        lblImgName.text = imgName[imgCount] //0번째 이름을 적기
//        imgView.image = UIImage(named: imgName[imgCount]) //0번째 이름의 이미지를 그려 넣기
        //위의 2줄을 함수로
        displayImg(imgCount)
        
        // 시간마다 무언갈 자동으로 해준다? Timer 사용
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: imgSelector, userInfo: nil, repeats: true)
        
        
    }//viewDidLoad
    
    // 이미지 변화 함수
    @objc func imgChange(){
        imgCount += 1
        
        // 1씩 올라가면서 이름과 이미지를 찍겠지만 6번째 값이 넘어가는 순간 배열의 범위를 넘으므로 오류 생김!
        // 마지막 사진이 되었을때는 그 번호를 0 번으로 만들어줘서 무한 반복 시켜야 함
        if imgCount == imgName.count{
            imgCount = 0
        }
        

//        lblImgName.text = imgName[imgCount]
//        imgView.image  = UIImage(named: imgName[imgCount])
        //위의 2줄을 함수로
        displayImg(imgCount)
        
    }//imgChange
    
    //이미지와 이미지 이름을 찍어내는 함수
    func displayImg(_ imgCount: Int){
        lblImgName.text = imgName[imgCount]
        imgView.image  = UIImage(named: imgName[imgCount])
    }
    


}//ViewController


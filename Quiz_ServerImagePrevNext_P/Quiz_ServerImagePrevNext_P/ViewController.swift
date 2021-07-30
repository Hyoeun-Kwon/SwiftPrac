//
//  ViewController.swift
//  Quiz_ServerImagePrevNext_P
//
//  Created by HyoEun Kwon on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    //image 담을 변수 (타입: UIImage)
    var imgLists: [UIImage] = [] //data의 이름이 뭔지 모르므로!, img를 그려서 담을거임
    var networkAddress = "http://192.168.35.241"
    
    //count
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // 이미지를 그려 넣은 리스트를 만드는 함수
        appendImage() // 리스트에 이미지가 그려 넣어진게 담김
        // 초기화면: 이미지뷰에 0번째 그림 보여주기
        imgView.image = imgLists[0]
        
    }
    

    //이미지 url을 이용 서버 이미지 그려서 imgLists에 담는 함수 : data로 그림
    func appendImage(){
        //ios 는 webapps _ ROOT 안에 만든 폴더명
        for i in 1...6{ // 현재 이미지 갯수: 6
            let url = URL(string: "\(networkAddress):8080/ios/flower_0\(i).png")
            let data = try? Data(contentsOf: url!) // url을 받아서 그 Data를 가져옴! 그걸 data 변수에 넣음
            imgLists.append(UIImage(data: data!)!)
        }
        
    }//appendImage
    
  
        // 이전버튼 : 배열이 0번째때 보다 작아지면 어떻게 하느냐
    @IBAction func btnBackWard(_ sender: UIButton) {
        count -= 1 // 버튼을 누를 때마다 index가 하나씩 내려감
        if count < 0 {
            // 배열 0번째 때는 flower_01 즉 1번 그림이 나옴,
            // 배열은 0번 이하가 없음
            // 0번 이하가 되면 마지막 그림이 나와야함 마지막그림의 번호는 6번이고, 배열은 5번임
            // 즉 배열(count)를 마지막 그림의 숫자에서 -1 해주면 ok
            count = imgLists.count - 1
        }else{
            // 그런 경우가 아니라면 그림을 그려줘
            imgView.image = imgLists[count]
        }
        
        
        
    }
    
    // 다음버튼 : 배열이 그림마지막번호 6 보다 같거나 많으면 안됨! 현재 배열은 5번까지임
    @IBAction func btnForward(_ sender: UIButton) {
        count += 1 // 버튼 누를떄마다 index가 하나씩 늘어남 (다음그림!)
        if count >= imgLists.count{
            // 배열이 6으로 넘어갔으면? 다시 0번째 처음 그림으로 돌리자!
            count = 0
        }else{
            imgView.image = imgLists[count]
        }
    }
    

}//ViewController


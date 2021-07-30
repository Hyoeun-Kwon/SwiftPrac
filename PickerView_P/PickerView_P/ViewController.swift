//
//  ViewController.swift
//  PickerView_P
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var pickerImage: UIPickerView!
    
    var imageFileName: [String] = []
    var nameCount = 10 // 배열에 이미지 이름 넣기 (이미지 갯수) _ 이미지 이름 넣을때 사용
    var imageArray = [UIImage?]() // 이미지를 그려놓은 배열 미리 만들기, 기본적으로 UI 쓰는건 모두 Optional임
    var maxArrayNum = 0 // Data 몇개 만들겠다.(전체 이미지 갯수)
    var viewColumn = 1 // column 갯수 지정
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 배열에 이미지 이름 넣기!
        for i in 1...nameCount{
            imageFileName.append("w\(i).jpg")
        }

        // 배열의 크기 알려주기 (데이터 크기는 파일이름배열 크기 만큼이다.)
        maxArrayNum = imageFileName.count
        
        // 이미지 먼저 그리기
        for i in 0..<maxArrayNum{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        // 초기화면 구성 : 0번째 이름과 그림 그려 넣기
        lblImageFileName.text = "Select File: \(imageFileName[0])"
        imgView.image = UIImage(named: imageFileName[0])
        
        //viewDidLoad 에서 extension 연결 (dataSource와 delegate)
        pickerImage.dataSource = self
        pickerImage.delegate = self

    }//viewDidLoad

    //pickerView는 기본적으로 Action이 없고 Outlet만 있음 -> extension 필요 ( + delegation)
    
   
}//ViewController


//extension은 ViewContoller 아래에 작성

//pickerView의 2가지 기능 넣기 1. 컬럼갯수와 파일갯수 (갯수지정), 2. 데이터 넣기 (이름 구성), 액션
extension ViewController: UIPickerViewDataSource{
    
    //pickerView의 컬럼갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn //Int 값임
    }
    //출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }

}//DataSource

// 데이터 넣기 (이름 구성), 액션
extension ViewController: UIPickerViewDelegate{
    //func pickerView 해보면 titleForRow 있는 목록이 나옴! 그거 선택
    // pickerView에 Title 입히기
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row] // 배열로 잡은것, for문을 안돌려도 알아서 구성 해옴
    }
    
    //func pickerView 해보면 didSelectRow 있는 목록이 나옴! 그거 선택
    // pickerView에서 Image선택 했을 경우
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // pickerView 선택시의 제목과, 이미지 넣어주기
        lblImageFileName.text = imageFileName[row]
        imgView.image = imageArray[row]
    }
    
    
}

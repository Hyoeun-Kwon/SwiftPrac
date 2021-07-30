//
//  ViewController.swift
//  Quiz_NavigationLampColor
//
//  Created by HyoEun Kwon on 2021/07/23.
//

import UIKit

class ViewController: UIViewController {

    
    //imgView 연결
    @IBOutlet weak var imgView: UIImageView!
    
    //image 만들어주기
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgPink = UIImage(named: "lamp_pink.png")
    
    // 상태 변수 만들기
    var isOn = true // 처음 켜있음
    var isPink = false // 처음 꺼있음
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 첫번째 화면이므로 처음 한번만 실행됨
        // lamp가 켜있는 상태
        imgView.image = imgOn
        
    }

    //Seg를 통해 다음화면으로 정보 넘기기
    //Seg의 Destination은 -> 화살표 방향
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectViewController = segue.destination as! SelectViewController
        
        selectViewController.isOn = isOn
        selectViewController.isPink = isPink
        
        // extension 을 사용하기 위해 권한부여 (X) 아니래!
        // 뒤에 애가 내 정보를 쓸수있어.
        selectViewController.delegate = self
        
    }
    

}//ViewController

// extension 으로 프로토콜!
extension ViewController: SelectDelegate{ //ViewController가 SelectDelegate를 쓸 수 있어!
    func didImageChangeDone(_ controller: SelectViewController, isOn: Bool, isPink: Bool) {
        // interface 만들어 둔거 가져옴
        // 이곳에 실행 함수 작성
        
        // SelectViewController에서 가져온 값
        if isOn{
            self.isOn = isOn // 두번째 화면에서 준 값이 On이면 첫화면도 On 상태로 바꿔줘
            if isPink{ // On 상태일때 에서 아래의 컬러 스위치를 왼(노랑색:Off), 오(핑크:On) 따라 이미지 색상을 바꿔줘
                imgView.image = imgPink
                self.isPink = true
            }else{ // On상태에서도 아래 스위치가 Off면
                imgView.image = imgOn // imgOn이 노랑색임
                self.isPink = false
            }
        }else{ // 두번째화면의 첫스위치(On/Off) 가 Off 라면
            self.isOn = isOn
            imgView.image = imgOff // 이미지는 끈 상태로!
        }
    }
    
    
}

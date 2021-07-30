//
//  SelectViewController.swift
//  Quiz_NavigationLampColor
//
//  Created by HyoEun Kwon on 2021/07/23.
//

import UIKit

class SelectViewController: UIViewController {

   
    // 스위치 2개와 해당 글자라벨 2개 연결
    // 스위치 모양
    @IBOutlet weak var swOnOff: UISwitch!
    @IBOutlet weak var swYellowPink: UISwitch!
    // 라벨
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    
    // 앞화면에서 넘기는 값을 받을 변수
    var isOn = true
    var isPink = false
    
    // protocol
    var delegate: SelectDelegate? // optional 임
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //2번째 화면은 viewDidLoad가 매번 실행됨
        //앞에서 넘겨준 값을 받을거야
        swOnOff.isOn = isOn
        swYellowPink.isOn = isPink
        
        //넘겨받은 isOn이 켜있다면_ 옆 글씨를 On으로 바꿔줘/ 꺼있다면 Off로 바꿔줘
        if isOn{
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
        
        //넘겨 받은 isPink가 켜있으면 Pink / 꺼있으면 Yellow
        if isPink{
            lblColor.text = "Pink"
        }else{
            lblColor.text = "Yellow"
        }
        
        
    }//viewDidLoad
    
    
    // -----> 현재 두번쨰 화면에서 스위치들을 변경했을경우
    // 그 값을 다시 전 화면으로 넘겨주기 (prepare랑 반대)
    @IBAction func btnSelectOk(_ sender: UIButton) {
        // delegate 를 만들어주자! : delegate는 기본적으로 특정 프로토콜을 상속받아 해당 프로토콜에서 선언된 함수들을 override하여 사용한다.
        // delegate를 사용하기 위해 ---> interface 만들기 /  사용하기위해 전역변수 지정
        if delegate != nil{
            delegate?.didImageChangeDone(self, isOn: isOn, isPink: isPink)
        }
        
        // pop 을 통해 위에떠있는 SelectViewController를 없애주기
        navigationController?.popViewController(animated: true)
        
    }
    
   
    
    
    
    
    //-------------------------------------
    // OnOff switch를 변경했을때
    @IBAction func swOnOff(_ sender: UISwitch) {
        // sender가 값을 앎
        switch sender.isOn{//switch를 오른쪽(초록색)으로 바꿧을때
        case true:// 가 맞다면
            isOn = true // 상태를 On으로 해줘
            lblOnOff.text = "On" // 옆에 글씨도 On이라고 바꿔줘
        default:// 아니라면
            isOn = false // 상태를 Off로 해주고
            lblOnOff.text = "Off" // 옆에 글씨도 Off 라고 해줘
            swYellowPink.isEnabled = false // 그리고 아래 버튼은 수정불가로 만들어줘!

        }
    }
    
    
    // YellowPink  switch 를 변경했을때
    @IBAction func swYellowPink(_ sender: UISwitch) {
        if sender.isOn{
            isPink = true
            lblColor.text = "Pink"
        }else{
            isPink = false
            lblColor.text = "Yellow"
        }
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

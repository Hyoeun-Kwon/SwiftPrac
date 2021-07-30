//
//  ViewController.swift
//  Quiz_AlarmColorAlert_P
//
//  Created by HyoEun Kwon on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectTime: UILabel!
    
    // 비교할 현재시간과 선택시간 변수로 지정
    var currentTime = ""
    var selectTime = ""
    
    // Timer에 사용할 interval 과 selector
    let interval = 1.0
    var timeSelector: Selector = #selector(ViewController.updateTime) //selector는 해당 함수 만들어주기
    
    //상태변수
    var isAlarm = false // 처음상태: 알람이 꺼져있음
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //초기 화면 설정
        lblSelectTime.text = "시간을 선택해 주세요"
        
        // 시간당 변하는 것 : Timer 사용
       Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        
    }//viewDidLoad
    
    // picker Action
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        //sender로 선택시간 받기
        let selectDate = sender
        let formatter = DateFormatter() //instance
        formatter.locale = Locale(identifier: "ko") //locale: 지역화 _ 한국시간으로 변경
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        
        lblSelectTime.text = "\(formatter.string(from: selectDate.date))" //sender.date 값을 string -> format 변경 =====> 선택시간 라벨에 값 넣기
        // 비교 위해 선택시간 넣기
        selectTime = "\(formatter.string(from: selectDate.date))"
        
        // 상태변수
       isAlarm = false

    }
    
    //Timer 의 selector에 있는 updateTime 함수로 현재 시간 찍기
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        let formatterOfColor = DateFormatter()
        
        // 현재시간 라벨에 찍을 값
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        
        //비교할 현재시간에 넣을 값
        formatterOfColor.locale = Locale(identifier: "ko")
        formatterOfColor.dateFormat  = "yyyy-MM-dd EEE a hh:mm"
        
        // 라벨과 비교 변수에 값 넣기
        lblCurrentTime.text = "현재시간 \(formatter.string(from: date as Date))"
        currentTime = "\(formatterOfColor.string(from: date as Date))"
        
        // 상태 변수를 활용 하여 알람 띄우기
        if !isAlarm{
            // 초기 상태: 알람이 꺼져있을때
            if currentTime == selectTime {
                let alarmAlert = UIAlertController(title: "알림", message: "설정된 시간입니다!! Wake Up", preferredStyle: .alert)
                let alarmAction = UIAlertAction(title: "ok 확인", style: .default, handler: {_ in
                    // 알람이 실행됐으면 상태변수만 변경
                    self.isAlarm = true
                })//handler
                
                // controller와 action 잇기
                alarmAlert.addAction(alarmAction)
                alarmAlert.view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                alarmAlert.view.layer.cornerRadius = 10
                present(alarmAlert, animated: true, completion: nil)

            }else{
                
            }
        }//if
        
    }
    

}//ViewController


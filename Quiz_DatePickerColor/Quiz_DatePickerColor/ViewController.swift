//
//  ViewController.swift
//  Quiz_DatePickerColor
//
//  Created by HyoEun Kwon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblCurrentTimeNew: UILabel!
    @IBOutlet weak var lblSelectTime: UILabel!
    // 전역 변수 선언
    let interval = 1.0 //1초 마다
    var DateSelector: Selector = #selector(ViewController.currentTime) //changeBackColor 함수를 실행
    
    // timer 가 실행 될때 값을 셈!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblSelectTime.text = "시간을 선택해 주세요"
        lblCurrentTimeNew.text = ""
        //Timer
        // interval 마다 self 에 있는 selector를 실행할 거야
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: DateSelector, userInfo: nil, repeats: true)

    }//viewDidLload

    //datePicker를 선택했을때 선택시간 란에 선택시간 출력
    @IBAction func datePickerChange(_ sender: UIDatePicker) {

        // sender 가 여러 정보를 가지고 있음
        let selectDate = sender.date // sender에서 받은 값을 datePickerView 상수에 저장
        // DateFormatter 클래스를 가져와 인스턴스 해주기
        let formatter = DateFormatter()
        
        // formatter 를 가지고 한국 시간으로 변경 및 형태 지정
        // locale: 지역화
        formatter.locale = Locale(identifier: "ko") // 한국 시간
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" // 0000년00월00일 0요일 오전/오후 시간:분
        
        lblSelectTime.text = "\(formatter.string(from: selectDate))" // sender 내용 중 date 값을 string(string 메서드 사용하여)으로 변환하여 알려조!
        
    }//datePicker
    
    
    //배경이 변하는 함수 실행 (Timer가 실행)
    // 1. 현재 시간에 현재 시간 찍기 2. 값이 일치하면 초마다 배경 색상 변경
    @objc func currentTime(){
        // objc 타입으로 컴파일이 되므로 @objc 라고 받아옴
        // 날짜와 시간을 위한 프로그래밍을 위해서는 기본적으로 NSDate를 사용한다. NSDate는 2001년 1월 1일 자정을 기점으로 현재시간 (혹은 특정 시점)까지의 초단위로 경과한 시간을 저장하고 있는 객체이다.
       let date = NSDate() // 회사: Next Step
       let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // 초까지
        lblCurrentTime.text = "\(formatter.string(from: date as Date))" // (as Date)Swift Date로서 date(NsDate의 상수명)를 받는다. 즉 타입변경
    
        
        
        //1. 현재 시간에 현재 시간 찍기 완료 -----------
        
        //2. 현재 시간과 선택 시간이 일치하면 배경색 처리
        let formatterC = DateFormatter()
        formatterC.locale = Locale(identifier: "ko")
        formatterC.dateFormat = "yyyy-MM-dd EEE a hh:mm" //현재시간을 초빼고 쓴 값 --- 비교시 사용
        lblCurrentTimeNew.text = "\(formatterC.string(from: date as Date))"
        
        
        // 배경색 변화 시키는 함수!
        //Timer 가 실행될떄마다 이 함수도 실행이 되므로 그 실행될떄마다의 변경 값을 줄 수 있다. -> 그 변경 값을 받는 변수가 필요 -> 위 count 변수 지정
        changeBackColor(현재시간: (formatterC.string(from: date as Date)), 선택시간: lblSelectTime.text!)
    }
    
    // 뒤의 두 글자 빼기 ? : suffix(2)
    
    //배경색 바꾸는 함수
    func  changeBackColor(현재시간 curtime: String, 선택시간 seltime: String) {
        if curtime == seltime{
            switch count % 2 == 0 {
            case true:
                view.backgroundColor = UIColor.red
            default:
                view.backgroundColor = UIColor.blue
            }
            
        }else{
            view.backgroundColor = UIColor.white
        }
        
        count += 1
        
        
        
    }
    
    
    

}//ViewController


//
//  SelectDelegate.swift
//  Quiz_NavigationLampColor
//
//  Created by HyoEun Kwon on 2021/07/23.
//

//import Foundation

// 번역기 , interface _ 모양만 제공
protocol SelectDelegate {
    func didImageChangeDone( _ controller: SelectViewController, isOn: Bool, isPink: Bool)
}


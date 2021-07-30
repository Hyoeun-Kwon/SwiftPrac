//
//  main.swift
//  StringIndex
//
//  Created by HyoEun Kwon on 2021/07/22.
//

import Foundation

let strSite = "https://www.naver.com"

let result = strSite.index(strSite.startIndex, offsetBy: 7)
let result2 = strSite[...result]
print(strSite[...result]) // 처음부터 result까지의 문자열 추출
let result3 = String(result2)

print(type(of: result3))

if result3 == "https://" {
    print(true)
}else {
    print(false)
}


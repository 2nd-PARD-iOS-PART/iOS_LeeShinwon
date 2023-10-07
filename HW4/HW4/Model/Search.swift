//
//  Search.swift
//  HW3
//
//  Created by 이신원 on 2023/10/07.
//

import Foundation

struct Search{
    var image: String
    var label: String
}

extension Search{
    static var SearchData = [
        Search(image:"s1_coffee" , label:"커피프린스 1호점"),
        Search(image:"s2_pasta" , label:"파스타"),
        Search(image:"s3_secret" , label:"시크릿 가든"),
        Search(image:"s4_yumi" , label:"연애의 발견"),
        Search(image:"s5_oh" , label:"또! 오해영"),
        Search(image:"s6_1988" , label:"응답하라 1988"),
        Search(image:"s7_1994" , label:"응답하라 1994"),
        Search(image:"s8_1997" , label:"응답하라 1997"),
        Search(image:"s9_doctor" , label:"슬기로운 의사생활"),
    ]
}

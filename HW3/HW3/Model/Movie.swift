//
//  Movie.swift
//  HW3
//
//  Created by 이신원 on 2023/09/30.
//

import Foundation


struct MovieModel {
    let image : String
}

#if DEBUG

extension MovieModel{
    static var MovieModelData = [
        [
            MovieModel(image: "m1_1"),
            MovieModel(image: "m1_2"),
            MovieModel(image: "m1_3"),
            MovieModel(image: "m1_4")
        ],
        [
            MovieModel(image: "m2_1"),
            MovieModel(image: "m2_2"),
            MovieModel(image: "m2_3"),
            MovieModel(image: "m2_4")
        ],
        [
            MovieModel(image: "m3_1"),
            MovieModel(image: "m3_2"),
            MovieModel(image: "m3_3"),
            MovieModel(image: "m3_4")
        ],
        [
            MovieModel(image: "m4_1"),
            MovieModel(image: "m4_2"),
            MovieModel(image: "m4_3"),
            MovieModel(image: "m4_4")
        ],
        
    ]
}
#endif

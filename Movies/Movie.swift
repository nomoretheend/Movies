//
//  Movie.swift
//  Movies
//
//  Created by never on 3/10/2561 BE.
//  Copyright © 2561 never. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    var id: Int
    var title_en: String
    var synopsis_en: String
    var poster_ori: String
}

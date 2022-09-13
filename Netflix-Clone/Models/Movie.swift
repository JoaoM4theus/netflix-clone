//
//  Movie.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 08/09/22.
//

import Foundation

struct Movie: Decodable {
    let adult: Bool?
    let backdropPath: String?
    let genresIds: [Int]?
    let id: Int?
    let mediaType: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genresIds =  "genre_ids"
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        
        case adult
        case id
        case overview
        case popularity
        case title
        case video
    }
}

/*
 adult = 0;
 "backdrop_path" = "/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg";
 "genre_ids" =             (
     28,
     12,
     14
 );
 id = 616037;
 "media_type" = movie;
 "original_language" = en;
 "original_title" = "Thor: Love and Thunder";
 overview = "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher\U2019s vengeance and stop him before it\U2019s too late.";
 popularity = "4237.659";
 "poster_path" = "/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg";
 "release_date" = "2022-07-06";
 title = "Thor: Love and Thunder";
 video = 0;
 "vote_average" = "6.803";
 "vote_count" = 2489;
 */

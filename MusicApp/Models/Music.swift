//
//  Music.swift
//  MusicApp
//
//  Created by 오정석 on 14/12/2023.
//

import Foundation
// 실제 우리가 사용하게 될 음악(Music)모델 구조체
// (서버에서 가져온 데이터만 표시해주면 되기 때문에 일반적으로 구조체로 만듦)

struct Music: Codable {
    let songName: String?
    let artistName: String?
    let albumName: String?
    let previewUrl: String?
    let imageUrl: String?
    private let releaseDate: String?

    //네트워크에서 주는 이름을 변환하는 방법 (원시값)
    // (서버: trackName ===> songName)
    enum CodingKeys: String, CodingKey {
        case songName = "trackName"
        case artistName
        case albumName = "collectionName"
        case previewUrl
        case imageUrl = "artworkUrl100"
        case releaseDate
    }
    
    // (출시 정보에 대한 날짜를 잘 계산하기 위해서) 계산 속성으로
    // "2011-07-05T12:00:00Z" ===> "yyyy-MM-dd"
    var releaseDateString: String? {
        // 서버에서 주는 형태 (ISO규약에 따른 문자열 형태)
        guard let isoDate = ISO8601DateFormatter().date(from: releaseDate ?? "") else { return "" }
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = myFormatter.string(from: isoDate)
        return dateString
    }
}


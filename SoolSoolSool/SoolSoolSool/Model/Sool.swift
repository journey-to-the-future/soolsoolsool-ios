//
//  Sool.swift
//  SoolSoolSool
//
//  Created by tae on 2022/11/22.
//

import Foundation

struct Sool: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case soolName = "전통주명"
        case soolDegree = "도수"
        case soolSize = "규격"
        case soolSources = "주원료"
        case soolMaker = "제조사"
    }
    var id: UUID = UUID()
    let soolName: String
    let soolDegree: String
    let soolSize: String?
    let soolSources: String
    let soolMaker: String?
}

struct SoolRawJson: Codable {
    let currentCount: Int
    let data: [Sool]
    let matchCount: Int
    let page: Int
    let perPage: Int
    let totalCount: Int
}

class SoolStore: ObservableObject {
    @Published var sools: [Sool] = []
}

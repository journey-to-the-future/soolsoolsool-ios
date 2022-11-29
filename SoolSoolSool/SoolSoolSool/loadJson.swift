//
//  loadJson.swift
//  SoolSoolSool
//
//  Created by tae on 2022/11/22.
//

import Foundation

class WebService {
    func fetchData(url: String) async throws-> [Sool] {
        guard let url = URL(string: url) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let sools = try JSONDecoder().decode(SoolRawJson.self, from: data)
        return sools.data
    }
}


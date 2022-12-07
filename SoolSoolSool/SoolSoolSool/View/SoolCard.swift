//
//  SoolCard.swift
//  SoolSoolSool
//
//  Created by tae on 2022/11/29.
//

import SwiftUI

struct SoolCard: View {
    var sool: Sool
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: "https://images.vivino.com/thumbs/g8BkR_1QRESXZwMdNZdbbA_pb_x300.png")!)
                    .frame(width: 80, height: 200)
                    .offset(y: -40)
                    .padding()
                VStack {
                    Text("4.2")
                        .font(.largeTitle)
                    Text("Available online \n from 79,000")
                }
            } // 술 사진과 별점
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(sool.soolMaker ?? "")")
                        .opacity(0.5)
                    Text("\(sool.soolName)")
                        .font(.title3)
                    Text("\(sool.soolSources)")
                        .opacity(0.5)
                }
            }// 술 종류 및 술 재료
            .padding()
        } // 이미지가 포함되는 그거
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
                .opacity(1)
        )
    }
}

struct SoolCard_Previews: PreviewProvider {
    static var previews: some View {
        SoolCard(sool: Sool(soolName: "삼양주", soolDegree: "19도", soolSize: "750ml", soolSources: "쌀, 뭐시기, 뭐시기", soolMaker: "??"))
    }
}

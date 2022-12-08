//
//  ContentView.swift
//  SoolSoolSool
//
//  Created by krc on 2022/10/24.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
    @ObservedObject var soolStore = SoolStore()
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @State private var isAnimating = false
    @State private var showProgress = false
    var foreverAnimation: Animation {
        Animation.linear(duration:0.1)
            .repeatForever(autoreverses: false)
    }
    @State private var page: Int = 1
    
    private let user = GIDSignIn.sharedInstance.currentUser
    
    var webService: WebService = WebService()
    var body: some View {
        VStack {
            VStack {
                HStack {
                    // 3
                    NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text(user?.profile?.name ?? "")
                            .font(.headline)
                        
                        Text(user?.profile?.email ?? "")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding()
                Button(action: {
                    self.showProgress.toggle()
                    
                }, label: {
                    if showProgress {
                        Image("soolsoolsool")
                            .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                            .animation(self.isAnimating ? foreverAnimation : .default)
                            .onAppear { self.isAnimating = true }
                            .onDisappear { self.isAnimating = false }
                    } else {
                        Image("soolsoolsool")
                    }
                })
                .onAppear {
                    self.showProgress = true
                    Task {
                        var url = "https://api.odcloud.kr/api/15048755/v1/uddi:fec53d3a-2bef-4494-b50e-f4e566f403e0?page=\(page)&perPage=20&serviceKey=GMt2vpUCR9RRx1vj6XlA96sJew6K9xFuIpgysZi7dVu7iCK76olLJw8lxeATAk%2Bg3AqdFRQPlPtmmSxZ8B%2F5Pg%3D%3D"
                        soolStore.sools = try await webService.fetchData(url: url)
                    }
                }
                if soolStore.sools.count > 0 {
                    List {
                        ForEach(soolStore.sools) { item in
                            VStack {
                                Text("\(item.soolName)")
                            }
                        }
                    }
                }
                VStack {
                    HStack {
                        Button(action: {
                            if page > 1 {
                                page -= 1
                                Task {
                                    var url = "https://api.odcloud.kr/api/15048755/v1/uddi:fec53d3a-2bef-4494-b50e-f4e566f403e0?page=\(page)&perPage=20&serviceKey=GMt2vpUCR9RRx1vj6XlA96sJew6K9xFuIpgysZi7dVu7iCK76olLJw8lxeATAk%2Bg3AqdFRQPlPtmmSxZ8B%2F5Pg%3D%3D"
                                    soolStore.sools = try await webService.fetchData(url: url)
                                }
                            }
                        }) {
                            Text("<")
                        }
                        HStack {
                            Text("\(page-1)")
                                .opacity(0.5)
                            Text("\(page)")
                            Text("\(page+1)")
                                .opacity(0.5)
                        }
                        Button(action: {
                            page += 1
                            Task {
                                var url = "https://api.odcloud.kr/api/15048755/v1/uddi:fec53d3a-2bef-4494-b50e-f4e566f403e0?page=\(page)&perPage=20&serviceKey=GMt2vpUCR9RRx1vj6XlA96sJew6K9xFuIpgysZi7dVu7iCK76olLJw8lxeATAk%2Bg3AqdFRQPlPtmmSxZ8B%2F5Pg%3D%3D"
                                soolStore.sools = try await webService.fetchData(url: url)
                            }
                        }) {
                            Text(">")
                        }
                    }
                }
                .padding()
            }
            // 4
            Button(action: viewModel.signOut) {
              Text("Sign out")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemIndigo))
                .cornerRadius(12)
                .padding()
            }
        }
    }
}
struct NetworkImage: View {
    let url: URL?
    
    var body: some View {
        if let url = url,
           let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

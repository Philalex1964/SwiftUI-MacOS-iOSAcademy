//
//  ContentView.swift
//  iOSAcademy
//
//  Created by Aleksandar Filipov on 5/5/22.
//

import SwiftUI

struct Option: Hashable {
    let title: String
    let imageName: String
}

struct ContentView: View {
    @State private var currentOption = 0
    
    let options: [Option] = [
        .init(title: "Home", imageName: "house"),
        .init(title: "About", imageName: "info.circle"),
        .init(title: "Settings", imageName: "gear"),
        .init(title: "Social", imageName: "message")
    ]
    
    var body: some View {
        NavigationView {
            ListView(
                options: options,
                currentSelection: $currentOption
            )
            
            switch currentOption {
            case 1:
                Text("About iOS Academy View")
            default:
                MainView()
            }
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}

struct ListView: View {
    let options: [Option]
    @Binding var currentSelection: Int
    
    var body: some View {
        VStack {
            let current = options[currentSelection]
            ForEach(options, id: \.self) { option in
                HStack {
                    Image(systemName: option.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                    
                    Text(option.title)
                        .foregroundColor(current == option ? Color.blue : Color.gray)
                    
                    Spacer()
                }
            }
            .padding()
            .onTapGesture {
                if currentSelection == 1 {
                    currentSelection = 0
                } else {
                    currentSelection = 1
                }
            }
        }
        
        Spacer()
    }
}

struct MainView: View {
    let cols: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    let videoImages = Array(1...6).map { "video\($0)" }
    
    var body: some View {
        VStack {
            Image("header")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            LazyVGrid(columns: cols) {
                ForEach(videoImages, id: \.self) { imageName in
//                    VStack {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
//
//                        Text("Video title goes here")
//                            .bold()
//                    }
                }
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

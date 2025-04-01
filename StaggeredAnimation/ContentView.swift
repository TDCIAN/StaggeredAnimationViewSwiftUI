//
//  ContentView.swift
//  StaggeredAnimation
//
//  Created by 김정민 on 3/29/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showView: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    Button("Toggle View") {
                        showView.toggle()
                    }
                    
                    // You can adjust StaggeredConfig
                    let config = StaggeredConfig(
                        offset: .zero,
                        scale: 0.85,
                        scaleAnchor: .center
                    )
                    
//                    let config = StaggeredConfig(
//                        offset: .init(width: 0, height: 70),
//                        scale: 0.85,
//                        scaleAnchor: .center
//                    )
                    
                    // MARK: Sample 1 - Grid View
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        StaggeredView(config: config) {
                            if showView {
                                ForEach(1...10, id: \.self) { _ in
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.black.gradient)
                                        .frame(height: 150)
                                }
                            }
                        }
                    }
                    
                    // MARK: Sample 2 - DummyView
//                    StaggeredView(config: config) {
//                        if showView {
//                            ForEach(1...10, id: \.self) { _ in
//                                DummyView()
//                            }
//                        }
//                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(15)
                .frame(maxWidth: .infinity) /// Makes sure that the width of the view stays same even whene there is no views are present!
            }
            .navigationTitle("Staggered View")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    /// Dummy View
    @ViewBuilder
    func DummyView() -> some View {
        HStack(spacing: 10) {
            Circle()
                .frame(width: 45, height: 45)
            
            VStack(alignment: .leading, spacing: 6) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 10)
                    .padding(.trailing, 20)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 10)
                    .padding(.trailing, 140)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 100, height: 10)
            }
        }
        .foregroundStyle(.gray.opacity(0.7).gradient)
    }
}

#Preview {
    ContentView()
}

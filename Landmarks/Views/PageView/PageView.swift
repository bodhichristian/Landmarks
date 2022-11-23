//
//  PageView.swift
//  Landmarks
//
//  Created by christian on 11/23/22.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            if currentPage == pages.count - 1 {
                                currentPage -= currentPage
                            } else {
                                currentPage += 1
                            }
                        } label: {
                            Label("Next featured landmark", systemImage: "chevron.right.circle.fill")
                                .labelStyle(.iconOnly)
                                .imageScale(.large)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding()
                    }
                }
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

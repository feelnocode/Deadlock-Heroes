//
//  CacheImage.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 02/01/2025.
//

import SwiftUI

struct CacheImage: View {
    var imageLoader: ImageLoader
    
    init(url: URL?) {
        self.imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
            if let uiImage = imageLoader.uiImage{
                Image(uiImage: uiImage)
                    .resizable()
            } else{
                ProgressView()
            }
    }
}

#Preview {
    CacheImage(url: URL(string: Hero.EXAMPLE_HERO.images.heroIcon!))
}

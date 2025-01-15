//
//  ImageLoader.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 02/01/2025.
//

import Foundation
import UIKit


@Observable
@MainActor
class ImageLoader {
    var uiImage: UIImage?
    private var url: URL?
    
    private static let cache = NSCache<NSString, UIImage>()
    
    init(url: URL?){
        self.url = url
        Task{
            do{
                try await fetchImage(url)
            }catch{throw APIErrors.imageDownloadError}
        }
    }
    
    func fetchImage(_ url: URL?) async throws {
        guard let url = url else {
            throw APIErrors.invalidUrl
        }
        
        if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString){
            uiImage = cachedImage
        }else{
            let(data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw APIErrors.invalidResponseCode
            }
            guard let image = UIImage(data: data) else {
                throw APIErrors.badImage
            }
            Self.cache.setObject(image, forKey: url.absoluteString as NSString)
            uiImage = image
        }
    }
    
}

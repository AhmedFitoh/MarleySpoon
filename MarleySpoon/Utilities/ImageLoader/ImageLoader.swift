//
//  ImageLoader.swift
//  MarleySpoon
//
//  Created by AhmedFitoh on 9/1/21.
//

import UIKit


extension UIImageView {
    /// Singleton cache variable
    var imageCache: NSCache<NSString, UIImage> {
        return ImageCacheManager.shared.imageCacher
    }

    /// Check if image is cached, if not it will be loaded and cached
    /// - Parameters:
    ///   - urlString: Url string
    ///   - cellIndexPathRow: used for reusables (UITableViewCell and UICollectionViewCells)
    ///   - placeHolderImage: placeholder image
    func loadImageUsingCache(withUrl urlString: String, cellIndexPathRow: Int? = nil, placeHolderImage: UIImage? = nil) {
        guard let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: encodedUrlString ) else {
            return
        }
        self.image = placeHolderImage
        if let cellIndexPathRow = cellIndexPathRow {
            self.tag = cellIndexPathRow
        }
        // check cached image is already fetched
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        // if not, download image from url
        URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                if let cellIndexPathRow = cellIndexPathRow{
                    if self.tag != cellIndexPathRow {
                        return
                    }
                }
             
                if  let data = data,
                    let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                } else {
                    print ("Invalid image @ \(urlString)")
                }
            }
        }).resume()
    }
}



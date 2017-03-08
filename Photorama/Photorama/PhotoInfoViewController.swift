//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Erik Uecke on 3/8/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImage(for: photo) { (result) -> Void in
            switch result {
            case let .success(image):
                self.imageView.image = image
            case let.failure(error):
                print("Error fetching image for photo: \(error)")
            }
        }
    }
}

//
//  ImageViewController.swift
//  Cassini
//
//  Created by Hank Liu on 8/1/16.
//  Copyright © 2016 Hank Liu. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL: NSURL? {
        didSet {
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            if let imageData = NSData(contentsOfURL: url) {
                image = UIImage(data: imageData)
            }
        }
    }
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView?.contentSize = imageView.frame.size
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        imageURL = NSURL(string: DemoURL.Stanford)
    }
}

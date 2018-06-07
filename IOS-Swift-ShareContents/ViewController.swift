//
//  ViewController.swift
//  IOS-Swift-ShareContents
//
//  Created by Pooya on 2018-06-07.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIDocumentInteractionControllerDelegate {

    final private let stringWithLink = "Please download this app here in App Store : https://www.apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func shareTextBtn(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [stringWithLink], applicationActivities: nil)
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed {
                print("Completed!")
            } else {
                print("Canceled!!")
            }
        }
        present(activityController , animated: true) {
            print("Text Presented!")
        }
    }
    
    @IBAction func sahreImageBtn(_ sender: Any) {
        guard let image = UIImage(named: "shareMe") else {
            print("image loading error!")
            return
        }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed {
                print("Completed!")
            } else {
                print("Canceled!!")
            }
        }
        present(activityController , animated: true) {
            print("Image Presented!")
        }

    }
    
    @IBAction func sharePdfBtn(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "sharePdf", withExtension: "pdf") else {
            print("file loading error!")
            return
        }
        let controller = UIDocumentInteractionController(url: url)
        controller.delegate = self
        controller.presentPreview(animated: true)
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
}


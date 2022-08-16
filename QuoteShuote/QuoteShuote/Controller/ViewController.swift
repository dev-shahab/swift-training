//
//  ViewController.swift
//  QuoteShuote
//
//  Created by Dev on 16/08/2022.
//

import UIKit

class ViewController: UIViewController {

    var quoteManager = QuoteManager()
    var walpaperManagement = WalpaperManager()
    @IBOutlet weak var quoteText: UILabel!
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var authorText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteManager.delegate = self
        quoteManager.fetchRandomQuote()
        walpaperManagement.delegate = self
        walpaperManagement.fetchWalpaper(query: nil)
        authorText.layer.masksToBounds = true
        authorText.layer.cornerRadius = 10.0
        quoteText.layer.masksToBounds = true
        quoteText.layer.cornerRadius = 10.0
        
        //quoteText.text = quote
        // Do any additional setup after loading the view.
    }


}

extension ViewController:QuoteManagerDelegate, WalpaperManagerDelegate{
   
    func didFetchQuote(quoteData: QuoteDataModel) {
        
        DispatchQueue.main.async {
            self.quoteText.text = quoteData.quotation
            self.authorText.text = quoteData.author
        }
        
    }
    
    func didFetchImageUrl(url: String) {
        
        backgroundImg.loadFrom(URLAddress: url)
    }
}


extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}


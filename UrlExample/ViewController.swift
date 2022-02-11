//
//  ViewController.swift
//  UrlExample
//
//  Created by Ruslan Dalgatov on 11.02.2022.
//

import UIKit

class ViewController: UIViewController {

    var imageWidth = ""
    var imageHight = ""
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func getImageButtonPressed(_ sender: Any) {
        // Получить АПИ
        let API = "https://picsum.photos/" + imageWidth + "/" + imageHight
        // создать ссылку
        guard let apiUrl = URL(string: API) else {
            fatalError("some Eror")
        }
        // инициализировать сессиию
        let session = URLSession(configuration: .default)
        // создать дата таск
        let task = session.dataTask(with: apiUrl) { (data, response, error) in
            // обрабоать данные
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                // data = .jpeg
                self.imageView.image = UIImage(data: data)
            }
        }
        //  запустить
        task.resume()
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let height = imageView.bounds.height
        self.imageHight = String(format: "%.0f", Double(height))
        
        let width = imageView.bounds.width
        self.imageWidth = String(format: "%.0f", Double(width))

    }


}


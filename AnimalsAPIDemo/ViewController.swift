//
//  ViewController.swift
//  AnimalsAPIDemo
//
//  Created by Christopher Walter on 7/8/22.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        displayLabel.text = ""
      
    }
    
    @IBAction func buttonTapped(_ sender: UIButton)
    {
        
        let urlString = "https://zoo-animal-api.herokuapp.com/animals/rand"
        
        // 1. Create a URL from the String
        guard let url = URL(string: urlString) else { return }
        
        // 2. Create a URLSessionDataTask to retrieve data from the URL
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let err = error {
                print(err)
                return
            }
            guard let data = data else { return }
            print(data)
            
            // convert the data into JSON
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
            guard let jsonData = json else { return }
            print(jsonData)
            
            // pull out the important information from the JSON
            let name = jsonData["name"] as? String ?? "No Name Found"
            print(name)
            let imageURLString = jsonData["image_link"] as? String ?? "No Image link found"
            let habitat = jsonData["habitat"] as? String ?? "No Habitat Found"
            
            
            // update the UI. Must be done on the main thread. This snippet puts us back on the main thread
            DispatchQueue.main.async {
                self.displayLabel.text = "\(name)\n\nHabitat: \(habitat)"
                // make sure to install SDWebImage before we do this.
                self.myImageView.sd_setImage(with: URL(string: imageURLString))
            }
        }
        // 3. Run the URLSessionDataTask
        task.resume()
  
        
    }

}


//
//  ViewController.swift
//  AnimalsAPIDemo
//
//  Created by Christopher Walter on 7/8/22.
//

import UIKit

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
        
  
        
    }
    


}


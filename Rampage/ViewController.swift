//
//  ViewController.swift
//  Rampage
//
//  Created by lapstore on 7/27/18.
//  Copyright © 2018 AmrSobhy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var Results = [MovieDataStruct]()
    
    @IBOutlet weak var PosterImage: UIImageView!
    
    @IBOutlet weak var TitleMovie: UILabel!
    
    @IBOutlet weak var RateImage: UIImageView!
    
    @IBOutlet weak var DateMovie: UILabel!
    
    @IBOutlet weak var KindMovie: UILabel!
    
    @IBOutlet weak var OverView: UILabel!
    
    @IBOutlet weak var OverViewTextView: UITextView!
    
    @IBOutlet weak var Companies: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //getData()
        NetworkManager.getData(url: LinksURL.api_key) { (json) in
            print("7777777",json)
            if let results = json["results"] as? [[String: Any]]{
                DispatchQueue.main.async {
                    self.Results = ParseData.parseEventsArray(array: results)
                    print(self.Results[0].original_title)
                    self.TitleMovie.text = self.Results[0].original_title
                    self.DateMovie.text = self.Results[0].release_date
                    self.OverViewTextView.text = self.Results[0].overview
                    self.title = self.Results[0].original_title

                }

            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func getImage(_ url_str:String,_ imageView:UIImageView){
        
        if url_str != "" {
            let url = URL(string: url_str)
            let session = URLSession.shared
            if url != nil{
                let task = session.dataTask(with: url!, completionHandler:{(data,response,error) in
                    if data != nil{
                        let image = UIImage(data: data!)
                        if(image != nil) {
                            
                            DispatchQueue.main.async(execute:{
                                
                                imageView.image = image
                            })
                            
                        }
                        
                    }
                    
                    
                })
                task.resume()
                
            }
            
        }else{
            print("zzzz:\(url_str)")
            
        }
        
    }
}


// alamo fire sampel code - 
//
//  ViewController.swift
//  BoosLeo Interview
//
//  Created by nikhil patil on 04/07/23.
//

import UIKit
import Alamofire
import SwiftyJSON

struct DaysDataModel{
    var days = Int()
    var ingrediant = Int()
    var cost = Int()
    var id = String()
}


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var mytable: UITableView!
    
    var dayarrey = [DaysDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Dayapicall()
    }
    
    
    
    
    
    func Dayapicall() {
        let urlstring = URL(fileURLWithPath: "/Users/nikhilpatil/Downloads/Test/getDays.json")
        AF.request(urlstring).responseJSON { response in
            print(response)
            switch response.result {
            case .success:
                let jsonresult = JSON(response.data!)
                let size = jsonresult.count
                self.dayarrey.removeAll()
                
                
                
                
                if size > 0 {
                    for index in 0...size-1 {
                        var daymodel = DaysDataModel()
                        daymodel.ingrediant = jsonresult[index]["totalIngredients"].intValue
                        daymodel.id = jsonresult[index]["id"].stringValue
                        daymodel.cost = jsonresult[index]["costPerUnit"].intValue
                        daymodel.days = jsonresult[index]["day"].intValue
                        self.dayarrey.append(daymodel)
                        
                    }
                }
                
                
                self.mytable.reloadData()
                
                
                break
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayarrey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DaysCell
        let days = dayarrey[indexPath.row]
        
        cell.dayLabel.text = "\(days.days)"
        cell.ingrediantLbl.text = "Total Ingredients : \(days.ingrediant)"
        cell.costLbl.text = "Cost Per Unit : \(days.cost)"
        cell.idLbl.text = "Id : \(days.id)"
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let nextvc = self.storyboard?.instantiateViewController(withIdentifier: "DishesVC") as! DishesVC
                self.navigationController?.pushViewController(nextvc, animated: true)
        
            }
    
    
}

    extension UIView {
        
        
        func addShadow(){
            self.layer.cornerRadius = 10.0
            self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.layer.shadowRadius = 2.0
            self.layer.shadowOpacity = 0.6
        }
        
    }



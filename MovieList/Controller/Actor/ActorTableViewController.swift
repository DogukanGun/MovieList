//
//  ActorTableViewController.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/22/21.
//

import UIKit

class ActorTableViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
    let actorCellIdentifier="ActorTableViewCell"
    var actors:[Actor?]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Actors"
        tableView.delegate=self
        tableView.dataSource=self
        self.createData()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func createData(){
        let actorNames:[String]=["Robin Williams","Betty White","Denzel Washington",
        "Tom Hanks","Morgan Freeman","Lucille Ball","Harrison Ford","Sandra Bullock"]
        let countries:[String]=["USA","England","Germany","New Zelland","France","Italy"]
        let gender:[String]=["Female","Male"] 
        for i in actorNames{
            let actor=Actor(name:i,gender:gender[Int.random(in:0..<gender.count)],country:countries[Int.random(in:0..<countries.count)],imageName:i)
            actors.append(actor)
        }
    }

}

extension ActorTableViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let tableViewCell=tableView.dequeueReusableCell(withIdentifier: self.actorCellIdentifier, for: indexPath) as? ActorTableViewCell else {
            return UITableViewCell()
        }
        let currentActor = actors[indexPath.row]
        print("At index \(indexPath.row) text is \(String(describing: currentActor?.name))")
        guard let actor=currentActor else{
            return UITableViewCell()
        }
        tableViewCell.refresh(actor: actor)
        return tableViewCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc=segue.destination as! ActorInformationViewController
        guard let cell = sender as? ActorTableViewCell else {
            return
        }
        for actor in actors{
            if actor?.name==cell.actorName.text!{
                vc.actor=actor
            }
        }
        
    }
    
}

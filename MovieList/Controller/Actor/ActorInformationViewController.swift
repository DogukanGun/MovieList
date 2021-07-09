//
//  ActorInformationViewController.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/22/21.
//

import UIKit

class ActorInformationViewController: UIViewController {

    var actor:Actor?=nil
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var country: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Actor's Information"
        name.text="Name : \(actor?.name ?? "Not Found")"
        gender.text="Gender : \(actor?.gender ?? "Not Found")"
        country.text="Country : \(actor?.country ?? "Not Found")"
        actorImage.image=actor?.image

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

}

//
//  RepartoViewController.swift
//  iOsPrueba
//
//  Created by JOAQUIN DIAZ RAMIREZ on 3/10/18.
//  Copyright © 2018 JOAQUIN DIAZ RAMIREZ. All rights reserved.
//

import UIKit
import SDWebImage
class RepartoViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    internal var actors: [Actors] = []

    convenience init(actors:[Actors] ) {
        self.init()
        self.actors = actors
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupBarButtonsItems()
        // Do any additional setup after loading the view.
    }
    private func setupBarButtonsItems()
    {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPressed))
        navigationItem.setRightBarButton(addButton, animated: false)
        
    }
    
    @objc private func addPressed()
    {
        let date = Date()
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeStyle = .medium
        
        
        
        
        let actor = Actors(name: dateFormatter.string(from: date), avatarImage: "https://api.adorable.io/avatars/200/80197d80116b41c83618598cd8b7fc47.png" )
        actors.append(actor)
        
        tableView.beginUpdates()
        
        if actors.count == 1 {
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
        else {
            tableView.insertRows(at: [IndexPath(row: actors.count - 1 , section: 0)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
    private func registerCells ()
    {
        let indentifier = "ActorsTableViewCell"
        let cellNib = UINib(nibName: indentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "actorsCell")
        
        let indentifier_empty = "EmptyCellViewController"
        let cellNib_empty = UINib(nibName: indentifier_empty, bundle: nil)
        tableView.register(cellNib_empty, forCellReuseIdentifier: "emptyCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension RepartoViewController: UITableViewDelegate,UITableViewDataSource
    
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if actors.count == 0 {
         return 1
        }
        else {
        return actors.count
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if actors.count == 0 {
            return 137
        }
        else{
        return 55.0
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if actors.count == 0{
            let cell: EmptyCellViewController = (tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath) as? EmptyCellViewController)!
            cell.delegate=self
            return cell
            
        }
        else {
            let cell: ActorsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "actorsCell", for: indexPath) as? ActorsTableViewCell)!
            let actore = actors[indexPath.row]
            cell.lblName.text = actore.name
            cell.imgAvatar.sd_setImage(with: URL(string: actore.avatarImage), completed: nil)
            return cell
        }
   
    }
}

extension RepartoViewController: EmptyCellViewControllerDelegate {
    func emptyCellViewControllerDidPressBack(cell: EmptyCellViewController) {
        navigationController?.popViewController(animated: true)
}
}

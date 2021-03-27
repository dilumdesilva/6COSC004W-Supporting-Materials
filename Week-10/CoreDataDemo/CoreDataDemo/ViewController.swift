//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Dilum De Silva on 2021-03-26.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate {
    
    var teamsContainer: [NSManagedObject] = []
    
    @IBOutlet weak var teamsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Team-Dasboard"
        // Do any additional setup after loading the view.
        teamsTableView.delegate = self
        teamsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //accessing the persistent container
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //captureing handled cxt
        let handledContext = appDelegate.persistentContainer.viewContext
        
        //fetching entity as objs from handled ctx via app deligate
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Team")
        
        do {
            teamsContainer = try handledContext.fetch(fetchRequest)
        } catch let err as NSError {
            print("CTX fetch failed: \(err) --> \(err.userInfo)")
        }
    }
    
    @IBAction func recordTeam(_ sender: UIBarButtonItem) {
        prepareDataInsertingAlert()
        
    }
    
    
    private func prepareDataInsertingAlert() {
        let dataAddAlert = UIAlertController(title: "New Team Record", message: "Add your team record", preferredStyle: .alert)
        
        dataAddAlert.addTextField{ (textField1) in
            textField1.placeholder = "Enter Team Name"
        }
        dataAddAlert.addTextField{ (textField2) in
            textField2.placeholder = "Enter Team Lead"
        }
        dataAddAlert.addTextField{ (textField) in
            textField.placeholder = "Enter Player Count"
        }
        dataAddAlert.addTextField{ (textField) in
            textField.placeholder = "Last Match Won"
        }
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default)
        let recordDataAction = UIAlertAction(title: "Record Team", style: .default) {
            [unowned self] action in
            guard let teamName = dataAddAlert.textFields?.first?.text,
                  let teamLeadName = dataAddAlert.textFields?[1].text,
                  let playerCount = dataAddAlert.textFields?[2].text,
                  let lastMatchWon = dataAddAlert.textFields?.last?.text
            else {
                return
            }
            
            self.saveTeamData(with: teamName, teamLeadName, Int(playerCount) ?? 0, lastMatchWon)
            self.teamsTableView.reloadData()
        }
        
        //attaching actions
        dataAddAlert.addAction(recordDataAction)
        dataAddAlert.addAction(dismissAction)
        
        present(dataAddAlert, animated: true)
    }
    
    private func saveTeamData(with teamName: String,
                              _ teamLeadName: String,
                              _ playerCount: Int,
                              _ lastMatchWon: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let team: Team = Team(context: managedContext)
        
        team.teamName = teamName
        team.teamLeadName = teamLeadName
        team.playersCount = Int16(playerCount)
        team.lastMatchWon = lastMatchWon
        
        do {
            try managedContext.save()
            teamsContainer.append(team)
        } catch let error as NSError {
            print("Data saving error:: \(error) --> \(error.userInfo)")
        }
        
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsContainer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamsTableView.dequeueReusableCell(withIdentifier: "cell",
                                                      for: indexPath)
        
        let team = teamsContainer[indexPath.row] as! Team
        cell.textLabel?.text = team.teamName
        cell.detailTextLabel?.text = "Player Count: \(team.playersCount)"
        
        print("Team: \(team.teamName ?? "Not Found")\nLast Match: \(team.lastMatchWon ?? "Not Found")\nTeam Lead: \(team.teamLeadName ?? "Not Found")")
        print("----------------------------------\n")
        
        return cell
    }
    
    
}

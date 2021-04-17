//
//  MasterViewController.swift
//  MasterDetailDemo
//
//  Created by Dilum De Silva on 2021-04-17.
//

import UIKit

protocol PetSelectionDelegate: class {
    func petSelected(_ newPet: Pet)
}

class MasterViewController: UITableViewController {
    
    let pets = [
        Pet(name: "Jenny", owner: "Dilum", age: "2Y", type: .dog),
        Pet(name: "Kit", owner: "Methya", age: "2Y", type: .cat),
        Pet(name: "Petta", owner: "Sakina", age: "1Y", type: .parrot),
        Pet(name: "Teddy", owner: "Raneesh", age: "1Y", type: .dog),
        Pet(name: "Kebu", owner: "Dula", age: "1Y", type: .cat),
        Pet(name: "Tonny", owner: "Suleka", age: "4M", type: .parrot),
    ]
    
    weak var delegate: PetSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let pet = pets[indexPath.row]
        cell.textLabel?.text = pet.name
        cell.detailTextLabel?.text = "owner: \(pet.owner)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPet = pets[indexPath.row]
        delegate?.petSelected(selectedPet)
        
        if let detailViewController = delegate as? DetailViewController {
          splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

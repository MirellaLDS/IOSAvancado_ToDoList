//
//  ListMemberTableViewController.swift
//  MyFinalProject
//
//  Created by Halyson Ribeiro Pessoa on 12/01/2019.
//  Copyright © 2019 Halyson Ribeiro Pessoa. All rights reserved.
//

import UIKit

class ListMemberTableViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    var memberModel: Member!
    var userTypeEnum: UserTypeEnumeration!
    var autentication: AutenticationModel!
    var rowText = ""
    
    var memberList:Array<MemberModel> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        memberModel = Member()
        autentication = AutenticationModel()

        addButton.isEnabled = autentication.isAdmin(userTypeEnum)


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memberList = memberModel.getMembers()
        self.tableView.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Or to rotate and lock
        OrientationUtil.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)    
        // Don't forget to reset when view is being removed
        OrientationUtil.lockOrientation(.all)
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memberList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myIdentifier", for: indexPath) as! MemberTableViewCell
        
        cell.myMember?.text = memberList[indexPath.row].descricao

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "abrirdetalhe" {
            if let destinationVC = segue.destination as? AddMemberViewController {
                destinationVC.indexSelect = (sender as? Int)!
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("Item select: \(indexPath.row)")
        self.performSegue(withIdentifier: "abrirdetalhe", sender: indexPath.row)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
        
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if (autentication.isAdmin(userTypeEnum)) {
                memberModel.deleteMember(indexPath.row)
                self.memberList = memberModel.getMembers()
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
    

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

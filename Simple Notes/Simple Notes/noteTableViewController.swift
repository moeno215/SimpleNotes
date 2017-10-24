//
//  noteTableViewController.swift
//  Simple Notes
//
//  Created by Maulana Hasbi on 10/24/17.
//  Copyright © 2017 SMK IDN. All rights reserved.
//

import UIKit

class noteTableViewController: UITableViewController {
//declare variable task as object
    var tasks: [Task] = [] // Task ini di panggil dari entiti yg sudah dibuat sebelumnya
    
    //deklarasi context untuk persistent container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath)

        // Configure the cell...
//deklarasi dataTask sebagai Index dari Task
        let dataTask = tasks[indexPath.row]
        //mengambil data atributs name_task
        if let myDataTask = dataTask.name_task {
            //menampilkan data ke label
            cell.textLabel?.text = myDataTask
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method getDAta()
        getData()
        //memanggil method reloadData
        tableView.reloadData()
    
    }
    
    
//method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do{
            //kondisi kalau tidak error
            //maka akan request download data
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
            //kondisi apabila error fetch data
            print("Fetching Failed")
      }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       //mengecek menu swipe apabila menu editing style nya delete
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            //delete data
            (UIApplication.shared.delegate as!
            AppDelegate).saveContext()
            
            do {
                //retrieves data
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch{
                print("Fetching Failed")
            }
        }
        //load data lagi
        tableView.reloadData()
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
////
////        } else if editingStyle == .insert {
////            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



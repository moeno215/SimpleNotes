//
//  addTaskViewController.swift
//  Simple Notes
//
//  Created by Maulana Hasbi on 10/24/17.
//  Copyright © 2017 SMK IDN. All rights reserved.
//

import UIKit

class addTaskViewController: UIViewController {
    @IBOutlet weak var etNameTask: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnSaveTask(_ sender: Any) {
    //deklarasi context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //deklarasi task
        let nameTask = Task(context: context)//deklarasi nameTask sebagai konteks dari entiti
        nameTask.name_task = etNameTask.text // mendeklarasikan bahwa nameTask.name_Task itu isinya dari etNameTask.text
        
        //proses penyimpanan data ke core data
        //mengecek apakah nilai dari etTask adalah kosong
        if etNameTask.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "warning", message: "Task cannot be empty ", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            //ketika kondisi teks task nya tidak kosong
            //data disimpan di core data
            (UIApplication.shared.delegate as!
            AppDelegate).saveContext()
            
           _ = navigationController?.popViewController(animated: true)
            //mencetak kalau data berhasil ditambahkan
            print("data berhasil disimpan")
        }
    
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

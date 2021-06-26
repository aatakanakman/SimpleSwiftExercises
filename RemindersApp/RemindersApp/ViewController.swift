//
//  ViewController.swift
//  RemindersApp
//
//  Created by Ali Atakan AKMAN on 27.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var reminders = [Reminder]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addBtn(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "AddViewController") as? AddViewController else {return}
        
        vc.title = "New Reminder"
        
        vc.complation = { (title , body, date ) in
            
            DispatchQueue.main.async {
                
                self.navigationController?.popToRootViewController(animated: true)
                
                let newReminder = Reminder(title: title, body: body, date: date, id: "id_\(title)")
                
                self.reminders.append(newReminder)
                
                self.tableView.reloadData()
                
                //!! NOTITICATION
                
                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                content.body = body
                
                let targetDate = date
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month , .day, .hour , .minute, .second], from: targetDate), repeats: false)
                
                let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request) { (error) in
                    
                    if error != nil {
                        print(error?.localizedDescription ?? "Error")
                    }
                    
                }
            }
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
}


extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = reminders[indexPath.row]
        
        cell.textLabel?.text = row.title
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd, MMMM, YYYY"
        cell.detailTextLabel?.text = formatter.string(from: row.date)
        
        return cell
        
    }
}

extension ViewController {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil){(action, sourceView, complationHandler) in
            self.reminders.remove(at: indexPath.row)
            tableView.reloadData()
            
            complationHandler(true)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        let doneAction = UIContextualAction(style: .destructive, title: nil){(action, sourceView, complationHandler) in
//
//            let reminder = self.reminders[indexPath.row]
//
//
//            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {success , error in
//                if success {
//
//                   // self.scheduleTest(title: reminder.title , body: reminder.body)
//
//                }else if error != nil{
//
//                    print(error?.localizedDescription ?? "Error")
//
//                }
//            })
//
//            complationHandler(true)
//        }
//
//        doneAction.image = UIImage(systemName: "checkmark")
//        doneAction.backgroundColor = .blue
//
//        return UISwipeActionsConfiguration(actions: [doneAction])
//
//    }
    
//    func scheduleTest(title : String , body : String ) {
//
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.sound = .default
//        content.body = body
//
//        let targetDate = Date().addingTimeInterval(10)
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month , .day, .hour , .minute, .second], from: targetDate), repeats: false)
//
//        let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
//
//        UNUserNotificationCenter.current().add(request) { (error) in
//
//            if error != nil {
//                print(error?.localizedDescription ?? "Error")
//            }
//
//        }
//
//
//    }
//}


struct Reminder {
    var title : String
    var body : String
    var date : Date
    let id : String
}

}

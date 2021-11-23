//
//  ContactSceneViewController.swift
//  ChatApp
//


import UIKit
import CoreData

final class ContactSceneViewController: GeneralController {
  
    @IBOutlet weak var contactTable: UITableView!
    
    var viewContext: NSManagedObjectContext!
    var router: ContactSceneRouting!
    var user: User!
    lazy var userFetchResultController:NSFetchedResultsController<User>? = {
        let request = User.sortedFetchRequest
        request.sortDescriptors = User.defaultSortDescriptors
        request.returnsObjectsAsFaults = false
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }()

    lazy var dataSource: TableDataSource<User,ContactSceneViewController>? = {
        guard let cv = self.contactTable else { fatalError("must have table view") }
        guard let frc = self.userFetchResultController else{ return nil}
        let dt = TableDataSource(tableView: self.contactTable, cellIdentifier: CellIdentifier.CommonCellIdentfier.rawValue,header:"", fetchedResultsController: frc, delegate: self)
        return dt
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactTable.dataSource = self.dataSource
        self.contactTable.delegate = self
    }
    
    @objc override func logoutTapped(_ sender: Any) {
        self.router.popToRootController()
    }
    
    @objc override func addUserTapped(_ sender: Any) {
        self.router.showAddUserPage()
    }
}

//MARK:- TableDataSourceDelegate
extension ContactSceneViewController: TableDataSourceDelegate {
    func configure(_ cell: CommonCell, for object: User, and indexPath :IndexPath){
        cell.configure(object)
    }
}

//MARK:- UITableViewDelegate
extension ContactSceneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedUser = self.dataSource?.objectAtIndexPath(indexPath){
            self.router.startChat(from: self.user, with: selectedUser)
        }
    }
}

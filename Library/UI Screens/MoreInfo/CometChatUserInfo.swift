
//  CometChatUserInfo.swift
//  CometChatUIKit
//  Created by Pushpsen Airekar on 20/09/19.
//  Copyright ©  2019 CometChat Inc. All rights reserved.

// MARK: - Importing Frameworks.

import UIKit
import CometChatPro

/*  ----------------------------------------------------------------------------------------- */

public class CometChatUserInfo: UIViewController {
    
    // MARK: - Declaration of Variables
    
    var tableView: UITableView! = nil
    var safeArea: UILayoutGuide!
    var preferances:[Int] = [Int]()
    var others:[Int] = [Int]()
    
    static let VIEW_PROFILE_CELL = 0
    static let PRIVACY_AND_SECURITY_CELL = 1
    static let NOTIFICATION_CELL = 2
    static let CHAT_CELL = 3
    static let HELP_CELL = 4
    static let REPORT_CELL = 5
    
      // MARK: - View controller lifecycle methods
    
    override public func loadView() {
        super.loadView()
        UIFont.loadAllFonts(bundleIdentifierString: Bundle.main.bundleIdentifier ?? "")
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        self.setupTableView()
        self.setupNavigationBar()
        self.setupItems()
    }
    
     // MARK: - Public instance methods
    
    
    /**
    This method specifies the navigation bar title for CometChatUserInfo.
    - Parameters:
    - title: This takes the String to set title for CometChatUserInfo.
    - mode: This specifies the TitleMode such as :
    * .automatic : Automatically use the large out-of-line title based on the state of the previous item in the navigation bar.
    *  .never: Never use a larger title when this item is topmost.
    * .always: Always use a larger title when this item is topmost.
    - Author: CometChat Team
    - Copyright:  ©  2019 CometChat Inc.
    */
    @objc public func set(title : String, mode: UINavigationItem.LargeTitleDisplayMode){
          if navigationController != nil{
              navigationItem.title = NSLocalizedString(title, comment: "")
              navigationItem.largeTitleDisplayMode = mode
              switch mode {
              case .automatic:
                  navigationController?.navigationBar.prefersLargeTitles = true
              case .always:
                  navigationController?.navigationBar.prefersLargeTitles = true
              case .never:
                  navigationController?.navigationBar.prefersLargeTitles = false
              @unknown default:break }
          }
      }
    
     // MARK: - Private instance methods
    
    /**
         This method sets the list of items needs to be display in CometChatUserInfo.
         - Author: CometChat Team
         - Copyright:  ©  2019 CometChat Inc.
         */
    private func setupItems(){
        
        preferances = [CometChatUserInfo.NOTIFICATION_CELL, CometChatUserInfo.PRIVACY_AND_SECURITY_CELL,CometChatUserInfo.CHAT_CELL]
        others = [CometChatUserInfo.HELP_CELL,CometChatUserInfo.REPORT_CELL]
        
    }
    
    /**
    This method setup the tableview to load CometChatUserInfo.
    - Author: CometChat Team
    - Copyright:  ©  2019 CometChat Inc.
    */
    private func setupTableView() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {}
        tableView = UITableView()
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.safeArea.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.registerCells()
    }
    
    /**
      This method register the cells for CometChatUserInfo.
      - Author: CometChat Team
      - Copyright:  ©  2019 CometChat Inc.
      */
      private func registerCells(){
          let CometChatUserView  = UINib.init(nibName: "CometChatUserView", bundle: nil)
                 self.tableView.register(CometChatUserView, forCellReuseIdentifier: "userView")
                 
                 let CometChatSettingsView  = UINib.init(nibName: "CometChatSettingsView", bundle: nil)
                 self.tableView.register(CometChatSettingsView, forCellReuseIdentifier: "cometChatSettingsView")
      }
      
    /**
           This method setup navigationBar for CometChatUserInfo viewController.
           - Author: CometChat Team
           - Copyright:  ©  2019 CometChat Inc.
           */
    private func setupNavigationBar(){
        if navigationController != nil{
            // NavigationBar Appearance
            if #available(iOS 13.0, *) {
                let navBarAppearance = UINavigationBarAppearance()
                navBarAppearance.configureWithOpaqueBackground()
                navBarAppearance.titleTextAttributes = [.font: UIFont (name: "SFProDisplay-Regular", size: 20) as Any]
                navBarAppearance.largeTitleTextAttributes = [.font: UIFont(name: "SFProDisplay-Bold", size: 35) as Any]
                navBarAppearance.shadowColor = .clear
                navigationController?.navigationBar.standardAppearance = navBarAppearance
                navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
                self.navigationController?.navigationBar.isTranslucent = true
            }
        }
    }
}

/*  ----------------------------------------------------------------------------------------- */

 // MARK: - Table view Methods

extension CometChatUserInfo: UITableViewDelegate , UITableViewDataSource {
    
    /// This method specifies the number of sections to display list of items.
    /// - Parameter tableView: An object representing the table view requesting this information.
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    /// This method specifies height for section in CometChatUserInfo
      /// - Parameters:
      ///   - tableView: The table-view object requesting this information.
      ///   - section: An index number identifying a section of tableView .
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0
        }else{
            return 25
        }
    }
    
    /// This method specifies the view for header  in CometChatUserInfo
          /// - Parameters:
          ///   - tableView: The table-view object requesting this information.
          ///   - section: An index number identifying a section of tableView .
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 25))
        let sectionTitle = UILabel(frame: CGRect(x: 10, y: 2, width: view.frame.size.width, height: 20))
        if section == 0 {
            sectionTitle.text =  ""
        }else if section == 1{
            sectionTitle.text =  "PREFERENCES"
        }else if section == 2{
            sectionTitle.text =  "OTHERS"
        }
        sectionTitle.font = UIFont(name: "SFProDisplay-Medium", size: 13)
        if #available(iOS 13.0, *) {
            sectionTitle.textColor = .lightGray
            returnedView.backgroundColor = .systemBackground
        } else {}
        returnedView.addSubview(sectionTitle)
        return returnedView
    }
    
    /// This method specifiesnumber of rows in CometChatUserInfo
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information.
    ///   - section: An index number identifying a section of tableView .
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if  section == 0 {
            return 1
        }else if section == 1{
            return preferances.count
        }else if section == 2 {
            return others.count
        }else{
            return 0
        }
    }
    
    /// This method specifies the view for user  in CometChatUserInfo
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information.
    ///   - section: An index number identifying a section of tableView .
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  indexPath.section == 0 {
            return 140
        }else if indexPath.section == 1{
            return 60
        }else if indexPath.section == 2 {
            return 60
        }else{
            return 0
        }
    }
    
    /// This method specifies the view for user  in CometChatUserInfo
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information.
    ///   - section: An index number identifying a section of tableView .
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell()
        if indexPath.section == 0 && indexPath.row == 0 {
            let userCell = tableView.dequeueReusableCell(withIdentifier: "userView", for: indexPath) as! CometChatUserView
            userCell.avatarWidth.constant = 80
            userCell.avatarHeight.constant = 80
            userCell.userAvatar.cornerRadius = 40
            userCell.userName.font =  UIFont(name: "SFProDisplay-Bold", size: 22)
            userCell.userStatus.font =  UIFont(name: "SFProDisplay-Regular", size: 15)
            userCell.user = CometChat.getLoggedInUser()
            userCell.userStatus.isHidden = false
            userCell.userStatus.text = "Online"
            userCell.separatorInset = UIEdgeInsets(top: 0, left: tableView.frame.size.width, bottom: 0, right: 0)
            return userCell
            
        }else if indexPath.section == 1{
            
            let settingsCell = tableView.dequeueReusableCell(withIdentifier: "cometChatSettingsView", for: indexPath) as! CometChatSettingsView
            
            switch preferances[indexPath.row] {
            case CometChatUserInfo.NOTIFICATION_CELL:
                settingsCell.settingsName.text = "Notifications"
                settingsCell.settingsIcon.image = #imageLiteral(resourceName: "􀋚")
                return settingsCell
                
            case CometChatUserInfo.PRIVACY_AND_SECURITY_CELL:
                settingsCell.settingsName.text = "Privacy & Security"
                settingsCell.settingsIcon.image = #imageLiteral(resourceName: "􀉼")
                return settingsCell
            case CometChatUserInfo.CHAT_CELL:
                settingsCell.settingsName.text = "Chats"
                settingsCell.settingsIcon.image = #imageLiteral(resourceName: "􀌧")
                
                return settingsCell
            default:
                break
            }
        }else if indexPath.section == 2{
            
            let settingsCell = tableView.dequeueReusableCell(withIdentifier: "cometChatSettingsView", for: indexPath) as! CometChatSettingsView
            switch others[indexPath.row] {
            case CometChatUserInfo.HELP_CELL:
                settingsCell.settingsName.text = "Help"
                settingsCell.settingsIcon.image = #imageLiteral(resourceName: "􀁝")
                return settingsCell
            case CometChatUserInfo.REPORT_CELL:
                settingsCell.settingsName.text = "Report a Problem"
                settingsCell.settingsIcon.image = #imageLiteral(resourceName: "􀇿")
                return settingsCell
            default:
                break
            }
        }
        return cell
    }
    
    /// This method triggers when particular cell is clicked by the user .
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information.
    ///   - indexPath: specifies current index for TableViewCell.
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1{
            switch preferances[indexPath.row] {
            case CometChatUserInfo.NOTIFICATION_CELL:
                print("didPressed: Notifications")
            case CometChatUserInfo.PRIVACY_AND_SECURITY_CELL:
                let privacyAndSeciruty = CometChatPrivacyAndSecurity()
                navigationController?.pushViewController(privacyAndSeciruty, animated: true)
            case CometChatUserInfo.CHAT_CELL:
                print("didPressed: Chats")
            default: break }
        }else if indexPath.section == 2{
            switch others[indexPath.row] {
            case CometChatUserInfo.HELP_CELL:
                print("didPressed: Help")
            case CometChatUserInfo.REPORT_CELL:
                print("didPressed: Report a Problem")
            default:break }
        }
        
    }
}


/*  ----------------------------------------------------------------------------------------- */

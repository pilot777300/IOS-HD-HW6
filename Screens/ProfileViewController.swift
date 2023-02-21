//
//  ProfileViewController.swift
//  NavigTest
//
//  Created by Mac on 08.07.2022.
//

import UIKit
import StorageService
import iOSIntPackage


class ProfileViewController: UIViewController {
   
    var coordinator: ProfileFlow?
    
    lazy var topView: ProfileHeaderView = {
        let tv = ProfileHeaderView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var tableView = UITableView(frame: .zero, style: .grouped)
     
    public var postData = [Post]()
   
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        user.fullName = "Fake account"
        user.status = "Fake status"
        user.avatar = UIImage(named: "arrow.png") ?? UIImage(systemName: "person")!
        
        #else
        user.fullName = "Изобретатель"
        user.status = "Отдыхаю"
        user.avatar = UIImage(named: "Avatarka1") ?? UIImage(systemName: "person")!
        #endif
        
        let postauthor = "Типичный инженер"
        let postText = "Посмотри какая мощь, какая красота и грация!"
        let postImage = "A330-300"
        let likes = 500
        let views = 20
        let post = Post(author: postauthor, description: postText, image: postImage, lokes: likes, views: views)
        postData.append(post)
        
        
        let postauthor2 = "Настоящий Роботостроитель"
        let postText2 = "Зацените мое новое детище"
        let postImage2 = "Boston"
        let likes2 = 520
        let views2 = 34
        let post2 = Post(author: postauthor2, description: postText2, image: postImage2, lokes: likes2, views: views2)
        postData.append(post2)
        
        let postauthor3 = "Ничегонеделатель"
        let postText3 = "Хочу спать и есть"
        let postImage3 = "fox"
        let likes3 = 35
        let views3 = 27
        let post3 = Post(author: postauthor3, description: postText3, image: postImage3, lokes: likes3, views: views3)
        postData.append(post3)
        
        setTableView()
        setConstraints()
    }

        func setTableView() {
            tableView.frame = self.view.frame
            tableView.delegate = self
            tableView.dataSource = self
            self.view.addSubview(tableView)
            tableView.separatorColor = UIColor.black
            tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
            tableView.backgroundColor = .systemGray5
            tableView.register(Postview.self, forCellReuseIdentifier: "Cell")
            tableView.translatesAutoresizingMaskIntoConstraints = false
        }
        func setConstraints() {
            let safeArea = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([

               tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
               tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
               tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
            
            ])
        }
    }
    
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Postview
        else {fatalError()}
        
        let thePost = postData[indexPath.row]
        cell.views.text = "Views:\(thePost.views ?? 0)"
        cell.likes.text = "Likes:\(thePost.lokes ?? 0)"
        cell.postAuthor.text = thePost.author
        cell.postTxt.text = thePost.description
        cell.postImage.image = UIImage(named: "\(thePost.image ?? "No Data")")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray5
        view.status.text = user.fullName
        view.profileView.image = user.avatar
        view.newStatus.text = user.status
        let q = PhotosTableViewCell()
        let editButton = UIButton(frame: CGRect(x:0, y:190, width:400, height:150))
        editButton.addTarget(self, action: #selector(showGallery), for: UIControl.Event.touchUpInside)
        view.addSubview(q)
        view.addSubview(editButton)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return 320
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    @objc func showGallery(sender: UIButton) {
        coordinator?.openPhotosViewController()
        
    }
}

    


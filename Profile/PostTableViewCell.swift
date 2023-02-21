

//import UIKit
//import StorageService
//
//class PostTableViewCell: UITableViewCell {
//
//
//
//    lazy var backView: UILabel = {
//        let authorlbl = UILabel()
//        authorlbl.translatesAutoresizingMaskIntoConstraints = false
//        authorlbl.backgroundColor = .white
//      return authorlbl
//    }()
//
//     lazy var postAuthor: UILabel = {
//       let postaut = UILabel()
//        let font: UIFont = UIFont.boldSystemFont(ofSize: 20)
//        postaut.translatesAutoresizingMaskIntoConstraints = false
//        postaut.font = font
//        postaut.numberOfLines = 2
//        postaut.textColor = .black
//        postaut.backgroundColor = .white
//        return postaut
//    }()
//
//     lazy var postTxt: UILabel = {
//        let ptxt = UILabel()
//        let font: UIFont = UIFont.systemFont(ofSize: 14)
//        ptxt.translatesAutoresizingMaskIntoConstraints = false
//        ptxt.font = font
//        ptxt.numberOfLines = 0
//        ptxt.textColor = .systemGray
//        ptxt.backgroundColor = .white
//        return ptxt
//    }()
//
//     lazy var postImage: UIImageView = {
//        let postImg = UIImageView()
//        postImg.translatesAutoresizingMaskIntoConstraints = false
//        postImg.contentMode = .scaleAspectFit
//        postImg.clipsToBounds = true
//        postImg.backgroundColor = .black
//        return postImg
//    }()
//
//      lazy var views: UILabel = {
//       let lbl = UILabel()
//        let font: UIFont = UIFont.systemFont(ofSize: 16)
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.font = font
//        lbl.textColor = .black
//        lbl.backgroundColor = .white
//        return lbl
//    }()
//
//     lazy var likes: UILabel = {
//       let like = UILabel()
//        let font: UIFont = UIFont.systemFont(ofSize: 16)
//        like.translatesAutoresizingMaskIntoConstraints = false
//        like.font = font
//        like.textColor = .black
//        like.backgroundColor = .white
//        return like
//    }()
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//    override func layoutSubviews() {
//        contentView.backgroundColor = .clear
//        backgroundColor = .clear
//        backView.clipsToBounds = true
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        addSubview(backView)
//        backView.addSubview(postAuthor)
//        backView.addSubview(postTxt)
//        backView.addSubview(postImage)
//        backView.addSubview(views)
//        backView.addSubview(likes)
//        cellConstraints()
//    }
//
//    func cellConstraints() {
//        let safeArea = self.safeAreaLayoutGuide
//        NSLayoutConstraint.activate([
//
//            backView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
//            backView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
//            backView.topAnchor.constraint(equalTo: safeArea.topAnchor),
//            backView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
//            backView.heightAnchor.constraint(equalTo: safeArea.heightAnchor),
//
//            postAuthor.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
//            postAuthor.leftAnchor.constraint(equalTo: backView.leftAnchor,constant: 15),
//            postAuthor.widthAnchor.constraint(equalTo: backView.widthAnchor, constant: -25),
//            postAuthor.heightAnchor.constraint(equalToConstant: 20),
//
//            postImage.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: 12),
//            postImage.leftAnchor.constraint(equalTo: backView.leftAnchor),
//            postImage.rightAnchor.constraint(equalTo: backView.rightAnchor),
//            postImage.heightAnchor.constraint(equalToConstant: 170),
//
//            postTxt.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 5),
//            postTxt.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
//            postTxt.rightAnchor.constraint(equalTo: backView.rightAnchor),
//            postTxt.bottomAnchor.constraint(equalTo: likes.topAnchor, constant: -7),
//
//            likes.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
//            likes.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
//            likes.widthAnchor.constraint(equalToConstant: 80),
//            likes.heightAnchor.constraint(equalToConstant: 20),
//
//            views.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
//            views.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16),
//            views.widthAnchor.constraint(equalToConstant: 90),
//            views.heightAnchor.constraint(equalToConstant: 20)
//
//        ])
//
//    }
//}

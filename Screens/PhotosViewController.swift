//
//  PhotosViewController.swift
//  NavigTest
//
//  Created by Mac on 15.09.2022.
//

import UIKit
import iOSIntPackage



class PhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    var coordinator: PhotosCoordinator?
    
  
    let imageProccesor = ImageProcessor()
    
    let startDate = Date()
   var cgImage = [CGImage?]()
    
    
    private lazy var scroll: UIScrollView = {
        let scr = UIScrollView(frame: .zero)
        scr.backgroundColor = .systemGray5
        scr.frame = self.view.bounds
        scr.contentSize = cv.bounds.size
        scr.showsVerticalScrollIndicator = true
        scr.isScrollEnabled = true
        scr.translatesAutoresizingMaskIntoConstraints = false
        return scr
    }()
  
    
   private lazy var cv: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let width = UIScreen.main.bounds.width / 5
        flowLayout.itemSize = CGSize(width: width, height: 80)
        flowLayout.minimumLineSpacing = 7
        flowLayout.sectionInset = UIEdgeInsets(top: 25, left: 12, bottom: 12, right: 12)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "HeaderCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.systemGray5
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Photos"
        view.addSubview(scroll)
        scroll.addSubview(cv)
        setConstraints()
        imageProccesor.processImagesOnThread(sourceImages: picGallery, filter: .monochrome(color: .black, intensity: 1.8), qos: .userInitiated, completion: {[weak self] images in  picGallery = images
                                                                                .compactMap {$0}
                                                                                .map { UIImage(cgImage: $0) }
                                                                                    DispatchQueue.main.async {
                                                                                        self?.cv.reloadData()
                                                                                            }
        })
        print("Process time:  \(Date().timeIntervalSince(startDate)) seconds")
       
    }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
                    {
                return picGallery.count
            }
    
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
                    {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath)  as! PhotosCollectionViewCell
               cell.backgroundColor = UIColor.green
                
                        let pic = picGallery[indexPath.row]
                        cell.image.image = pic
              collectionView.reloadData()
               return cell
            }
    
    

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
                {
           return CGSize(width: 100, height: 100)
            }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
                {
           return UIEdgeInsets(top: 25, left: 25, bottom: 5, right: 5)
            }

        func setConstraints() {
            let safeArea = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
            
        scroll.topAnchor.constraint(equalTo: safeArea.topAnchor),
        scroll.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        scroll.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
        scroll.heightAnchor.constraint(equalTo: safeArea.heightAnchor),
            
        cv.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 8),
        cv.leftAnchor.constraint(equalTo: scroll.leftAnchor, constant: 8),
        cv.widthAnchor.constraint(equalTo: scroll.widthAnchor, constant: 8),
        cv.heightAnchor.constraint(equalTo: scroll.heightAnchor)
        
            ])
        }
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         navigationController?.navigationBar.isHidden = true
        }
    
    }

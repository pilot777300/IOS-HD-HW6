

import UIKit
import RealmSwift


class LogInViewController: UIViewController {
    
    var coordinator: StartFlow?
    
     private lazy var loginButton: CustomButton = {
         let button = CustomButton(buttonTitle: "Войти" , buttonColor: .blue) { [self] in
            loginButtonPressed()
        }
       return button
    }()
    

    private lazy var logo = UIImageView()
  lazy var email = UITextField()
  lazy var password = UITextField()
    
    lazy var registerButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Регистрация", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return btn
    }()
 
    
    var loginDelegate: LoginViewControllerDelegate = LoginInspector()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let allData = realm.objects(Authorisation.self)
//        print(realm.configuration.fileURL)
        
     
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
       
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
        logo.backgroundColor = .white
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
        view.addSubview(registerButton)
        
        email.layer.borderWidth = 0.5
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.placeholder = "e-mail"
        email.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        email.backgroundColor = .systemGray6
        email.font = UIFont.systemFont(ofSize: 15)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.clipsToBounds = true
        email.layer.cornerRadius = 10
        email.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        email.keyboardType = UIKeyboardType.default
        email.clearButtonMode = UITextField.ViewMode.whileEditing
        email.returnKeyType = UIReturnKeyType.done
        email.resignFirstResponder()
        self.view.addSubview(email)
        
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        password.placeholder = "Password"
        password.font = UIFont.systemFont(ofSize: 15)
        password.backgroundColor = .systemGray6
        password.keyboardType = UIKeyboardType.default
        password.translatesAutoresizingMaskIntoConstraints = false
        password.clipsToBounds = true
        password.layer.cornerRadius = 10
        password.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        //password.isSecureTextEntry = true
        self.view.addSubview(password)
        self.view.addSubview(loginButton)
        constraints()

    }
   
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -90 
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }
   
   @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
   
     func loginButtonPressed() {
         let email = email.text!
         let pass = password.text!
         let person = realm.objects(Authorisation.self)
         for person in person {
             if person.email == email && person.password == pass {
                 coordinator?.openProfileViewController()
                             coordinator?.coordinateToTabBar()
             } else {
                    let alert = UIAlertController(title: "Пользователь не найден",
                                                    message: "Неправильный логин или пароль",
                                                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Попробую снова", style: .cancel, handler: nil))
                                                     self.present(alert, animated: true)
            }
         }
     }
    
    private func constraints() {
        let safeArea = view.safeAreaLayoutGuide
     NSLayoutConstraint.activate([
        logo.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
       logo.widthAnchor.constraint(equalToConstant: 100),
       logo.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 120.0),
       logo.heightAnchor.constraint(equalToConstant: 100),
        
        email.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
        email.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
        email.heightAnchor.constraint(equalToConstant: 50),
        email.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        email.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
      
        password.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
        password.topAnchor.constraint(equalTo: email.bottomAnchor),
        password.heightAnchor.constraint(equalToConstant: 50),
        password.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        password.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
      
        loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 16),
        loginButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        loginButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        loginButton.heightAnchor.constraint(equalToConstant: 50),
        
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 5),
        registerButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        registerButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        registerButton.heightAnchor.constraint(equalToConstant: 50)

     ])
    }
    
    @objc  func registerButtonPressed() {
       
        let email = email.text!
        let pass = password.text!
        let regUser = Authorisation()
        regUser.email = email
        regUser.password = pass
        try! realm.write {
           realm.add(regUser)
        }
        self.email.text = ""
        self.password.text = ""
    }
  
}





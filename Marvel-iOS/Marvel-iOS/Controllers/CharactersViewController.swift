//
//  CharactersTableViewController.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 14/12/21.
//

import UIKit

class CharactersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   var characters = [Result]()
    
    private var myTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(red: 83/255.0, green: 177.0/255.0, blue: 192/255.0, alpha: 1)
        self.view = view
        applyViewCode()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        REST.loadCharacters{ (characters) in
            self.characters = characters!
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        } onError: { (error) in
            print(error)
        }
    }
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
        let character = characters[indexPath.row]
        let image = UIImage()
        cell.imageFoto.image = image.getImageData(character)
        cell.labelName.text = character.name
        cell.backgroundColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.view.frame.height*0.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ViewController()
        let character = characters[indexPath.row]
        viewController.character = character
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CharactersViewController: ViewCodeConfiguration {
   
    func buildHierarchy() {
        view.addSubview(myTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureViews() {
        navigationItem.title = "Personagens"

        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "cell")
       
    }
}



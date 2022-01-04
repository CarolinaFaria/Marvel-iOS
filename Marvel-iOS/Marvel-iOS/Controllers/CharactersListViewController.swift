//
//  CharactersTableViewController.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 14/12/21.
//

import UIKit

class CharactersListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var characters = [Character]()
    var imageConstrutor = ImageConstructor()
    var networkRequest = NetworkRequest()
    var loadingAlert = LoadingAlert()
    
    private var myTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(named: "main")
        self.view = view
        applyViewCode()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let loading = self.loadingAlert.startLoader()
        present(loading, animated: true, completion: nil)
        networkRequest.fetchGenericData { (marvelInfo: MarvelRequest) in
            self.characters = marvelInfo.data.results
            DispatchQueue.main.async {
                self.myTableView.reloadData()
                self.loadingAlert.stopLoader(loading)
            }
        } onError: { (genericError: GenericError) in
            print(genericError)
        }
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
        let character = characters[indexPath.row]

        cell.imageFoto.image = imageConstrutor.getImageData(character)
        cell.labelName.text = character.name
        
        let indicator = UIImage(named: "chevron.png")!.withTintColor(.white)
        cell.accessoryType = .disclosureIndicator
        cell.accessoryView = UIImageView(image: indicator)
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.view.frame.height*0.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = CharacterViewController()
        let character = characters[indexPath.row]
        viewController.character = character
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CharactersListViewController: ViewCodeConfiguration {
   
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




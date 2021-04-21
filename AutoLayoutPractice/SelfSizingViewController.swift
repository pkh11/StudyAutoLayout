//
//  SelfSizingViewController.swift
//  AutoLayoutPractice
//
//  Created by 박균호 on 2021/04/20.
//

import UIKit

class SelfSizingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("layoutCell"), object: nil, queue: OperationQueue.main) { (noti) in
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
        // Do any additional setup after loading the view.
    }
}

extension SelfSizingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let customCell = cell as? CustomTableViewCell else { return cell }
        
        customCell.titleLabel?.text = indexPath.description
        customCell.postLabel?.text = """
            adfasdfasdfasdfasdfadsfadsf
            adfadfadsfasdfadsfadfadfadsfadsf
            adsfadsfasdfasdfasdfasdfasdfas
            adsfadsfasdfasdfasdfasdfasdfas
            adsfaasdfasdfas
            adsfadsfasdfasdfasdfasdfasdfas
            adsfadsfasdfallllllll
            """
        customCell.myImageView?.image = UIImage(named: "image\(indexPath.row % 4)")
        return cell
    }
}

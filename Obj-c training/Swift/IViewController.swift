//
//  ViewController.swift
//  Obj-c training
//
//  Created by Sergei Veretennikov on 18.06.2024.
//

import UIKit

@objcMembers
@objc class IViewController: UIViewController {
    @objc var name: String = "Sergei"
    private var gesture: UITapGestureRecognizer!
    private lazy var tableView = UITableView()
    private lazy var vsdsDataSource = VSDSDataSource(tableView: tableView)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        swiftUseObjc()
        title = "Swift screen"
        tableView.setToEdgesOf(self.view)
        self.navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(presentObjcScreen))
    }

    @objc func hello() {
        print("Hello, \(name)")
    }

    @objc(printSomeShitsInteger:string:)
    func printSomeThings(int: NSInteger, string: NSString) {
        print(int, string)
    }

    @objc
    func swiftUseObjc() {
        let service = NetworkServiceImpl<BreedsArray>()
        service.fetchData(fromUrl: "https://catfact.ninja/breeds") { breeds in
        }
    }

    @objc 
    init(name: String = "Sergei") {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func presentObjcScreen() {
        let cellWithoutHeightWithTap = VSDSTestCell {  cell in
            guard let cell = cell as? VSDSTestCell else { return }
            cell.testConfigFunc(string: "Tappable default height  ")
        } onDidTap: { cell in
            guard let cell = cell as? VSDSTestCell else { return }
            print(cell.vsdsReuseIdentifier, " has been tapped")
        }

        let cellWithoutTapWithCustomHeight = VSDSTestCellTwo(height: 30) { cell in
            guard let cell = cell as? VSDSTestCellTwo else { return }
            cell.testConfigFunc(color: .brown, string: "Custom height no tap", stringTwo: "TAP? NO")
        }

        let cellWithCustomHeightWithTap = VSDSTestCellThree(height: 100) { cell in
            guard let cell = cell as? VSDSTestCellThree else { return }
            cell.testConfigFunc(color: .cyan, string: "Open next Screen", stringTwo: "PLEASE")
        } onDidTap: { cell in
            guard let cell = cell as? VSDSTestCellThree else { return }
            print(cell.vsdsReuseIdentifier, " has been tapped")
            let screen = TableViewController()
            self.navigationController?.pushViewController(screen, animated: true)
        }

        let defaultCellWithAutomaticHeightWithoutTap = VSDSTestCellFour { cell in
            guard let cell = cell as? VSDSTestCellFour else { return }
            cell.testConfigFunc(color: .green, string: "Default cell without tap", stringTwo: "DEFAULT??")
        }

        vsdsDataSource?.appending([cellWithoutHeightWithTap, cellWithoutTapWithCustomHeight, cellWithCustomHeightWithTap, defaultCellWithAutomaticHeightWithoutTap])
        vsdsDataSource?.tableView.reloadData()
    }
}

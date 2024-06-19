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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        swiftUseObjc()
        title = "Swift screen"
        gesture = UITapGestureRecognizer(target: self, action: #selector(presentObjcScreen))
        self.view.addGestureRecognizer(gesture)
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
            breeds?.data.forEach { breed in
                print(breed.description, "\n\n")
            }
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
        let tableViewController = TableViewController()
        tableViewController.title = "Objective-c screen"
        navigationController?.pushViewController(tableViewController, animated: true)
    }
}

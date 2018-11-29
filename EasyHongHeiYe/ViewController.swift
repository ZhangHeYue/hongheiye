//
//  ViewController.swift
//  EasyHongHeiYe
//
//  Created by 张和悦 on 2018/11/28.
//  Copyright © 2018 张和悦. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var countTextField: UITextField!

    private var hasPolice = false

    private var roleArray = [Role]()

    private let identifier = String(describing: CardCollectionViewCell.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }

    @IBAction func generate(_ sender: Any) {
        let text = countTextField.text ?? ""
        let count = Int(text) ?? 0
        roleArray = getRoleArray(count: count, needPolice: hasPolice)
        collectionView.reloadData()
    }

    @IBAction func changePoliceState(_ sender: UISegmentedControl) {
        hasPolice = sender.selectedSegmentIndex == 1
    }

    private func getRoleArray(count: Int, needPolice: Bool) -> [Role] {
        var result = [Role]()
        var most = 0
        if count.isEven() {
            most = count / 2
        } else {
            most = (count + 1) / 2
        }
        if needPolice {
            if count.isEven() {
                for _ in 0..<most {
                    result.append(.bad)
                }
                for _ in 0..<most - 1 {
                    result.append(.good)
                }
                result.append(.police)
            } else {
                for _ in 0..<most - 1 {
                    result.append(.bad)
                    result.append(.good)
                }
                result.append(.police)
            }
        } else {
            if count.isEven() {
                for _ in 0..<most {
                    result.append(.bad)
                    result.append(.good)
                }
            } else {
                for _ in 0..<most - 1 {
                    result.append(.bad)
                    result.append(.good)
                }
                result.append(.good)
            }
        }
        return result.shuffled()
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let popView = UINib(nibName: "PopView", bundle: nil).instantiate(withOwner: self, options: nil).first as! PopView
        popView.frame = view.bounds
        popView.set(number: indexPath.row + 1, role: roleArray[indexPath.row])
        view.addSubview(popView)
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roleArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CardCollectionViewCell
        cell.set(number: indexPath.row + 1)
        return cell
    }

}

extension Int {
    func isEven() -> Bool {
        return self % 2 == 0
    }
}

//
//  DetailScreenViewController.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 29.02.2024.
//

import UIKit

class DetailScreenViewController: UIViewController {

    @Injected(\.viewModel) var viewModel
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

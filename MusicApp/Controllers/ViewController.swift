//
//  ViewController.swift
//  MusicApp
//
//  Created by 오정석 on 12/12/2023.
//

import UIKit

final class ViewController: UIViewController {
    // 🍏 서치 컨트롤러 생성 ===> 네비게이션 아이템에 할당
//    let searchController = UISearchController()
    
    // 🍎 서치 Results 컨트롤러
    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 서치바 셋팅
    func setupSearchBar() {
        self.title = "Music Search"
        navigationItem.searchController = searchController
        
        // (단순)서치바의 사용
        searchController.searchBar.delegate = self
    }
}

extension ViewController: UISearchBarDelegate {
    
}

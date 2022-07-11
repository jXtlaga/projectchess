//
//  wierszViewController.swift
//  projectchess
//
//  Created by Jan Tlaga on 08/07/2022.
//

import UIKit

class wierszViewController: UIViewController {

    @IBOutlet weak var tytul: UILabel!
    @IBOutlet weak var tekst: UITextView!
    var wiersz = ""
    var tytultekst = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tekst.text = wiersz
        tytul.text = tytultekst
       
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

//
//  szachmatViewController.swift
//  projectchess
//
//  Created by Jan Tlaga on 22/06/2022.
//

import UIKit

class szachmatViewController: UIViewController {

    @IBOutlet weak var tekst: UILabel!
    var wygranykolor = ""
    var zapisgry: [Int] = []
    @IBOutlet weak var analiza: UIButton!
    var zapisparii:[String] = []
    var ustawieniefigur : [Int:String]!
    var czymoze:Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        tekst.text = "Wygrały " + wygranykolor
        if czymoze != nil {analiza.isHidden = true}
        // Do any additional setup after loading the view.
    }
    @IBAction func szachmat(segue: UIStoryboardSegue) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ekran = segue.destination as? analizapartiiViewController
        {
            ekran.zapisgry = zapisgry
            ekran.zapisparii = zapisparii
            ekran.ustawieniefigur = ustawieniefigur
        }
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

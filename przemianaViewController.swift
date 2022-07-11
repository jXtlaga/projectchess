//
//  przemianaViewController.swift
//  projectchess
//
//  Created by Jan Tlaga on 24/06/2022.
//

import UIKit

class przemianaViewController: UIViewController {
    @IBOutlet weak var tapdama: UIButton!
    @IBOutlet weak var tapwieza: UIButton!
    @IBOutlet weak var tapgoniec: UIButton!
    @IBOutlet weak var tapskoczek: UIButton!
    var kolor:String!
    var figura:String!
    override func viewDidLoad() {
        super.viewDidLoad()
       kolorystykafigur(kolor: kolor)
        
    }
    func kolorystykafigur(kolor:String)
    {
        if kolor == "C"
        {
            tapdama.setImage(UIImage(named: "CQ"), for: .normal)
            tapwieza.setImage(UIImage(named: "CW"), for: .normal)
            tapgoniec.setImage(UIImage(named: "CG"), for: .normal)
            tapskoczek.setImage(UIImage(named: "CS"), for: .normal)
            
        }
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? WutangViewController
        {
            if kolor == "C" {vc.przemiana(figurazmiana: "C"+figura)}
            else{vc.przemiana(figurazmiana: figura)}
        }
        if let vc = segue.destination as? KochanowskiViewController
        {
            if kolor == "C" {vc.przemiana(figurazmiana: "C"+figura)}
            else{vc.przemiana(figurazmiana: figura)}
        }
        if let vc = segue.destination as? DuchampViewController
        {
            if kolor == "C" {vc.przemiana(figurazmiana: "C"+figura)}
            else{vc.przemiana(figurazmiana: figura)}
        }
        if let vc = segue.destination as? klasykViewController
        {
            if kolor == "C" {vc.przemiana(figurazmiana: "C"+figura)}
            else{vc.przemiana(figurazmiana: figura)}
        }
    }
    @IBAction func powrotWithSegue(segue: UIStoryboardSegue) {
        if let vc = segue.destination as? WutangViewController
        {
 
        }
                          }
       
    @IBAction func dama(_ sender: Any) {
        figura = "Q"
        self.performSegue(withIdentifier: "powrotWithSegue", sender: self)
    }
    @IBAction func wieza(_ sender: Any) {
        figura = "W"
        self.performSegue(withIdentifier: "powrotWithSegue", sender: self)
    }
    @IBAction func goniec(_ sender: Any) {
        figura = "G"
        self.performSegue(withIdentifier: "powrotWithSegue", sender: self)
    }
    @IBAction func skoczek(_ sender: Any) {
        figura = "S"
        self.performSegue(withIdentifier: "powrotWithSegue", sender: self)
    }
    
}

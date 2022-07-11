//
//  ViewController.swift
//  projectchess
//
//  Created by Jan Tlaga on 20/06/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dodawanieView()
        self.scroll.isScrollEnabled = true
        scroll.contentSize = CGSize(width: view.frame.width, height: 7*(view.frame.width/2))
        self.view = scroll
        
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    func dodawanieView()
    {
        
        let rozmiar = view.frame.width/2 - 15
        for int in 0...5
        {
            var Y = int/2
            var X = int%2
            var dod:CGFloat = 10
            var dodY:CGFloat = 0
            if int % 2 == 0 {dodY += 10}
            if X != 0 {dod += 10}
            let tlo = UIButton(frame: CGRect(x: CGFloat(X)*rozmiar + dod, y: CGFloat(Y)*rozmiar + CGFloat(Y*10)+10, width: rozmiar, height: rozmiar))
           
            tlo.tag = int
            tlo.addTarget(self, action: #selector(tap(sender:)), for: .touchDown)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: rozmiar/2-5, height: rozmiar/7))
            label.numberOfLines = 1
            label.textAlignment = .center
            
            label.font = UIFont(name: "DIN Alternate", size: 15)
            label.textColor = UIColor.white
            tlo.backgroundColor = UIColor.white
            //tlo.layer.borderWidth = 10
            //tlo.layer.borderColor = UIColor.systemGray6.cgColor
            //let tlonapis = UIView(frame: CGRect(x: 10, y: 10, width: rozmiar/2-15, height: label.frame.height))
            let tlonapis = UIView(frame: CGRect(x: 0, y: 0, width: rozmiar/2-5, height: label.frame.height))
            //tlonapis.transform = tlonapis.transform.rotated(by: .pi / 2)
            tlonapis.backgroundColor = UIColor.white
            label.layer.opacity = 0.8
            label.backgroundColor = UIColor.systemPink
        
            tlonapis.layer.opacity = 1
        
            
            switch int
            {
            case 0:
                tlo.setImage(UIImage(named: "kochanowskipole2"), for: .normal)
                label.text = "POEZJA"
                
            case 1:
                tlo.setImage(UIImage(named: "poleduchamp"), for: .normal)
                label.text = "DZIWNE SZACHY"
                label.font = UIFont(name: "DIN Condensed", size: 15)
                label.textAlignment = .center
            case 2:
                tlo.setImage(UIImage(named: "Badin"), for: .normal)
                label.text = "KLASYCZNE"
            case 3:
                tlo.setImage(UIImage(named: "wutangprzyszachownicy"), for: .normal)
                label.text = "BULLET"
            case 4:
                tlo.setImage(UIImage(named: "polebergman"), for: .normal)
                label.text = "ZADANIA"
            case 5:
                tlo.setImage(UIImage(named: "yokoono"), for: .normal)
                label.text = "YOKOSZACHY"
                label.textAlignment = .center
                label.font = UIFont(name: "DIN Condensed", size: 15)
            
                
            default:
                print("test")
                tlo.layer.borderWidth = 10
                
            }
          
            
            scroll.addSubview(tlo)
            tlo.addSubview(tlonapis)
            tlonapis.addSubview(label)
        
        }
            
    }
    
    
    @IBAction func tap(sender: UIButton)
    {
        switch sender.tag
        {
        case 0:
            performSegue(withIdentifier: "kochanowski", sender: self)
        case 1:
            performSegue(withIdentifier: "Duchamp", sender: self)
        case 2:
            performSegue(withIdentifier: "Badin", sender: self)
        case 3:
            performSegue(withIdentifier: "wutang", sender: self)
        case 4:
            performSegue(withIdentifier: "bergman", sender: self)
        case 5:
            performSegue(withIdentifier: "yoko", sender: self)
            
        default:
            performSegue(withIdentifier: "normal", sender: self)
        }
    }


}


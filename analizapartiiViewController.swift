//
//  analizapartiiViewController.swift
//  projectchess
//
//  Created by Jan Tlaga on 29/06/2022.
//

import UIKit

class analizapartiiViewController: UIViewController {
    var ustawieniepoczatkowe : [Int:String] = [1:"CW1",2:"CS2",3:"CG1",4:"CQ1",5:"CK",6:"CG2",7:"CS2",8:"CW2", 9:"CP1", 10:"CP2", 11:"CP3", 12:"CP4",13:"CP5", 14:"CP6", 15:"CP7",16:"CP8",49:"P1",50:"P2",51:"P3",52:"P4",53:"P5",54:"P6",55:"P7",56:"P8", 57:"W1", 58:"S1", 59:"G1", 60:"Q1",61:"K", 62:"G2", 63:"S2",64:"W2"]
    var zapisgry:[Int] = []
    var ustawieniefigur : [Int:String]!

    var zapisparii:[String] = []
    var zaznaczenie1:Int = 0
    var zaznaczenie2:Int = 0
    var zaznaczenie:Int = 0
    var savetap:UIButton!
    var przycisktag:Int!
    var daneX: [CGFloat] = [0]
    var lasttap:UIButton!
    
    let zasady = reguly()
    var przemianakolor = "N"
   
    var ostatnitag = 128

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tworzenieszachownicy()
        ustawieniefigur = ustawieniepoczatkowe
        
        poczatektworzenie(dane: ustawieniepoczatkowe)
        
        
    }
    
  
    @IBAction func powrotWithSegue(segue: UIStoryboardSegue) {
                          
                          }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    func tworzenieszachownicy()
    {
        let rozmiiarszachownicy = ((self.view.frame.size.width-20)/8).rounded(.down)*8
        let zdjecie = UIImageView(frame: CGRect(x: 0, y: 0, width: rozmiiarszachownicy, height: rozmiiarszachownicy))
        zdjecie.frame.origin = CGPoint(x: (self.view.frame.size.width-rozmiiarszachownicy)/2, y: 100)
        zdjecie.image = UIImage(named: "szachownicanaliza")
        zdjecie.isUserInteractionEnabled = true
        zdjecie.tag = -1
        let scroll = UIScrollView(frame: CGRect(x: (self.view.frame.size.width-rozmiiarszachownicy)/2, y: zdjecie.frame.maxY+10, width: rozmiiarszachownicy, height: rozmiiarszachownicy))
        scroll.contentSize = CGSize(width: rozmiiarszachownicy, height: CGFloat((zapisparii.count/2))*rozmiiarszachownicy/8)
        view.addSubview(scroll)
        
        scroll.isScrollEnabled = true
       
        view.addSubview(zdjecie)
        if zapisparii.count == 0 {return}
        var zliczanie = 0
        for int in 0..<zapisparii.count
        {
        
            let rozmiartap = (rozmiiarszachownicy/8)*3.5
            var X = (rozmiiarszachownicy/8)*4.5
            if int%2==0 {
                X=rozmiiarszachownicy/8
                let numer  = UILabel(frame: CGRect(x: 0, y: (rozmiiarszachownicy/8)*CGFloat((int/2)), width: rozmiiarszachownicy/8, height: rozmiiarszachownicy/8))
                zliczanie = zliczanie+1
                numer.text = String(zliczanie)+"."
                numer.textAlignment = .center
                scroll.addSubview(numer)
            }
            let tap = UIButton(frame: CGRect(x: X, y: (rozmiiarszachownicy/8)*CGFloat((int/2)), width: rozmiartap, height: rozmiiarszachownicy/8))
            tap.tag = -1 * (int+2)
            
            
            tap.setTitle("     "+zapisparii[int], for: .normal)
            tap.contentHorizontalAlignment = .left
            tap.setTitleColor(UIColor.black, for: .normal)
            tap.layer.borderWidth = 0.6
            tap.layer.borderColor = UIColor.systemGray5.cgColor
            tap.setAttributedTitle(NSMutableAttributedString(string: zapisparii[int], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]), for: .selected)
            tap.setAttributedTitle(NSMutableAttributedString(string: zapisparii[int], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .light)]), for: .normal)
            scroll.addSubview(tap)
            
            
            tap.addTarget(self, action: #selector(taptap(sender:)), for: .touchDown)
            
        }
        
        
        
     
    }
    @IBAction func taptap(sender:UIButton)
    {
        
        if lasttap != nil && lasttap != sender
        {
            if lasttap.isSelected {
                lasttap.isSelected = false
                
            }
            else {
                lasttap.isSelected = true
                
            }
        }
        lasttap = sender
        if sender.isSelected == false {
            sender.isSelected = true
            
        }
        
        if sender.tag < -1 && sender.tag > -67
        {
            odczytpozycji(posuniecie: (sender.tag * (-1))-1)
        }
    }
    func odczytpozycji(posuniecie:Int)
    {
        var pole = 0
        var zbiortagow:[Int] = []
        var usuniecietag:[Int] = []
        for (klucz, wartosc) in  ustawieniefigur
        {
            zbiortagow.append(klucz)
        }
        for int in 64 * posuniecie..<posuniecie * 64+64
        {
            pole += 1
            if zapisgry[int] != 0
            {
                view.viewWithTag(zapisgry[int])?.isHidden=false
                view.viewWithTag(zapisgry[int])?.layer.opacity = 1
                view.viewWithTag(zapisgry[int])?.frame.origin = zamianapole(pole: pole)
                for n in 0..<zbiortagow.count
                {
                    if zbiortagow[n]==zapisgry[int]
                    {
                        zbiortagow[n]=0
                    }
                }
            }
        }
        for int in 0..<zbiortagow.count
        {
            if zbiortagow[int] != 0
            {
                view.viewWithTag(zbiortagow[int])?.isHidden = true
            }
            
        }
    }
    func funtabliczapoczatek() -> [Int]
    {
        var wynik: [Int] = []
        for l in 0...63
        {
            if (l+1<17 || l+1>48)
            {
                wynik.append(l+1)
            }
            else
            {
                wynik.append(0)
            }
        }
        return wynik
    }
    func poczatektworzenie(dane: [Int:String])
    {
        for (x, y) in dane {
            if(y[0] != "C")
            {
                funtworzeniefigur(nazwa: y[0], numer: x)
            }
            else {
                funtworzeniefigur(nazwa: y[0]+y[1], numer: x)
            }
        }
    }
    func funtworzeniefigur (nazwa: String, numer: Int)
    {
        var figura : UIImageView
        let wymiar = (self.view.viewWithTag(-1)?.frame.size.width ?? view.frame.size.width)/8
        figura = UIImageView(frame: CGRect(x: 0, y: 0, width: wymiar, height: wymiar))
        figura.image = UIImage(named: nazwa)
        figura.tag = numer
        if view.viewWithTag(-1) != nil {self.view.viewWithTag(-1)!.addSubview(figura)}
       
        figura.frame.origin = zamianapole(pole: numer)
    }
    
    func zamianapole(pole:Int) -> CGPoint
    {
        let wymiar = (self.view.viewWithTag(-1)!.frame.size.width)/8
        var x = pole
        let y = (pole-1)/8 + 1
        while x>8
        {
            x = x-8
        }
        return CGPoint(x: wymiar*(CGFloat(x)-1), y: wymiar*(CGFloat(y)-1))
    }
    
    
   
}

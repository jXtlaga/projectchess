//
//  KochanowskiViewController.swift
//  projectchess
//
//  Created by Jan Tlaga on 22/06/2022.
//

import UIKit

class KochanowskiViewController: UIViewController {

    var ustawieniepoczatkowe : [Int:String] = [1:"CW1",2:"CS2",3:"CG1",4:"CQ1",5:"CK",6:"CG2",7:"CS2",8:"CW2", 9:"CP1", 10:"CP2", 11:"CP3", 12:"CP4",13:"CP5", 14:"CP6", 15:"CP7",16:"CP8",49:"P1",50:"P2",51:"P3",52:"P4",53:"P5",54:"P6",55:"P7",56:"P8", 57:"W1", 58:"S1", 59:"G1", 60:"Q1",61:"K", 62:"G2", 63:"S2",64:"W2"]
    var zapisgry:[Int] = []
    var teksty:[String] = ["Taka była decyzja białego króla.\nI rozpoczęła się kolejna tura.", "\nSłychać jego rżenie i kopyta.\nBiały koń żołnierzy wita.","\nStrumieniem płynie krew i łzy.\nTańczą danse macabre pokazując kły.","\nHetman przybliża się do nich z oddali.\nDlatego jęczą i zgrzytają zębami."]
    var ustawieniefigur : [Int:String]!
    
    
    var zaznaczenie1:Int = 0
    var zaznaczenie2:Int = 0
    var zaznaczenie:Int = 0
    var savetap:UIButton!
    var przycisktag:Int!
    var daneX: [CGFloat] = [0]
    let zadanie1 = [46,22, 15, 22, 37, 39, 7, 8, 43, 22]
    var zadanieruch = 0
    var uzyte:[Int] = []
    var ostatnitag = 128
    var zapispartii:[String] = []
    let zasady = reguly()
    var przemianakolor = "N"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        zapisgry = funtabliczapoczatek()
        ustawieniefigur = ustawieniepoczatkowe
        tworzenieszachownicy()
        poczatektworzenie(dane: ustawieniepoczatkowe)
        funtworzenieprzyciskow()
        let pangesture = UIPanGestureRecognizer(target: self, action: #selector(self.poruszanie(_:)))
        view.viewWithTag(-1)!.addGestureRecognizer(pangesture)
        tworzeniedaneX()
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ekran = segue.destination as? wierszViewController
        {
            let x = view.viewWithTag(-2)! as! UITextView
            //ekran.tytul.text = "jek"
            ekran.wiersz += x.text
            if (zapisgry.count/64)%2==0 {
                ekran.tytultekst += "Zwyciestwo białego"
                ekran.wiersz += "\n\nBól I blask, widowisko zakończone.\nBiały król już świętuje zwycięstwo swoje."
            }
            else {
                ekran.tytultekst += "Zwyciestwo czarnego"
                ekran.wiersz += "\n\nBól I blask, widowisko zakończone.\nCzarny król już świętuje zwycięstwo swoje."
            }
        }
        if let ekran = segue.destination as? przemianaViewController
        {
            ekran.kolor = przemianakolor
        }
    }
    
    @IBAction func koch(segue: UIStoryboardSegue) {
                          
                          }
    @IBAction func powrotWithSegue(segue: UIStoryboardSegue) {
                          
                          }
    func tworzenieszachownicy()
    {
        var rozmiiarszachownicy = ((self.view.frame.size.width)/8).rounded(.down)*8 
        rozmiiarszachownicy = rozmiiarszachownicy - rozmiiarszachownicy/4
        let zdjecie = UIImageView(frame: CGRect(x: 0, y: 0, width: rozmiiarszachownicy, height: rozmiiarszachownicy))
        zdjecie.frame.origin = CGPoint(x: (self.view.frame.size.width-rozmiiarszachownicy)/2, y: 100)
        zdjecie.image = UIImage(named: "szachownicaduchamp")
        
        zdjecie.isUserInteractionEnabled = true
        zdjecie.tag = -1
        let pasek1 =  UIImageView(frame: CGRect(x: 0, y: 0, width: rozmiiarszachownicy/8, height: rozmiiarszachownicy))
        pasek1.frame.origin = CGPoint(x: zdjecie.frame.minX-rozmiiarszachownicy/8, y: zdjecie.frame.minY)
        pasek1.image = UIImage(named: "pasek2")
        let pasek2 =  UIImageView(frame: CGRect(x: 0, y: 0, width: rozmiiarszachownicy, height: rozmiiarszachownicy/8))
        pasek2.frame.origin = CGPoint(x: zdjecie.frame.minX, y: zdjecie.frame.maxY)
        pasek2.image = UIImage(named: "pasek3")
        let textview = UITextView(frame: CGRect(x: 0, y: pasek2.frame.maxY, width: view.frame.width, height: rozmiiarszachownicy*2))
        textview.tag = -2
        textview.font = UIFont(name: "Cochin", size: 18)
        textview.textAlignment = .center
        textview.isEditable = false
        textview.backgroundColor = nil
        view.addSubview(textview)
        view.addSubview(zdjecie)
        view.addSubview(pasek1)
        view.addSubview(pasek2)
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
        let wymiar = (self.view.viewWithTag(-1)!.frame.size.width)/8
        figura = UIImageView(frame: CGRect(x: 0, y: 0, width: wymiar, height: wymiar))
        figura.image = UIImage(named: nazwa)
        figura.tag = numer
        self.view.viewWithTag(-1)!.addSubview(figura)
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
    
    func funtworzenieprzyciskow ()
    {
        for i in 65...128
        {
            let pole : UIButton
            
            let wymiar = (self.view.viewWithTag(-1)!.frame.size.width)/8
            pole = UIButton(frame: CGRect(x: 0, y: 0, width: wymiar, height: wymiar))
            pole.layer.opacity = 0.5
            pole.tag = i
            pole.tintColor = UIColor.black
            self.view.viewWithTag(-1)!.addSubview(pole)
            pole.addTarget(self, action: #selector(przytrzymanie(_:)), for: .touchDown)
            pole.frame.origin = zamianapole(pole: i-64)
        }
        
    }
    @IBAction func przytrzymanie(_ sender: UIButton)
    {
        przycisk(sender)
        przycisktag = sender.tag
    }
    func animacja(tekst:String)
    {
        
        let tekscik:UITextView = view.viewWithTag(-2)! as! UITextView
        tekscik.frame.size.height = tekscik.frame.height + 36
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveLinear, animations: { [self] in
            tekscik.text += "\n"
            tekscik.text += tekst
        }, completion: nil)
    }
    func tekstowo()
    {
        let rand = Int.random(in: 4..<8)
        if zapisgry.count/64 == 2 && uzyte.count == 0
        {
            uzyte.append(0)
            animacja(tekst: teksty[0])
            
        }
        if uzyte.contains(1) == false && (zapisgry.count/64)%2 == 0 && zapispartii.count>0 && zapispartii[zapispartii.count-1][0]=="♘" && rand == 6
        {
                uzyte.append(1)
                animacja(tekst: teksty[1])
            
        }
        if uzyte.contains(2) == false && (zapisgry.count/64)>12 && rand == 7
        {
            uzyte.append(2)
            animacja(tekst: teksty[2])
        }
        if uzyte.contains(3) == false && zapispartii.count>0 && zapispartii[zapispartii.count-1][0]=="♕" && rand == 5
        {
                uzyte.append(3)
                animacja(tekst: teksty[3])
        }
        
    }
    func przemiana(figurazmiana:String) {
        print(figurazmiana )
        if figurazmiana != "N"
        {
            for int in 1...8
            {
                if ustawieniefigur[zapisgry[zapisgry.count-65+int]]?[0]=="P"
                {
                    
                    let numer = ostatnitag + 1
                    ostatnitag = numer
                    view.viewWithTag(zapisgry[zapisgry.count-65+int])?.isHidden = true
                    zapisgry[zapisgry.count-65+int] = numer
                    var figura : UIImageView
                    let wymiar = (self.view.viewWithTag(-1)!.frame.size.width)/8
                    figura = UIImageView(frame: CGRect(x: 0, y: 0, width: wymiar, height: wymiar))
                    figura.image = UIImage(named: figurazmiana)
                    figura.tag = numer
                    
                    self.view.viewWithTag(-1)!.addSubview(figura)
                    figura.frame.origin = zamianapole(pole: int)
                    ustawieniefigur[numer] = figurazmiana
                    
                    
                }
                if ustawieniefigur[zapisgry[zapisgry.count-65+int+56]]?[1]=="P"
                {
                    
                    let numer = ostatnitag + 1
                    ostatnitag = numer
                    view.viewWithTag(zapisgry[zapisgry.count-65+int+56])?.isHidden = true
                    zapisgry[zapisgry.count-65+int+56] = numer
                    var figura : UIImageView
                    let wymiar = (self.view.viewWithTag(-1)!.frame.size.width)/8
                    figura = UIImageView(frame: CGRect(x: 0, y: 0, width: wymiar, height: wymiar))
                    figura.image = UIImage(named: figurazmiana)
                    figura.tag = numer
                    self.view.viewWithTag(-1)!.addSubview(figura)
                    figura.frame.origin = zamianapole(pole: int+56)
                    ustawieniefigur[numer] = figurazmiana
                    
                }
            }
        }
    }
    func przycisk(_ sender: UIButton)
    {
        if zaznaczenie1==0
        {
            if zaznaczenie == (zapisgry.count-64)/64
            {
                dozwoloneposuniecia(tag: sender.tag, ktory: true)
                savetap = sender

            
                zaznaczenie1=sender.tag-64
                if zapisgry[zapisgry.count+sender.tag-129] != 0
                {
                   // view.viewWithTag(zapisgry[zapisgry.count+sender.tag-129])?.backgroundColor=UIColor.systemBrown.withAlphaComponent(0.5)
                }
                else
                {
                    zaznaczenie1=0
                }
            }
        }
        else if zaznaczenie2==0
        {
            
            view.viewWithTag(zapisgry[zapisgry.count+savetap.tag-129])?.backgroundColor=UIColor.white.withAlphaComponent(0)
            dozwoloneposuniecia(tag: savetap.tag, ktory: false )
            zaznaczenie2=sender.tag-64
            rozkmina(l1: zaznaczenie1, l2: zaznaczenie2, mat: false)
            zaznaczenie1=0
            zaznaczenie2=0
            var ck = 0
            var bk = 0
            for int in zapisgry.count-64..<zapisgry.count
            {
                if zapisgry[int]==5
                {
                    ck=int-zapisgry.count+65
                }
                if zapisgry[int]==61
                {
                    bk=int-zapisgry.count+65
                }
               
            }
            if zasady.czyatakowane(pole: ck,kolor: "C", zapisgry: zapisgry, ustawieniefigur: ustawieniefigur) == true
            {
                view.viewWithTag(zapisgry[zapisgry.count+ck-65])?.backgroundColor=UIColor.systemRed.withAlphaComponent(0.5)
                if mat(atakowanykolor: "C", polekrol: ck) == true
                {
                   
                    performSegue(withIdentifier: "szachmat", sender: self)
                    
                    
                }
            }
            if zasady.czyatakowane(pole: bk, kolor: "B", zapisgry: zapisgry, ustawieniefigur: ustawieniefigur) == true
            {
                if mat(atakowanykolor: "B", polekrol: bk) == true
                {
                    
                    performSegue(withIdentifier: "szachmat", sender: self)
                    
                }
                view.viewWithTag(zapisgry[zapisgry.count+bk-65])?.backgroundColor=UIColor.systemRed.withAlphaComponent(0.5)
                
            }
            if zasady.czyatakowane(pole: bk, kolor: "B", zapisgry: zapisgry, ustawieniefigur: ustawieniefigur) == false
            {
                view.viewWithTag(zapisgry[zapisgry.count+bk-65])?.backgroundColor=UIColor.clear
            }
            if zasady.czyatakowane(pole:ck, kolor: "C", zapisgry: zapisgry, ustawieniefigur: ustawieniefigur) == false
            {
                view.viewWithTag(zapisgry[zapisgry.count+ck-65])?.backgroundColor=UIColor.clear
            }
            tekstowo()
        }
    }
    
    func funkolor(tag:Int) -> String
    {
        if ustawieniefigur[tag]?[0] == "C"
        {
            return "C"
        }
        else if ustawieniefigur[tag]?[0] != nil
        {
            return "B"
        }
        else
        {
            return "N"
        }
    }
    
    
   
    func dozwoloneposuniecia(tag: Int, ktory: Bool)
    {
        var pola:[Int] = []
        let pole = tag-64
        
        let y: Int = (tag-65)/8 + 1
        var x = tag-64
        while x>8
        {
            x = x-8
        }
       
        
        let kolor = funkolor(tag: zapisgry[zapisgry.count-65+pole])
        var dane: [Int] = []
        if ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "P" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "P"
        {
            dane = zasady.pionekruchy(pole: pole, kolor: kolor, zapisgry:zapisgry, ustawieniefigur:ustawieniefigur)
        }
        if ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "S" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "S"
        {
         dane = zasady.skoczekruchy(pole: pole, kolor: kolor, zapisgry:zapisgry, ustawieniefigur:ustawieniefigur)
        }
        if ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "G" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "G"
        {
            dane = zasady.goniecruchy(pole: pole, kolor: kolor, zapisgry:zapisgry, ustawieniefigur:ustawieniefigur)
        }
        if ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "W" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "W"
        {
            dane = zasady.wiezaruchy(pole: pole, kolor: kolor, zapisgry:zapisgry, ustawieniefigur:ustawieniefigur)
        }
        if ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "K" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "K"
        {
            dane = zasady.krolruchy(pole: pole, kolor: kolor, zapisgry:zapisgry, ustawieniefigur:ustawieniefigur)
        }
        if ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "Q" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "Q"
        {
            dane = zasady.wiezaruchy(pole: pole, kolor: kolor, zapisgry:zapisgry, ustawieniefigur:ustawieniefigur)
            if zasady.goniecruchy(pole: pole, kolor: kolor, zapisgry:zapisgry, ustawieniefigur:ustawieniefigur).count>0
            {
                for l in 0..<zasady.goniecruchy(pole: pole, kolor: kolor, zapisgry:zapisgry, ustawieniefigur:ustawieniefigur).count
                {
                    dane.append(zasady.goniecruchy(pole: pole, kolor: kolor, zapisgry:zapisgry, ustawieniefigur:ustawieniefigur)[l])
                }
            }
        }
        
        if dane.count>0
        {
            for l in 0..<dane.count
            {
                if ktory == false
                {
                   
                    let kolo = self.view.viewWithTag(64+dane[l]) as? UIButton
                    kolo?.setImage(nil, for: .normal)
                                        
                }
                else
                {
                    let zdjecie = UIImage(systemName: "circle.fill")
                    let kolo = self.view.viewWithTag(64+dane[l]) as? UIButton
                    kolo?.setImage(zdjecie, for: .normal)
                    
                    
                }
                
            }
        }
        
        
    }
    func mat(atakowanykolor: String, polekrol:Int)->Bool
    {
        
        var sprawdzanie = 1
        if atakowanykolor == "B"
        {
            sprawdzanie = 0
        }
        var pole = 0
        let a = zapisgry.count-64
        let b = zapisgry.count
        for int in a..<b
        {
            pole = pole + 1
            var dane:[Int] = []
            let figura:String = ustawieniefigur[zapisgry[int]]?[sprawdzanie] ?? "N"
            switch figura
            {
            case "P":
                dane.append(contentsOf: zasady.pionekruchy(pole: pole, kolor: atakowanykolor,zapisgry:zapisgry, ustawieniefigur:ustawieniefigur))
            case "S":
                dane.append(contentsOf: zasady.skoczekruchy(pole: pole, kolor: atakowanykolor,zapisgry:zapisgry, ustawieniefigur:ustawieniefigur))
                
            case "W":
                dane.append(contentsOf: zasady.wiezaruchy(pole: pole, kolor: atakowanykolor,zapisgry: zapisgry,ustawieniefigur: ustawieniefigur))
            case "G":
                dane.append(contentsOf: zasady.goniecruchy(pole: pole, kolor: atakowanykolor,zapisgry: zapisgry,ustawieniefigur: ustawieniefigur))
            case "Q":
                dane = zasady.wiezaruchy(pole: pole, kolor: atakowanykolor,zapisgry: zapisgry,ustawieniefigur: ustawieniefigur)
                if zasady.goniecruchy(pole: pole, kolor: atakowanykolor,zapisgry: zapisgry,ustawieniefigur: ustawieniefigur).count>0
                {
                    for l in 0..<zasady.goniecruchy(pole: pole, kolor: atakowanykolor,zapisgry: zapisgry,ustawieniefigur: ustawieniefigur).count
                    {
                        dane.append(zasady.goniecruchy(pole: pole, kolor: atakowanykolor,zapisgry: zapisgry,ustawieniefigur: ustawieniefigur)[l])
                    }
                }
            case "K":
                dane.append(contentsOf: zasady.krolruchy(pole: pole, kolor: atakowanykolor,zapisgry: zapisgry,ustawieniefigur: ustawieniefigur))
            default:
                print("nic")
            }
            if dane.count>0
            {
                for i in 0..<dane.count
                {
                    rozkmina(l1: pole, l2: dane[i], mat: true)
                    if zapisgry.count>b
                    {
                        zapisgry = zapisgry.dropLast(64)
                        return false
                    }
                }
            }
        }
        return true
        
    }
    func rozkmina(l1: Int, l2: Int, mat: Bool)
    {
        
        let kod = zapisgry[zapisgry.count - 65+l1]
        let removefigura = zapisgry[zapisgry.count - 65+l2]
        let roz = zapisgry.count
        let ruch = (zapisgry.count+1)/64
        var mozeniemoze = false
        var figura = ""
        let kolor = funkolor(tag: kod)
        var czarnykrol = 0
        var bialykrol = 0
        let y = (l2-1)/8+1
        //var sprawdzaniepozycji:[Int] = []
        for int in zapisgry.count-64..<zapisgry.count
        {
            if zapisgry[int]==5
            {
                czarnykrol=int-zapisgry.count+65
            }
            if zapisgry[int]==61
            {
                bialykrol=int-zapisgry.count+65
            }
           
        }
        
       
       
        
        
        if kolor == "C"
        {
            figura = ustawieniefigur[kod]?[1] ?? ""
            mozeniemoze = zasady.sprawdzaniepoprawnosci(ruch1: l1, ruch2: l2, figura: figura, kolor: "C", zapisgry: zapisgry,ustawieniefigur: ustawieniefigur, zapisparti: zapispartii)
        }
        else if kolor == "B" {
            figura = ustawieniefigur[kod]?[0] ?? ""
            mozeniemoze = zasady.sprawdzaniepoprawnosci(ruch1: l1, ruch2: l2, figura: figura, kolor: "B", zapisgry:zapisgry, ustawieniefigur:ustawieniefigur, zapisparti: zapispartii)
        }
        if (zapisgry.count/64)%2 == 0 && kolor == "B"
        {
            mozeniemoze=false
        }
        else if (zapisgry.count/64)%2 != 0 && kolor == "C"
        {
            mozeniemoze=false
        }
        if mozeniemoze == false
        {
            if mat == false
            {
            view.viewWithTag(kod)?.frame.origin = zamianapole(pole: l1)
            }
            
        }
           
        
        else if kod != 0 && mozeniemoze==true
        {
           
               
                    if removefigura != 0 && mat == false
                    {
                        view.viewWithTag(removefigura)?.isHidden = true
                    }
                    for l in 0...63
                    {
                        zapisgry.append(zapisgry[roz-64+l])
                    }
                    zapisgry[roz+l2-1] = kod
                    zapisgry[roz+l1-1] = 0
            if figura == "K" && abs(l1-l2) == 2
            {
                if l2 > l1
                {
                    if mat == false
                    {
                    view.viewWithTag(l1+3)?.frame.origin = zamianapole(pole: l1+1)
                    }
                   
                    zapisgry[zapisgry.count-65+l2+1] = 0
                    zapisgry[zapisgry.count-65+l2-1] = l2+1
                }
                else
                {
                    if mat == false
                    {
                    view.viewWithTag(l1-4)?.frame.origin = zamianapole(pole: l1-1)
                    }
                    
                    zapisgry[zapisgry.count-65+l2-2] = 0
                    zapisgry[zapisgry.count-65+l2+1] = l2-2
                }
            }
                
            
            
        }
        if kod != 0 && mozeniemoze == true && (zapisgry.count/64)%2 != 0
        {
            
            for int in zapisgry.count-64..<zapisgry.count
            {
                if zapisgry[int]==5
                {
                    czarnykrol=int-zapisgry.count+65
                }
            }

            if zasady.czyatakowane(pole: czarnykrol, kolor: "C",zapisgry: zapisgry,ustawieniefigur: ustawieniefigur) == false
            {
                if mat == false
                {
                    //timer1.invalidate()
                    zapispartii.append(zasady.zapisszachowy(pole: l2, kolor: "C", ustawieniefigur: ustawieniefigur, zapisgry: zapisgry))
                    
                view.viewWithTag(kod)?.frame.origin = zamianapole(pole: l2)
                zaznaczenie = (zapisgry.count-64)/64
                 
                    if figura=="P" && kolor == "C" && y==8
                    {
                        przemianakolor = "C"
                        if uzyte.contains(4) == false
                        {
                            uzyte.append(4)
                            animacja(tekst: "\nSłychać przerażenia wrzask.\nTo żołnierz przemienił się w blask.")
                        }
                        
                        performSegue(withIdentifier: "przemiana", sender: self)
                        
                        
                    }
                    if figura=="P" && kolor == "B" && y==1
                    {
                        przemianakolor = "B"
                        if uzyte.contains(4) == false
                        {
                            uzyte.append(4)
                            animacja(tekst: "\nSłychać przerażenia wrzask.\nTo żołnierz przemienił się w blask.")
                        }
                        performSegue(withIdentifier: "przemiana", sender: self)
                       
                    }
                    
                }
            }
            else
            {
                view.viewWithTag(kod)?.frame.origin = zamianapole(pole: l1)
                zapisgry = zapisgry.dropLast(64)
            }
            
            
        }
        else if kod != 0 && mozeniemoze == true && (zapisgry.count/64)%2 == 0
        {
            
            for int in zapisgry.count-64..<zapisgry.count
            {
                if zapisgry[int]==61
                {
                    bialykrol=int-zapisgry.count+65
                }
            }

            if zasady.czyatakowane(pole: bialykrol, kolor: "B",zapisgry: zapisgry,ustawieniefigur: ustawieniefigur) == false
            {
                if mat == false
                {
                    zapispartii.append(zasady.zapisszachowy(pole: l2, kolor: "B", ustawieniefigur: ustawieniefigur, zapisgry: zapisgry))
                    
                view.viewWithTag(kod)?.frame.origin = zamianapole(pole: l2)
                zaznaczenie = (zapisgry.count-64)/64
                    
                    if figura=="P" && kolor == "C" && y==8
                    {
                        performSegue(withIdentifier: "przemiana", sender: self)
                        przemianakolor = "C"
                    }
                    if figura=="P" && kolor == "B" && y==1
                    {
                        performSegue(withIdentifier: "przemiana", sender: self)
                        przemianakolor = "B"
                    }
                    
                }
                
                
            }
            else
            {
                view.viewWithTag(kod)?.frame.origin = zamianapole(pole: l1)
                zapisgry = zapisgry.dropLast(64)
                
            }
            
        }
    }
        
    func tworzeniedaneX()
    {
        for int in 65...72
        {
            daneX.append(view.viewWithTag(int)!.frame.maxX)
        }
    }
    @objc func poruszanie(_ sender: UIPanGestureRecognizer)
    {
        var pozycja = CGPoint()
        
        let tagprzytrzymanejfigury = zapisgry[zapisgry.count-65+przycisktag-64]
        if tagprzytrzymanejfigury > 0 && tagprzytrzymanejfigury<65
        {
            let objekt = view.viewWithTag(tagprzytrzymanejfigury)
            let location = sender.location(in: view.viewWithTag(-1)!)
            if sender.state == .began
            {
                pozycja = objekt!.center
            }
            if sender.state != .cancelled
            {
                let nowapozycja = CGPoint(x: pozycja.x + location.x, y: pozycja.y + location.y)
                objekt?.center = nowapozycja
            }
            
            else
            {
                objekt?.center = pozycja
            }
            if sender.state == .ended
            {
                let maxX = view.viewWithTag(72)!.frame.minX + 10
                
                if objekt!.frame.minX < -10 || objekt!.frame.minX>maxX || objekt!.frame.minY < -10 || objekt!.frame.minY>maxX
                {
                    let tap = view.viewWithTag(przycisktag) as! UIButton
                    przycisk(tap)
                    objekt!.frame.origin = zamianapole(pole: przycisktag-64)
               }
                else
                {
                    var poleX: Int = 10
                    var poleY: Int = 10
                    for int in 0...7
                    {
                        if objekt!.center.x>daneX[int] && objekt!.center.x<daneX[int+1]
                        {
                            poleX = int+1
                            
                        }
                        if objekt!.center.y>daneX[int] && objekt!.center.y<daneX[int+1]
                        {
                            poleY = int
                        }
                    }
                    if poleX != 10 && poleY != 10
                    {
                        //objekt!.frame.origin = zamianapole(pole: poleY*8 + poleX)
                        let tap = view.viewWithTag(poleY*8 + poleX+64) as! UIButton
                        przycisk(tap)
                    }
                }
            }
            
        }
        
    }
 

}








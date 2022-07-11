//
//  BergmanViewController.swift
//  projectchess
//
//  Created by Jan Tlaga on 25/06/2022.
//

import UIKit

class BergmanViewController: UIViewController {
    
    @IBOutlet weak var pagecontrol: UIPageControl!
    var ustawieniepoczatkowe : [Int:String] = [1:"CW1",2:"CS2",3:"CG1",4:"CQ1",5:"CK",6:"CG2",7:"CS2",8:"CW2", 9:"CP1", 10:"CP2", 11:"CP3", 12:"CP4",13:"CP5", 14:"CP6", 15:"CP7",16:"CP8",49:"P1",50:"P2",51:"P3",52:"P4",53:"P5",54:"P6",55:"P7",56:"P8", 57:"W1", 58:"S1", 59:"G1", 60:"Q1",61:"K", 62:"G2", 63:"S2",64:"W2"]
    var zapisgry:[Int] = []
    @IBOutlet weak var tlopunktacja: UIView!
    @IBOutlet weak var punktacja: UILabel!
    var ustawieniefigur : [Int:String]!
    let zadanie1 = [46,22, 15, 22, 37, 39, 7, 8, 43, 22]
    let zadanie2 = [11,15,16,15,40,22,15,7,22,23,7,6,36,27]
    let zadanie3 = [36,4,7,16,4,8,16,8,31,24,8,7,24,15]
    let zadanie4 = [12,15,7,15,28,31,15,6,31,22,6,7,22,14]
    var zadanieruch = 0
    var zaznaczenie1:Int = 0
    var zaznaczenie2:Int = 0
    var zaznaczenie:Int = 0
    var savetap:UIButton!
    var przycisktag:Int!
    var daneX: [CGFloat] = [0]
    var zadania: [Bool] = [true ,false, false ,false]
    var punkty = 0
    var zapispartii:[String] = []
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tlolabel: UIView!
    let zasady = reguly()
    var przemianakolor = "N"
    
    var ostatnitag = 128

    override func viewDidLoad() {
        super.viewDidLoad()
        
        zapisgry = funtabliczapoczatek()
        zapisgry.append(contentsOf: funtabliczapoczatek())
        ustawieniefigur = ustawieniepoczatkowe
        tworzenieszachownicy()
        poczatektworzenie(dane: ustawieniepoczatkowe)
        funtworzenieprzyciskow()
        let pangesture = UIPanGestureRecognizer(target: self, action: #selector(self.poruszanie(_:)))
        view.viewWithTag(-1)!.addGestureRecognizer(pangesture)
        tworzeniedaneX()
        pagecontrol.currentPage = 0
        zagadki(numer: pagecontrol.currentPage+1)
        poziomy()
        label.alpha = 0
        
        //animacjatekst(tekst: "hej czekalem")
        
    }
    
    @IBOutlet weak var tlo: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        animacjatekst(tekst: "Czekałem na ciebie. Jeżeli wygrasz to puscze cię wolno.")
    }
    @IBAction func pagecon(_ sender: UIPageControl) {
        poziomy()
    }
    func liczbapunktow()
    {
        
        punktacja.text = String(punkty)
        punktacja.text! += "/4"
    }
    func animacjatekst(tekst:String)
    {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.label.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseIn, animations: {
            self.label.text = tekst
            self.label.alpha = 1.0
        }, completion: nil)
        
    }
    func poziomy()
    {
        liczbapunktow()
        if pagecontrol.currentPage == 0 {view.viewWithTag(-2)?.isHidden = true}
        else if zadania[pagecontrol.currentPage] == false
        {
            view.viewWithTag(-2)?.isHidden = false
        }
        
        else {view.viewWithTag(-2)?.isHidden = true}
        zadanieruch=0
        switch pagecontrol.currentPage
        {
        case 0:
            zapisgry.removeAll()
            zapisgry = funtabliczapoczatek()
            zapisgry.append(contentsOf: funtabliczapoczatek())
            zagadki(numer: 1)
            odczytpozycji(posuniecie: 2)
        case 1:
            zapisgry.removeAll()
            zapisgry = funtabliczapoczatek()
            zapisgry.append(contentsOf: funtabliczapoczatek())
            zagadki(numer: 2)
            odczytpozycji(posuniecie: 2)
        case 2:
            
            zapisgry.removeAll()
            zapisgry = funtabliczapoczatek()
            zapisgry.append(contentsOf: funtabliczapoczatek())
            zagadki(numer: 3)
            odczytpozycji(posuniecie: 2)
        case 3:
            
            zapisgry.removeAll()
            zapisgry = funtabliczapoczatek()
            zapisgry.append(contentsOf: funtabliczapoczatek())
            zagadki(numer: 4)
            odczytpozycji(posuniecie: 2)
            
        default:
            odczytpozycji(posuniecie: 2)
        }
    }
    @IBAction func zmianazadania(_ sender: UIPageControl) {
        zadanieruch=0
        
    }
    func zagadki(numer:Int)
    {
        switch numer
        {
        case 1:
            zapisgry.append(contentsOf: [0,0,1,0,0,8,5,0,9,0,4,0,0,10,11,12,0,0,0,0,0,0,0,0,0,0,13,56,0,0,0,0,0,0,0,0,57,0,0,0,0,0,59,0,0,60,55,0,0,54,0,0,0,0,0,53,0,0,0,0,0,0,61,0])
        case 2:
            zapisgry.append(contentsOf: [1,0,0,0,0,0,0,0,0,3,64,0,0,0,9,5,0,0,0,0,0,10,0,13,0,0,0,0,51,0,0,0,0,12,0,59,0,0,52,60,0,53,0,0,0,0,0,0,54,0,0,0,4,0,0,0,0,61,0,0,0,0,0,0,])
            
            
        case 3:
            zapisgry.append(contentsOf: [0,0,0,0,0,0,5,0,9,0,0,0,0,10,11,0,0,0,0,0,0,0,2,0,0,12,0,0,0,0,60,13,0,55,0,57,0,0,0,0,54,0,0,0,0,0,53,4,0,59,1,0,0,0,0,52,0,0,0,0,0,0,61,0])
        case 4:
            zapisgry.append(contentsOf: [0,0,4,0,1,0,5,0,0,0,2,57,0,0,9,10,11,0,0,0,55,12,0,0,52,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,54,0,0,0,0,0,0,53,0,59,0,0,0,0,0,0,61])
            
        default:
            zapisgry.append(contentsOf: [0,0,1,0,0,8,5,0,9,0,4,0,0,10,11,12,0,0,0,0,0,0,0,0,0,0,13,56,0,0,0,0,0,0,0,0,57,0,0,0,0,52,0,0,0,0,0,55,0,54,0,0,0,0,0,0,59,0,0,0,0,0,0,61])
            
        }
        
        
    }
    func przemiana(figurazmiana:String) {
        
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
   
    @IBAction func powrotWithSegue(segue: UIStoryboardSegue) {
                          
                          }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ekran = segue.destination as? szachmatViewController
        {
            
            var wygrany = "czarne"
            if ((zapisgry.count-64)/64) % 2 != 0 {wygrany="białe"}
            ekran.wygranykolor = wygrany
            ekran.zapisgry = zapisgry
        }
        if let ekran = segue.destination as? przemianaViewController
        {
            ekran.kolor = przemianakolor
        }
    }
    func tworzenieszachownicy()
    {
        let rozmiiarszachownicy = ((self.view.frame.size.width-20)/8).rounded(.down)*8
        let zdjecie = UIImageView(frame: CGRect(x: 0, y: 0, width: rozmiiarszachownicy, height: rozmiiarszachownicy))
        zdjecie.frame.origin = CGPoint(x: (self.view.frame.size.width-rozmiiarszachownicy)/2, y: self.view.frame.height/2-zdjecie.frame.width/2)
        zdjecie.image = UIImage(named: "szachownicawutang2")
        zdjecie.isUserInteractionEnabled = true
        zdjecie.tag = -1
        let lock = UIImageView(frame: CGRect(x: 0, y: 0, width: rozmiiarszachownicy, height: rozmiiarszachownicy))
        lock.frame.origin = CGPoint(x: (self.view.frame.size.width-rozmiiarszachownicy)/2, y: self.view.frame.height/2-zdjecie.frame.width/2)
        
        self.tlo.frame.size.width = rozmiiarszachownicy
        
        lock.image = UIImage(systemName: "lock.fill")
        lock.tintColor = UIColor.black
        lock.isUserInteractionEnabled = false
        lock.tag = -2
        view.addSubview(zdjecie)
        view.addSubview(lock)
        tlo.translatesAutoresizingMaskIntoConstraints = true
        tlo.frame.size.width = rozmiiarszachownicy
        tlo.frame.origin = CGPoint(x: (self.view.frame.size.width-rozmiiarszachownicy)/2, y: self.view.frame.height/2-zdjecie.frame.width/2-tlo.frame.height-10)
        tlopunktacja.translatesAutoresizingMaskIntoConstraints = true
        tlopunktacja.frame.size.width = rozmiiarszachownicy/4
        punktacja.frame.size.width = rozmiiarszachownicy/4
        tlopunktacja.frame.origin = CGPoint(x: (self.view.frame.size.width-rozmiiarszachownicy)/2, y: lock.frame.maxY+10)
        
        
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
            pole.tintColor = UIColor.white
            self.view.viewWithTag(-1)!.addSubview(pole)
            pole.addTarget(self, action: #selector(przytrzymanie(_:)), for: .touchDown)
            pole.frame.origin = zamianapole(pole: i-64)
        }
        
    }
    @IBAction func przytrzymanie(_ sender: UIButton)
    {
        if sender.tag > 64 && sender.tag<129
        {
            przycisk(sender)
            przycisktag = sender.tag
            
        }
        
    }
    func przycisk(_ sender: UIButton)
    {
        
        
        if zaznaczenie1==0
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
        else if sender.tag-64 == zaznaczenie1
        {
            zaznaczenie1=0
            dozwoloneposuniecia(tag: savetap.tag, ktory: false )
        }
        else if zaznaczenie2==0
        {
            
            view.viewWithTag(zapisgry[zapisgry.count+savetap.tag-129])?.backgroundColor=UIColor.white.withAlphaComponent(0)
            dozwoloneposuniecia(tag: savetap.tag, ktory: false )
            zaznaczenie2=sender.tag-64
            rozkmina(l1: zaznaczenie1, l2: zaznaczenie2, mat: false)
            
            //zaznaczenie1=0
            //zaznaczenie2=0
            
            var dane:[Int]!
            switch pagecontrol.currentPage
            {
            case 0:
                dane = zadanie1
            case 1:
                dane = zadanie2
            case 2:
                dane = zadanie3
            case 3:
                dane = zadanie4
            default:
                dane = zadanie1
            }
            let p = zadanieruch
            if zadanieruch+1<dane.count
            {
                
                if zaznaczenie1 == dane[zadanieruch] && zaznaczenie2 == dane[zadanieruch+1]
                {
                    zadanieruch = zadanieruch+2
                    
                    if zadanieruch+2<dane.count && ((zapisgry.count)/64)%2 == 0
                    {
                        animacjatekst(tekst: "dobry ruch")
                        zaznaczenie1=0
                        zaznaczenie2=0
                        //zadanieruch = zadanieruch+2
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.przytrzymanie(self.view.viewWithTag(dane[self.zadanieruch]+64) as! UIButton)
                            self.przytrzymanie(self.view.viewWithTag(dane[self.zadanieruch+1]+64) as! UIButton)
                        }
                        
                       // zadanieruch = zadanieruch+2
                        
                        
                    }
                    if zadanieruch == dane.count && pagecontrol.currentPage != 3
                    {
                        punkty += 1
                       animacjatekst(tekst: "Ciekawe czy z kolejnym zadaniem sobie poradzisz")
                        
                        zadania[pagecontrol.currentPage+1] = true
                        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                            
                            self.pagecontrol.currentPage = self.pagecontrol.currentPage + 1
                            self.poziomy()
                        }, completion: nil)
                    }
                    else if zadanieruch == dane.count && pagecontrol.currentPage == 3
                    {
                        punkty += 1
                        poziomy()
                        
                    }
                    
                    
                    
                    
                     
                }
                else
                {

                    animacjatekst(tekst: "zły ruch")
                    print("zlyyy")
                    
                   
                    
                    UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                            self.poziomy()
                        }, completion: nil)
                    
                    zadanieruch=0
                }
                
            }
            zaznaczenie1=0
            zaznaczenie2=0
            
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
        var czas = 0.0
        if ((zapisgry.count)/64)%2 == 0 {czas = 0.5}
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
                    UIView.animate(withDuration: 0.5, delay: czas, options: .curveLinear, animations: { [self] in
                        view.viewWithTag(kod)?.frame.origin = zamianapole(pole: l2)
                    }, completion: nil)
                zaznaczenie = (zapisgry.count-64)/64
                    //zapisgry = zapisgry.dropLast(64)
                    
                    if figura=="P" && kolor == "C" && y==8
                    {
                        przemianakolor = "C"
                        performSegue(withIdentifier: "przemiana", sender: self)
                        
                    }
                    if figura=="P" && kolor == "B" && y==1
                    {
                        przemianakolor = "B"
                        performSegue(withIdentifier: "przemiana", sender: self)
                       
                    }
                    
                }
            }
            else
            {
                
                
               
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
                    UIView.animate(withDuration: 0.5, delay: czas, options: .curveLinear, animations: { [self] in
                        view.viewWithTag(kod)?.frame.origin = zamianapole(pole: l2)
                    }, completion: nil)
                    
                zaznaczenie = (zapisgry.count-64)/64
                    //zapisgry = zapisgry.dropLast(64)
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
               
                zapisgry = zapisgry.dropLast(64)
                
            }
            
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
                UIView.animate(withDuration: 0.5, delay: czas , options: .curveLinear, animations: {
                    self.view.viewWithTag(removefigura)?.layer.opacity = 0
                    
                    
                }, completion: nil)
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
                    //zapisgry[zapisgry.count-65+l2-1] = l2+1
                }
                else
                {
                    if mat == false
                    {
                    view.viewWithTag(l1-4)?.frame.origin = zamianapole(pole: l1-1)
                    }
                    
                    //zapisgry[zapisgry.count-65+l2-2] = 0
                    //zapisgry[zapisgry.count-65+l2+1] = l2-2
                }
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
 

}



//
//  infoViewController.swift
//  projectchess
//
//  Created by Jan Tlaga on 25/06/2022.
//

import UIKit

class infoViewController: UIViewController {
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var tytul: UITextView!
    @IBOutlet weak var tekst: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pagecontrol.currentPage = 0
        zmiana(self)
        
    }
   
    @IBAction func unwind(segue: UIStoryboardSegue) {
                          }

    @IBAction func zmiana(_ sender: Any) {
        tekst.isHidden = false

        switch pagecontrol.currentPage
        {
        case 0:
            photo.image = UIImage(named: "yokolenon")
            tytul.text = "Autor: Yoko Ono"
            tekst.text = "Zamiana rywalizacji w kooperację jest najczęściej li tylko postulatem i „pobożnym” życzeniem ludzi biznesu. Wartość takiej transformacji jest znana, ale jej urzeczywistnienie napotyka na wiele trudności, które wiążą się głównie z automatycznie wyzwalanym nawykiem gry w „moje lepsze/moje na wierzchu”. Jak to zmienić? Odpowiedni model postępowania posuwają „białe szachy”. Metafora bazuje na realnym obiekcie, jakim są „szachy zaufania” (oryg. Play it by trust), wymyślone przez Yoko Ono. Artystka wystawiła planszę z białymi pionami i figurami pierwszy raz w 1966 roku w londyńskiej Indica Gallery.\n\nźrodło:https://pl.linkedin.com/pulse/b-białe-szachy-pawel-fortuna"
        case 1:
            photo.image = UIImage(named: "poleandersson")
            tytul.text = "Autorzy: Benny Andersson,Tim Rice i Björn Ulvaeus"
            tekst.text = "Akcja musicalu dzieje się w latach zimnej wojny, kiedy istniał ZSRR. Dwóch szachistów: Amerykanin Frederick „Freddie” Trumper i Rosjanin Anatolij Siergiejewski, walczą przeciwko sobie w szachowych mistrzostwach rozgrywanych w Merano. Asystentką, a zarazem kochanką Freddiego jest Florence Vassy, uchodźczyni z Węgier, która w trakcie rozgrywek zakochuje się ze wzajemnością w Anatoliju. Mężczyzna wygrywa rozgrywkę i prosi o azyl na Zachodzie.  Następnie udaje się do Bangkoku na kolejne rozgrywki, tym razem z Rosjaninem Vilgadem. Florence dowiaduje się, że Anatolij pozostawił w Rosji żonę, Swietłanę. Jednocześnie Trumper, telewizyjny komentator zawodów, grozi mu, że jeśli przegra rozgrywkę, władze radzieckie wyjawią prawdę o ojcu Florence, który zaginął podczas powstania na Węgrzech w 1956.\n\n źródło:https://www.wikiwand.com/pl/Chess_(musical)"
        case 2:
            photo.image = UIImage(named: "matiss")
            tytul.text = "Autor: Henri Matisse"
            tekst.text = "Na wielu jego obrazach pojawia się motyw szachów."
            tekst.largeContentImage = UIImage(named: "matiss")
        default:
            photo.image = UIImage(named: "Witold")
            tytul.text = "Witold Gombrowicz grający w szachy"
            tekst.text = "Witold Gombrowicz należy do pisarzy wyjątkowych. Urodził się 4 sierpnia 1904 roku w Małoszycach koło Opatowa. Studiował na Wydziale Prawa Uniwersytetu Warszawskiego. Tytuł magistra obronił w 1927 roku. Nazywany był mistrzem zrywania masek, uznawany za tego, który najlepiej opisał grę i teatralność relacji międzyludzkich. Pisał „… bo nie ma ucieczki przed gębą, jak tylko w inną gębę. A przed człowiekiem schronić się można tylko w objęcia innego człowieka. Przed pupą nie ma zaś w ogóle ucieczki – ścigajcie mnie, jeśli chcecie!”. W świadomości wielu był wiecznym prowokatorem, zabawiającym się kosztem otoczenia, człowiekiem niezwykle pewnym swojej wartości. Ale miał też „ludzkie” cechy. Jedną z nich była… gra w szachy.  Uwielbiał tę grę. Prawie zawsze wygrywał, bo przyjmował pozycję atakującego, był w natarciu. Brał pionek do ręki i aby wytrącić z równowagi przeciwnika, stukał nim o szachownicę… .\n\nźródło:https://proszewycieczki.wordpress.com/2020/04/11/radom-szachy-z-gombrowiczem/"
            
           
        }
    }
    

}

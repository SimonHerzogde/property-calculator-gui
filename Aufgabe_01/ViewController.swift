//
//  ViewController.swift
//  Aufgabe_01
//
//  Created by Simon Herzog on 16.03.21.
//

import Cocoa

class ViewController: NSViewController {
    
    //die Outlets für die Textfelder, welche die Eingaben der Werte entgegen nehmen
    @IBOutlet weak var inputLength: NSTextField!
    @IBOutlet weak var inputWidth: NSTextField!
    @IBOutlet weak var inputSquareMeterPrice: NSTextField!
    
    //Outlets für die Labels, die die Preise anzeigen
    @IBOutlet weak var netPrice: NSTextField!
    @IBOutlet weak var brokeragePrice: NSTextField!
    @IBOutlet weak var totalPrice: NSTextField!
    
    
    //Action bei Klick auf Berechnen Button
    @IBAction func calculateClicked(_ sender: Any) {
        //die Konstanten für die Provision und die Mehrwertsteuer
        let brokerage = 1.05
        let vat = 1.19
        
        //Berechnung des Nettopreises: Länge * Breite für die Quadratmeter und das wird mit dem Preis pro qm multipliziert
        //eine Zwischenspeicherung der Werte inputLength etc. in Konstanten ist nicht notwendig aber würde ich der Übersicht halber machen, wenn es noch mehr Werte werden würden
        //round(... * 100) / 100.0 dient dazu, die Ergebnisse auf 2 Nachkommastellen zu runden, was meiner Meinung nach passend ist bei Preisangaben.
        netPrice.doubleValue = round(((inputLength.doubleValue * inputWidth.doubleValue) * inputSquareMeterPrice.doubleValue) * 100) / 100.0
        
        //Berechnung Preis inkl. Provision: einfach Nettopreis mit Provision multiplizieren
        brokeragePrice.doubleValue = round((netPrice.doubleValue * brokerage) * 100) / 100.0
        
        //Berechnung des Gesamtpreises: Provisionspreis mal Mehrwertsteuer
        totalPrice.doubleValue = round((brokeragePrice.doubleValue * vat) * 100) / 100.0
        
    }
    
    //Action bei Klick auf Beenden Button
    @IBAction func quitClicked(_ sender: Any) {
        //diese Instanz (self) wird terminiert
        NSApplication.shared.terminate(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


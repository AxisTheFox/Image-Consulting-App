//
//  ViewController.swift
//  FoxBraydonAssignment2Part3
//
//  Created by Fox, Braydon on 10/2/16.
//  Copyright © 2016 Fox, Braydon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let pickerData = [["Makeover", "Hair Styling", "Manicure", "Perm. Makeup"], ["None", "10%", "20%"]]
    
    enum pickerComponent:Int {
        case service = 0
        case discount = 1
    }
    
    var selectedService = ""
    var selectedDiscount = ""
    
    // MARK: Outlets and Properties
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var servicePicker: UIPickerView!

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        servicePicker.dataSource = self
        servicePicker.delegate = self
        updateSelection()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Delegates and Data Source
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateSelection()
    }
    
    // MARK: Actions
    @IBAction func calculateButton(sender: AnyObject) {
        let servicePrice = getServicePriceFrom(selectedService)
        let discountAmount = getDiscountFrom(selectedDiscount)
        let totalCost = servicePrice - (servicePrice * discountAmount)
        totalCostLabel.text = "$" + String.localizedStringWithFormat("%.2f", totalCost)
    }
    
    // MARK: Instance Methods
    func updateSelection() {
        let serviceComponent = pickerComponent.service.rawValue
        let discountComponent = pickerComponent.discount.rawValue
        let service = pickerData[serviceComponent][servicePicker.selectedRowInComponent(serviceComponent)]
        let discount = pickerData[discountComponent][servicePicker.selectedRowInComponent(discountComponent)]
        selectedService = service
        selectedDiscount = discount
    }
    
    func getServicePriceFrom(service: String) -> Double {
        if (service == "Makeover") {
            return 125.00
        } else if (service == "Hair Styling") {
            return 60.00
        } else if (service == "Manicure") {
            return 35.00
        } else if (service == "Perm. Makeup") {
            return 200.00
        } else {
            return 0.00
        }
    }
    
    func getDiscountFrom(discount: String) -> Double {
        if (discount == "None") {
            return 0.00
        } else if (discount == "10%") {
            return 0.10
        } else {
            return 0.20
        }
    }

}


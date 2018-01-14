//
//  ColorSpecsTableViewController.swift
//  ColorSpecs
//
//  Created by Akhila Ballari on 10/17/17.
//  Copyright © 2017 Akhila Ballari. All rights reserved.
//

import UIKit

struct ColorSpec {
    var color: UIColor
    var colorName: String
}

class ColorSpecsTableViewController: UITableViewController {
    
    var colorSpecs: [ColorSpec] = [ColorSpec.init(color: .red, colorName: "Red"),
                                   ColorSpec.init(color: .blue, colorName: "Blue")]

    @IBAction func addColor(_ sender: Any) {
        ColorPickerViewController.present(over: self) {
            (colorSpec) in
            self.colorSpecs.append(colorSpec)
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return colorSpecs.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let colorSpec = colorSpecs[indexPath.row]
        cell.textLabel?.text = colorSpec.colorName
        cell.textLabel?.textColor = colorSpec.color
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController, let tableViewCell = sender as? UITableViewCell, let index = tableView.indexPath(for: tableViewCell)
        {
            let colorSpec = colorSpecs[index.row]
            destination.colorSpec = colorSpec
        }
    }

}

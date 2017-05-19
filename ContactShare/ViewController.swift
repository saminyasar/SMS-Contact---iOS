//
//  ViewController.swift
//  ContactShare
//
//  Created by Samin Yasar on 2/15/17.
//  Copyright © 2017 Appdragon. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
        //addContact()
        fetchContact()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchContact() -> Void {
        
        let contactStore = CNContactStore()
        
        let keyToFetch = [
                            CNContactFormatter.descriptorForRequiredKeys(for: CNContactFormatterStyle.fullName),
                            CNContactEmailAddressesKey as NSString,
                            CNContactPhoneNumbersKey as NSString,
                            CNContactImageDataAvailableKey as NSString,
                            CNContactThumbnailImageDataKey as NSString
                            ] as [CNKeyDescriptor]
        
        var allContainers : [CNContainer] = []
        
        do{
            allContainers = try contactStore.containers(matching: nil)
            
        }catch{
            print("Error Fetching Contacts")
        }
        
        var results:[CNContact] = []
        
        for container in allContainers{
            
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do{
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keyToFetch)
                results.append(contentsOf: containerResults)
            }
            catch{
                print("Error fetching for container")
            }
        }
        
        print(results)
        
    }
    
    func addContact() -> Void {
        
        let contact = CNMutableContact()
        
        contact.imageData =  UIImagePNGRepresentation(UIImage.init(named: "ContactImage")!);
        
        contact.givenName = "Abul"
        contact.familyName = "Hayat"
        
        let homeEmail = CNLabeledValue(label:CNLabelHome, value:"john@example.com" as NSString)
        let workEmail = CNLabeledValue(label:CNLabelWork, value:"j.appleseed@icloud.com" as NSString)
        contact.emailAddresses = [homeEmail, workEmail]
        
        contact.phoneNumbers = [CNLabeledValue(label: CNLabelPhoneNumberMain,
                                               value: CNPhoneNumber(stringValue: "0161111111111111111"))]
        
        let homeAddress = CNMutablePostalAddress()
        homeAddress.street = "Road 1 & 1/B"
        homeAddress.city = "Dhaka"
        homeAddress.state = "CA"
        homeAddress.postalCode = "9191919"
        
        contact.postalAddresses = [CNLabeledValue(label: CNLabelHome, value: homeAddress)]
        
        let birthdayOfContact = NSDateComponents()
        birthdayOfContact.day = 1
        birthdayOfContact.month = 4
        birthdayOfContact.year = 1999
        
        contact.birthday = birthdayOfContact as DateComponents;
        
        let store = CNContactStore()
        
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier:nil)
        
        try! store.execute(saveRequest)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        return UITableViewCell.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
     
        return 1
    }
    
    
    
    
    
    
}


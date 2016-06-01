//
//  ViewController.m
//  ZContactDemo
//
//  Created by mac on 16/5/4.
//  Copyright © 2016年 R. All rights reserved.
//

#import "ViewController.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface ViewController ()<CNContactPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CNMutableContact *contact = [[[CNMutableContact alloc] init] autorelease];
    UIImage *image = [UIImage imageNamed:@"0.jpg"];
    contact.imageData = UIImageJPEGRepresentation(image, 0.5);
    
    contact.familyName = @"Lee";
    contact.givenName = @"Chard";
    
    CNLabeledValue *phone = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:[CNPhoneNumber phoneNumberWithStringValue:@"15528299460"]];
    contact.phoneNumbers = @[phone];
    CNLabeledValue *email = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:@"9916@163.com"];
    contact.emailAddresses = @[email];
    
    CNMutablePostalAddress *postalAdd = [[[CNMutablePostalAddress alloc] init] autorelease];
    postalAdd.country = @"China";
    postalAdd.city = @"ZhengZhou";
    postalAdd.street = @"YangJin";
    
    CNLabeledValue *postalLabel = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:postalAdd];
    contact.postalAddresses = @[postalLabel];
    
//    存
    CNSaveRequest *saveR = [[[CNSaveRequest alloc] init] autorelease];
    [saveR addContact:contact toContainerWithIdentifier:nil];
    
    CNContactStore *store = [[[CNContactStore alloc] init] autorelease];
    [store executeSaveRequest:saveR error:nil];
}

- (IBAction)goToContact:(UIButton *)sender {
    CNContactPickerViewController *contactPVC = [[CNContactPickerViewController new] autorelease];
    contactPVC.delegate = self;
    [self presentViewController:contactPVC animated:YES completion:nil];
}

- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    NSLog(@"*****%s",__FUNCTION__);
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{
     NSLog(@"*****%s",__FUNCTION__);
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
     NSLog(@"*****%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

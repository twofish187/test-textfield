//
//  TableViewControllerTests.swift
//  TextFieldTests
//
//  Created by Tobias Hähnel on 10.05.22.
//

@testable import TextField
import XCTest

class TableViewControllerTests: XCTestCase {
    
    private var sut: TableViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: TableViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        executeRunLoop()
    }
    
    
    func test_outlets_shouldBeConnected() throws {
        XCTAssertNotNil(sut.passwordField, "passwordField")
    }
       
    func test_textFieldDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.passwordField.delegate, "passwordField")
    }
    
    func test_becomeFirstResponder_withPasswordField_shouldMakePasswordFieldFirstResponder() {
        putInViewHierarchy(sut)
		sut.tableView.cellForRow(at: [0,0]) // Needed only for static tableView, get the cell in the view hierarchy
        
        sut.passwordField.becomeFirstResponder()
        
        XCTAssertTrue(sut.passwordField.isFirstResponder)
    }
    
    
}



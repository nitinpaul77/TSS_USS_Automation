@TSS_Regression
Feature: Some feature

  # Before running this script, go to https://test-ssc.dbresults.com.au/TSSAccountMgmt/DataExtensions.aspx
  # Find mbrown's account and make sure he has an CRN, an ABN and his employer status is set to 'Designated group employer for a group and lodging for itself'
  # As of 12 pm 9/1/2017 these settings have already been implemented, but double-checking them is advised.
  
 

  #NOTE: Ensure that mbrown has a current employee type selected in the data extensions page
  

	@review
  Scenario Outline: DTSP-380 -> As a user I want the ability to enter my Payroll Tax Information on the Tax Registration form so that I can register for Payroll Tax
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                                                  |
      #| item2 | Select Business Type                                      |
      #| item3 | Employer Name                                             |
      #| item4 | Business Trading Name                                     |
      #| item5 | Australian Business Number (ABN)                          |
      #| item6 | Australian Company Number (ACN)                           |
      #| item7 | Business Address                                          |
      #| item7 | Postal Address                                            |
      #| item7 | Address where Business Records are located (Jurisdiction) |
      #| item7 | Contact Person                                            |
      #| item7 | Preferred Communication Method                            |
      #| item7 | Postal Address                                            |
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    |        97110187767 |
      | RegistrationAnswer_ACN    |          110187767 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST.com          |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I wait for "2000" millisecond
    # Scenario 1...................updated with changes from 506
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                                                                     |
      #| item2 | Date Business Commenced Employing in ACT (or Recommenced)                    |
      #| item3 | Date Business Became Liable in the ACT (or Reactivated its Liability)        |
      #| item4 | Number of Employees in your ACT Business                                     |
      #| item5 | Business Activity in the ACT                                                 |
      #| item6 | Are you a member of a group?                                                 |
      #| item7 | Grouping for Payroll Tax Purposes                                            |
      #| item7 | Total Taxable Wages for the five previous financial years                    |
      #| item7 | As an eligible employer, do you wish to apply for annual lodgement approval? |
    Then I wait for "2000" millisecond
    And from section "AnnualLodgementApproval" I select radio button option "wtLabel_AnnualLodgementApproval_YES"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item7 | Annual Lodgement Request Justification |
      | item7 | Contact Person for Payroll Tax         |
    # Scenario 2
    Then I click on "MonthlyReturnBack"
    Then I wait for "2000" millisecond
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                                         |
      #| item2 | Business Activity Elsewhere in Australia         |
      #| item3 | Control and Financial Interest                   |
      #| item4 | (shares, beneficiaries if greater than 20% each) |
    Then I click on "ACTWagesPaidNext"
    # Then I click on "DateBusinessStart"
    Then I click on "DateBusinessStart"
    Then I click on "20170228"
    Then I click on "DateBusinessLiable"
    Then I click on "20170228"
    Then I enter the details as
      | Fields               | Value |
      | NumberOfEmployees    |    33 |
      | RequestJustification | TEST  |
    Then I enter the details as
      | Fields | Value |
    Then I click on "GroupMember_UNSURE"
    Then I click on "PayrollNext"
    Then I wait for "1000" millisecond
    #scenario 3
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                        |
      #| item2 | Set Up Bank Account for Refunds |
      #| item3 | BSB                             |
      #| item4 | Bank Account Number             |
    Then I click on "ConfirmBack"
    Then I wait for "2000" millisecond
    #scenario 4
    Then I select "2016" from "YearComboBox"
    Then I enter the details as
      | Fields                   | Value     |
      | TaxableACTWages          |       100 |
      | AusWideTaxableWages      |       100 |
      | GroupAusWideTaxableWages |       100 |
    Then I click on "AddTotalWages"
    Then I see text "Remove" displayed
    Then I wait for "1000" millisecond
    #Then I click on "RemoveLine"
    Then I click on button "RemoveLine"
    Then I see "Are you sure you want to remove this year's taxable wages" displayed on popup and I click "Cancel"
    #scenario 5
    Then I click on button "RemoveLine"
    Then I see "Are you sure you want to remove this year's taxable wages" displayed on popup and I click "OK"





    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12345678901 | 12345678901 |

	

  ####################################
  ####### Iteration 3 test cases######
  ####################################
  Scenario Outline: DTSP-318: As a Customer Portal Administrator (CPA), I want to be able to search for taxpayer tips on Manage Tips page so that I can find the tips I need
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #  Given I want to login to portal "<PortalName2>"
    # Remove the following step with the one above throughout test case when defect on UAP is fixed.
    Given I want to login to portal "<PortalName>"
    # Scenario 1: CPA access the 'Manage Tips' page
    And I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName             |
      #| item2 | Page                 |
      | item3 | Section              |
      | item5 | Tooltips Description |
      | item5 | Identifier           |
      | item5 | Status               |
    And I enter the details as
      | Fields      | Value      |
      | SearchInput | PayrollTax |
    Then I click on button "SearchBT"
    And I click on "Page"
    #Scenario 2: CPA searches for the taxpayer tips on the 'Manage Tips' page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item2 | PayrollTax_AustralianWide        |
      | item3 | PayrollTax_BonusesAndCommissions |
      | item5 | PayrollTax_SuperAnnuation        |
      | item5 | PayrollTax_PayrollTaxGroupNumber |
      | item5 | PayrollTax_MonthOfReturn         |
    Then I click on button "ResetBT"
    #Scenario 3: CPA filters tips on the 'Manage Tips' page
    Then I click on button "FilterByDescription"
    And I enter the details as
      | Fields                                  | Value   |
      | FilterByDescription_block_wtinputFilter | Account |
    Then I hit Enter
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                      |
      | item2 | AccountAlreadyActivatedLine1  |
      | item3 | AccountAlreadyActivatedLine2  |
      | item5 | AccountAlreadyRegisteredLine1 |
      | item5 | AccountAlreadyRegisteredLine2 |
      | item5 | AddNewAccountIntro            |
    # | item5 | LockedAccountLine1            |.............disabling because taken out...
    #Scenario 4: More than 10 search results
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields      | Value      |
      | SearchInput | PayrollTax |
    Then I click on button "SearchBT"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item2 | Counter  |
    And I enter the details as
      | Fields      | Value   |
      | SearchInput | Account |
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item2 | Counter  |

    Examples: 
      | PortalName   | PortalName2 | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS_Tooltips | TSSUAP      | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |


  @review
  Scenario Outline: DTSP-25: As an organisation I want a users details verified during registration so that only valid users register with the portal (page 1)
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Client Reference Number (CRN)   |
      | item3 | ABN                             |
      | item7 | By creating an account, I agree |
    #Scenario 4
    Then I click on "Sign In"
    Then I check I am on "Login" page
    #Scenario 5
    Then I click on "Create Account"

    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Then I check I am on "Terms of Use | DB Results - Digital Business specialists" page
    Then I see text "Terms of Use" displayed
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    #Scenario 3
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 33333333333 |
      | InputCRNNumber | 33333333333 |
    Then I click on button "RegistrationSubmit"
    Then I see text "By creating an account, I agree to the" displayed
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "The combination of the provided information does not refer to a registered in PSRM Entity" displayed
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 88070527276 |
      | InputCRNNumber | 	2 |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Registration" page
    #DTSP-29: As a user I want to enter my user details so that I can complete the registration process (page 2)
    #Scenario 1
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                 |
      | item2 | First Name               |
      | item3 | Last Name                |
      | item4 | Email Address            |
      | item5 | Choose Username          |
      | item6 | Choose Password          |
      | item7 | Hint                     |
      | item7 | Confirm Password         |
      | item7 | Already have an account? |
    #Scenario 4: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I check I am on "Login" page
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 11162041929 |
      | InputCRNNumber | 	1 |
    Then I click on button "RegistrationSubmit"
    Then I click on button "TermsandConditionsCheckBox"
    Then I check I am on "Registration" page
    Then I click on button "Submit"
    #Scenario 3: Details entered do not pass validation (Can't fully complete on this due to WIP done on the page)
    Then I enter the details as
      | Fields                 | Value       |
      | Registration_Email     | 12345678961 |
      | Registration_FirstName | Test        |
      | Registration_LastName  | Test        |
      | Registration_Username  | 12345678961 |
      | NewPassword            | 12345678961 |
      | ConfirmPassword        |   123456781 |
      | ConfirmPassword        |   123456781 |
      | PhoneNumber            |    12345671 |
      | Registration_Hint      |      123123 |
    Then I click on button "Submit"
    Then I see text "Incorrect Email Format." displayed
    Then I see text "Invalid password. Please try again." displayed
    Then I see text "Passwords do not match. Please try again." displayed
    #Scenario 5: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I check I am on "Registration" page
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "Login" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12345678901 | 12345678901 |

	@done
  Scenario Outline: DTSP-145 , As an end user I want to be able to view my user profile settings so that I know if my profile information is up to date
    #Scenario 1: User views their profile settings
    Given I want to login to portal "<PortalName>"
    And I check "UserNameEmailLabel" is marked as "Mandatory"
    Then I check "PasswordLabel" is marked as "Mandatory"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "AccountManagement"
    Then I check I am on "View Settings" page
    # Scenario 2: User access edit profile settings function
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Profile       |
      | item2 | Username      |
      | item3 | First Name    |
      | item5 | Last Name     |
      | item2 | Contact       |
      | item5 | Email Address |
      | item5 | Phone Number  |
      | item5 | Tax Agent     |
      | item5 | Security      |
      | item5 | Password      |
      | item5 | Hint          |
    And I click on "Edit"
    And I check I am on "Edit Settings" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | Item2 | Submit   |
      | Item3 | Cancel   |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

	@review
  Scenario Outline: DTSP-147
    Given I want to login to portal "<PortalName>"
    Then I check "UserNameEmailLabel" is marked as "Mandatory"
    Then I check "PasswordLabel" is marked as "Mandatory"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "AccountManagement"
    Then I click on button "EditBT"
    #Scenario 1: User accesses the edit function
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName           |
      | item2 | Username           |
      | item3 | First Name         |
      | item5 | Last Name          |
      | item5 | Email Address      |
      | item5 | Phone Number       |
      | item5 | Choose a Tax Agent |
      | item5 | Password           |
      | item5 | New Password       |
      | item5 | Confirm Password   |
      | item5 | Hint               |
    #Scenario 2: User enters incorrect input type into a restricted fields (e.g. entering 123 into an alphabet field)
    Then I enter the details as
      | Fields            | Value |
      | Input_PhoneNumber | TEST  |
    Then I check "Input_PhoneNumber" is empty
    #Scenario 3: User has not entered all the mandatory fields
    Then I check "CancelBT" is readonly
    #Scenario 4, 6: Scenario 6: Profile settings details does not pass all validations
    Then I enter the details as
      | Fields                   | Value                 |
      | Input_FirstName          | TEST                  |
      | Input_LastName           | TEST                  |
      | Input_PhoneNumber        |                 33333 |
      | Input_Email              | TEST                  |
      | Input_NewPassword        | adsfasdfaf            |
      | Input_NewpasswordConfirm | asfsadfsadf           |
      | Input_Hint               | testsetsetwetstsetset |
    Then I wait for "1000" millisecond
    Then I click on button "Input_FirstName"
    Then I click on button "Submit"
    #Then I see text "Please enter a valid email address" displayed
    Then I see text "Email expected!" displayed
    Then I see text "Invalid Phone Number. Phone Number should be 8 digits. Please try again." displayed

    Then I see text "New Password is invalid. Please try again." displayed
    Then I see text "New Password and Confirm Password do not match. Please try again." displayed
    #Scenario 8: User cancels edit function with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "View Settings" page
    Given I want to login to portal "AccountManagement"
	    Then I check I am on "View Settings" page
	   
    #Scenario 5: Profile settings details pass all validations
    Then I click on button "EditBT"
    Then I click on button "ChooseTaxAgent"
    Then I see text "Latz (12345678906)" displayed
    Then I click on "Latz (12345678906)"
    #Scenario 9: User update's Tax Agent Details (Tax Agent registered and activated on the Portal)
    #Then I select "OrganizationWithA_Z TaxAgents (98765432102)" from "ChooseTaxAgent"
    #Then I click on button "Input_FirstName"
    Then I click on button "Submit"
    Then I see text "Your changes have been successfully saved." displayed
    Then I check I am on "View Settings" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |


	@review
  Scenario Outline: DTSP-440 and DTSP-441: As an organisation I want to know the type of user who is registering so that the relevant verification information can be presented.
    #ONHOLD until the tax agent registration bug can be fixed
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #DTSP-440: Scenario 1 and 2
    Then I see checkbox "RegistrationAsBusiness" as selected
    Then I see checkbox "RegistrationAsTaxAgent" as not selected
    #DTSP-441, Scenario 1:
    Then I click on "Register as a Tax Agent"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Registration ID                        |
      | item5 | Registered Business Name               |
      | item5 | Registered Business Address            |
      | item5 | Country                                |
      | item5 | Address Line 1                         |
      | item5 | Address Line 2                         |
      | item5 | Suburb / City                          |
      | item5 | Territory / State                      |
      | item5 | Postcode                               |
      | item5 | By creating an account, I agree to the |
    #DTSP-441, Scenario 3:
    Then I check "RegistrationSubmit" is readonly
    #DTSP-441, Scenario 4: User clicks on the â€˜Sign Inâ€™ link
    Then I click on "Sign In"
    Then I check I am on "Login" page
    #DTSP-441, Scenario 5: User views Terms and Conditions
    Then I click on "Create Account"
    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on "Register as a Tax Agent"
    Then I enter the details as
      | Fields                    | Value        |
      | InputTaxAgentABN          |  81551705088 |
      | InputTaxAgentBusinessName | DAVIS, KAREN PATRICIA |
      | BusinessAddress_Address1  | TEST         |
      | BusinessAddress_Address2  | TEST         |
      | BusinessAddress_Suburb    | TEST         |
      | BusinessAddress_Postcode  |         3333 |
   	And I select "Victoria" from "BusinessAddress_StateId"
    #Then I select "Australia" from "BusinessAddress_CountryId"
    Then I click on button "TermsandConditionsCheckBox2"
    
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item5 | Phone Number     |
      | item5 | Email Address    |
      | item5 | Choose Username  |
      | item5 | Choose Password  |
      | item5 | Confirm Password |
      | item5 | Hint             |
    Then I enter the details as
      | Fields                       | Value             |
      | Registration_FirstName       | TEST              |
      | Registration_LastName        | TEST              |
      | Registration_PhoneNumber     |          33333333 |
      | Registration_Email           | TEST@asdfasdfafsd |
      | Registration_Username        | TeSTMANMAN        |
      | Registration_NewPassword     | Dbresults1        |
      | Registration_ConfirmPassword | Dbresults1        |
      | Registration_Hint            |              3333 |
    Then I check "Submit" is not readonly

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |
	
	@review
  Scenario Outline: DTSP-459
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Registration Verification' page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Australian Business Number (ABN)       |
      | item3 | Client Reference Number (CRN)          |
      | item5 | By creating an account, I agree to the |
    #Scenario 7: User clicks on the â€˜Sign Inâ€™ link
    Then I click on "Sign In"
    Then I check I am on "Login" page
    #Scenario 8: User views Terms and Conditions
    Then I click on "Create Account"
    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    #Scenario 3: User has not entered all the mandatory fields
    Then I check "RegistrationSubmit" is readonly
    #Scenario 2: User tries to enter incorrect input type into a restricted fields (e.g. entering ABC into a Number field)
    Then I enter the details as
      | Fields                  | Value |
      | InputABNNumber_Business | TEST  |
      | InputCRNNumber_Business | TEST  |
    Then I check "InputABNNumber_Business" is empty
    Then I check "InputCRNNumber_Business" is empty
    #Scenario 4: Registration details do not pass the frontend validation
    Then I enter the details as
      | Fields                  | Value |
      | InputABNNumber_Business |     3 |
      | InputCRNNumber_Business |     3 |
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "Invalid ABN. ABN Should be 11 Digits. Please try again." displayed
    #Then I see text "Invalid CRN. CRN Should be 6 digits. Please try again." displayed
    #Scenario 6: Registration details failed the verification with stubs
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 33333333333 |
      | InputCRNNumber_Business |      333333 |
    Then I click on button "RegistrationSubmit"
    Then I wait for "1000" millisecond
    Then I see text "The combination of the provided information does not refer to a registered in PSRM Entity" displayed
    #Scenario 5: Registration details verified with stubs
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 33105384585 |
      | InputCRNNumber_Business | 5 |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |
      
    @done  
     Scenario Outline: DTSP-460: s an organisation I want user inputs to be restricted & validated during Tax Agent's portal registration so that human error can be minimised
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I see checkbox "RegistrationAsBusiness" as selected
    Then I see checkbox "RegistrationAsTaxAgent" as not selected
    Then I click on "Register as a Tax Agent"
    #Scenario 1: User tries to enter incorrect input type into a restricted fields (e.g. entering ABC into a number field)
    Then I enter the details as
      | Fields                   | Value |
      | InputTaxAgentRegId       | TEST  |
      | InputTaxAgentABN         | TEST  |
      | BusinessAddress_Postcode | TEST  |
    Then I check "InputTaxAgentRegId" is empty
    Then I check "InputTaxAgentABN" is empty
    Then I check "BusinessAddress_Postcode" is empty
    #Scenario 2: Tax Agent Registration details do not pass the frontend validation
    Then I enter the details as
      | Fields                    | Value            |
      | InputTaxAgentABN          |               11 |
      | InputTaxAgentBusinessName | Automated Tester |
      | BusinessAddress_Address1  | TEST         |
      | BusinessAddress_Address2  | TEST         |
      | BusinessAddress_Suburb    | TEST         |
      | BusinessAddress_Postcode  |         3333 |
    And I select "Victoria" from "BusinessAddress_StateId"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I wait for "1000" millisecond
    Then I see text "Invalid ABN. ABN Should be 11 Digits. Please try again." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |
      
	Scenario Outline: DTSP-508: As an end user, I want to see a reminder message on the top of the Payroll Tax Registration form so I know I cannot save an incomplete form
  Given I want to login to portal "<PortalName>"
  And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
  And I hit Enter
  Then I click on "Payroll Tax Registration"
  Then I see text "Because you are not logged in, you cannot save an incomplete form for later. Please complete your form and submit it before closing your session" displayed
  Examples:
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |



   
	  @done
  Scenario Outline: DTSP-523
    # Part of this story is automatically tested by others...
  
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jbradley   |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    
    #PAYROLL TAX FORM TESTING WITH ANNUAL RECONCILIATION IS BLOCKED BY BUG DTSP-603
    Then I click on button "Discard"
    Then I check "NextSection" is readonly
    Then I click on "Monthly Return"
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "SubmitBT" is readonly
    Then I click on button "ClaimingACTProportion_Yes"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               | NO    |
      | BonusesAndCommissions                          | NO    |
      | LodgePayrollAnswer_Commissions                 | NO    |
      | LodgePayrollAnswer_Allowances                  | NO    |
      | LodgePayrollAnswer_DirectorsFees               | NO    |
      | LodgePayrollAnswer_EligibleTerminationPayments | NO    |
      | LodgePayrollAnswer_ValueOfBenefits             | NO    |
      | LodgePayrollAnswer_ShareValue                  | NO    |
      | LodgePayrollAnswer_ServiceContracts            | NO    |
      | LodgePayrollAnswer_Superannuation              | NO    |
      | LodgePayrollAnswer_OtherTaxablePayment         | NO    |
      | LodgePayrollAnswer_ExemptWages                 | NO    |
      | PayrollAnswer_AustralianWide                   | NO    |
      | GroupActWages                                | NO    |
    Then I check "SalariesAndWages" is readonly
    Then I check "BonusesAndCommissions" is readonly
    Then I check "LodgePayrollAnswer_Commissions" is readonly
    Then I check "LodgePayrollAnswer_Allowances" is readonly
    Then I check "LodgePayrollAnswer_DirectorsFees" is readonly
    Then I check "LodgePayrollAnswer_EligibleTerminationPayments" is readonly
    Then I check "LodgePayrollAnswer_ValueOfBenefits" is readonly
    Then I check "LodgePayrollAnswer_ShareValue" is readonly
    Then I check "LodgePayrollAnswer_ServiceContracts" is readonly
    Then I check "LodgePayrollAnswer_Superannuation" is readonly
    Then I check "LodgePayrollAnswer_OtherTaxablePayment" is readonly
    Then I check "LodgePayrollAnswer_ExemptWages" is readonly
    Then I check "LodgePayrollAnswer_AustralianWide" is readonly
    Then I check "GroupActWages" is readonly
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |   100 |
      | BonusesAndCommissions                          |   100 |
      | LodgePayrollAnswer_Commissions                 |   100 |
      | LodgePayrollAnswer_Allowances                  |   100 |
      | LodgePayrollAnswer_DirectorsFees               |   100 |
      | LodgePayrollAnswer_EligibleTerminationPayments |   100 |
      | LodgePayrollAnswer_ValueOfBenefits             |   100 |
      | LodgePayrollAnswer_ShareValue                  |   100 |
      | LodgePayrollAnswer_ServiceContracts            |   100 |
      | LodgePayrollAnswer_Superannuation              |   100 |
      | LodgePayrollAnswer_OtherTaxablePayment         |   100 |
      | LodgePayrollAnswer_ExemptWages                 |   100 |
      | GroupActWages	                                 |     0 |
      | PayrollAnswer_AustralianWide              |     0 |
    Then I click on button "SubmitBT"
    Then I check "wtSummarySubmitBT" is readonly
    Then I click on button "CorrectInfoDeclared"
    Then I check "wtSummarySubmitBT" is not readonly
    Then I click on button "BackBt" 
    #Then I enter the details as
      #| Fields                 | Value |
      #| AnnualLessTotalTaxPaid | NO    |
    #Then I check "AnnualLessTotalTaxPaid" is readonly
    #Then I click on button "Discard"
    #Tax Registration Form
    Then I click on "Payroll Tax Registration"
    Then I check "TaxPayerDetailsNext" is readonly
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    | NO                 |
      | RegistrationAnswer_ACN    | NO                 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  | NO                 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber | NO                 |
      | ContactPerson_Email       | TEST@TEST.com      |
    Then I check "RegistrationAnswer_ABN" is readonly
    Then I check "RegistrationAnswer_ACN" is readonly
    Then I check "PostCode" is readonly
    Then I check "ContactPerson_PhoneNumber" is readonly
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields                    | Value       |
      | RegistrationAnswer_ABN    | 97110187767 |
      | RegistrationAnswer_ACN    |   110187767 |
      | AddressLine1              | TEST        |
      | Address_City              | TEST        |
      | PostCode                  |        3333 |
      | ContactPerson_FirstName   | TEST        |
      | ContactPerson_LastName    | TEST        |
      | ContactPerson_PhoneNumber |    33333333 |
    Then I click on button "AddressLine1"
    Then I click on button "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I check "ACTWagesPaidNextBt" is readonly
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I check "PayrollNext" is readonly
    Then I enter the details as
      | Fields                   | Value |
      | TaxableACTWages          | NO    |
      | wtAusWideTaxableWages    | NO    |
      | GroupAusWideTaxableWages | NO    |
      | NumberOfEmployees        | NO    |
    Then I check "TaxableACTWages" is readonly
    Then I check "wtAusWideTaxableWages" is readonly
    Then I check "GroupAusWideTaxableWages" is readonly
    Then I check "NumberOfEmployees" is readonly
    Then I enter the details as
      | Fields                   | Value |
      | NumberOfEmployees          |    33 |
    Then I click on "DateBusinessStart"
    Then I click on "20170228"
    Then I click on "DateBusinessLiable"
    Then I click on "20170228"
    Then I click on "PayrollNext"
    Then I enter the details as
      | Fields                   | Value |
      | RegistrationAnswer_BSB          | NO    |
      | BankAccountNumber    | NO    |
      | BankAccountName | NO    |
    Then I check "RegistrationAnswer_BSB" is readonly
    Then I check "BankAccountNumber" is readonly
    Then I check "BankAccountName" is readonly
    Then I check "HiddenSubmitBT" is readonly
    
    

    Examples: 
      | PortalName | UserNameField | PasswordField | Password   |
      | TSS        | UserNameInput | PasswordInput | Dbresults1 |

  @review
  Scenario Outline: DTSP-537
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jbradley   |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: Annual Rec [Single Emp Status]
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "(01/07/2013 - 30/06/2014 / Independent employer (non-group) lodging for itself)" displayed
    #Scenario 2: Annual Rec [Multi Emp Status]
    Then I click on "Sign Out"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jscott     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Annual Reconciliation Return" displayed
    #Scenario 5: Days paid wage group Australia-wide" field removed from Payroll Tax
    Then I see text "Days paid wage group Australia-wide" not displayed
    Then I see text "(01/07/2013 - 30/06/2014 / Independent employer (non-group) lodging for itself)" displayed
    #Scenario 3: Monthly Return
    Then I click on "Sign Out"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | camido     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I check "LodgePayrollAnswer_TypeAnnual" is readonly
    Then I see text "No Annual Lodgements Available" displayed
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    #Scenario 4: Exempt wages question updated
    Then I see text "ACT wages not included on this return" displayed
    Then I click on "Sign Out"

    #Scenario 6: (Designated group employer for a group and lodging for itself’) Rename the field ‘Days where you paid or were liable to pay taxable or interstate wages’ to ‘Days where 1 group member paid or was liable to pay taxable or interstate wages’
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | mbisping     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2013" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
     Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |   100 |
      | BonusesAndCommissions                          |   100 |
      | LodgePayrollAnswer_Commissions                 |   100 |
      | LodgePayrollAnswer_Allowances                  |   100 |
      | LodgePayrollAnswer_DirectorsFees               |   100 |
      | LodgePayrollAnswer_EligibleTerminationPayments |   100 |
      | LodgePayrollAnswer_ValueOfBenefits             |   100 |
      | LodgePayrollAnswer_ShareValue                  |   100 |
      | LodgePayrollAnswer_ServiceContracts            |   100 |
      | LodgePayrollAnswer_Superannuation              |   100 |
      | LodgePayrollAnswer_OtherTaxablePayment         |   100 |
      | LodgePayrollAnswer_ExemptWages                 |   100 |
    #Then I click on button "wtSubmitBTAjaxRfrsh"
    
    Then I click on button "ClaimingACTProportion_Yes" 
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate wages" displayed
    
    #Scenario 7:  (Designated group employer and lodging a joint return for itself and other ACT group members) Rename the field ‘Days where you paid or were liable to pay taxable or interstate wages’ to ‘Days where 1 group member paid or was liable to pay taxable or interstate wages’
    Then I click on "Sign Out"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | latz     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2012" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I click on button "ClaimingACTProportion_Yes" 
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate wages" displayed
    
    Examples: 
      | PortalName | UserNameField | PasswordField | Password   |
      | TSS        | UserNameInput | PasswordInput | Dbresults1 |

  @done
  Scenario Outline: DTSP-444: As an end user, I want to know my Payroll Tax Obligations (including Month and Year) which have not been lodged so I can lodge my monthly payroll tax accordingly
    #Scenario 5: Gather Obligation List [Monthly and Annual] [Exception Path]
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | ccover     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I check "LodgePayrollAnswer_TypeMonthly" is readonly
    Then I see text "No Monthly Lodgements Available" displayed
    Then I check "LodgePayrollAnswer_TypeAnnual" is readonly
    Then I see text "No Annual Lodgements Available" displayed
    Then I check "NextSection" is readonly
    Then I click on "Sign Out"
    #Scenario 4: Gather Obligation List [Annually] [Exception Path]
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | mbrown     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I check "LodgePayrollAnswer_TypeMonthly" is readonly
    Then I see text "No Monthly Lodgements Available" displayed
    Then I select "2016" from "AnnualObligationSelect"
    Then I click on "Sign Out"
    #Scenario 3: Gather Obligation List [Monthly] [Exception Path]
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | camido     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I check "LodgePayrollAnswer_TypeAnnual" is readonly
    Then I see text "No Annual Lodgements Available" displayed
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on "Sign Out"
    #Scenario 2: Gather Obligation List [Annually] [Happy Path]
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jscott     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Annual Reconciliation Return" displayed
    Then I see text "(01/07/2013 - 30/06/2014 / Independent employer (non-group) lodging for itself)" displayed
    #Then I see text "(01/07/2015 - 30/06/2016 / Designated group employer for a group and lodging for itself / 5)" displayed
    #Scenario 1: Gather Obligation List [Monthly] [Happy Path]
    Then I click on "Payroll Tax Lodgement"
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I click on button "Discard"
    Then I click on "Monthly Return"
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "(01/01/2017 - 31/01/2017 / Designated group employer for a group and lodging for itself / 5)" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | Password   |
      | TSS        | UserNameInput | PasswordInput | Dbresults1 |

  @done
  Scenario Outline: DTSP-501: As an end user, I want the Payroll Tax Registration Form to be updated for Ease of Use
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 3: Rename the Tax Registration Form on the left navigation menu
    Then I see text "Payroll Tax Registration" displayed
    Then I click on "Payroll Tax Registration"
    #Scenario 4: Rename the Page Header of the Payroll Tax Registration Form
    Then I check I am on "Payroll Tax Registration" page
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    |        97110187767 |
      | RegistrationAnswer_ACN    |          110187767 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST.com      |
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I wait for "2000" millisecond
    #Scenario 1: Contact Person for Payroll Tax
    Then I see text "Same as Business Contact Person" displayed
    Then I click on "Same as Business Contact Person"
    #Scenario 2: User is a member of a group
    Then I click on button "GroupMember_YES"
    Then I see text "Provide group number" displayed
    And I enter the details as
      | Fields             | Value |
      | ProvideGroupNumber |  1111 |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |


    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-566: As an end user, I want the Payroll Tax Information accordion, sub section Total Taxable Wages) on the Payroll Tax Registration Form to accept calendar year input
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Registration"
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I check "TaxPayerDetailsNext" is readonly
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    |        97110187767 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |          333333333 |
      | ContactPerson_Email       | test@test.com      |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I click on button "YearComboBox"
    Then I see text "2012" displayed
    Then I see text "2013" displayed
    Then I see text "2014" displayed
    Then I see text "2015" displayed
    Then I see text "2016" displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-553: As a user, I want to see a "Total Amounts" section on my Annual Payroll Tax return form so I can enter my "Less Total Tax Paid" amount
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |   100 |
      | BonusesAndCommissions                          |   100 |
      | LodgePayrollAnswer_Commissions                 |   100 |
      | LodgePayrollAnswer_Allowances                  |   100 |
      | LodgePayrollAnswer_DirectorsFees               |   100 |
      | LodgePayrollAnswer_EligibleTerminationPayments |   100 |
      | LodgePayrollAnswer_ValueOfBenefits             |   100 |
      | LodgePayrollAnswer_ShareValue                  |   100 |
      | LodgePayrollAnswer_ServiceContracts            |   100 |
      | LodgePayrollAnswer_Superannuation              |   100 |
      | LodgePayrollAnswer_OtherTaxablePayment         |   100 |
      | LodgePayrollAnswer_ExemptWages                 |   100 |
    Then I click on button "SubmitBT"
    Then I see text "Total Tax Payable" displayed
    Then I see text "Less Total Tax Paid" displayed
    Then I see text "Total Amount Payable" displayed
    Then I enter the details as
      | Fields                 | Value |
      | AnnualLessTotalTaxPaid |    50 |
    Then I check "AnnualTotalTaxPayable" contains "$ 75.35"
    Then I check "AnnualTotalAmountPayable" contains "$ 25.35"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-536: As a Business Tax Payer, I want my details pre populated on the Payroll Tax form when I select an outstanding obligation
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    #Scenario 1: User chooses outstanding monthly obligation
    Then I click on button "Discard"
    Then I click on "Monthly Return"
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I see text "50600468817" displayed
    Then I see text "400011" displayed
    Then I click on "Payroll Tax Lodgement"
    #Scenario 2: User chooses outstanding yearly obligation
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I see text "50600468817" displayed
    Then I see text "400011" displayed

    #Scenario 3: User chooses outstanding (Monthly or Yearly) obligation and no Payroll Tax Group Number is returned (user is an independent and is not part of a group)
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-526, 531: Update the ABN LookUp Rules for Payroll Tax Registration Form / Update the first page of the Portal Registration process
    Given I want to login to portal "<PortalName>"
    #This user has the ABN 12345678933, but since it's a tax agent user it isn't shown in the lodgement form
    And I enter the details as
      | Fields        | Value       |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields                    | Value         |
      | Address_AddressLine1      | TEST          |
      | Address_City              | TEST          |
      | PostCode                  |          3333 |
      | ContactPerson_FirstName   | TEST          |
      | ContactPerson_LastName    | TEST          |
      | ContactPerson_PhoneNumber |     333333333 |
      | ContactPerson_Email       | test@test.com |
    #Scenario 7: ABN Lookup for Inactive ABN
    Then I enter the details as
      | Fields                 | Value                |
      | EmployerName           | CODAVALLI, AARADHANA |
      | BusinessTradingName    | CODAVALLI, AARADHANA |
      | RegistrationAnswer_ABN |          85613104316 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
    #Scenario 8:ABN Lookup for Invalid ABN
    Then I enter the details as
      | Fields                 | Value       |
      | EmployerName           | TEST        |
      | BusinessTradingName    | TEST        |
      | RegistrationAnswer_ABN | 11111111111 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
    #Scenario 6: ABN Lookup for Tax Agent with an active ABN, incorrect Registered Business Name, and Entity Type is not 'Individual'
    Then I enter the details as
      | Fields                 | Value             |
      | EmployerName           | DB RESULTS PTY LT |
      | BusinessTradingName    | DB RESULTS PTY LT |
      | RegistrationAnswer_ABN |       97110187767 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Your Employer Name or ACN doesn't match with your ABN. Please try again." displayed
    #Scenario 4: ABN Lookup for Tax Agent with an active ABN, incorrect Registered Business Name, and Entity Type = Individual
    Then I enter the details as
      | Fields                 | Value          |
      | EmployerName           | PSALTIS, COSMA |
      | BusinessTradingName    | PSALTIS, COSMA |
      | RegistrationAnswer_ABN |    71583328324 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Your Employer Name or ACN doesn't match with your ABN. Please try again." displayed
    #Scenario 3: ABN Lookup for Tax Agent with an active ABN, correct Registered Business Name, and Entity Type = Individual
    Then I enter the details as
      | Fields                 | Value           |
      | EmployerName           | PSALTIS, COSMAS |
      | BusinessTradingName    | PSALTIS, COSMAS |
      | RegistrationAnswer_ABN |     71583328324 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Control and Financial Interest" displayed
    Then I click on button "ACTWagesPaidBackBt"
    #Scenario 5: ABN Lookup for Tax Agent with an active ABN, correct Registered Business Name, and Entity Type is not 'Individual'
    Then I enter the details as
      | Fields                 | Value              |
      | EmployerName           | DB RESULTS PTY LTD |
      | BusinessTradingName    | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN |        97110187767 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Control and Financial Interest" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-527: Update the relationship between Business Taxpayer, Tax Agent Organisation and Users
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Capture User Details' page
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 91098629095 |
      | InputCRNNumber_Business |      400004 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    #Scenario 2: A Tax Agent organisation can have multiple users
    Given I want to login to portal "<PortalName>"
    #This user has the ABN 12345678933, but since it's a tax agent user it isn't shown in the lodgement form
    And I enter the details as
      | Fields        | Value       |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Sign Out"
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Tax Agent"
    Then I enter the details as
      | Fields                    | Value                |
      | InputTaxAgentABN          |          21006819692 |
      | InputTaxAgentBusinessName | TOYOTA SUPER PTY LTD |
      | BusinessAddress_Address1  | TEST                 |
      | BusinessAddress_Address2  | TEST                 |
      | BusinessAddress_Suburb    | TEST                 |
      | BusinessAddress_Postcode  |                 3333 |
    Then I click on button "BusinessAddress_StateId"
    Then I click on "Victoria"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    #Scenario 3: A Tax Agent Organisation can serve multiple Business Taxpayer
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value       |
      | UserNameInput | <UserName2> |
      | PasswordInput | <Password2> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I see text "Choose a Client" displayed
    Then I click on button "BusinessEntityDropdown"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | USED IN TESTING DO NOT CHANGE (2) |
    # click on the first option available (standard dropdown step doesn't seem to work here)
    Then I click on button "select2-results-1"
    Then I click on button "BusinessEntityDropdown"
    Then I enter the details as
      | Fields               | Value                  |
      | s2id_autogen1_search | USED IN TESTING DO NOT CHANGE (3) |
    Then I click on button "select2-results-1"
    Then I click on button "ClientBT"
    Then I click on button "NextSection"
    Then I click on "Sign Out"
    #Scenario 4: A business Taxypayer can only nominate one Tax Agent Organisation at any point of time
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Settings"
    Then I click on button "Edit"
    Then I click on button "ChooseTaxAgent"
    Then I see text "Latz (12345678906)" displayed
    Then I see text "Db RESULTS PTY LTD (97110187767)" displayed


    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | UserName2 | Password2  |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | taxagent1_delete    | Dbresults1 |

  @done
  Scenario Outline: DTSP-392:
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |     0 |
      | BonusesAndCommissions                          |     0 |
      | LodgePayrollAnswer_Commissions                 |     0 |
      | LodgePayrollAnswer_Allowances                  |     0 |
      | LodgePayrollAnswer_DirectorsFees               |     0 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     0 |
      | LodgePayrollAnswer_ValueOfBenefits             |     0 |
      | LodgePayrollAnswer_ShareValue                  |     0 |
      | LodgePayrollAnswer_ServiceContracts            |     0 |
      | LodgePayrollAnswer_Superannuation              |     0 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     0 |
      | LodgePayrollAnswer_ExemptWages                 |     0 |
    Then I click on button "Submit"
    Then I enter the details as
      | Fields                 | Value |
      | AnnualLessTotalTaxPaid |     0 |
    Then I click on button "TotalAmountsNextBt"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Declaration   |
      | item3 | Declarer      |
      | item4 | Organisation  |
      | item5 | Phone Number  |
      | item6 | Email Address |

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-506: Update default answer to a question on the Payroll Tax Registration form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Registration"
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I check "TaxPayerDetailsNext" is readonly
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    |        97110187767 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |          333333333 |
      | ContactPerson_Email       | test@test.com      |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I see checkbox "AnnualLodgementApproval_NO" as selected

    
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-508: As an end user, I want to see a reminder message on the top of the Payroll Tax Registration form so I know I cannot save an incomplete form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Registration"
    Then I see text "Because you are not logged in, you cannot save an incomplete form for later. Please complete your form and submit it before closing your session." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-524: As an organisation, I want to force the user to key in every 'dollar' field on the Payroll Tax Lodgement Form so that the user won't miss out any of these fields
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "SalariesAndWages" contains "$"
    Then I check "BonusesAndCommissions" contains "$"
    Then I check "LodgePayrollAnswer_Commissions" contains "$"
    Then I check "LodgePayrollAnswer_Allowances" contains "$"
    Then I check "LodgePayrollAnswer_DirectorsFees" contains "$"
    Then I check "LodgePayrollAnswer_EligibleTerminationPayments" contains "$"
    Then I check "LodgePayrollAnswer_ValueOfBenefits" contains "$"
    Then I check "LodgePayrollAnswer_ShareValue" contains "$"
    Then I check "LodgePayrollAnswer_ServiceContracts" contains "$"
    Then I check "LodgePayrollAnswer_Superannuation" contains "$"
    Then I check "LodgePayrollAnswer_OtherTaxablePayment" contains "$"
    Then I check "LodgePayrollAnswer_ExemptWages" contains "$"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |     0 |
      | BonusesAndCommissions                          |     0 |
      | LodgePayrollAnswer_Commissions                 |     0 |
      | LodgePayrollAnswer_Allowances                  |     0 |
      | LodgePayrollAnswer_DirectorsFees               |     0 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     0 |
      | LodgePayrollAnswer_ValueOfBenefits             |     0 |
      | LodgePayrollAnswer_ShareValue                  |     0 |
      | LodgePayrollAnswer_ServiceContracts            |     0 |
      | LodgePayrollAnswer_Superannuation              |     0 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     0 |
      | LodgePayrollAnswer_ExemptWages                 |     0 |
    Then I click on button "ClaimingACTProportion_Yes"
    Then I check "PayrollAnswer_AustralianWide" contains "$"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
	
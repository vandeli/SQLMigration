CREATE TABLE BOS_AP_ApMaster(
szSuppId BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 bBad   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_AP_ApMasterClass(
szSuppId BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szApClassId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AP_ApTrans(
szTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szSuppId   BOS_DT_szId (30)  NOT NULL,
 shRevNo   smallint (5,0)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 dtmPeriode   timestamp  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decRemain   BOS_DT_decAmount (18,2)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bClosed   smallint (3,0)  NOT NULL,
 dtmClosed   timestamp  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 szFInvoiceStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szInvWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szRefTrnId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 szFInvoiceUsage   BOS_DT_szSmallId (5)  NOT NULL,
 bCash   bit  NOT NULL,
 dtmDue   timestamp  NOT NULL,
 dtmDue_Printed   timestamp  NOT NULL,
 szFInvoiceType   BOS_DT_szSmallId (5)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_AP_ApTransRefDoc(
szTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szSuppId   BOS_DT_szId (30)  NOT NULL,
 shRevNo   smallint (5,0)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szRefTrnId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 szRefSuppId   BOS_DT_szId (30)  NOT NULL,
 shRefRevNo   smallint (5,0)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AP_ClaimPromoBudget(
szBudgetId BOS_DT_szId (30)  NOT NULL,
 dtmClaim   timestamp  NOT NULL,
 szBudgetType   BOS_DT_szSmallId (5)  NOT NULL,
 decBudgetValue   BOS_DT_decAmount (18,2)  NOT NULL,
 decClaimValue   BOS_DT_decAmount (18,2)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_AP_ClaimPromoBudgetItem(
szBudgetId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL,
 decBonusAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decSuppBudgetShare   BOS_DT_decAmount (18,2)  NOT NULL,
 decPrincipalCost   BOS_DT_decAmount (18,2)  NOT NULL,
 szDocumentId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szId (30)  NOT NULL,
 dtmDocument   timestamp  NOT NULL
);
CREATE TABLE BOS_AP_FApInvoice(
szFApInvoiceId BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szSuppId   BOS_DT_szId (30)  NOT NULL,
 dtmPeriode   timestamp  NOT NULL,
 szCanceledByInvId   BOS_DT_szId (30)  NOT NULL,
 szCorrectedByInvId   BOS_DT_szId (30)  NOT NULL,
 szCancelToInvId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decTax   BOS_DT_decTax (18,2)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 decCcyRate   BOS_DT_decCcyRate (18,8)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 szInvUsage   BOS_DT_szSmallId (5)  NOT NULL,
 bCash   bit  NOT NULL,
 szFakturPajakId   BOS_DT_szId (30)  NOT NULL,
 dtmFakturPajak   timestamp  NOT NULL,
 szInvType   BOS_DT_szId (30)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 szInvoiceRef   BOS_DT_szId (30)  NOT NULL,
 szAccountId   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 decCost   BOS_DT_decCcyRate (18,8)  NOT NULL,
 decRevTax   BOS_DT_decCcyRate (18,8)  NOT NULL,
 decCostTax   BOS_DT_decCcyRate (18,8)  NOT NULL,
 szFPoReceipt_sId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bJournal   smallint (3,0)  NOT NULL,
 bPosted   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 szPurchaseType   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AP_FApInvoiceItem(
szFApInvoiceId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decDiscProcent   BOS_DT_decPrice (18,8)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 decDiscount   BOS_DT_decAmount (18,2)  NOT NULL,
 bTaxable   bit  NOT NULL,
 decTax   BOS_DT_decTax (18,2)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDPP   BOS_DT_decTax (18,2)  NOT NULL,
 szInvItemType   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szInvItemUsage   BOS_DT_szSmallId (5)  NOT NULL,
 szAccountId   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 decOriginalQty   BOS_DT_decAmount (18,2),
 decOriginalPrice   BOS_DT_decAmount (18,2),
 bBonus   bit,
 szPurchaseItemType   BOS_DT_szId (30)  NOT NULL,
 szFPoReceipt_sId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AP_FSupplierPayment_s(
szFSupplierPayment_sId BOS_DT_szId (30)  NOT NULL,
 dtmFSupplierPayment   timestamp  NOT NULL,
 szFCashReceiptId   BOS_DT_szId (30)  NOT NULL,
 szDeposanId   BOS_DT_szId (30)  NOT NULL,
 szAccountId1   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId1   BOS_DT_szGLAccount (100)  NOT NULL,
 decAmount1   BOS_DT_decAmount (18,2)  NOT NULL,
 szAccountId2   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId2   BOS_DT_szGLAccount (100)  NOT NULL,
 decAmount2   BOS_DT_decAmount (18,2)  NOT NULL,
 szAccountId3   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId3   BOS_DT_szGLAccount (100)  NOT NULL,
 decAmount3   BOS_DT_decAmount (18,2)  NOT NULL,
 szAccountId4   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId4   BOS_DT_szGLAccount (100)  NOT NULL,
 decAmount4   BOS_DT_decAmount (18,2)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 szRemark   BOS_DT_szDescription (100)  NOT NULL,
 szCashAccountId   BOS_DT_szId (30)  NOT NULL,
 szCashGlSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 szApAccountId   BOS_DT_szId (30)  NOT NULL,
 szApGlSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 decControlAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 szChequeId   BOS_DT_szId (30)  NOT NULL,
 szFCashTrnId   varchar (20)  NOT NULL,
 szFCashDocId   varchar (40)  NOT NULL,
 szVoucherId   varchar (40)  NOT NULL,
 apInvoiceAmountReturn   numeric (18,0)  NOT NULL,
 apInvoiceIdReturn   BOS_DT_szId (30)  NOT NULL,
 supplierDisbursementId   BOS_DT_szId (30)  NOT NULL,
 purchaseTypeId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AP_FSupplierPayment_s_Item(
szFSupplierPayment_sId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szSuppId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decPaidByCashReceipt   BOS_DT_decAmount (18,2)  NOT NULL,
 szFDoId   BOS_DT_szId (30)  NOT NULL,
 remain_s   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AP_FSupplierPayment_s_ItemDetail(
szFSupplierPayment_sId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shDetailNumber   smallint (5,0)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 bValue   smallint (3,0)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 bDeposit   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_AP_FSupplierPromoBudget(
szFSupplierPromoBudgetId BOS_DT_szId (30)  NOT NULL,
 szBudgetId   BOS_DT_szId (30)  NOT NULL,
 dtmBudget   timestamp  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szBigDescription (250)  NOT NULL,
 szSupplierid   BOS_DT_szId (30)  NOT NULL,
 dtmValidStart   timestamp  NOT NULL,
 dtmValidEnd   timestamp  NOT NULL,
 szBudgetType   BOS_DT_szSmallId (5)  NOT NULL,
 szUomCurr   BOS_DT_szMediumId (10)  NOT NULL,
 decBudgetValue   BOS_DT_decAmount (18,2)  NOT NULL,
 bEmailNotification   BOS_DT_bBoolean (3,0)  NOT NULL,
 decWarningPercentage   BOS_DT_decAmount (18,2)  NOT NULL,
 bVoid   BOS_DT_bBoolean (3,0)  NOT NULL,
 bApplied   BOS_DT_bBoolean (3,0)  NOT NULL,
 bApproved   BOS_DT_bBoolean (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   BOS_DT_bBoolean (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 bSystemCreated   BOS_DT_bBoolean (3,0)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 bTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 bPosted   BOS_DT_bBoolean (3,0)  NOT NULL,
 bJournal   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRejected   BOS_DT_bBoolean (3,0)  NOT NULL,
 bResultFrTransfer   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_AP_FSupplierPromoBudgetDiscRef(
szFSupplierPromoBudgetId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL,
 decSuppBudgetShare   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AP_Supplier(
szSuppId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 SuppszContactPerson   BOS_DT_szName (50)  NOT NULL,
 SuppszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 SuppszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 SuppszBuilding   BOS_DT_szName (50)  NOT NULL,
 SuppszAddress_1   BOS_DT_szName (50)  NOT NULL,
 SuppszAddress_2   BOS_DT_szName (50)  NOT NULL,
 SuppszDistrict   BOS_DT_szName (50)  NOT NULL,
 SuppszCity   BOS_DT_szMediumName (20)  NOT NULL,
 SuppszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 SuppszState   BOS_DT_szMediumName (20)  NOT NULL,
 SuppszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 SuppszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 SuppszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 SuppszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 SuppszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 SuppszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 SuppszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 szSuppCustId   BOS_DT_szId (30)  NOT NULL,
 szOurCustId   BOS_DT_szId (30)  NOT NULL,
 szSuppUserId   BOS_DT_szId (30)  NOT NULL,
 szSuppGroupId   BOS_DT_szId (30)  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 decCreditLimit   BOS_DT_decAmount (18,2)  NOT NULL,
 szDefaultCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szAccId   BOS_DT_szId (30)  NOT NULL,
 szGLSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 szNPWP   BOS_DT_szName (50)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AP_SupplierDisbursement(
supplierDisbursementId BOS_DT_szId (30)  NOT NULL,
 supplierDisbursementDate   timestamp  NOT NULL,
 supplierPaymentId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bJournal   smallint (3,0)  NOT NULL,
 bPosted   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_AP_SupplierDisbursementItem(
supplierDisbursementId BOS_DT_szId (30)  NOT NULL,
 itemNumber   smallint (5,0)  NOT NULL,
 invoiceId   BOS_DT_szId (30)  NOT NULL,
 subAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 payAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AP_SupplierPromoBudget(
szBudgetId BOS_DT_szId (30)  NOT NULL,
 dtmBudget   timestamp  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szBigDescription (250)  NOT NULL,
 szSupplierid   BOS_DT_szId (30)  NOT NULL,
 dtmValidStart   timestamp  NOT NULL,
 dtmValidEnd   timestamp  NOT NULL,
 szBudgetType   BOS_DT_szSmallId (5)  NOT NULL,
 szUomCurr   BOS_DT_szMediumId (10)  NOT NULL,
 decBudgetValue   BOS_DT_decAmount (18,2)  NOT NULL,
 decBudgetUsed   BOS_DT_decAmount (18,2)  NOT NULL,
 bEmailNotification   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastNotification   timestamp  NOT NULL,
 decWarningPercentage   BOS_DT_decAmount (18,2)  NOT NULL,
 bClaim   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AP_SupplierPromoBudgetDiscRef(
szBudgetId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL,
 DecSuppBudgetShare   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AP_SupplierPromoBudgetHistory(
szBudgetId BOS_DT_szId (30)  NOT NULL,
 dtmTransaction   timestamp  NOT NULL,
 decValue   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomCurr   BOS_DT_szMediumId (10)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_AP_SuppProduct(
szSuppId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szRefProductId   BOS_DT_szId (30)  NOT NULL,
 szRefProductName   BOS_DT_szName (50)  NOT NULL,
 decQuality   BOS_DT_decAmount (18,2)  NOT NULL,
 decLeadDay   BOS_DT_decAmount (18,2)  NOT NULL,
 decMinOrderQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decMaxOrderQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AR_ArClass(
szArClassId BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_AR_ArMaster(
szCustId BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 bBad   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 intNumberOfOpenInvoice   smallint (5,0)  NOT NULL
);
CREATE TABLE BOS_AR_ArMasterClass(
szCustId BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szArClassId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 intNumberOfOpenInvoice   smallint (5,0)  NOT NULL
);
CREATE TABLE BOS_AR_ArOpname(
szArOpnameId BOS_DT_szId (30)  NOT NULL,
 szOpnameStatus   BOS_DT_szMediumId (10)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmArOpname   timestamp  NOT NULL,
 szEmployeeId   BOS_DT_szId (30)  NOT NULL,
 szEmployeeName   BOS_DT_szName (50)  NOT NULL,
 intScopeCategory   smallint (3,0)  NOT NULL,
 szCategoryType   BOS_DT_szId (30)  NOT NULL,
 szCustCategory   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szPrefix   BOS_DT_szBigId (50)  NOT NULL,
 bJournal   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bPosted   smallint (3,0)  NOT NULL,
 bRejected   smallint (3,0)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szCompanyNm   BOS_DT_szName (50)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceNm   BOS_DT_szName (50)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bOpnameConfirm   smallint (3,0)  NOT NULL,
 bOpnameCanceled   smallint (3,0)  NOT NULL,
 bOpnameProccess   smallint (3,0)  NOT NULL,
 szCancelReason   BOS_DT_szBigDescription (250)  NOT NULL,
 decAmountSalesLOS   BOS_DT_decQty (18,2)  NOT NULL,
 decAmountReturnLOS   BOS_DT_decQty (18,2)  NOT NULL
);
CREATE TABLE BOS_AR_ArOpnameItem(
szArOpnameId BOS_DT_szId (30)  NOT NULL,
 szFInvoiceId   BOS_DT_szBigId (50)  NOT NULL,
 szInvOpnameStatus   BOS_DT_szSmallId (5)  NOT NULL,
 decRestAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decRestOutstanding   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmPeriod   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 bReturn   smallint (3,0)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bInput   smallint (3,0)  NOT NULL,
 decPDRAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AR_ArOpnameLost(
szArOpnameId BOS_DT_szId (30)  NOT NULL,
 szFInvoiceId   BOS_DT_szBigId (50)  NOT NULL,
 dtmPeriod   timestamp  NOT NULL,
 decRestOutstanding   BOS_DT_decAmount (18,2)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 decPDRAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AR_ArTrans(
szTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 shRevNo   smallint (5,0)  NOT NULL,
 szArClassId   BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 dtmPeriode   timestamp  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decRemain   BOS_DT_decAmount (18,2)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bClosed   smallint (3,0)  NOT NULL,
 dtmClosed   timestamp  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 szFInvoiceStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szInvWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szRefTrnId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 szFInvoiceUsage   BOS_DT_szSmallId (5)  NOT NULL,
 bCash   bit  NOT NULL,
 dtmDue   timestamp  NOT NULL,
 dtmDue_Printed   timestamp  NOT NULL,
 szFInvoiceType   BOS_DT_szSmallId (5)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmCollectionDoc   timestamp  NOT NULL,
 dtmToBeCollected   timestamp  NOT NULL
);
CREATE TABLE BOS_AR_ArTransItemReason(
szTrnId BOS_DT_szId (30)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szEmployeeId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_ArTransRefDoc(
szTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 shRevNo   smallint (5,0)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szRefTrnId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 szRefCustId   BOS_DT_szId (30)  NOT NULL,
 shRefRevNo   smallint (5,0)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AR_Category(
szCategoryId BOS_DT_szId (30)  NOT NULL,
 szCategoryType   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szParentCategory   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_CategoryType(
szCategoryType BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szParentCategoryType   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_CustDeposit(
szCustId BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szId (30)  NOT NULL,
 decDeposit   BOS_DT_decDecimal (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_AR_CustDepositItem(
szCustId BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szId (30)  NOT NULL,
 dtmTransaction   timestamp  NOT NULL,
 shitemNo   integer (10,0)  NOT NULL,
 decDeposit   BOS_DT_decAmount (18,2)  NOT NULL,
 szRefTrnId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_CustInvoice(
szCustId BOS_DT_szId (30)  NOT NULL,
 szCustInvoiceNm   BOS_DT_szName (50)  NOT NULL,
 szCustTaxNm   BOS_DT_szName (50)  NOT NULL,
 szCustCollectNm   BOS_DT_szName (50)  NOT NULL,
 InvoiceszContactPerson   BOS_DT_szName (50)  NOT NULL,
 InvoiceszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 InvoiceszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 InvoiceszBuilding   BOS_DT_szName (50)  NOT NULL,
 InvoiceszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 InvoiceszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 InvoiceszDistrict   BOS_DT_szName (50)  NOT NULL,
 InvoiceszCity   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 InvoiceszState   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 bIsDiffTaxAddress   bit  NOT NULL,
 TaxszContactPerson   BOS_DT_szName (50)  NOT NULL,
 TaxszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 TaxszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 TaxszBuilding   BOS_DT_szName (50)  NOT NULL,
 TaxszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 TaxszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 TaxszDistrict   BOS_DT_szName (50)  NOT NULL,
 TaxszCity   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 TaxszState   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 bIsDiffCollectAddress   bit  NOT NULL,
 CollectszContactPerson   BOS_DT_szName (50)  NOT NULL,
 CollectszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 CollectszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 CollectszBuilding   BOS_DT_szName (50)  NOT NULL,
 CollectszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 CollectszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 CollectszDistrict   BOS_DT_szName (50)  NOT NULL,
 CollectszCity   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 CollectszState   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 bLock   bit  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_AR_CustLocation(
szCustId BOS_DT_szId (30)  NOT NULL,
 btLocId   smallint (3,0)  NOT NULL,
 szCustDeliveryNm   BOS_DT_szName (50)  NOT NULL,
 LocationszContactPerson   BOS_DT_szName (50)  NOT NULL,
 LocationszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 LocationszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 LocationszBuilding   BOS_DT_szName (50)  NOT NULL,
 LocationszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 LocationszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 LocationszDistrict   BOS_DT_szName (50)  NOT NULL,
 LocationszCity   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 LocationszState   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_AR_Customer(
szCustId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 CustszContactPerson   BOS_DT_szName (50)  NOT NULL,
 CustszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 CustszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 CustszBuilding   BOS_DT_szName (50)  NOT NULL,
 CustszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 CustszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 CustszDistrict   BOS_DT_szName (50)  NOT NULL,
 CustszCity   BOS_DT_szName (50)  NOT NULL,
 CustszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 CustszState   BOS_DT_szMediumName (20)  NOT NULL,
 CustszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 CustszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 CustszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 CustszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 CustszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 CustszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 CustszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 szLatitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szLongitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szFCallId   BOS_DT_szId (30)  NOT NULL,
 bSoldToCust   BOS_DT_bBoolean (3,0)  NOT NULL,
 bDeliverToCust   BOS_DT_bBoolean (3,0)  NOT NULL,
 bInvoiceToCust   BOS_DT_bBoolean (3,0)  NOT NULL,
 bCollectToCust   BOS_DT_bBoolean (3,0)  NOT NULL,
 szSoldToCustId   BOS_DT_szId (30)  NOT NULL,
 szDeliverToCustId   BOS_DT_szId (30)  NOT NULL,
 szInvoiceToCustId   BOS_DT_szId (30)  NOT NULL,
 szCollectToCustId   BOS_DT_szId (30)  NOT NULL,
 bIsDiffDeliveryAddress   bit  NOT NULL,
 bIsDiffInvoiceAddress   bit  NOT NULL,
 bIsMultiLocation   bit  NOT NULL,
 szCategory_1   BOS_DT_szId (30)  NOT NULL,
 szCategory_2   BOS_DT_szId (30)  NOT NULL,
 szCategory_3   BOS_DT_szId (30)  NOT NULL,
 szCategory_4   BOS_DT_szId (30)  NOT NULL,
 szCategory_5   BOS_DT_szId (30)  NOT NULL,
 szCategory_6   BOS_DT_szId (30)  NOT NULL,
 szCategory_7   BOS_DT_szId (30)  NOT NULL,
 szCategory_8   BOS_DT_szId (30)  NOT NULL,
 szCategory_9   BOS_DT_szId (30)  NOT NULL,
 szCategory_10   BOS_DT_szId (30)  NOT NULL,
 bJoinInvoice   bit  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szDlvWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szInvWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szCollWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szSalWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szDistrChannelId   BOS_DT_szId (30)  NOT NULL,
 szDefaultCcyId   BOS_DT_szId (30)  NOT NULL,
 szStartDoc   BOS_DT_szId (30)  NOT NULL,
 dtmStart   timestamp  NOT NULL,
 szContractDoc   BOS_DT_szId (30)  NOT NULL,
 dtmContract   timestamp  NOT NULL,
 szRenewalDoc   BOS_DT_szId (30)  NOT NULL,
 dtmRenewal   timestamp  NOT NULL,
 szStopDoc   BOS_DT_szId (30)  NOT NULL,
 dtmStop   timestamp  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 bICP   bit  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szLastFCustBIId   BOS_DT_szId (30)  NOT NULL,
 bNeedInvoiceChange   BOS_DT_bBoolean (3,0)  NOT NULL,
 bInvoiceChangeWithReceipt   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Sunday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Monday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Tuesday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Wednesday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Thursday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Friday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Saturday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bPaymentType_Cash   BOS_DT_bBoolean (3,0)  NOT NULL,
 bPaymentType_CurrentAccount   BOS_DT_bBoolean (3,0)  NOT NULL,
 bPaymentType_Transfer   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_PO   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_Receipt   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_StandardTaxInvoice   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_Materai   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_ReceiptNote   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_Other   BOS_DT_bBoolean (3,0)  NOT NULL,
 szRequiredDocuments_Other   BOS_DT_szBigDescription (250)  NOT NULL,
 szGuarantee   BOS_DT_szBigDescription (250)  NOT NULL,
 szDeliveryGroupId   BOS_DT_szId (30)  NOT NULL,
 szBarcodeId   BOS_DT_szId (30)  NOT NULL,
 szActivityStatus   BOS_DT_szId (30)  NOT NULL,
 dtmLastChangeActivityStatus   timestamp  NOT NULL
);
CREATE TABLE BOS_AR_CustomerCategoryPayment_Mapping(
szCategoryNo varchar (2)  NOT NULL,
 szCategoryId   BOS_DT_szId (30)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp
);
CREATE TABLE BOS_AR_CustomerProductItem(
szCustId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szRefProductId   BOS_DT_szId (30)  NOT NULL,
 szRefProductName   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_AR_CustomerVisitConfig(
szCustId BOS_DT_szDeviceId (100)  NOT NULL,
 bGpsActive   BOS_DT_bBoolean (3,0)  NOT NULL,
 bUpdateCoordinate   BOS_DT_bBoolean (3,0)  NOT NULL,
 bValidateCoordinate   BOS_DT_bBoolean (3,0)  NOT NULL,
 bGpsScanSuccess   BOS_DT_bBoolean (3,0)  NOT NULL,
 szLastGpsScanStatus   BOS_DT_szId (30)  NOT NULL,
 bUpdateBarcode   BOS_DT_bBoolean (3,0)  NOT NULL,
 bValidateBarcode   BOS_DT_bBoolean (3,0)  NOT NULL,
 bBarcodeScanSuccess   BOS_DT_bBoolean (3,0)  NOT NULL,
 szLastBarcodeScanStatus   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_AR_CustPrePayment(
szCustId BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 decPayment   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_AR_CustPrePaymentHistory(
szCustId BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 dtmPayment   timestamp  NOT NULL,
 decPrePayment   BOS_DT_decAmount (18,2)  NOT NULL,
 szTrnId   BOS_DT_szId (30)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_AR_CustProductDeposit(
szCustId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_AR_CustProductDepositHistory(
szCustId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 dtmTransaction   timestamp  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_AR_CustSales(
szCustId BOS_DT_szId (30)  NOT NULL,
 bAllowToCredit   BOS_DT_bBoolean (3,0)  NOT NULL,
 decCreditLimit   BOS_DT_decAmount (18,2)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szInvoiceProcessingId   BOS_DT_szId (30)  NOT NULL,
 bInvoiceNote   bit  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 bNoVatApplied   BOS_DT_bBoolean (3,0)  NOT NULL,
 bCheckMaxDropSize   BOS_DT_bBoolean (3,0)  NOT NULL,
 intMaxCountOpenInv   smallint (5,0)  NOT NULL,
 bCheckMinDropSize   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_AR_CustSalesArClass(
szCustId BOS_DT_szId (30)  NOT NULL,
 szArClassId   BOS_DT_szId (30)  NOT NULL,
 decCreditLimit   BOS_DT_decAmount (18,2)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 intMaxCountOpenInv   smallint (5,0)  NOT NULL
);
CREATE TABLE BOS_AR_CustSalesQualification(
szCustId BOS_DT_szId (30)  NOT NULL,
 szQualificationId   BOS_DT_szBigId (50)  NOT NULL
);
CREATE TABLE BOS_AR_FCustBasicInformation(
szFCustBIId BOS_DT_szId (30)  NOT NULL,
 szFCallId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 dtmDoc   timestamp  NOT NULL,
 bNewCustomer   bit  NOT NULL,
 szCustNm   BOS_DT_szName (50)  NOT NULL,
 szDistrChannelId   BOS_DT_szId (30)  NOT NULL,
 szCategory_1   BOS_DT_szId (30)  NOT NULL,
 szCategory_2   BOS_DT_szId (30)  NOT NULL,
 szCategory_3   BOS_DT_szId (30)  NOT NULL,
 szCategory_4   BOS_DT_szId (30)  NOT NULL,
 szCategory_5   BOS_DT_szId (30)  NOT NULL,
 szCategory_6   BOS_DT_szId (30)  NOT NULL,
 szCategory_7   BOS_DT_szId (30)  NOT NULL,
 szCategory_8   BOS_DT_szId (30)  NOT NULL,
 szCategory_9   BOS_DT_szId (30)  NOT NULL,
 szCategory_10   BOS_DT_szId (30)  NOT NULL,
 CustszContactPerson   BOS_DT_szName (50)  NOT NULL,
 CustszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 CustszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 CustszBuilding   BOS_DT_szName (50)  NOT NULL,
 CustszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 CustszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 CustszDistrict   BOS_DT_szName (50)  NOT NULL,
 CustszCity   BOS_DT_szMediumName (20)  NOT NULL,
 CustszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 CustszState   BOS_DT_szMediumName (20)  NOT NULL,
 CustszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 CustszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 CustszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 CustszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 CustszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 CustszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 CustszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 szLatitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szLongitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szRemark   BOS_DT_szDescription (100)  NOT NULL,
 bSoldToCust   bit  NOT NULL,
 bDeliverToCust   bit  NOT NULL,
 bInvoiceToCust   bit  NOT NULL,
 bCollectToCust   bit  NOT NULL,
 szSoldToCustId   BOS_DT_szId (30)  NOT NULL,
 szDeliverToCustId   BOS_DT_szId (30)  NOT NULL,
 szInvoiceToCustId   BOS_DT_szId (30)  NOT NULL,
 szCollectToCustId   BOS_DT_szId (30)  NOT NULL,
 bJoinInvoice   bit  NOT NULL,
 bDelCust   bit  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szSalWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szDefaultCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szFCustChgSalesCfgId   BOS_DT_szId (30)  NOT NULL,
 szStartDoc   BOS_DT_szId (30)  NOT NULL,
 dtmStart   timestamp  NOT NULL,
 szContractDoc   BOS_DT_szId (30)  NOT NULL,
 dtmContract   timestamp  NOT NULL,
 szRenewalDoc   BOS_DT_szId (30)  NOT NULL,
 dtmRenewal   timestamp  NOT NULL,
 szStopDoc   BOS_DT_szId (30)  NOT NULL,
 dtmStop   timestamp  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 bICP   bit  NOT NULL,
 bCheckMaxDropSize   BOS_DT_bBoolean (3,0)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 bCheckMinDropSize   BOS_DT_bBoolean (3,0)  NOT NULL,
 bNeedInvoiceChange   BOS_DT_bBoolean (3,0)  NOT NULL,
 bInvoiceChangeWithReceipt   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Sunday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Monday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Tuesday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Wednesday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Thursday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Friday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasSpecialCollectionDay_Saturday   BOS_DT_bBoolean (3,0)  NOT NULL,
 bPaymentType_Cash   BOS_DT_bBoolean (3,0)  NOT NULL,
 bPaymentType_CurrentAccount   BOS_DT_bBoolean (3,0)  NOT NULL,
 bPaymentType_Transfer   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_PO   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_Receipt   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_StandardTaxInvoice   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_Materai   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_ReceiptNote   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRequiredDocuments_Other   BOS_DT_bBoolean (3,0)  NOT NULL,
 szRequiredDocuments_Other   BOS_DT_szBigDescription (250)  NOT NULL,
 szGuarantee   BOS_DT_szBigDescription (250)  NOT NULL,
 szDeliveryGroupId   BOS_DT_szId (30)  NOT NULL,
 szBarcodeId   BOS_DT_szId (30)  NOT NULL,
 szActivityStatus   BOS_DT_szId (30)  NOT NULL,
 dtmLastChangeActivityStatus   timestamp  NOT NULL
);
CREATE TABLE BOS_AR_FCustBasicInformationArItem(
szFCustBIId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 decValue   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AR_FCustBasicInformationDjrTrackingItem(
szFCustBIId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szDjrTrackingId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustBasicInformationDoItem(
szFCustBIId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szFDoId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustBasicInformationProductItem(
szFCustBIId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szRefProductId   BOS_DT_szId (30)  NOT NULL,
 szRefProductName   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_AR_FCustBasicInformationStockItem(
szFCustBIId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgDlvAddress(
szFCustCDAId BOS_DT_szId (30)  NOT NULL,
 szFCallId   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 dtmDoc   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szCustDeliveryNm   BOS_DT_szName (50)  NOT NULL,
 CustszContactPerson   BOS_DT_szName (50)  NOT NULL,
 CustszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 CustszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 CustszBuilding   BOS_DT_szName (50)  NOT NULL,
 CustszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 CustszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 CustszDistrict   BOS_DT_szName (50)  NOT NULL,
 CustszCity   BOS_DT_szMediumName (20)  NOT NULL,
 CustszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 CustszState   BOS_DT_szMediumName (20)  NOT NULL,
 CustszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 CustszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 CustszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 CustszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 CustszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 CustszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 CustszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 bIsDiffDeliveryAddress   bit  NOT NULL,
 DeliveryszContactPerson   BOS_DT_szName (50)  NOT NULL,
 DeliveryszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 DeliveryszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 DeliveryszBuilding   BOS_DT_szName (50)  NOT NULL,
 DeliveryszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 DeliveryszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 DeliveryszDistrict   BOS_DT_szName (50)  NOT NULL,
 DeliveryszCity   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 DeliveryszState   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 szDlvWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szRemark   BOS_DT_szDescription (100)  NOT NULL,
 bIsMultiLocation   bit  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgDlvAddressItem(
szFCustCDAId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 LocationszContactPerson   BOS_DT_szName (50)  NOT NULL,
 LocationszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 LocationszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 LocationszBuilding   BOS_DT_szName (50)  NOT NULL,
 LocationszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 LocationszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 LocationszDistrict   BOS_DT_szName (50)  NOT NULL,
 LocationszCity   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 LocationszState   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszWebSite   BOS_DT_szMediumName (20)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgGpsCoord(
szFCCGId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szOpUserId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgGpsCoordItem(
szFCCGId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szLongitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szLatitude   BOS_DT_szGPSCoordinate (20)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgInvAddress(
szFCustCIAId BOS_DT_szId (30)  NOT NULL,
 szFCallId   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 dtmDoc   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szCustInvoiceNm   BOS_DT_szName (50)  NOT NULL,
 szCustTaxNm   BOS_DT_szName (50)  NOT NULL,
 szCustCollectNm   BOS_DT_szName (50)  NOT NULL,
 bIsDiffInvoiceAddress   bit  NOT NULL,
 InvoiceszContactPerson   BOS_DT_szName (50)  NOT NULL,
 InvoiceszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 InvoiceszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 InvoiceszBuilding   BOS_DT_szName (50)  NOT NULL,
 InvoiceszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 InvoiceszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 InvoiceszDistrict   BOS_DT_szName (50)  NOT NULL,
 InvoiceszCity   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 InvoiceszState   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 InvoiceszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 bIsDiffTaxAddress   bit  NOT NULL,
 TaxszContactPerson   BOS_DT_szName (50)  NOT NULL,
 TaxszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 TaxszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 TaxszBuilding   BOS_DT_szName (50)  NOT NULL,
 TaxszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 TaxszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 TaxszDistrict   BOS_DT_szName (50)  NOT NULL,
 TaxszCity   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 TaxszState   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 CustszContactPerson   BOS_DT_szName (50)  NOT NULL,
 CustszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 CustszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 CustszBuilding   BOS_DT_szName (50)  NOT NULL,
 CustszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 CustszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 CustszDistrict   BOS_DT_szName (50)  NOT NULL,
 CustszCity   BOS_DT_szMediumName (20)  NOT NULL,
 CustszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 CustszState   BOS_DT_szMediumName (20)  NOT NULL,
 CustszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 CustszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 CustszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 CustszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 CustszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 CustszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 CustszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 bIsDiffCollectAddress   bit  NOT NULL,
 CollectszContactPerson   BOS_DT_szName (50)  NOT NULL,
 CollectszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 CollectszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 CollectszBuilding   BOS_DT_szName (50)  NOT NULL,
 CollectszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 CollectszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 CollectszDistrict   BOS_DT_szName (50)  NOT NULL,
 CollectszCity   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 CollectszState   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 CollectszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 szInvWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szCollWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szRemark   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgSalesCfg(
szFCustCSCId BOS_DT_szId (30)  NOT NULL,
 szFCallId   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 dtmDoc   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 bAllowToCredit   bit  NOT NULL,
 decCreditLimit   BOS_DT_decAmount (18,2)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 szInvoicingProcessId   BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szRemark   BOS_DT_szDescription (100)  NOT NULL,
 bInvoiceNote   bit  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 bNoVatApplied   BOS_DT_bBoolean (3,0)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 bCheckMaxDropSize   BOS_DT_bBoolean (3,0)  NOT NULL,
 intMaxCountOpenInv   smallint (5,0)  NOT NULL,
 bCheckMinDropSize   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgSalesCfgArClass(
szFCustCSCId BOS_DT_szId (30)  NOT NULL,
 szArClassId   BOS_DT_szId (30)  NOT NULL,
 decCreditLimit   BOS_DT_decAmount (18,2)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 intMaxCountOpenInv   smallint (5,0)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgSalesCfgNonVatProd(
szFCustCSCId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgSalesCfgQualification(
szFCustCSCId BOS_DT_szId (30)  NOT NULL,
 szQualificationId   BOS_DT_szBigId (50)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgStatus(
szFCustChgStatusId BOS_DT_szId (30)  NOT NULL,
 dtmFCustChgStatus   timestamp  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_AR_FCustChgStatusItem(
szFCustChgStatusId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szId (30)  NOT NULL,
 decDueAR   BOS_DT_decAmount (18,2)  NOT NULL,
 decCurrentAR   BOS_DT_decAmount (18,2)  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_AR_FCustDeposit(
szFCustDepositId BOS_DT_szId (30)  NOT NULL,
 dtmFCustDeposit   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 decDeposit   BOS_DT_decAmount (18,2)  NOT NULL,
 szCcyId   BOS_DT_szId (30)  NOT NULL,
 szDeposanId   BOS_DT_szId (30)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 szRefId   BOS_DT_szId (30)  NOT NULL,
 bValue   smallint (3,0)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApproved   bit  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bJournal   smallint (3,0)  NOT NULL,
 bPosted   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustDepoTransferIn(
szDepoTransInId BOS_DT_szId (30)  NOT NULL,
 dtmDoc   timestamp  NOT NULL,
 szWpTransferFrom   BOS_DT_szId (30)  NOT NULL,
 szDepoTransOutId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bJournal   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bPosted   smallint (3,0)  NOT NULL,
 bRejected   smallint (3,0)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szCompanyNm   BOS_DT_szName (50)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceNm   BOS_DT_szName (50)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 szFCustPaymentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustDepoTransferOut(
szDepoTransOutId BOS_DT_szId (30)  NOT NULL,
 dtmDoc   timestamp  NOT NULL,
 szWpSource   BOS_DT_szId (30)  NOT NULL,
 szWpDestination   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bJournal   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bPosted   smallint (3,0)  NOT NULL,
 bRejected   smallint (3,0)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szCompanyNm   BOS_DT_szName (50)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceNm   BOS_DT_szName (50)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 szFCustPaymentId   BOS_DT_szId (30)  NOT NULL,
 bHasTransferIn   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_AR_FCustDepoTransferOutItemCBAccount(
szDepoTransOutId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 szCustBankAccountNo   BOS_DT_szId (30)  NOT NULL,
 szCustBankAccountNm   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_AR_FCustDepoTransferOutItemLoc(
szDepoTransOutId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 btLocId   smallint (3,0)  NOT NULL,
 szCustDeliveryNm   BOS_DT_szName (50)  NOT NULL,
 LocationszContactPerson   BOS_DT_szName (50)  NOT NULL,
 LocationszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 LocationszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 LocationszBuilding   BOS_DT_szName (50)  NOT NULL,
 LocationszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 LocationszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 LocationszDistrict   BOS_DT_szName (50)  NOT NULL,
 LocationszCity   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 LocationszState   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 LocationszWebSite   BOS_DT_szMediumName (20)  NOT NULL
);
CREATE TABLE BOS_AR_FCustDepoTransferOutItemPdr(
szDepoTransOutId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szFInvoiceId   BOS_DT_szBigId (50)  NOT NULL,
 szPdrId   BOS_DT_szBigId (50)  NOT NULL,
 shItemNumber   integer (10,0)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 dtmDue   timestamp  NOT NULL,
 dtmReceipt   timestamp  NOT NULL,
 dtmPdr   timestamp  NOT NULL,
 szLedgerId   BOS_DT_szId (30)  NOT NULL,
 szPayForAccId   BOS_DT_szId (30)  NOT NULL,
 szPayForSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 szFCustPaymentId   BOS_DT_szBigId (50)  NOT NULL,
 custBankAccountNo   BOS_DT_szId (30)
);
CREATE TABLE BOS_AR_FCustPayment(
szFCustPaymentId BOS_DT_szId (30)  NOT NULL,
 dtmFCustPayment   timestamp  NOT NULL,
 szFCashReceiptId   BOS_DT_szId (30)  NOT NULL,
 szDeposanId   BOS_DT_szId (30)  NOT NULL,
 szAccountId1   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId1   BOS_DT_szGLAccount (100)  NOT NULL,
 decAmount1   BOS_DT_decAmount (18,2)  NOT NULL,
 szAccountId2   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId2   BOS_DT_szGLAccount (100)  NOT NULL,
 decAmount2   BOS_DT_decAmount (18,2)  NOT NULL,
 szAccountId3   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId3   BOS_DT_szGLAccount (100)  NOT NULL,
 decAmount3   BOS_DT_decAmount (18,2)  NOT NULL,
 szAccountId4   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId4   BOS_DT_szGLAccount (100)  NOT NULL,
 decAmount4   BOS_DT_decAmount (18,2)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_AR_FCustPayment2(
szFCustPaymentId BOS_DT_szId (30)  NOT NULL,
 dtmFCustPayment   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 decInitialCustDeposit   BOS_DT_decAmount (18,2)  NOT NULL,
 bResultFrTransfer   BOS_DT_bBoolean (3,0)  NOT NULL,
 bVoid   BOS_DT_bBoolean (3,0)  NOT NULL,
 bApproved   BOS_DT_bBoolean (3,0)  NOT NULL,
 bApplied   BOS_DT_bBoolean (3,0)  NOT NULL,
 bJournal   BOS_DT_bBoolean (3,0)  NOT NULL,
 bPosted   BOS_DT_bBoolean (3,0)  NOT NULL,
 btPrintedCount   BOS_DT_bBoolean (3,0)  NOT NULL,
 bTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   BOS_DT_bBoolean (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   BOS_DT_bBoolean (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 szPaymentRefNo   varchar (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustPayment2Item(
szFCustPaymentId BOS_DT_szId (30)  NOT NULL,
 szInvoiceId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decPaidByDeposit   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_AR_FCustPaymentItem(
szFCustPaymentId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decPaidByCashReceipt   BOS_DT_decAmount (18,2)  NOT NULL,
 szFDoId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustPaymentItemDetail(
szFCustPaymentId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shDetailNumber   smallint (5,0)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 bValue   smallint (3,0)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 bDeposit   smallint (3,0)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_AR_FCustPaymentPlan(
szFCustPaymentPlanId varchar (30)  NOT NULL,
 dtmFCustPaymentPlan   timestamp  NOT NULL,
 szPaymentRefNo   varchar (100)  NOT NULL,
 bVoid   BOS_DT_bBoolean (3,0)  NOT NULL,
 bApplied   BOS_DT_bBoolean (3,0)  NOT NULL,
 bApproved   BOS_DT_bBoolean (3,0)  NOT NULL,
 btPrintedCount   BOS_DT_bBoolean (3,0)  NOT NULL,
 szCompanyId   varchar (10)  NOT NULL,
 szWorkplaceId   varchar (30)  NOT NULL,
 szTaxEntityId   varchar (30)  NOT NULL,
 bNeedApproval   BOS_DT_bBoolean (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 szUserId   varchar (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 bSystemCreated   BOS_DT_bBoolean (3,0)  NOT NULL,
 szFJournalId   varchar (50)  NOT NULL,
 szApprovalId   varchar (50)  NOT NULL,
 szWorkplaceNm   varchar (50)  NOT NULL,
 szCompanyNm   varchar (50)  NOT NULL,
 bTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 bPosted   BOS_DT_bBoolean (3,0)  NOT NULL,
 bJournal   BOS_DT_bBoolean (3,0)  NOT NULL,
 bRejected   BOS_DT_bBoolean (3,0)  NOT NULL,
 bResultFrTransfer   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_AR_FCustPaymentPlanItem(
szFCustPaymentPlanId varchar (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szInvoiceId   varchar (30)  NOT NULL
);
CREATE TABLE BOS_AR_NonVatCustItem(
szProductId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_AR_PaymentTerm(
szPaymentTermId BOS_DT_szId (30)  NOT NULL,
 szFailCheckActionType   BOS_DT_szSmallId (5)  NOT NULL,
 szOpenBlockApprovalId   BOS_DT_szId (30)  NOT NULL,
 decOverLimitAmount_2   BOS_DT_decAmount (18,2)  NOT NULL,
 szFailCheckActionType_2   BOS_DT_szSmallId (5)  NOT NULL,
 szOpenBlockApprovalId_2   BOS_DT_szId (30)  NOT NULL,
 decOverLimitAmount_3   BOS_DT_decAmount (18,2)  NOT NULL,
 szFailCheckActionType_3   BOS_DT_szSmallId (5)  NOT NULL,
 szOpenBlockApprovalId_3   BOS_DT_szId (30)  NOT NULL,
 decOverLimitAmount_4   BOS_DT_decAmount (18,2)  NOT NULL,
 szFailCheckActionType_4   BOS_DT_szSmallId (5)  NOT NULL,
 szOpenBlockApprovalId_4   BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 intMaxPaymentDay   integer (10,0)  NOT NULL,
 intPrintedMaxPaymentDay   integer (10,0)  NOT NULL,
 intDayBeforeDueDateToSendInvoice   integer (10,0)  NOT NULL,
 szPaymentDelayPenalty   BOS_DT_szSmallId (5)  NOT NULL,
 decPenalty   BOS_DT_decAmount (18,2)  NOT NULL,
 decFixPenalty   BOS_DT_decAmount (18,2)  NOT NULL,
 szPenaltyOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szAdvancePaymentIncentive   BOS_DT_szSmallId (5)  NOT NULL,
 decIncentive   BOS_DT_decAmount (18,2)  NOT NULL,
 decFixIncentive   BOS_DT_decAmount (18,2)  NOT NULL,
 szIncentiveOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 decMultipleFactor   BOS_DT_decDecimal (18,2)  NOT NULL
);
CREATE TABLE BOS_BIZ_PeriodicCalendar(
dtmDate timestamp  NOT NULL,
 szYear   BOS_DT_szMediumName (20)  NOT NULL,
 szMonth   BOS_DT_szMediumName (20)  NOT NULL,
 szYWeek   BOS_DT_szMediumName (20)  NOT NULL,
 szQuarter   BOS_DT_szMediumName (20)  NOT NULL,
 szTriSemester   BOS_DT_szMediumName (20)  NOT NULL,
 szSemester   BOS_DT_szMediumName (20)  NOT NULL,
 szDay   BOS_DT_szMediumName (20)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szYearWeek   BOS_DT_szMediumName (20)  NOT NULL
);
CREATE TABLE BOS_BIZ_PostalCode(
szPostalCode BOS_DT_szMediumId (10)  NOT NULL,
 szKelurahan   BOS_DT_szName (50)  NOT NULL,
 szKecamatan   BOS_DT_szName (50)  NOT NULL,
 szKotamadya   BOS_DT_szName (50)  NOT NULL,
 szKabupaten   BOS_DT_szName (50)  NOT NULL,
 szPropinsi   BOS_DT_szName (50)  NOT NULL,
 szCountry   BOS_DT_szName (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 decPopulation   numeric (18,0)  NOT NULL
);
CREATE TABLE BOS_BIZ_Qualification(
szQualificationClassId BOS_DT_szMediumId (10)  NOT NULL,
 szQualificationId   BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_BIZ_QualificationClass(
szQualificationClassId BOS_DT_szMediumId (10)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_BIZ_Qualifier(
szQualificationClassId BOS_DT_szMediumId (10)  NOT NULL,
 szQualifierId   BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szQualifierFormula   BOS_DT_szBigMessage (1000)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CAS_AccountMonitoring(
szAccountMonitoringId BOS_DT_szId (30)  NOT NULL,
 szAccountMonitoringName   BOS_DT_szName (50)  NOT NULL,
 szAccountId_1   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId_1   BOS_DT_szId (30)  NOT NULL,
 szClearingAccountId   BOS_DT_szId (30)  NOT NULL,
 szClearingSubAccountId   BOS_DT_szId (30)  NOT NULL,
 decMaxAmountAccount_1   BOS_DT_decAmount (18,2)  NOT NULL,
 decMaxNettInOutClearingAccount   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_CAS_Bank(
szBankId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szAccount   BOS_DT_szBigId (50)  NOT NULL,
 BankszContactPerson   BOS_DT_szName (50)  NOT NULL,
 BankszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 BankszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 BankszBuilding   BOS_DT_szName (50)  NOT NULL,
 BankszAddress_1   BOS_DT_szName (50)  NOT NULL,
 BankszAddress_2   BOS_DT_szName (50)  NOT NULL,
 BankszDistrict   BOS_DT_szName (50)  NOT NULL,
 BankszCity   BOS_DT_szMediumName (20)  NOT NULL,
 BankszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 BankszState   BOS_DT_szMediumName (20)  NOT NULL,
 BankszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 BankszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 BankszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 BankszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 BankszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 BankszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 BankszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CAS_CashAdvanceRequest(
szCashAdvanceRequestId BOS_DT_szId (30)  NOT NULL,
 szCashAdvanceType   BOS_DT_szId (30),
 szStatus   BOS_DT_szName (50),
 dtmDate   timestamp,
 iMaturity   integer (10,0),
 dtmMaturity   timestamp,
 szCashAdvanceRecipientId   BOS_DT_szId (30),
 szCashAdvanceRecipientName   BOS_DT_szName (50),
 szAccount   BOS_DT_szId (30),
 szSubAccount   BOS_DT_szId (30),
 decCashAdvanceAmount   BOS_DT_decAmount (18,2),
 szUtilities   BOS_DT_szName (50),
 bApplied   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0),
 bJournal   smallint (3,0),
 bNeedApproval   smallint (3,0),
 bPosted   smallint (3,0),
 bRejected   smallint (3,0),
 bResultFrTransfer   smallint (3,0),
 bSystemCreated   smallint (3,0),
 btPrintedCount   smallint (3,0),
 bTransferred   smallint (3,0),
 bVoid   smallint (3,0),
 dtmCreated   timestamp,
 gdApprovedId   bytea (16),
 szApprovalId   BOS_DT_szId (30),
 szCompanyId   BOS_DT_szId (30),
 szCompanyNm   BOS_DT_szName (50),
 szFJournalId   BOS_DT_szId (30),
 szTaxEntityId   BOS_DT_szId (30),
 szUserId   BOS_DT_szId (30),
 szWorkplaceId   BOS_DT_szId (30),
 szWorkplaceNm   BOS_DT_szName (50),
 bAlreadyTransferred   smallint (3,0),
 dtmLastUpdated   timestamp,
 szSalWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmClosing   timestamp,
 bSystem   smallint (3,0)
);
CREATE TABLE BOS_CAS_CashAdvanceType(
szCashAdvanceTypeId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szName (50),
 szApproval   BOS_DT_szId (30),
 decNominal   BOS_DT_decAmount (18,2),
 iMaxCashAdvance   integer (10,0),
 iMaturity   integer (10,0),
 bManualInput   BOS_DT_bBoolean (3,0),
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_CAS_Denomination(
szCcyId BOS_DT_szSmallName (10)  NOT NULL,
 decNominal   BOS_DT_decDecimal (18,2)  NOT NULL,
 szMoneyType   varchar (20)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_CAS_FBankSettlement(
szFBankSettlementId BOS_DT_szId (30)  NOT NULL,
 szAccountId   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 dtmBankSettlement   timestamp  NOT NULL,
 dtmFrom   timestamp  NOT NULL,
 dtmTo   timestamp  NOT NULL,
 decBankBeginingBalance   BOS_DT_decAmount (18,2)  NOT NULL,
 decReconcileBeginingBalance   BOS_DT_decAmount (18,2)  NOT NULL,
 decBankEndingBalance   BOS_DT_decAmount (18,2)  NOT NULL,
 decBankCreditMutation   BOS_DT_decAmount (18,2)  NOT NULL,
 decBankDebitMutation   BOS_DT_decAmount (18,2)  NOT NULL,
 decReconcileEndingBalance   BOS_DT_decAmount (18,2)  NOT NULL,
 decDeviationBalance   BOS_DT_decAmount (18,2)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_CAS_FBankSettlementItem(
szFBankSettlementId BOS_DT_szId (30)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szAccountId   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 szTransactionType   BOS_DT_szId (30)  NOT NULL,
 decCreditAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDebitAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmBankStatement   timestamp  NOT NULL,
 bHasReconsile   smallint (3,0)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 iSequentialIndex   smallint (5,0)  NOT NULL,
 bankId   BOS_DT_szId (30)  NOT NULL,
 trnId   BOS_DT_szUrl (100)  NOT NULL,
 szRefIdFromClearing   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_CAS_FCashOpname(
szOpnameId BOS_DT_szId (30)  NOT NULL,
 dtmOpname   timestamp  NOT NULL,
 dtmLastClosing   timestamp,
 dtmConfirm   timestamp,
 szOpnameToCash   BOS_DT_szId (30)  NOT NULL,
 szCurrency   BOS_DT_szId (30)  NOT NULL,
 szStatus   BOS_DT_szId (30)  NOT NULL,
 szUserIdTreasury   BOS_DT_szId (30)  NOT NULL,
 szSettlementDoc   BOS_DT_szId (30)  NOT NULL,
 decPhysicalMoney   BOS_DT_decDecimal (18,2),
 decLastClosingBalance   BOS_DT_decDecimal (18,2),
 decCashTransaction   BOS_DT_decDecimal (18,2),
 bLock   smallint (3,0),
 bConfirm   smallint (3,0),
 bApplied   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0),
 bJournal   smallint (3,0),
 bNeedApproval   smallint (3,0),
 bPosted   smallint (3,0),
 bRejected   smallint (3,0),
 bResultFrTransfer   smallint (3,0),
 bSystemCreated   smallint (3,0),
 btPrintedCount   smallint (3,0),
 bTransferred   smallint (3,0),
 bVoid   smallint (3,0),
 dtmCreated   timestamp,
 gdApprovedId   bytea (16),
 szApprovalId   BOS_DT_szId (30),
 szCompanyId   BOS_DT_szId (30),
 szCompanyNm   BOS_DT_szName (50),
 szFJournalId   BOS_DT_szId (30),
 szTaxEntityId   BOS_DT_szId (30),
 szUserId   BOS_DT_szId (30),
 szWorkplaceId   BOS_DT_szId (30),
 szWorkplaceNm   BOS_DT_szName (50),
 bAlreadyTransferred   smallint (3,0),
 dtmLastUpdated   timestamp,
 szFCashOutId   BOS_DT_szId (30)  NOT NULL,
 szFCashReceiptId   BOS_DT_szId (30)  NOT NULL,
 szDifferReason   BOS_DT_szBigDescription (250)
);
CREATE TABLE BOS_CAS_FCashOpnameItemCashTransaction(
szOpnameId BOS_DT_szId (30)  NOT NULL,
 decCashTransaction   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_CAS_FCashOpnameItemDenomination(
szOpnameId BOS_DT_szId (30)  NOT NULL,
 szMoneyType   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decNominal   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_CAS_FCashOut(
szCreateId BOS_DT_szId (30)  NOT NULL,
 szOfficerId   BOS_DT_szId (30)  NOT NULL,
 szFCashOutId   BOS_DT_szId (30)  NOT NULL,
 dtmReleased   timestamp  NOT NULL,
 szAccountId   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 szChequeNo   BOS_DT_szId (30)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 decControlAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 szRecUserId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_CAS_FCashOutItem(
szCreateId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   integer (10,0)  NOT NULL,
 szAccountId   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_CAS_FCashReceipt(
szFCashReceiptId BOS_DT_szId (30)  NOT NULL,
 dtmReceipt   timestamp  NOT NULL,
 szOfficerId   BOS_DT_szId (30)  NOT NULL,
 szAccountId   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 decControlAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 szDeposanId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_CAS_FCashReceiptItem(
szFCashReceiptId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   integer (10,0)  NOT NULL,
 szAccountId   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_CAS_FCashTemp(
szFCashTempId BOS_DT_szId (30)  NOT NULL,
 dtmTransaction   timestamp  NOT NULL,
 szOfficerId   BOS_DT_szId (30)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szEmployeeId   BOS_DT_szId (30)  NOT NULL,
 szCashDirection   BOS_DT_szSmallId (5)  NOT NULL,
 szFCashTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szFCashId   BOS_DT_szId (30)  NOT NULL,
 szFCashURL   BOS_DT_szUrl (100)  NOT NULL,
 szChequeNo   BOS_DT_szId (30)  NOT NULL,
 szSrcTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szSrcDocId   BOS_DT_szId (30)  NOT NULL,
 szSrcURL   BOS_DT_szUrl (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmMobileTransaction   timestamp  NOT NULL,
 szJobRoutine   BOS_DT_szId (30)  NOT NULL,
 szCashAdvanceRequestId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_CAS_FCashTempItem(
szFCashTempId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szAccountId   BOS_DT_szId (30)  NOT NULL,
 szSubAccountId   BOS_DT_szGLAccount (100)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_CAS_FPdrClearing(
szFPdrClearingId BOS_DT_szId (30)  NOT NULL,
 dtmClearing   timestamp  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_CAS_FPdrClearingItem(
szFPdrClearingId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 szRefId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_CAS_FPdrDeposit(
szFPdrDepositId BOS_DT_szId (30)  NOT NULL,
 dtmDeposit   timestamp  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szDepositBankId   BOS_DT_szId (30)  NOT NULL,
 szClearingAccId   BOS_DT_szId (30)  NOT NULL,
 szClearingSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_CAS_FPdrDepositItem(
szFPdrDepositId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 szRefId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_CAS_FPdrReceipt(
szFPdrReceiptId BOS_DT_szId (30)  NOT NULL,
 dtmPdrReceipt   timestamp  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 decControlAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 bAssumeValuable   smallint (3,0)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szDeposanId   BOS_DT_szId (30)  NOT NULL,
 szPayForAccId   BOS_DT_szId (30)  NOT NULL,
 szPayForSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 szUnclearPdrAccId   BOS_DT_szId (30)  NOT NULL,
 szUnclearPdrSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 szFCashTempId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmMobileTransaction   timestamp  NOT NULL,
 szOfficerId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_CAS_FPdrReceiptItem(
szFPdrReceiptId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 szRefId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmDue   timestamp  NOT NULL,
 dtmPdr   timestamp  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 custBankAccountNo   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_CAS_FPdrReject(
szFPdrRejectId BOS_DT_szId (30)  NOT NULL,
 dtmReject   timestamp  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 bPDRCancellation   smallint (3,0)  NOT NULL,
 szOfficerId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_CAS_FPdrRejectItem(
szFPdrRejectId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 szRefId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_CAS_Pdr(
szBankId BOS_DT_szId (30)  NOT NULL,
 szRefId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmDue   timestamp  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 dtmClear   timestamp  NOT NULL,
 dtmReceipt   timestamp  NOT NULL,
 dtmPdr   timestamp  NOT NULL,
 dtmDeposit   timestamp  NOT NULL,
 szRecWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 bAssumeValuable   bit  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szDepositBankId   BOS_DT_szId (30)  NOT NULL,
 szDeposanId   BOS_DT_szId (30)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szLedgerId   BOS_DT_szId (30)  NOT NULL,
 szPayForAccId   BOS_DT_szId (30)  NOT NULL,
 szPayForSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 szUnclearPdrAccId   BOS_DT_szId (30)  NOT NULL,
 szUnclearPdrSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 szClearingAccId   BOS_DT_szId (30)  NOT NULL,
 szClearingSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 decRemain   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szFBankSettlementId   BOS_DT_szId (30)  NOT NULL,
 bHasReconcile   smallint (3,0)  NOT NULL,
 custBankAccountNo   BOS_DT_szId (30)  NOT NULL,
 szOfficerId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_CAS_PdrOpname(
szDocId BOS_DT_szBigId (50)  NOT NULL,
 szStatusOpname   BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmDoc   timestamp  NOT NULL,
 bJournal   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bPosted   smallint (3,0)  NOT NULL,
 bRejected   smallint (3,0)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 szApprovalId   BOS_DT_szBigId (50)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szBigId (50)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szBigId (50)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szCompanyNm   BOS_DT_szName (50)  NOT NULL,
 szWorkplaceId   BOS_DT_szBigId (50)  NOT NULL,
 szWorkplaceNm   BOS_DT_szName (50)  NOT NULL,
 szTaxEntityId   BOS_DT_szBigId (50)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 szLOS_Status_Total   integer (10,0)  NOT NULL,
 decLOS_Amount   BOS_DT_decAmount (18,2)  NOT NULL,
 szGiroAdminId   BOS_DT_szBigId (50)  NOT NULL,
 szGiroAdminName   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_CAS_PdrOpnameItem(
szDocId BOS_DT_szBigId (50)  NOT NULL,
 szGiroId   BOS_DT_szBigId (50)  NOT NULL,
 szBank   BOS_DT_szBigId (50)  NOT NULL,
 decTotal   BOS_DT_decDecimal (18,2)  NOT NULL,
 szStatusOpname   BOS_DT_szSmallName (10)  NOT NULL,
 dtmDueDate   timestamp  NOT NULL,
 szOverDueGiro   BOS_DT_szBigId (50)  NOT NULL,
 decSystemValue   BOS_DT_decDecimal (18,2),
 decDifference   BOS_DT_decDecimal (18,2)
);
CREATE TABLE BOS_CAS_PdrStatusToYaTidak(
szStatus BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_CRL_CustFUp(
szTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 szCallType   BOS_DT_szSmallId (5)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szDocDescription   BOS_DT_szDescription (100)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bProspect   bit  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CRL_FCall(
szFCallId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szCallRecipientId   BOS_DT_szId (30)  NOT NULL,
 szCallType   BOS_DT_szSmallId (5)  NOT NULL,
 szCallReasonId   BOS_DT_szId (30)  NOT NULL,
 shCallCount   smallint (5,0)  NOT NULL,
 szMessage   BOS_DT_szMessage (500)  NOT NULL,
 dtmFollowUp   timestamp  NOT NULL,
 bNoMoreFollowUp   bit  NOT NULL,
 dtmFinish   timestamp  NOT NULL,
 bSuccess   bit  NOT NULL,
 szTrackingId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szForwardToWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szForwardToGroupId   BOS_DT_szId (30)  NOT NULL,
 bReplyDirectly   bit  NOT NULL,
 szReply   BOS_DT_szMessage (500)  NOT NULL,
 szContactPerson   BOS_DT_szName (50)  NOT NULL,
 szRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 szFloor   BOS_DT_szSmallName (10)  NOT NULL,
 szBuilding   BOS_DT_szName (50)  NOT NULL,
 szAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 szAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 szDistrict   BOS_DT_szName (50)  NOT NULL,
 szCity   BOS_DT_szMediumName (20)  NOT NULL,
 szZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 szState   BOS_DT_szMediumName (20)  NOT NULL,
 szCountry   BOS_DT_szMediumName (20)  NOT NULL,
 szPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 szPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 szFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 szMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 szEmail   BOS_DT_szMediumName (20)  NOT NULL,
 szWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastReminder   timestamp  NOT NULL
);
CREATE TABLE BOS_CRL_FCallProduct(
szFCallId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL
);
CREATE TABLE BOS_CRL_FCallReply(
szFCallReplyId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szReplyUserId   BOS_DT_szId (30)  NOT NULL,
 szFCallId   BOS_DT_szId (30)  NOT NULL,
 bNoMoreFollowUp   bit  NOT NULL,
 bSuccess   bit  NOT NULL,
 szFailReasonId   BOS_DT_szId (30)  NOT NULL,
 szMessage   BOS_DT_szMessage (500)  NOT NULL,
 szRefTrnId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 szRefUrl   BOS_DT_szUrl (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_CRM_Buyer(
szBuyerId BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CRM_CustCrm(
szCustId BOS_DT_szId (30)  NOT NULL,
 szNickNm   BOS_DT_szSmallName (10)  NOT NULL,
 dtmBirthday   timestamp  NOT NULL,
 szGender   BOS_DT_szSmallName (10)  NOT NULL,
 szReligionId   BOS_DT_szId (30)  NOT NULL,
 szEducationId   BOS_DT_szId (30)  NOT NULL,
 szEthnicId   BOS_DT_szId (30)  NOT NULL,
 szMaritalStatusId   BOS_DT_szId (30)  NOT NULL,
 szSpouseNm   BOS_DT_szName (50)  NOT NULL,
 szSpouseNickNm   BOS_DT_szSmallName (10)  NOT NULL,
 dtmSpouseBirthday   timestamp  NOT NULL,
 szOwnerHobbyId1   BOS_DT_szId (30)  NOT NULL,
 szOwnerHobbyId2   BOS_DT_szId (30)  NOT NULL,
 szOwnerHobbyId3   BOS_DT_szId (30)  NOT NULL,
 szOwnerHobbyId4   BOS_DT_szId (30)  NOT NULL,
 szOwnerHobbyId5   BOS_DT_szId (30)  NOT NULL,
 szOwnerHobbyId6   BOS_DT_szId (30)  NOT NULL,
 szOwnerHobbyId7   BOS_DT_szId (30)  NOT NULL,
 szOwnerHobbyId8   BOS_DT_szId (30)  NOT NULL,
 szOwnerHobbyId9   BOS_DT_szId (30)  NOT NULL,
 szOwnerHobbyId10   BOS_DT_szId (30)  NOT NULL,
 szSpouseHobbyId1   BOS_DT_szId (30)  NOT NULL,
 szSpouseHobbyId2   BOS_DT_szId (30)  NOT NULL,
 szSpouseHobbyId3   BOS_DT_szId (30)  NOT NULL,
 szSpouseHobbyId4   BOS_DT_szId (30)  NOT NULL,
 szSpouseHobbyId5   BOS_DT_szId (30)  NOT NULL,
 szSpouseHobbyId6   BOS_DT_szId (30)  NOT NULL,
 szSpouseHobbyId7   BOS_DT_szId (30)  NOT NULL,
 szSpouseHobbyId8   BOS_DT_szId (30)  NOT NULL,
 szSpouseHobbyId9   BOS_DT_szId (30)  NOT NULL,
 szSpouseHobbyId10   BOS_DT_szId (30)  NOT NULL,
 iChildrenCount   integer (10,0)  NOT NULL,
 szFirstChildNm   BOS_DT_szName (50)  NOT NULL,
 szSecondChildNm   BOS_DT_szName (50)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 szBankAccId   BOS_DT_szBigId (50)  NOT NULL,
 szOutletTypeId   BOS_DT_szId (30)  NOT NULL,
 decOutletSpace   BOS_DT_decAmount (18,2)  NOT NULL,
 szBuyerId1   BOS_DT_szId (30)  NOT NULL,
 szBuyerId2   BOS_DT_szId (30)  NOT NULL,
 szBuyerId3   BOS_DT_szId (30)  NOT NULL,
 szBuyerId4   BOS_DT_szId (30)  NOT NULL,
 szBuyerId5   BOS_DT_szId (30)  NOT NULL,
 szBuyerId6   BOS_DT_szId (30)  NOT NULL,
 szBuyerId7   BOS_DT_szId (30)  NOT NULL,
 szBuyerId8   BOS_DT_szId (30)  NOT NULL,
 szBuyerId9   BOS_DT_szId (30)  NOT NULL,
 szBuyerId10   BOS_DT_szId (30)  NOT NULL,
 szSalesFleetId1   BOS_DT_szId (30)  NOT NULL,
 szSalesFleetId2   BOS_DT_szId (30)  NOT NULL,
 szSalesFleetId3   BOS_DT_szId (30)  NOT NULL,
 szSalesFleetId4   BOS_DT_szId (30)  NOT NULL,
 szSalesFleetId5   BOS_DT_szId (30)  NOT NULL,
 szSalesFleetId6   BOS_DT_szId (30)  NOT NULL,
 szSalesFleetId7   BOS_DT_szId (30)  NOT NULL,
 szSalesFleetId8   BOS_DT_szId (30)  NOT NULL,
 szSalesFleetId9   BOS_DT_szId (30)  NOT NULL,
 szSalesFleetId10   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CRM_Education(
szEducationId BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CRM_Ethnic(
szEthnicId BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CRM_Hobby(
szHobbyId BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CRM_MaritalStatus(
szMaritalStatusId BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CRM_OutletType(
szOutletTypeId BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CRM_Religion(
szReligionId BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CRM_SalesFleet(
szSalesFleetId BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CU_Currency(
szCcyId BOS_DT_szSmallId (5)  NOT NULL,
 szSymbol   BOS_DT_szSmallId (5)  NOT NULL,
 szAmountFormat   BOS_DT_szMediumName (20)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_CU_CurrencyRate(
szCcyRateId BOS_DT_szMediumId (10)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmTime   timestamp  NOT NULL
);
CREATE TABLE BOS_CU_CurrencyRate_History(
szCcyRateHistoryId BOS_DT_szMediumId (10)  NOT NULL,
 dtmCcyId   timestamp  NOT NULL,
 szFromCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szToCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 decValue   BOS_DT_decCcyRate (18,8)  NOT NULL
);
CREATE TABLE BOS_CU_CurrencyRateItem(
szCcyRateId BOS_DT_szMediumId (10)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szToCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 decValue   BOS_DT_decCcyRate (18,8)  NOT NULL
);
CREATE TABLE BOS_DOM_BreakingNews(
gdHistory bytea (16)  NOT NULL,
 szCompanyId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szEmployeeId   BOS_DT_szId (30)  NOT NULL,
 szMessage   BOS_DT_szMessage (500)  NOT NULL,
 szLongitude   BOS_DT_szBigDescription (250)  NOT NULL,
 szLatitude   BOS_DT_szBigDescription (250)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_DOM_TickerNews(
gdHistory bytea (16)  NOT NULL,
 szCompanyId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmShow   timestamp  NOT NULL,
 szEmployeeId   BOS_DT_szId (30)  NOT NULL,
 szMessage   BOS_DT_szMessage (500)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_DOM_WHPalletPosition(
szProductId BOS_DT_szId (30)  NOT NULL,
 decRacking   BOS_DT_decAmount (18,2)  NOT NULL,
 decNonRacking   BOS_DT_decAmount (18,2)  NOT NULL,
 decRacking_Ctn   BOS_DT_decAmount (18,2)  NOT NULL,
 decNonRacking_Ctn   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_DOM_WHRacking(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 decPalletCapacity   BOS_DT_decAmount (18,2)  NOT NULL,
 bRackingWH   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_DOM_WHSafetyStock(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decSafetyStock   BOS_DT_decAmount (18,2)  NOT NULL,
 decSafetyStock_Ctn   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_GEN_Approval(
szApprovalId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bLock   bit,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_ApprovalGroup(
szApprovalId BOS_DT_szId (30)  NOT NULL,
 btLevel   smallint (3,0)  NOT NULL,
 szGroupId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_GEN_ApprovalLevel(
szApprovalId BOS_DT_szId (30)  NOT NULL,
 btLevel   smallint (3,0)  NOT NULL,
 bAllowSkipToNext   bit  NOT NULL
);
CREATE TABLE BOS_GEN_Approved(
gdApprovedId bytea (16)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 bApproved   bit  NOT NULL,
 bRejected   bit  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szURI   BOS_DT_szBigId (50)  NOT NULL
);
CREATE TABLE BOS_GEN_ApprovedItem(
gdApprovedId bytea (16)  NOT NULL,
 btApprovedLevel   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 szGroupId   BOS_DT_szId (30)  NOT NULL,
 dtmApproved   timestamp  NOT NULL,
 bApproved   smallint (3,0)
);
CREATE TABLE BOS_GEN_Calendar(
szCalendarId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bWorkOnSat   bit  NOT NULL,
 bWorkOnSun   bit  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_CalendarOverride(
szCalendarId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 dtmOverride   timestamp  NOT NULL,
 bWorkingDay   bit  NOT NULL
);
CREATE TABLE BOS_GEN_Closing(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szClosingType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 dtmClosing   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_Counter(
szCounterId BOS_DT_szId (30)  NOT NULL,
 lngLastCounterNumber   bigint (19,0)  NOT NULL,
 lngMaxNumber   bigint (19,0)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_DataTrf(
szWpId BOS_DT_szId (30)  NOT NULL,
 szDataTrfId   BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szFlexiKeyId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_GEN_DataTrfItem(
szWpId BOS_DT_szId (30)  NOT NULL,
 szDataTrfId   BOS_DT_szBigId (50)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szUri   BOS_DT_szUri (50)  NOT NULL,
 bAllWp   bit  NOT NULL,
 bDestWp   bit  NOT NULL,
 szDestWpId   BOS_DT_szId (30)  NOT NULL,
 szFromId   BOS_DT_szId (30)  NOT NULL,
 szToId   BOS_DT_szId (30)  NOT NULL,
 bNotVoidOnly   bit  NOT NULL,
 bNeedNoApprovalOnly   bit  NOT NULL,
 bApprovedOnly   bit  NOT NULL,
 bAppliedOnly   bit  NOT NULL,
 bToday   bit  NOT NULL,
 bFromToDate   bit  NOT NULL,
 dtmFrom   timestamp  NOT NULL,
 dtmTo   timestamp  NOT NULL,
 bUnexportedDataOnly   bit  NOT NULL,
 szFromId2   BOS_DT_szId (30)  NOT NULL,
 szToId2   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_GEN_FBackDateClosing(
szFBackDateClosingId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 dtmCashierLastClosing   timestamp  NOT NULL,
 dtmDistrLastClosing   timestamp  NOT NULL,
 dtmInvLastClosing   timestamp  NOT NULL,
 dtmBackDate   timestamp  NOT NULL,
 bCloseCashier   BOS_DT_bBoolean (3,0)  NOT NULL,
 bCloseDistr   BOS_DT_bBoolean (3,0)  NOT NULL,
 bCloseInv   BOS_DT_bBoolean (3,0)  NOT NULL,
 szReason   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_FieldClass(
szFieldClass BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_FieldContent(
szFieldClass BOS_DT_szBigId (50)  NOT NULL,
 szFieldName   BOS_DT_szBigId (50)  NOT NULL,
 szFieldContent   BOS_DT_szBigId (50)  NOT NULL,
 szParentFieldName   BOS_DT_szBigId (50)  NOT NULL,
 szParentFieldContent   BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_FieldName(
szFieldClass BOS_DT_szBigId (50)  NOT NULL,
 szFieldName   BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_FlagCashCredit(
bCash smallint (3,0)  NOT NULL,
 szDescription   BOS_DT_szMediumId (10)  NOT NULL
);
CREATE TABLE BOS_GEN_FlexiKey(
szFlexiKeyId BOS_DT_szId (30)  NOT NULL,
 btSegmentCount   smallint (3,0)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bAllowDynamicGLAccEntry   BOS_DT_bBoolean (3,0)  NOT NULL,
 szFieldClass   BOS_DT_szBigId (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_FlexiKeyItem(
szFlexiKeyId BOS_DT_szId (30)  NOT NULL,
 btSegmentNumber   smallint (3,0)  NOT NULL,
 szKeyType   BOS_DT_szSmallId (5)  NOT NULL,
 szContentId   BOS_DT_szId (30)  NOT NULL,
 btSegmentLength   smallint (3,0)  NOT NULL,
 szSeparator   BOS_DT_szSmallId (5)  NOT NULL,
 szAlignment   BOS_DT_szSmallId (5)  NOT NULL,
 szFillChar   varchar (1)  NOT NULL,
 bBalancingSegment   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_FreezeObject(
szUri BOS_DT_szBigId (50)  NOT NULL,
 bFreeze   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_Image(
szDocId BOS_DT_szId (30)  NOT NULL,
 szTrnId   BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 imgImageData   bytea (2147483647)  NOT NULL
);
CREATE TABLE BOS_GEN_Menu(
szMenuId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bLock   bit  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_MenuItem(
szMenuId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szItemName   BOS_DT_szName (50)  NOT NULL,
 szLinkAddress   BOS_DT_szUrl (100)  NOT NULL
);
CREATE TABLE BOS_GEN_Monkey(
decMonth integer (10,0)  NOT NULL,
 decQuarter   integer (10,0)  NOT NULL
);
CREATE TABLE BOS_GEN_Olap(
szOlapTypeId BOS_DT_szBigId (50)  NOT NULL,
 szOlapName   BOS_DT_szName (50)  NOT NULL,
 szOlapTitle   BOS_DT_szName (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szOlapParameter   BOS_DT_szBigId (50)
);
CREATE TABLE BOS_GEN_OlapItem(
szOlapTypeId BOS_DT_szBigId (50)  NOT NULL,
 szOlapName   BOS_DT_szName (50)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szColumnName   BOS_DT_szName (50)  NOT NULL,
 shColumnWidth   smallint (5,0)  NOT NULL,
 bDetail   bit  NOT NULL,
 bSummarized   bit  NOT NULL,
 szPrintText   BOS_DT_szName (50)  NOT NULL,
 szSortType   BOS_DT_szSmallId (5)  NOT NULL,
 iMaxDisplayedRow   integer (10,0)  NOT NULL,
 szRowToDisplay   BOS_DT_szSmallId (5)  NOT NULL,
 szProductIdFieldNm   BOS_DT_szName (50)  NOT NULL,
 szCompUomIdForTotal   BOS_DT_szId (30)  NOT NULL,
 szStyle   BOS_DT_szId (30)  NOT NULL,
 bInline   BOS_DT_bBoolean (3,0)  NOT NULL,
 iIndentLength   integer (10,0)  NOT NULL,
 bFreeze   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_One(
decOne BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_GEN_Reason(
szReasonId BOS_DT_szId (30)  NOT NULL,
 szReasonType   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_RoutineSchedule(
szScheduleId BOS_DT_szId (30)  NOT NULL,
 szScheduleUsage   BOS_DT_szSmallId (5)  NOT NULL,
 szScheduleType   BOS_DT_szSmallId (5)  NOT NULL,
 bIncludeSat   bit  NOT NULL,
 bIncludeSun   bit  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GEN_RoutineScheduleItem(
szScheduleId BOS_DT_szId (30)  NOT NULL,
 shScheduleItem   smallint (5,0)  NOT NULL,
 decValue   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_GEN_TrnMaster(
szUri BOS_DT_szUri (50)  NOT NULL,
 szTrnId   BOS_DT_szTrnId (15)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szAssemblyNm   BOS_DT_szBigId (50)  NOT NULL,
 szFqn   BOS_DT_szBigId (50)  NOT NULL,
 bShowAsTransferable   bit  NOT NULL,
 bSupportDataMaintenance   bit  NOT NULL,
 bSupportGLPosting   bit  NOT NULL,
 supportDataMaster   bit  NOT NULL,
 supportDataExtension   bit  NOT NULL,
 bSupportExportImport   bit  NOT NULL
);
CREATE TABLE BOS_GEN_YesNo(
bYesNo smallint (3,0)  NOT NULL,
 szName   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_GL_AccBalance(
szLedgerId BOS_DT_szId (30)  NOT NULL,
 szAccId   BOS_DT_szId (30)  NOT NULL,
 szSegment_01   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_02   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_03   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_04   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_05   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_06   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_07   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_08   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_09   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_10   BOS_DT_szGLSegment (10)  NOT NULL,
 szGLSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 decDebit   BOS_DT_decAmount (18,2)  NOT NULL,
 decCredit   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_Account(
szAccountId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szAccountType   BOS_DT_szMediumId (10)  NOT NULL,
 szOnlyUsedForWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szOnlyUsedForUserId   BOS_DT_szId (30)  NOT NULL,
 szFullPathAccId   BOS_DT_szFullPath (255)  NOT NULL,
 byteLevel   BOS_DT_byteLevel (3,0)  NOT NULL,
 bGroup   BOS_DT_bBoolean (3,0)  NOT NULL,
 szDefaultBalance   BOS_DT_szOneChar (1)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_AccountingCalendar(
szAccCalendarId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szAccPeriodTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_AccountingCalendarItem(
szAccCalendarId BOS_DT_szId (30)  NOT NULL,
 szAccPeriodNm   BOS_DT_szName (50)  NOT NULL,
 intAccPeriodNo   integer (10,0)  NOT NULL,
 intAccYear   integer (10,0)  NOT NULL,
 dtmStart   timestamp  NOT NULL,
 dtmEnd   timestamp  NOT NULL,
 bAdjustmentPeriod   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_AccPeriod(
szLedgerId BOS_DT_szId (30)  NOT NULL,
 szAccPeriodNm   BOS_DT_szId (30)  NOT NULL,
 szAccPeriodStatus   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_AccPeriodType(
szAccPeriodTypeId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 intPeriodCnt   integer (10,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_AllocBatch(
szAllocBatchId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_AllocBatchItem(
szAllocBatchId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szAllocCodeId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_GL_AllocCode(
szAllocCodeId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szJournalCategoryId   BOS_DT_szId (30)  NOT NULL,
 szAccId_CostPool   BOS_DT_szGLSegment (10)  NOT NULL,
 szGLSubAccId_CostPool   BOS_DT_szGLAccount (100)  NOT NULL,
 decCostPool   BOS_DT_decAmount (18,2)  NOT NULL,
 szAccId_UsageFactor   BOS_DT_szGLSegment (10)  NOT NULL,
 szGLSubAccId_UsageFactor   BOS_DT_szGLAccount (100)  NOT NULL,
 decUsageFactor   BOS_DT_decAmount (18,2)  NOT NULL,
 szAccId_TotalUsage   BOS_DT_szGLSegment (10)  NOT NULL,
 szGLSubAccId_TotalUsage   BOS_DT_szGLAccount (100)  NOT NULL,
 decTotalUsage   BOS_DT_decAmount (18,2)  NOT NULL,
 szAccId_Target   BOS_DT_szGLSegment (10)  NOT NULL,
 szGLSubAccId_Target   BOS_DT_szGLAccount (100)  NOT NULL,
 szAccId_Offset   BOS_DT_szGLSegment (10)  NOT NULL,
 szGLSubAccId_Offset   BOS_DT_szGLAccount (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_Company(
szCompanyId BOS_DT_szMediumId (10)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 szLedgerId   BOS_DT_szId (30)  NOT NULL,
 szTaxSerialNumber   BOS_DT_szTaxId (50)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_FBatch(
szFBatchId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmPost   timestamp  NOT NULL,
 bPosted   BOS_DT_bBoolean (3,0)  NOT NULL,
 bResultFrTransfer   BOS_DT_bBoolean (3,0)  NOT NULL,
 bVoid   BOS_DT_bBoolean (3,0)  NOT NULL,
 bApplied   BOS_DT_bBoolean (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   BOS_DT_bBoolean (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   BOS_DT_bBoolean (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szParamLedgerId   BOS_DT_szId (30)  NOT NULL,
 szParamPeriodId   BOS_DT_szId (30)  NOT NULL,
 szParamCompanyId   BOS_DT_szId (30)  NOT NULL,
 szParamWorkplaceId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_GL_FJournalTrans(
szFJournalId BOS_DT_szId (30)  NOT NULL,
 dtmPost   timestamp  NOT NULL,
 szAccPeriodNm   BOS_DT_szName (50)  NOT NULL,
 szFBatchId   BOS_DT_szId (30)  NOT NULL,
 szLedgerId   BOS_DT_szId (30)  NOT NULL,
 szJournalCategoryId   BOS_DT_szId (30)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 decTotalAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDocTotalAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   BOS_DT_bBoolean (3,0)  NOT NULL,
 bVoid   BOS_DT_bBoolean (3,0)  NOT NULL,
 bPosted   BOS_DT_bBoolean (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   BOS_DT_bBoolean (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   BOS_DT_bBoolean (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 bClosingJournal   BOS_DT_bBoolean (3,0)  NOT NULL,
 szFBankSettlementId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_GL_FJournalTransItem(
szFJournalId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szAccId   BOS_DT_szId (30)  NOT NULL,
 szSegment_01   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_02   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_03   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_04   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_05   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_06   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_07   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_08   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_09   BOS_DT_szGLSegment (10)  NOT NULL,
 szSegment_10   BOS_DT_szGLSegment (10)  NOT NULL,
 szGLSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDocAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 iSequentialIndexBankSettlement   smallint (5,0)  NOT NULL,
 dtmBankStatement   timestamp  NOT NULL,
 bHasReconcile   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_GLAcc(
szLedgerId BOS_DT_szId (30)  NOT NULL,
 szAccId   BOS_DT_szId (30)  NOT NULL,
 szGLSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 bEnable   smallint (3,0)  NOT NULL,
 dtmValidStart   timestamp  NOT NULL,
 dtmValidEnd   timestamp  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bStatAccount   smallint (3,0)  NOT NULL,
 decStatValue   numeric (18,0)  NOT NULL,
 szStatUomId   BOS_DT_szId (30)  NOT NULL,
 bDefaultSubAcc   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_GLSubAcc(
szLedgerId BOS_DT_szId (30)  NOT NULL,
 szGLSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 szDescription   BOS_DT_szBigDescription (250)  NOT NULL,
 szOnlyUsedForUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szOnlyUsedForGroupId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_GL_JournalCategory(
szJournalCategoryId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bAllowManualJournal   smallint (3,0)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_JournalConfig(
szUri BOS_DT_szUri (50)  NOT NULL,
 szLedgerId   BOS_DT_szId (30)  NOT NULL,
 bIncludeInPosting   bit  NOT NULL,
 szJournalCategoryId   BOS_DT_szId (30)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_GL_JournalConfigItem(
szUri BOS_DT_szUri (50)  NOT NULL,
 szLedgerId   BOS_DT_szId (30)  NOT NULL,
 szJournalType   BOS_DT_szBigDescription (250)  NOT NULL,
 szPostingBase1   BOS_DT_szId (30)  NOT NULL,
 szPostingBase2   BOS_DT_szId (30)  NOT NULL,
 szPostingBase3   BOS_DT_szId (30)  NOT NULL,
 szPostingBase4   BOS_DT_szId (30)  NOT NULL,
 szPostingBase5   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_GL_JournalConfigItemDetail(
szUri BOS_DT_szUri (50)  NOT NULL,
 szLedgerId   BOS_DT_szId (30)  NOT NULL,
 szJournalType   BOS_DT_szBigDescription (250)  NOT NULL,
 shItemNo   integer (10,0)  NOT NULL,
 szPostingBaseValue1   BOS_DT_szId (30)  NOT NULL,
 szPostingBaseValue2   BOS_DT_szId (30)  NOT NULL,
 szPostingBaseValue3   BOS_DT_szId (30)  NOT NULL,
 szPostingBaseValue4   BOS_DT_szId (30)  NOT NULL,
 szPostingBaseValue5   BOS_DT_szId (30)  NOT NULL,
 szAccountNo   BOS_DT_szGLAccount (100)  NOT NULL,
 szSubAccountNo   BOS_DT_szGLAccount (100)  NOT NULL
);
CREATE TABLE BOS_GL_JournalMaster(
szUri BOS_DT_szUri (50)  NOT NULL,
 szDocumentTableName   BOS_DT_szName (50)  NOT NULL,
 szDocumentIdFieldName   BOS_DT_szName (50)  NOT NULL,
 szDocumentDateFieldName   BOS_DT_szName (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_GL_JournalMasterItem(
szUri BOS_DT_szUri (50)  NOT NULL,
 szJournalType   BOS_DT_szBigDescription (250)  NOT NULL,
 bSupportCompany   bit  NOT NULL,
 bSupportWorkplace   bit  NOT NULL,
 bSupportSalesOrganization   bit  NOT NULL,
 bSupportProductCategory   bit  NOT NULL,
 bSupportCustomerCategory   bit  NOT NULL,
 bSupportProduct   bit  NOT NULL,
 bSupportOrderType   bit  NOT NULL,
 bSupportOrderItemType   bit  NOT NULL,
 bSupportSupplier   bit  NOT NULL,
 bSupportPurchaseType   bit  NOT NULL,
 bSupportPurchaseItemType   bit  NOT NULL
);
CREATE TABLE BOS_GL_Ledger(
szLedgerId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szLedgerType   BOS_DT_szMediumId (10)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szCcyId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szAccCalendarId   BOS_DT_szId (30)  NOT NULL,
 szCOAId   BOS_DT_szId (30)  NOT NULL,
 szRetainedEarningAccId   BOS_DT_szId (30)  NOT NULL,
 szRetainedEarningGLSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 szTranslationAdjustmentAccId   BOS_DT_szId (30)  NOT NULL,
 szTranslationAdjustmentGLSubAccId   BOS_DT_szGLAccount (100)  NOT NULL
);
CREATE TABLE BOS_GL_SubAccountSegmentMapping(
szFieldClass BOS_DT_szId (30)  NOT NULL,
 szFieldName   BOS_DT_szId (30)  NOT NULL,
 szPostingBase   BOS_DT_szId (30)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_GL_SubAccountSegmentMappingItem(
szFieldClass BOS_DT_szId (30)  NOT NULL,
 szFieldName   BOS_DT_szId (30)  NOT NULL,
 shItemNo   integer (10,0)  NOT NULL,
 szFieldContentMapping   BOS_DT_szId (30)  NOT NULL,
 szPostingBaseValue   BOS_DT_szGLAccount (100)  NOT NULL
);
CREATE TABLE BOS_GL_TaxEntity(
szTaxId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szTaxNo   BOS_DT_szTaxId (50)  NOT NULL,
 szPKPNo   BOS_DT_szTaxId (50)  NOT NULL,
 dtmNPWPDate   timestamp  NOT NULL,
 TaxszContactPerson   BOS_DT_szName (50)  NOT NULL,
 TaxszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 TaxszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 TaxszBuilding   BOS_DT_szName (50)  NOT NULL,
 TaxszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 TaxszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 TaxszDistrict   BOS_DT_szName (50)  NOT NULL,
 TaxszCity   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 TaxszState   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 TaxszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 CPszContactPerson   BOS_DT_szName (50)  NOT NULL,
 CPszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 CPszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 CPszBuilding   BOS_DT_szName (50)  NOT NULL,
 CPszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 CPszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 CPszDistrict   BOS_DT_szName (50)  NOT NULL,
 CPszCity   BOS_DT_szMediumName (20)  NOT NULL,
 CPszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 CPszState   BOS_DT_szMediumName (20)  NOT NULL,
 CPszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 CPszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 CPszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 CPszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 CPszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 CPszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 CPszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 TOszContactPerson   BOS_DT_szName (50)  NOT NULL,
 TOszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 TOszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 TOszBuilding   BOS_DT_szName (50)  NOT NULL,
 TOszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 TOszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 TOszDistrict   BOS_DT_szName (50)  NOT NULL,
 TOszCity   BOS_DT_szMediumName (20)  NOT NULL,
 TOszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 TOszState   BOS_DT_szMediumName (20)  NOT NULL,
 TOszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 TOszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 TOszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 TOszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 TOszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 TOszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 TOszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_TaxType(
szTaxTypeId BOS_DT_szMediumId (10)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 decRate   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_Workplace(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szWorkplaceTypeId   BOS_DT_szSmallId (5)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 WpszContactPerson   BOS_DT_szName (50)  NOT NULL,
 WpszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 WpszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 WpszBuilding   BOS_DT_szName (50)  NOT NULL,
 WpszAddress_1   BOS_DT_szName (50)  NOT NULL,
 WpszAddress_2   BOS_DT_szName (50)  NOT NULL,
 WpszDistrict   BOS_DT_szName (50)  NOT NULL,
 WpszCity   BOS_DT_szMediumName (20)  NOT NULL,
 WpszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 WpszState   BOS_DT_szMediumName (20)  NOT NULL,
 WpszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 WpszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 WpszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 WpszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 WpszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 WpszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 WpszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szTaxId   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szCalenderId   BOS_DT_szId (30)  NOT NULL,
 szChiefOfWorkplace   BOS_DT_szName (50)  NOT NULL,
 szPaymentBankId   BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szInvOrgId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 bActive   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_GL_WorkplaceProduct(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decMinQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decMaxQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szPurchOrgId   BOS_DT_szId (30)  NOT NULL,
 szDiscountGroupId   BOS_DT_szId (30)
);
CREATE TABLE BOS_GL_WorkplaceProductCategory(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szCategory   BOS_DT_szId (30)  NOT NULL,
 szCategoryValue   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_Carrier(
szCarrierId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szContactPerson   BOS_DT_szName (50)  NOT NULL,
 szRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 szFloor   BOS_DT_szSmallName (10)  NOT NULL,
 szBuilding   BOS_DT_szName (50)  NOT NULL,
 szAddress_1   BOS_DT_szName (50)  NOT NULL,
 szAddress_2   BOS_DT_szName (50)  NOT NULL,
 szDistrict   BOS_DT_szName (50)  NOT NULL,
 szCity   BOS_DT_szMediumName (20)  NOT NULL,
 szZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 szState   BOS_DT_szMediumName (20)  NOT NULL,
 szCountry   BOS_DT_szMediumName (20)  NOT NULL,
 szPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 szPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 szFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 szMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 szEmail   BOS_DT_szMediumName (20)  NOT NULL,
 szWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_CompUom(
szUomClassId BOS_DT_szMediumId (10)  NOT NULL,
 szCompUomId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szSeparator   varchar (1)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_CompUomItem(
szUomClassId BOS_DT_szMediumId (10)  NOT NULL,
 szCompUomId   BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL
);
CREATE TABLE BOS_INV_ConditionType(
szConditionTypeId BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_INV_CustExpirationDateMapping(
szCustId BOS_DT_szId (30)  NOT NULL,
 szProductCategory   BOS_DT_szId (30)  NOT NULL,
 intMaxExpDay   smallint (5,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_CustomerCategoryInfo(
szCategoryId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szInfoProduct   BOS_DT_szVeryBigMessage (2000),
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FAdjustment(
szFAdjustmentId BOS_DT_szId (30)  NOT NULL,
 dtmAdjustment   timestamp  NOT NULL,
 szReffTrnType   BOS_DT_szMediumId (10)  NOT NULL,
 szReffTrnId   BOS_DT_szId (30)  NOT NULL,
 szReffTrnNewId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_FAdjustmentItem(
szFAdjustmentId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FAdjustmentItemLot(
szFAdjustmentId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FAdjustmentItemSn(
szFAdjustmentId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItem2Number   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FChgLotStatus(
szFChgStatusLotId BOS_DT_szId (30)  NOT NULL,
 dtmFChgStatusLotId   timestamp  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (50)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_FchgLotStatusItem(
szFChgStatusLotId BOS_DT_szId (30)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 szCurrentStatus   BOS_DT_szId (30)  NOT NULL,
 szNewStatus   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FDn(
szFDnId BOS_DT_szId (30)  NOT NULL,
 dtmDelivery   timestamp  NOT NULL,
 szFDoId   BOS_DT_szId (30)  NOT NULL,
 szDestinationType   BOS_DT_szSmallId (5)  NOT NULL,
 szDestinationId   BOS_DT_szId (30)  NOT NULL,
 DlvszContactPerson   BOS_DT_szName (50)  NOT NULL,
 DlvszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 DlvszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 DlvszBuilding   BOS_DT_szName (50)  NOT NULL,
 DlvszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 DlvszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 DlvszDistrict   BOS_DT_szName (50)  NOT NULL,
 DlvszCity   BOS_DT_szMediumName (20)  NOT NULL,
 DlvszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 DlvszState   BOS_DT_szMediumName (20)  NOT NULL,
 DlvszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 DlvszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 DlvszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 DlvszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 DlvszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 DlvszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 DlvszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 szCarrierId   BOS_DT_szId (30)  NOT NULL,
 szVehicleNumber   BOS_DT_szMediumId (10)  NOT NULL,
 szDriverName   BOS_DT_szName (50)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szCustPoId   BOS_DT_szId (30)  NOT NULL,
 dtmCustPo   timestamp  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szFStInId   BOS_DT_szId (30)  NOT NULL,
 bFromDistribution   bit  NOT NULL,
 szFAdjustmentId   BOS_DT_szId (30)  NOT NULL,
 szAdjustedById   BOS_DT_szId (30)  NOT NULL,
 szAdjustToId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkPlaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_FDn2FDnCreated(
szFDn2Id BOS_DT_szId (30)  NOT NULL,
 szWpId   BOS_DT_szId (30)  NOT NULL,
 szFDnId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FDn2ItemDeliverToLotQty(
szFDn2Id BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItemNumber_DeliverTo   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FDnItem(
szFDnId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decQty (18,2)  NOT NULL,
 decUomQty   BOS_DT_decQty (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decCOGS   BOS_DT_decAmount (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FDnItemLotQty(
szFDnId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FDnItemSn(
szFDnId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItem2Number   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FKitMaintenance(
szFKitMaintenanceId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szToProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szId (30)  NOT NULL,
 bExplode   BOS_DT_bBoolean (3,0)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bJournal   smallint (3,0)  NOT NULL,
 bPosted   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)
);
CREATE TABLE BOS_INV_FKitMaintenanceItem(
szFKitMaintenanceId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szId (30)  NOT NULL,
 szToProductId   BOS_DT_szId (30)  NOT NULL,
 decToQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decToUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szToUomId   BOS_DT_szId (30)  NOT NULL,
 decCOGS   BOS_DT_decAmount (18,2)  NOT NULL,
 decToCOGS   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FSid(
szFSidId BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 dtmIn   timestamp  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szFAdjustmentId   BOS_DT_szId (30)  NOT NULL,
 szAdjustedById   BOS_DT_szId (30)  NOT NULL,
 szAdjustToId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szHelperId   BOS_DT_szId (30)  NOT NULL,
 szHelperId_2   BOS_DT_szId (30)  NOT NULL,
 szHelperId_3   BOS_DT_szId (30)  NOT NULL,
 szNoBKB   BOS_DT_szId (30)  NOT NULL,
 decRitKe   BOS_DT_decDecimal (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FSidItem(
szFSidId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FSidItemLotQty(
szFSidId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FSidItemSn(
szFSidId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FSod(
szFSodId BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 dtmOut   timestamp  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szFAdjustmentId   BOS_DT_szId (30)  NOT NULL,
 szAdjustedById   BOS_DT_szId (30)  NOT NULL,
 szAdjustToId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szHelperId   BOS_DT_szId (30)  NOT NULL,
 szHelperId_2   BOS_DT_szId (30)  NOT NULL,
 szHelperId_3   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FSodItem(
szFSodId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FSodItemLotQty(
szFSodId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FSodItemSn(
szFSodId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FSrc(
szFSrcId BOS_DT_szId (30)  NOT NULL,
 dtmReceipt   timestamp  NOT NULL,
 szPoId   BOS_DT_szId (30)  NOT NULL,
 szSupplierId   BOS_DT_szId (30)  NOT NULL,
 szWarehouseId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szRefDn   BOS_DT_szId (30)  NOT NULL,
 szCarrierId   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szVehicleNumber   BOS_DT_szId (30)  NOT NULL,
 szDriverNm   BOS_DT_szName (50)  NOT NULL,
 szFAdjustmentId   BOS_DT_szId (30)  NOT NULL,
 szAdjustedById   BOS_DT_szId (30)  NOT NULL,
 szAdjustToId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_INV_FSrcItem(
szFSrcId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szRefProductId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decPrice   BOS_DT_decAmount (18,2)  NOT NULL,
 bTaxable   BOS_DT_bBoolean (3,0)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 szDistProductId   BOS_DT_szId (30)  NOT NULL,
 decDistQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decDistPrice   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FSrcItemLotInfo(
szFSrcId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLotTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductionCode   BOS_DT_szId (30)  NOT NULL,
 decLotStrength   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 szLotStatus   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_INV_FSrcItemLotQty(
szFSrcId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FSrcItemSn(
szFSrcId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FSrt(
szFSrtId BOS_DT_szId (30)  NOT NULL,
 dtmReturn   timestamp  NOT NULL,
 szStRetType   BOS_DT_szSmallId (5)  NOT NULL,
 szPoId   BOS_DT_szId (30)  NOT NULL,
 szSupplierId   BOS_DT_szId (30)  NOT NULL,
 szWarehouseId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szRefDn   BOS_DT_szId (30)  NOT NULL,
 szCarrierId   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szVehicleNo   BOS_DT_szMediumId (10)  NOT NULL,
 szDriverNm   BOS_DT_szName (50)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szFAdjustmentId   BOS_DT_szId (30)  NOT NULL,
 szAdjustedById   BOS_DT_szId (30)  NOT NULL,
 szAdjustToId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FSrtItem(
szFSrtId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szDistProductId   BOS_DT_szId (30)  NOT NULL,
 decDistQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FSrtItemLotQty(
szFSrtId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FSrtItemSn(
szFSrtId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStCor(
szFStCorId BOS_DT_szId (30)  NOT NULL,
 dtmCorrection   timestamp  NOT NULL,
 szWarehouseId   BOS_DT_szId (30)  NOT NULL,
 szReason   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_FStCorItem(
szFStCorId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 decStockQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decActualQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomStockQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomActualQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decCOGS   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStCorItemLotInfo(
szFStCorId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLotTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductionCode   BOS_DT_szId (30)  NOT NULL,
 decLotStrength   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 szLotStatus   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_INV_FStCorItemLotQty(
szFStCorId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStCorItemSn(
szFStCorId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStIn(
szFStInId BOS_DT_szId (30)  NOT NULL,
 dtmTransfer   timestamp  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szCarrierId   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szDriverNm   BOS_DT_szName (50)  NOT NULL,
 szPoliceNo   BOS_DT_szSmallName (10)  NOT NULL,
 szRefDoc   BOS_DT_szId (30)  NOT NULL,
 szFDnFileName   BOS_DT_szFullPath (255)  NOT NULL,
 szFDnId   BOS_DT_szId (30)  NOT NULL,
 szSenderWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szFAdjustmentId   BOS_DT_szId (30)  NOT NULL,
 szAdjustedById   BOS_DT_szId (30)  NOT NULL,
 szAdjustToId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szFDn2Id   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStInItem(
szFStInId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decCOGS   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStInItemLotInfo(
szFStInId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLotTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductionCode   BOS_DT_szId (30)  NOT NULL,
 decLotStrength   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 szLotStatus   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_INV_FStInItemLotQty(
szFStInId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStInItemSn(
szFStInId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStIntern(
szFStInternId BOS_DT_szId (30)  NOT NULL,
 dtmTransfer   timestamp  NOT NULL,
 szRefDocType   BOS_DT_szMediumId (10)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 szEmployeeId   BOS_DT_szId (30)  NOT NULL,
 szFrWhId   BOS_DT_szId (30)  NOT NULL,
 szFrStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szToWhId   BOS_DT_szId (30)  NOT NULL,
 szToStockTypeId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 bTransportationDetail   BOS_DT_bBoolean (3,0)  NOT NULL,
 szExpedition   BOS_DT_szName (50)  NOT NULL,
 szDriverName   BOS_DT_szName (50)  NOT NULL,
 szVehicleNumber   BOS_DT_szId (30)  NOT NULL,
 szDriver   BOS_DT_szId (30)  NOT NULL,
 szVehicle   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStInternItem(
szFStInternId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStInternItemLotQty(
szFStInternId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStInternItemReason(
szFStInternId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStInternItemSn(
szFStInternId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStMorph(
szFStMorphId BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 dtmMorph   timestamp  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStMorphItem(
szFStMorphId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 bIsSnExist   bit  NOT NULL,
 szToProductId   BOS_DT_szId (30)  NOT NULL,
 szToUomId   BOS_DT_szMediumId (10)  NOT NULL
);
CREATE TABLE BOS_INV_FStMorphItemLotInfo(
szFStMorphId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLotTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductionCode   BOS_DT_szId (30)  NOT NULL,
 decLotStrength   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 szLotStatus   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_INV_FStMorphItemLotQty(
szFStMorphId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStMorphItemSn(
szFStMorphId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStMovingStock(
szFStMovingStockId BOS_DT_szId (30)  NOT NULL,
 dtmTransfer   timestamp  NOT NULL,
 szDirection   BOS_DT_szSmallId (5)  NOT NULL,
 szPartyWpId   BOS_DT_szId (30)  NOT NULL,
 szFrVehicleId   BOS_DT_szId (30)  NOT NULL,
 szFrDriverId   BOS_DT_szId (30)  NOT NULL,
 szToVehicleId   BOS_DT_szId (30)  NOT NULL,
 szToDriverId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_INV_FStMovingStockItem(
szFStMovingStockId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 bIsSnExist   bit  NOT NULL
);
CREATE TABLE BOS_INV_FStMovingStockItemLotQty(
szFStMovingStockId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStMovingStockItemSn(
szFStMovingStockId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStockTransfer(
szFStockTransferId BOS_DT_szId (30)  NOT NULL,
 szStockTransferType   BOS_DT_szId (30)  NOT NULL,
 dtmStockTransferDate   timestamp  NOT NULL,
 szRefDoc   BOS_DT_szBigId (50)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 szReceiveDoc   BOS_DT_szId (30)  NOT NULL,
 szLocationTypeOrigin   BOS_DT_szId (30)  NOT NULL,
 szLocationIdOrigin   BOS_DT_szId (30)  NOT NULL,
 szWarehouseIdOrigin   BOS_DT_szId (30),
 szStockTypeIdOrigin   BOS_DT_szId (30)  NOT NULL,
 szLocationTypeDestination   BOS_DT_szId (30)  NOT NULL,
 szLocationIdDestination   BOS_DT_szId (30)  NOT NULL,
 szWarehouseIdDestination   BOS_DT_szId (30)  NOT NULL,
 szStockTypeIdDestination   BOS_DT_szId (30)  NOT NULL,
 szPOId   BOS_DT_szId (30)  NOT NULL,
 szExpedition   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szVehicleNumber   BOS_DT_szSmallName (10)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szDriverName   BOS_DT_szName (50)  NOT NULL,
 szDeliveryNote   BOS_DT_szId (30)  NOT NULL,
 dtmArriveDepartTime   timestamp  NOT NULL,
 dtmLoadUnloadStartTime   timestamp  NOT NULL,
 dtmLoadUnloadEndTime   timestamp  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szAdjustToId   BOS_DT_szId (30)  NOT NULL,
 szAdjustedById   BOS_DT_szId (30)  NOT NULL,
 szAdjustmentId   BOS_DT_szId (30)  NOT NULL,
 szAdjustmentTrnId   BOS_DT_szId (30)  NOT NULL,
 szRuleTransferType   BOS_DT_szId (30)  NOT NULL,
 iStockTransferStatus   integer (10,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0),
 bJournal   smallint (3,0),
 bNeedApproval   smallint (3,0),
 bPosted   smallint (3,0),
 bRejected   smallint (3,0),
 bResultFrTransfer   smallint (3,0),
 bSystemCreated   smallint (3,0),
 btPrintedCount   smallint (3,0),
 bTransferred   smallint (3,0),
 bVoid   smallint (3,0),
 dtmCreated   timestamp,
 gdApprovedId   bytea (16),
 szApprovalId   BOS_DT_szId (30),
 szCompanyId   BOS_DT_szId (30),
 szCompanyNm   BOS_DT_szName (50),
 szFJournalId   BOS_DT_szId (30),
 szTaxEntityId   BOS_DT_szId (30),
 szUserId   BOS_DT_szId (30),
 szWorkplaceId   BOS_DT_szId (30),
 szWorkplaceNm   BOS_DT_szName (50),
 bAlreadyTransferred   smallint (3,0),
 dtmLastUpdated   timestamp,
 bImportRef   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_FStockTransferItem(
szFStockTransferId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQtyDeliver   BOS_DT_decQty (18,2)  NOT NULL,
 decQtyReceive   BOS_DT_decQty (18,2)  NOT NULL,
 decUomQtyDeliver   BOS_DT_decQty (18,2)  NOT NULL,
 decUomQtyReceive   BOS_DT_decQty (18,2)  NOT NULL,
 szUomId   BOS_DT_szBigId (50)  NOT NULL,
 decCOGSDeliver   BOS_DT_decAmount (18,2)  NOT NULL,
 decCOGSReceive   BOS_DT_decAmount (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 shDocLineNumber   BOS_DT_szId (30)  NOT NULL,
 shRefPOLineNumber   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStockTransferItemCorrection(
szFStockTransferId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decQty (18,2)
);
CREATE TABLE BOS_INV_FStockTransferItemLotInfo(
szFStockTransferId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLotTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductionCode   BOS_DT_szId (30)  NOT NULL,
 decLotStrength   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 szLotStatus   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_INV_FStockTransferItemLotQty(
szFStockTransferId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStockTransferItemLotSn(
szFStockTransferId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItem2Number   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStockTransferItemReason(
szFStockTransferId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decQty (18,2)
);
CREATE TABLE BOS_INV_FStOpname(
szFStOpnameId BOS_DT_szId (30)  NOT NULL,
 szWarehouseId   BOS_DT_szId (30)  NOT NULL,
 szProdCategoryId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStOpnameItem(
szFStOpnameId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQtyStInSystem   BOS_DT_decDecimal (18,2)  NOT NULL,
 decQtyStInPhisic   BOS_DT_decDecimal (18,2)  NOT NULL,
 decQtyStDiff   BOS_DT_decDecimal (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStReject(
szFStRejectId BOS_DT_szId (30)  NOT NULL,
 dtmDocument   timestamp  NOT NULL,
 szRefDocType   BOS_DT_szMediumId (10)  NOT NULL,
 szRefDoc   BOS_DT_szId (30)  NOT NULL,
 szWhId   BOS_DT_szId (30)  NOT NULL,
 szDepartmentId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szEmployeeId   BOS_DT_szId (30)  NOT NULL,
 szQcDocId   BOS_DT_szId (30)  NOT NULL,
 dtmQcDoc   timestamp  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szFAdjustmentId   BOS_DT_szId (30)  NOT NULL,
 szAdjustedById   BOS_DT_szId (30)  NOT NULL,
 szAdjustToId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStRejectItem(
szFStRejectId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szConditionTypeId   BOS_DT_szSmallId (5)  NOT NULL,
 szSuggestionTypeId   BOS_DT_szSmallId (5)  NOT NULL,
 szProductIdTobeSold   BOS_DT_szId (30)  NOT NULL,
 szStockTypeIdToBeSold   BOS_DT_szId (30)  NOT NULL,
 decQtyToBeSold   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQtyToBeSold   BOS_DT_decAmount (18,2)  NOT NULL,
 decCOGS   BOS_DT_decAmount (18,2)  NOT NULL,
 decNewProductCOGS   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomIdToBeSold   BOS_DT_szMediumId (10)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 szParentIdToBeSold   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FStRejectItemLotQty(
szFStRejectId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FStRejectItemSn(
szFStRejectId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItem2Number   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FVRema(
szFVRemaId BOS_DT_szId (30)  NOT NULL,
 dtmRemain   timestamp  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szFAdjustmentId   BOS_DT_szId (30)  NOT NULL,
 szAdjustedById   BOS_DT_szId (30)  NOT NULL,
 szAdjustToId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FVRemaItem(
szFVRemaId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_FVRemaItemLotQty(
szFVRemaId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_FVRemaItemSn(
szFVRemaId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_INV_FWhClosing(
szFWhClosingId BOS_DT_szId (30)  NOT NULL,
 dtmClosing   timestamp  NOT NULL,
 szWareHouseId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_InvOrg(
szInvOrgId BOS_DT_szId (30)  NOT NULL,
 szCostingMethod   BOS_DT_szSmallId (5)  NOT NULL,
 bDisableLotTracking   BOS_DT_bBoolean (3,0)  NOT NULL,
 bDisableSnTracking   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_KitConversion(
szFromKitProductId BOS_DT_szId (30)  NOT NULL,
 szToKitProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   numeric (18,0)  NOT NULL,
 bJoin   BOS_DT_bBoolean (3,0)  NOT NULL,
 bBreak   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_KitConversionItem(
szFromKitProductId BOS_DT_szId (30)  NOT NULL,
 szChildFromKitProductId   BOS_DT_szId (30)  NOT NULL,
 decQtyChildFromKitProductId   numeric (18,0)  NOT NULL,
 szToKitProductId   BOS_DT_szId (30)  NOT NULL,
 szChildToKitProductId   BOS_DT_szId (30)  NOT NULL,
 decQtyChildToKitProductId   numeric (18,0)  NOT NULL,
 shItemNumber   numeric (18,0)  NOT NULL
);
CREATE TABLE BOS_INV_LotInfo(
szLotId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLotTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductionCode   BOS_DT_szId (30)  NOT NULL,
 decLotStrength   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 szLotStatus   BOS_DT_szSmallId (5)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_LotStatus(
szLotStatusId BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bAvailableForSales   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_OrderItemType(
szOrderItemTypeId BOS_DT_szId (30)  NOT NULL,
 bTaxable   bit  NOT NULL,
 bSubjectToInvoice   bit  NOT NULL,
 szTrnType   BOS_DT_szSmallId (5)  NOT NULL,
 szRentChargeCalcId   BOS_DT_szId (30)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 bApplicable4AllProduct   bit  NOT NULL,
 bApplicable4AllDistrChannel   bit  NOT NULL,
 bApplicable4AllSalesOrg   bit  NOT NULL,
 bApplicable4AllWorkplace   bit  NOT NULL,
 bApplicable4AllCust   bit  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL,
 szInvoiceGroupId   BOS_DT_szId (30)  NOT NULL,
 szReturnOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 bMustFillTrnReason   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 bAllowZeroPrice   BOS_DT_bBoolean (3,0)  NOT NULL,
 bAllowNegativeQty   BOS_DT_bBoolean (3,0)  NOT NULL,
 bAllowPositiveQty   BOS_DT_bBoolean (3,0)  NOT NULL,
 bAllowEmptyTrnReason   BOS_DT_bBoolean (3,0)  NOT NULL,
 bAllowDifferentSignInQty   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_OrderItemTypeCust(
szOrderItemTypeId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_OrderItemTypeDistrChannel(
szOrderItemTypeId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szDistrChannelId   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_INV_OrderItemTypeProduct(
szOrderItemTypeId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_OrderItemTypeSalesOrg(
szOrderItemTypeId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_OrderItemTypeWorkplace(
szOrderItemTypeId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_OrderType(
szOrderTypeId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bAllowManualPrice   bit  NOT NULL,
 bAllowToChangeLinePriceDate   BOS_DT_bBoolean (3,0)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 szFlexiKeyId   BOS_DT_szId (30)  NOT NULL,
 bApplicable4AllOrderItemType   bit  NOT NULL,
 bApplicable4AllProduct   bit  NOT NULL,
 bApplicable4AllDistrChannel   bit  NOT NULL,
 bApplicable4AllSalesOrg   bit  NOT NULL,
 bApplicable4AllWorkplace   bit  NOT NULL,
 bApplicable4AllCust   bit  NOT NULL,
 szReturnOrderTypeId   BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_OrderTypeCust(
szOrderTypeId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_OrderTypeDistrChannel(
szOrderTypeId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szDistrChannelId   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_INV_OrderTypeOrderItemType(
szOrderTypeId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_OrderTypeProduct(
szOrderTypeId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_OrderTypeSalesOrg(
szOrderTypeId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_OrderTypeWorkplace(
szOrderTypeId BOS_DT_szId (30)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_Price(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szUsageType   BOS_DT_szSmallId (5)  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId_1   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId_2   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmValidStart   timestamp  NOT NULL,
 bIsSpecificEndDate   smallint (3,0)  NOT NULL,
 dtmValidEnd   timestamp  NOT NULL,
 szNextOwnerTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szNextPriceId   BOS_DT_szId (30)  NOT NULL,
 szProductCat_1   BOS_DT_szId (30)  NOT NULL,
 szProductCat_2   BOS_DT_szId (30)  NOT NULL,
 szProductCat_3   BOS_DT_szId (30)  NOT NULL,
 szPriceCombCd   BOS_DT_szMediumId (10)  NOT NULL,
 shPriceCombOrder   smallint (5,0)  NOT NULL,
 szQualifierId   BOS_DT_szBigId (50)  NOT NULL,
 szQualifierId_2   BOS_DT_szBigId (50)  NOT NULL,
 szQualifierId_3   BOS_DT_szBigId (50)  NOT NULL,
 szDiscGroupId   BOS_DT_szId (30)  NOT NULL,
 szDiscGroupId_2   BOS_DT_szId (30)  NOT NULL,
 szDiscGroupId_3   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_PriceItem(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 bBaseOnAmount   BOS_DT_bBoolean (3,0)  NOT NULL,
 bUnitBaseOnAmount   BOS_DT_bBoolean (3,0)  NOT NULL,
 bUseForPriceCalculation   BOS_DT_bBoolean (3,0)  NOT NULL,
 bUsePriceWTax   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasDiscountBonus   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasProductBonus   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmItemValidStart   timestamp  NOT NULL,
 bIsSpecificEndDate   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmItemValidEnd   timestamp  NOT NULL,
 bProgressive   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_PriceItemDiscBonus(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decMinQty   BOS_DT_decQty (18,2)  NOT NULL,
 decUnitQty   BOS_DT_decQty (18,2)  NOT NULL,
 decBonusDisc   BOS_DT_decPrice (18,8)  NOT NULL,
 szDiscType   BOS_DT_szSmallId (5)  NOT NULL,
 szOrderItemType   BOS_DT_szId (30)  NOT NULL,
 bSeparateDiscItem   smallint (3,0)  NOT NULL,
 bCalcFrPrevDiscAmt   smallint (3,0)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL,
 dtmItemValidStart   timestamp  NOT NULL,
 decInitialQty   BOS_DT_decQty (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_PriceItemPricing(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decMinQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 dtmItemValidStart   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_PriceItemProductBonus(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decMinQty   BOS_DT_decQty (18,2)  NOT NULL,
 decUnitQty   BOS_DT_decQty (18,2)  NOT NULL,
 dtmItemValidStart   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_PriceItemProductBonusItem(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decMinQty   BOS_DT_decQty (18,2)  NOT NULL,
 szBonusProductId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 decBonusQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szBonusType   BOS_DT_szSmallId (5)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL,
 dtmItemValidStart   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrder(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szUsageType   BOS_DT_szSmallId (5)  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId_1   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId_2   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bIsSpecificEndDate   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmValidStart   timestamp  NOT NULL,
 dtmValidEnd   timestamp  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 bHasCombinationBonus   BOS_DT_bBoolean (3,0)  NOT NULL,
 bOnlyCalculateFrCombination   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasAmountDiscBonus   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasAmountProductBonus   BOS_DT_bBoolean (3,0)  NOT NULL,
 bMinDiscBaseOnAmount   BOS_DT_bBoolean (3,0)  NOT NULL,
 bUnitDiscBaseOnAmount   BOS_DT_bBoolean (3,0)  NOT NULL,
 bMinBonusBaseOnAmount   BOS_DT_bBoolean (3,0)  NOT NULL,
 bUnitBonusBaseOnAmount   BOS_DT_bBoolean (3,0)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szNextOwnerTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szNextPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szPriceCombCd   BOS_DT_szMediumId (10)  NOT NULL,
 shPriceCombOrder   smallint (5,0)  NOT NULL,
 szQualifierId   BOS_DT_szBigId (50)  NOT NULL,
 szQualifierId_2   BOS_DT_szBigId (50)  NOT NULL,
 szQualifierId_3   BOS_DT_szBigId (50)  NOT NULL,
 szDiscGroupId   BOS_DT_szId (30)  NOT NULL,
 szDiscGroupId_2   BOS_DT_szId (30)  NOT NULL,
 szDiscGroupId_3   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 bHasProvisionBonus   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderAmountDiscBonus(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 decMinAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decUnitAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decBonusDisc   BOS_DT_decPrice (18,8)  NOT NULL,
 szDiscType   BOS_DT_szSmallId (5)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 bCalcFrPrevDiscAmt   smallint (3,0)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderAmountProductBonus(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 decMinAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decUnitAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderAmountProductBonusItem(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 decMinAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 szBonusProductId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 decBonusQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szBonusType   BOS_DT_szSmallId (5)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderItem(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szProductId_1   BOS_DT_szId (30)  NOT NULL,
 szProductId_2   BOS_DT_szId (30)  NOT NULL,
 szProductId_3   BOS_DT_szId (30)  NOT NULL,
 szProductId_4   BOS_DT_szId (30)  NOT NULL,
 szProductId_5   BOS_DT_szId (30)  NOT NULL,
 decQty_1   BOS_DT_decAmount (18,2)  NOT NULL,
 decQty_2   BOS_DT_decAmount (18,2)  NOT NULL,
 decQty_3   BOS_DT_decAmount (18,2)  NOT NULL,
 decQty_4   BOS_DT_decAmount (18,2)  NOT NULL,
 decQty_5   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId_1   BOS_DT_szMediumId (10)  NOT NULL,
 szUomId_2   BOS_DT_szMediumId (10)  NOT NULL,
 szUomId_3   BOS_DT_szMediumId (10)  NOT NULL,
 szUomId_4   BOS_DT_szMediumId (10)  NOT NULL,
 szUomId_5   BOS_DT_szMediumId (10)  NOT NULL,
 bHasDiscountBonus   smallint (3,0)  NOT NULL,
 bHasProductBonus   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderItemDiscBonus(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szProductId_1   BOS_DT_szId (30)  NOT NULL,
 szProductId_2   BOS_DT_szId (30)  NOT NULL,
 szProductId_3   BOS_DT_szId (30)  NOT NULL,
 szProductId_4   BOS_DT_szId (30)  NOT NULL,
 szProductId_5   BOS_DT_szId (30)  NOT NULL,
 decMinQty   BOS_DT_decQty (18,2)  NOT NULL,
 decUnitQty   BOS_DT_decQty (18,2)  NOT NULL,
 decBonusDisc   BOS_DT_decPrice (18,8)  NOT NULL,
 szDiscType   BOS_DT_szSmallId (5)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 bCalcFrPrevDiscAmt   smallint (3,0)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderItemProductBonus(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szProductId_1   BOS_DT_szId (30)  NOT NULL,
 szProductId_2   BOS_DT_szId (30)  NOT NULL,
 szProductId_3   BOS_DT_szId (30)  NOT NULL,
 szProductId_4   BOS_DT_szId (30)  NOT NULL,
 szProductId_5   BOS_DT_szId (30)  NOT NULL,
 decMinQty   BOS_DT_decQty (18,2)  NOT NULL,
 decUnitQty   BOS_DT_decQty (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderItemProductBonusItem(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 szProductId_1   BOS_DT_szId (30)  NOT NULL,
 szProductId_2   BOS_DT_szId (30)  NOT NULL,
 szProductId_3   BOS_DT_szId (30)  NOT NULL,
 szProductId_4   BOS_DT_szId (30)  NOT NULL,
 szProductId_5   BOS_DT_szId (30)  NOT NULL,
 decMinQty   BOS_DT_decQty (18,2)  NOT NULL,
 szBonusProductId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 decBonusQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szBonusType   BOS_DT_szSmallId (5)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderProvision(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 shProvisionId   integer (10,0)  NOT NULL,
 shMinProductOrder   integer (10,0)  NOT NULL,
 bBaseOnAmount   smallint (3,0)  NOT NULL,
 bHasDiscountBonus   smallint (3,0)  NOT NULL,
 bHasProductBonus   smallint (3,0)  NOT NULL,
 bHasMinOrderOnAmount   smallint (3,0)  NOT NULL,
 szUomId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderProvisionItem(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 shProvisionId   integer (10,0)  NOT NULL,
 shProvisionItemId   integer (10,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decMinOrder   numeric (18,2)  NOT NULL,
 szUomId   BOS_DT_szId (30)  NOT NULL,
 bMustOrder   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderProvisionItemDiscount(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 shProvisionId   integer (10,0)  NOT NULL,
 shProvisionItemId   integer (10,0)  NOT NULL,
 decMinQty   numeric (18,2)  NOT NULL,
 decUnitQty   numeric (18,2)  NOT NULL,
 szDiscType   BOS_DT_szId (30)  NOT NULL,
 decBonusDisc   numeric (18,2)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 bCalcFrPrevDiscAmt   smallint (3,0)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderProvisionItemProductBonus(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 shProvisionId   integer (10,0)  NOT NULL,
 shProvisionItemId   integer (10,0)  NOT NULL,
 decMinQty   numeric (18,2)  NOT NULL,
 decUnitQty   numeric (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_PriceOrderProvisionItemProductBonusItem(
szOwnerTrnId BOS_DT_szMediumId (10)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 gdHistory   bytea (16)  NOT NULL,
 shProvisionId   integer (10,0)  NOT NULL,
 shProvisionItemId   integer (10,0)  NOT NULL,
 shProvisionProductBonusItemId   integer (10,0)  NOT NULL,
 szBonusProductId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 decBonusQty   numeric (18,2)  NOT NULL,
 szUomId   BOS_DT_szId (30)  NOT NULL,
 szBonusType   BOS_DT_szId (30)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_Product(
szProductId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szNickName   BOS_DT_szName (50)  NOT NULL,
 bService   bit  NOT NULL,
 szTrackingType   BOS_DT_szSmallId (5)  NOT NULL,
 szUomClassId   BOS_DT_szMediumId (10)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 bKit   bit  NOT NULL,
 bExplodeKit   bit  NOT NULL,
 bBreakNonExplodeKit   BOS_DT_bBoolean (3,0)  NOT NULL,
 szCategory_1   BOS_DT_szId (30)  NOT NULL,
 szCategory_2   BOS_DT_szId (30)  NOT NULL,
 szCategory_3   BOS_DT_szId (30)  NOT NULL,
 szCategory_4   BOS_DT_szId (30)  NOT NULL,
 szCategory_5   BOS_DT_szId (30)  NOT NULL,
 szQtyFormat   BOS_DT_szQtyFormat (20)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szArClassId   BOS_DT_szId (30)  NOT NULL,
 szTaxTypeId   BOS_DT_szId (30)  NOT NULL,
 szCompUomId   BOS_DT_szId (30)  NOT NULL,
 szSupplyType   BOS_DT_szSmallId (5)  NOT NULL,
 bDoNotCheckQtyWhenDoProductBooking   smallint (3,0)  NOT NULL,
 dtmValidStart   timestamp  NOT NULL,
 dtmValidEnd   timestamp  NOT NULL,
 szDiscountGroupId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 bUsedByAllWorkplace   BOS_DT_bBoolean (3,0)  NOT NULL,
 szCategory_6   BOS_DT_szId (30)  NOT NULL,
 szCategory_7   BOS_DT_szId (30)  NOT NULL,
 szCategory_8   BOS_DT_szId (30)  NOT NULL,
 szCategory_9   BOS_DT_szId (30)  NOT NULL,
 szCategory_10   BOS_DT_szId (30)  NOT NULL,
 dtmPromoStart   timestamp  NOT NULL,
 dtmPromoEnd   timestamp  NOT NULL,
 szBarcode   BOS_DT_szId (30)  NOT NULL,
 bPromo   BOS_DT_bBoolean (3,0)  NOT NULL,
 bShowKit   bit  NOT NULL,
 szBarcodeSekunder   BOS_DT_szId (30)  NOT NULL,
 szBarcodeTersier   BOS_DT_szId (30)  NOT NULL,
 szApplicationClass   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_ProductCategory(
szProductCategoryId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szCategoryType   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_ProductCategoryInfo(
szProductCategoryId BOS_DT_szId (30)  NOT NULL,
 szInfoProduct   BOS_DT_szVeryBigMessage (2000)
);
CREATE TABLE BOS_INV_ProductCategoryType(
szCategoryType BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_ProductInfo(
szProductId BOS_DT_szId (30)  NOT NULL,
 szProductCategoryId   BOS_DT_szId (30)  NOT NULL,
 szInfoProduct   BOS_DT_szVeryBigMessage (2000),
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_ProductKitItem(
szProductId BOS_DT_szId (30)  NOT NULL,
 szKitItemProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL
);
CREATE TABLE BOS_INV_ProductKnowledge(
szProductId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szBigDescription (250)  NOT NULL
);
CREATE TABLE BOS_INV_ProductPositionInfo(
szProductId BOS_DT_szId (30)  NOT NULL,
 szMediaType   BOS_DT_szSmallId (5)  NOT NULL,
 szMediaTitle   BOS_DT_szName (50)  NOT NULL,
 szMachineBrandId   BOS_DT_szId (30)  NOT NULL,
 szMachineType   BOS_DT_szId (30)  NOT NULL,
 shYear   smallint (5,0)  NOT NULL,
 szMachineSN   BOS_DT_szSN (30)  NOT NULL,
 szDrawingNumber   BOS_DT_szId (30)  NOT NULL,
 szPositionNumber   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_ProductPrice(
szProductId BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 bUsePriceWTax   bit  NOT NULL,
 decPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 szPriceCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_ProductPurchaseInfo(
szProductId BOS_DT_szId (30)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szTaxTypeId   BOS_DT_szId (30)  NOT NULL,
 bUsePriceWTax   bit  NOT NULL,
 decPurchPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 szPriceCcyId   BOS_DT_szId (30)  NOT NULL,
 decLastPurchPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 dtmLastPurchDate   timestamp  NOT NULL,
 szLastSupplierId   BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 szDefaultSuppId   BOS_DT_szId (30)  NOT NULL,
 decBasePurchPrice_S   BOS_DT_decPrice (18,8)  NOT NULL
);
CREATE TABLE BOS_INV_ProductSerNum(
szProductId BOS_DT_szId (30)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_INV_ProductTechnicalSpecInfo(
szProductId BOS_DT_szId (30)  NOT NULL,
 decWeight   numeric (18,4)  NOT NULL,
 szUomWeight   BOS_DT_szMediumId (10)  NOT NULL,
 decVolume   numeric (18,4)  NOT NULL,
 szUomVolume   BOS_DT_szMediumId (10)  NOT NULL,
 decLength   numeric (18,4)  NOT NULL,
 szUomLength   BOS_DT_szMediumId (10)  NOT NULL,
 decWidth   numeric (18,4)  NOT NULL,
 szUomWidth   BOS_DT_szMediumId (10)  NOT NULL,
 decHeight   numeric (18,4)  NOT NULL,
 szUomHeight   BOS_DT_szMediumId (10)  NOT NULL,
 decStoreTemp   numeric (18,4)  NOT NULL,
 szUomTemp   BOS_DT_szMediumId (10)  NOT NULL,
 decStoreHuminity   numeric (18,4)  NOT NULL,
 szUomHuminity   BOS_DT_szMediumId (10)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_INV_ProductVariance(
szVarianceId BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_ProductVarianceItem(
szVarianceId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_INV_ShippingNetwork(
szWorkplaceSenderId BOS_DT_szId (30)  NOT NULL,
 szWorkplaceReceiverId   BOS_DT_szId (30)  NOT NULL,
 shEstimatedDelivery   smallint (5,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_Stock(
szProductId BOS_DT_szId (30)  NOT NULL,
 szLocationType   varchar (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szReportedAsType   varchar (5)  NOT NULL,
 szReportedAsId   BOS_DT_szId (30)  NOT NULL,
 decQtyOnHand   numeric (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 bFreeze   smallint (3,0)  NOT NULL,
 szDistProductId   BOS_DT_szId (30)  NOT NULL,
 decDistQtyOnHand   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_StockAllocation(
szProductId BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 decAllocatedQty   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 decWpAllocatedQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_StockCostLayer(
szProductId BOS_DT_szId (30)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szReportedAsId   BOS_DT_szId (30)  NOT NULL,
 decPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_StockHistory(
szProductId BOS_DT_szId (30)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmTransaction   timestamp  NOT NULL,
 gdHistoryId   bytea (16)  NOT NULL,
 shOrder   smallint (5,0)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decDocQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szDocUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szStockTransferReason   BOS_DT_szSmallId (5)  NOT NULL,
 szOrderTypeId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 szReportedAsType   BOS_DT_szSmallId (5)  NOT NULL,
 szReportedAsId   BOS_DT_szId (30)  NOT NULL,
 szPartyType   BOS_DT_szSmallId (5)  NOT NULL,
 szPartyId   BOS_DT_szId (30)  NOT NULL,
 szEmployeeId   BOS_DT_szId (30)  NOT NULL,
 szRefDocId   BOS_DT_szId (30)  NOT NULL,
 szPartyLocType   BOS_DT_szSmallId (5)  NOT NULL,
 szPartyLocId   BOS_DT_szId (30)  NOT NULL,
 szFakturPajakId   BOS_DT_szId (30)  NOT NULL,
 decCOGS   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bFreeze   smallint (3,0)  NOT NULL,
 szDistProductId   BOS_DT_szId (30)  NOT NULL,
 decDistQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_StockLot(
szLotId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 decQtyOnHand   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_StockLotHistory(
szLotId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmTransaction   timestamp  NOT NULL,
 gdStockHistoryId   bytea (16)  NOT NULL,
 shOrder   smallint (5,0)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decDocQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szDocUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szBigId (50)  NOT NULL,
 szStockTransferReason   BOS_DT_szSmallId (5)  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_StockOpname(
szStockOpnameId BOS_DT_szId (30)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0),
 szStockOpnameStatus   varchar (30)  NOT NULL,
 dtmDocumentDate   timestamp  NOT NULL,
 szRemarks   BOS_DT_szBigDescription (250),
 szPicEmployeeId   BOS_DT_szId (30),
 szParameter   varchar (20),
 szOpnameNotes   BOS_DT_szBigDescription (250),
 szValidateMessage   BOS_DT_szBigDescription (250),
 szCorrectionStockDocument   BOS_DT_szBigDescription (250),
 szFDOTekorDocument   BOS_DT_szBigDescription (250),
 btPrintedCount   smallint (3,0),
 szWorkplaceId   BOS_DT_szId (30),
 szCompanyId   BOS_DT_szId (30),
 btStockOpnameCount   smallint (3,0),
 bLocked   smallint (3,0),
 bConfirmed   smallint (3,0),
 szCancelReason   BOS_DT_szBigDescription (250)
);
CREATE TABLE BOS_INV_StockOpnameItem(
szStockOpnameId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szCompUOMId   BOS_DT_szId (30),
 decStockOpnameValue   BOS_DT_decAmount (18,2),
 decSwapValue   BOS_DT_decAmount (18,2),
 decSurplusValue   BOS_DT_decAmount (18,2),
 decDefisitValue   BOS_DT_decAmount (18,2),
 decQtyOnHand   numeric (18,2),
 bIsProceed   smallint (3,0),
 bIsLocked   smallint (3,0),
 bIsDiffValue   smallint (3,0),
 decPrice   BOS_DT_decPrice (18,8),
 szUomId   BOS_DT_szMediumId (10),
 szPriceCcyId   BOS_DT_szSmallId (5)
);
CREATE TABLE BOS_INV_StockOpnameItemLotInfo(
szStockOpnameId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 szLotTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductionCode   BOS_DT_szId (30)  NOT NULL,
 decLotStrength   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 szLotStatus   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_INV_StockOpnameItemLotQty(
szStockOpnameId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_INV_StockOpnameProductCategory(
szStockOpnameId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 bIsProduct   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_StockSN(
szProductSn BOS_DT_szSN (30)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szReportedAsType   BOS_DT_szSmallId (5)  NOT NULL,
 szReportedAsId   BOS_DT_szId (30)  NOT NULL,
 shQty   smallint (5,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 iSyncTransferStatus   smallint (5,0)  NOT NULL
);
CREATE TABLE BOS_INV_StockSNHistory(
szProductSn BOS_DT_szSN (30)  NOT NULL,
 gdStockHistoryId   bytea (16)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szReportedAsType   BOS_DT_szSmallId (5)  NOT NULL,
 szReportedAsId   BOS_DT_szId (30)  NOT NULL,
 shQty   smallint (5,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 iSyncTransferStatus   smallint (5,0)  NOT NULL
);
CREATE TABLE BOS_INV_StockSnProduct(
szProductSn BOS_DT_szSN (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 dtmLastChecked   timestamp  NOT NULL,
 szSuppId   BOS_DT_szId (30)  NOT NULL,
 szCheckerId   BOS_DT_szId (30)  NOT NULL,
 szChassisNumber   BOS_DT_szMediumName (20)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 iSyncTransferStatus   smallint (5,0)  NOT NULL
);
CREATE TABLE BOS_INV_StockToDeliver(
szProductId BOS_DT_szId (30)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 dtmDelivery   timestamp  NOT NULL,
 decQtyToDeliver   BOS_DT_decAmount (18,2)  NOT NULL,
 decQtyDelivered   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_StockToReceive(
szProductId BOS_DT_szId (30)  NOT NULL,
 szLocationType   BOS_DT_szSmallId (5)  NOT NULL,
 szLocationId   BOS_DT_szId (30)  NOT NULL,
 dtmReceive   timestamp  NOT NULL,
 decQtyToReceive   BOS_DT_decAmount (18,2)  NOT NULL,
 decQtyReceived   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_StockTransferType(
szStockTransferTypeId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100),
 szRuleTransfer   varchar (50)  NOT NULL,
 iStatus   integer (10,0),
 szReceiveStockTransferType   varchar (50),
 szApproval   varchar (50),
 bDocRef   BOS_DT_bBoolean (3,0),
 bActive   BOS_DT_bBoolean (3,0),
 bAllowQtyNol   BOS_DT_bBoolean (3,0),
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_StockType(
szStockTypeId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bAvailableForSales   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_StockWarehouseAllocation(
szProductId BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szWarehouseId   BOS_DT_szId (30)  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 decAllocatedQty   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_INV_SuggestionType(
szSuggestionTypeId BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_INV_Uom(
szUomClassId BOS_DT_szMediumId (10)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 bLock   bit  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_UomClass(
szUomClassId BOS_DT_szMediumId (10)  NOT NULL,
 szDescription   BOS_DT_szBigDescription (250)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_UomConversion(
szUomClassId BOS_DT_szMediumId (10)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szToUomClassId   BOS_DT_szMediumId (10)  NOT NULL,
 szToUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decValue   BOS_DT_decUomConv (18,8)  NOT NULL
);
CREATE TABLE BOS_INV_Vehicle(
szVehicleId BOS_DT_szId (30)  NOT NULL,
 szPoliceNo   BOS_DT_szSmallName (10)  NOT NULL,
 szChassisNo   BOS_DT_szMediumName (20)  NOT NULL,
 szMachineNo   BOS_DT_szMediumName (20)  NOT NULL,
 szVehicleCapacityId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 bActive   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_VehicleCapacity(
szVehicleCapacityId BOS_DT_szMediumId (10)  NOT NULL,
 decMaxWeight   BOS_DT_decAmount (18,2)  NOT NULL,
 decMaxVolume   BOS_DT_decAmount (18,2)  NOT NULL,
 szWeightUomId   BOS_DT_szId (30)  NOT NULL,
 szVolumeUomId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_Warehouse(
szWarehouseId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 WhszContactPerson   BOS_DT_szName (50)  NOT NULL,
 WhszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 WhszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 WhszBuilding   BOS_DT_szName (50)  NOT NULL,
 WhszAddress_1   BOS_DT_szName (50)  NOT NULL,
 WhszAddress_2   BOS_DT_szName (50)  NOT NULL,
 WhszDistrict   BOS_DT_szName (50)  NOT NULL,
 WhszCity   BOS_DT_szMediumName (20)  NOT NULL,
 WhszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 WhszState   BOS_DT_szMediumName (20)  NOT NULL,
 WhszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 WhszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 WhszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 WhszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 WhszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 WhszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 WhszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_INV_WarehouseStockType(
szWarehouseId BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_MD_Competitor(
szCompetitorId BOS_DT_szId (30)  NOT NULL,
 szCompetitorNm   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_MD_CompetitorActivity(
gdHistoryId bytea (16)  NOT NULL,
 szCompetitorId   BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szCompetitorActivityReasonId   BOS_DT_szId (30)  NOT NULL,
 szActivity   BOS_DT_szDescription (100)  NOT NULL,
 szWorkplaceId   BOS_DT_szDescription (100)  NOT NULL,
 szTeamId   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_MD_Device(
szDeviceId BOS_DT_szDeviceId (100)  NOT NULL,
 szDeviceType   BOS_DT_szId (30)  NOT NULL,
 bHasGprs   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasGps   BOS_DT_bBoolean (3,0)  NOT NULL,
 szGpsType   BOS_DT_szSmallId (5)  NOT NULL,
 bHasPrinter   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasBarcode   BOS_DT_bBoolean (3,0)  NOT NULL,
 szBarcodeReaderType   BOS_DT_szSmallId (5)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_MD_DevicePack(
szDeviceId BOS_DT_szDeviceId (100)  NOT NULL,
 abtPackData   bytea (1000)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_MD_DummyCustomer(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szEmployeeId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_MD_EmployeeDevice(
szEmployeeId BOS_DT_szId (30)  NOT NULL,
 szDeviceId   BOS_DT_szDeviceId (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_MD_ExpenseMapping(
szWpId BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_MD_ExpenseMappingItem(
szWpId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szAccId   BOS_DT_szId (30)  NOT NULL,
 szSubAccId   BOS_DT_szGLAccount (100)  NOT NULL,
 szExpenseType   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_MD_FPromoActivity(
szDocId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szCustomerId   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szPromoActivityId   BOS_DT_szId (30)  NOT NULL,
 szPromoActivityName   BOS_DT_szName (50)  NOT NULL,
 bProductPromo   smallint (3,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decDecimal (18,2)  NOT NULL,
 szAccountId   BOS_DT_szId (30)  NOT NULL,
 szAccountDesc   BOS_DT_szDescription (100)  NOT NULL,
 decAmount   BOS_DT_decDecimal (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_MD_FSurvey(
szCustId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szSurveyId   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_MD_FSurveyItem(
szCustId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szSurveyId   BOS_DT_szId (30)  NOT NULL,
 szSubject   BOS_DT_szDescription (100)  NOT NULL,
 szAnswer1   BOS_DT_szDescription (100)  NOT NULL,
 szAnswer2   BOS_DT_szDescription (100)  NOT NULL,
 szAnswer3   BOS_DT_szDescription (100)  NOT NULL,
 szAnswer4   BOS_DT_szDescription (100)  NOT NULL,
 szSubjectType   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_MD_PromoActivity(
szPromoActivityId BOS_DT_szId (30)  NOT NULL,
 szPromoActivityName   BOS_DT_szName (50)  NOT NULL,
 bProductPromo   smallint (3,0)  NOT NULL,
 bPromoExpense   smallint (3,0)  NOT NULL,
 bActive   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_MD_SalesmanTaskList(
szSalesmanId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 lTaskId   bigint (19,0)  NOT NULL,
 szTask   BOS_DT_szBigDescription (250)  NOT NULL,
 szDesc   BOS_DT_szBigDescription (250)  NOT NULL,
 szStatus   BOS_DT_szSmallName (10)  NOT NULL,
 bNewRow   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_MD_Survey(
szSurveyId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szTitle1   BOS_DT_szId (30)  NOT NULL,
 szTitle2   BOS_DT_szId (30)  NOT NULL,
 szTitle3   BOS_DT_szId (30)  NOT NULL,
 szTitle4   BOS_DT_szId (30)  NOT NULL,
 szEntryType1   BOS_DT_szId (30)  NOT NULL,
 szEntryType2   BOS_DT_szId (30)  NOT NULL,
 szEntryType3   BOS_DT_szId (30)  NOT NULL,
 szEntryType4   BOS_DT_szId (30)  NOT NULL,
 szEntryMode1   BOS_DT_szId (30)  NOT NULL,
 szEntryMode2   BOS_DT_szId (30)  NOT NULL,
 szEntryMode3   BOS_DT_szId (30)  NOT NULL,
 szEntryMode4   BOS_DT_szId (30)  NOT NULL,
 dtValidFrom   timestamp  NOT NULL,
 dtValidTo   timestamp  NOT NULL,
 bMustBeFilled   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_MD_SurveyInputSelection(
szSurveyInputSelectionId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szName (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_MD_SurveyInputSelectionItem(
szSurveyInputSelectionId BOS_DT_szId (30)  NOT NULL,
 szOption   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_MD_SurveyItem(
szSurveyId BOS_DT_szId (30)  NOT NULL,
 szSubject   BOS_DT_szDescription (100)  NOT NULL,
 szSubjectType   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_MD_SurveyItemWorkPlace(
szSurveyId BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceName   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_MD_SurveySalesMapping(
szSurveyId BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szSalesName   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_MD_UploadHistory(
szUri BOS_DT_szUri (50)  NOT NULL,
 szMobileDocId   BOS_DT_szBigId (50)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 dtmTransaction   timestamp  NOT NULL,
 dtmUpload   timestamp  NOT NULL,
 szDFsDocId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_MKT_FPromo(
szFPromoId BOS_DT_szId (30)  NOT NULL,
 dtmStart   timestamp  NOT NULL,
 dtmEnd   timestamp  NOT NULL,
 szPromoMediaId1   BOS_DT_szId (30)  NOT NULL,
 szPromoMediaId2   BOS_DT_szId (30)  NOT NULL,
 szPromoMediaId3   BOS_DT_szId (30)  NOT NULL,
 szPromoMediaId4   BOS_DT_szId (30)  NOT NULL,
 szPromoMediaId5   BOS_DT_szId (30)  NOT NULL,
 szPromoTypeId1   BOS_DT_szId (30)  NOT NULL,
 szPromoTypeId2   BOS_DT_szId (30)  NOT NULL,
 szPromoTypeId3   BOS_DT_szId (30)  NOT NULL,
 szPromoTypeId4   BOS_DT_szId (30)  NOT NULL,
 szPromoTypeId5   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_MKT_FPromoItem(
szFPromoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 dtmEvent   timestamp  NOT NULL,
 decCountOfPerformance   BOS_DT_decAmount (18,2)  NOT NULL,
 decDuration   BOS_DT_decAmount (18,2)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_MKT_PromoViewer(
szPromoViewerId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szDateRange   BOS_DT_szId (30)  NOT NULL,
 dtmStart   timestamp  NOT NULL,
 dtmEnd   timestamp  NOT NULL,
 szTimeGranular   BOS_DT_szId (30)  NOT NULL,
 szPromoMediaId1   BOS_DT_szId (30)  NOT NULL,
 szPromoMediaId2   BOS_DT_szId (30)  NOT NULL,
 szPromoMediaId3   BOS_DT_szId (30)  NOT NULL,
 szPromoMediaId4   BOS_DT_szId (30)  NOT NULL,
 szPromoMediaId5   BOS_DT_szId (30)  NOT NULL,
 szPromoTypeId1   BOS_DT_szId (30)  NOT NULL,
 szPromoTypeId2   BOS_DT_szId (30)  NOT NULL,
 szPromoTypeId3   BOS_DT_szId (30)  NOT NULL,
 szPromoTypeId4   BOS_DT_szId (30)  NOT NULL,
 szPromoTypeId5   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId1   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId2   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId3   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId4   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId5   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szDistrChannelId   BOS_DT_szId (30)  NOT NULL,
 szCustCategoryId1   BOS_DT_szId (30)  NOT NULL,
 szCustCategoryId2   BOS_DT_szId (30)  NOT NULL,
 szCustCategoryId3   BOS_DT_szId (30)  NOT NULL,
 szCustCategoryId4   BOS_DT_szId (30)  NOT NULL,
 szCustCategoryId5   BOS_DT_szId (30)  NOT NULL,
 szProductCategoryId1   BOS_DT_szId (30)  NOT NULL,
 szProductCategoryId2   BOS_DT_szId (30)  NOT NULL,
 szProductCategoryId3   BOS_DT_szId (30)  NOT NULL,
 szProductCategoryId4   BOS_DT_szId (30)  NOT NULL,
 szProductCategoryId5   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_MSI_FieldMapping(
szType BOS_DT_szSmallId (5)  NOT NULL,
 szIdFrom   BOS_DT_szBigId (50)  NOT NULL,
 szIdTo   BOS_DT_szBigId (50)  NOT NULL
);
CREATE TABLE BOS_PI_Department(
szDepartmentId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_PI_Division(
szDivisionId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_PI_Employee(
szEmployeeId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szSupervisorId   BOS_DT_szId (30)  NOT NULL,
 szDivisionId   BOS_DT_szId (30)  NOT NULL,
 szDepartmentId   BOS_DT_szId (30)  NOT NULL,
 szTeamId   BOS_DT_szId (30)  NOT NULL,
 bIncludeInDailySettlement   BOS_DT_bBoolean (3,0)  NOT NULL,
 szRoutineType   BOS_DT_szSmallId (5)  NOT NULL,
 szFVRemaScheduleId   BOS_DT_szId (30)  NOT NULL,
 intRoundingLevel_for_distribution   integer (10,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szSubAccIdForMoDis   BOS_DT_szGLAccount (100)  NOT NULL,
 bHasGprs   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasGps   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasPrinter   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasBarcodeCustInfo   BOS_DT_bBoolean (3,0)  NOT NULL,
 bHasBarcodeReaderToReadSn   BOS_DT_bBoolean (3,0)  NOT NULL,
 decPassKey   BOS_DT_decAmount (18,2)  NOT NULL,
 bActive   BOS_DT_bBoolean (3,0)  NOT NULL,
 szGpsType   BOS_DT_szSmallId (5)  NOT NULL,
 szBarcodeReaderType   BOS_DT_szSmallId (5)  NOT NULL,
 bMustFillAssetMonitoring   BOS_DT_bBoolean (3,0)  NOT NULL,
 szDeliveryGroupId   BOS_DT_szId (30)  NOT NULL,
 bCheckInUsingGps   BOS_DT_bBoolean (3,0)  NOT NULL,
 szDeviceType   BOS_DT_szId (30)  NOT NULL,
 AdcId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PI_EmployeeDistribution(
szDriverId BOS_DT_szId (30)  NOT NULL,
 szHelperId1   BOS_DT_szId (30)  NOT NULL,
 szHelperId2   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szHelperId3   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PI_ProductFocus(
szProductFocusId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 iPriority   BOS_DT_byteLevel (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 iColorArgb   integer (10,0),
 iMinimumSku   BOS_DT_byteLevel (3,0)
);
CREATE TABLE BOS_PI_StockLimit(
szSalesId BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_PI_StockLimitItem(
szSalesId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQtyLimit   BOS_DT_decQty (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL
);
CREATE TABLE BOS_PI_Team(
szTeamId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szDoPrintPaperType   BOS_DT_szId (30)  NOT NULL,
 szDoPrintType   BOS_DT_szId (30)  NOT NULL,
 szDefaultOrderTypeId   BOS_DT_szId (30)  NOT NULL,
 bCreateAutoFCjr   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_PI_TeamArClass(
teamId BOS_DT_szId (30)  NOT NULL,
 arClassId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PI_TeamAvailibility(
szTeamId BOS_DT_szId (30)  NOT NULL,
 szProductCategory   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PI_TeamProductTemplate(
szTeamId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   numeric (18,2),
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 szProductFocusId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PI_TeamVisibility(
szTeamId BOS_DT_szId (30)  NOT NULL,
 szVisibilityId   BOS_DT_szId (30)  NOT NULL,
 szVisibilityType   BOS_DT_szId (30)
);
CREATE TABLE BOS_PI_UserInfo(
szUserId BOS_DT_szId (30)  NOT NULL,
 szDivisionId   BOS_DT_szId (30)  NOT NULL,
 szDepartmentId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_PI_Visibility(
szVisibilityId BOS_DT_szId (30)  NOT NULL,
 szVisibilityName   BOS_DT_szDescription (100)  NOT NULL,
 szVisibilityType   BOS_DT_szId (30)  NOT NULL,
 bActive   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLastUpdated   timestamp,
 bTakePicture   BOS_DT_bBoolean (3,0)
);
CREATE TABLE BOS_PI_VisibilityType(
szVisibilityTypeId BOS_DT_szId (30)  NOT NULL,
 szGuidance   BOS_DT_szBigMessage (1000)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_PI_VisibilityTypeImage(
szVisibilityTypeId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   integer (10,0)  NOT NULL,
 szImageName   BOS_DT_szFullPath (255)  NOT NULL,
 szImageTumb   bytea (2147483647)  NOT NULL,
 szImageData   bytea (2147483647)  NOT NULL
);
CREATE TABLE BOS_PUR_FPo_s(
szFPo_sId BOS_DT_szId (30)  NOT NULL,
 dtmPO   timestamp  NOT NULL,
 bReturn   BOS_DT_bBoolean (3,0)  NOT NULL,
 szSupplierId   BOS_DT_szId (30)  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 paymentTermId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bJournal   smallint (3,0)  NOT NULL,
 bPosted   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 purchaseTypeId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PUR_FPo_sItem(
szFPo_sId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decQty (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 bTaxable   smallint (3,0)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDiscount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDiscPercentage   BOS_DT_decPrice (18,8)  NOT NULL,
 decDPP   BOS_DT_decAmount (18,2)  NOT NULL,
 decPPN   BOS_DT_decAmount (18,2)  NOT NULL,
 decBaseQty_S   BOS_DT_decQty (18,2)  NOT NULL,
 decReceiptQty   BOS_DT_decQty (18,2)  NOT NULL,
 purchaseItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szDistProductId   BOS_DT_szId (30)  NOT NULL,
 decDistQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decDistPrice   BOS_DT_decPrice (18,8)  NOT NULL
);
CREATE TABLE BOS_PUR_FPo_sItemDelivery(
szFPo_sId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmDelivery   timestamp  NOT NULL,
 decQty   BOS_DT_decQty (18,2)  NOT NULL,
 decReceiptQty   BOS_DT_decQty (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_PUR_FPoReceipt_s(
szFPoReceipt_sId BOS_DT_szId (30)  NOT NULL,
 dtmReceipt   timestamp  NOT NULL,
 bReturn   BOS_DT_bBoolean (3,0)  NOT NULL,
 szPoId   BOS_DT_szId (30)  NOT NULL,
 szRefDn   BOS_DT_szId (30)  NOT NULL,
 dtmRefDn   timestamp  NOT NULL,
 szWarehouseId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szCarrierId   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szVehicleNumber   BOS_DT_szId (30)  NOT NULL,
 szDriverNm   BOS_DT_szName (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szFApInvoiceId   BOS_DT_szId (30)  NOT NULL,
 paymentTermId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApproved   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 bJournal   smallint (3,0)  NOT NULL,
 bPosted   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 purchaseTypeId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PUR_FPoReceipt_sItem(
szFPoReceipt_sId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decBaseQty_S   BOS_DT_decQty (18,2)  NOT NULL,
 decQty   BOS_DT_decQty (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 bTaxable   smallint (3,0)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDiscount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDiscPercentage   BOS_DT_decPrice (18,8)  NOT NULL,
 decDPP   BOS_DT_decAmount (18,2)  NOT NULL,
 decPPN   BOS_DT_decAmount (18,2)  NOT NULL,
 decRemainingQty   BOS_DT_decQty (18,2)  NOT NULL,
 bBonus   BOS_DT_bBoolean (3,0)  NOT NULL,
 decCOGS   BOS_DT_decAmount (18,2)  NOT NULL,
 purchaseItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szDistProductId   BOS_DT_szId (30)  NOT NULL,
 decDistQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decDistPrice   BOS_DT_decPrice (18,8)  NOT NULL
);
CREATE TABLE BOS_PUR_FPoReceipt_sItemLotInfo(
szFPoReceipt_sId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szLotTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductionCode   BOS_DT_szId (30)  NOT NULL,
 decLotStrength   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 szLotStatus   BOS_DT_szSmallId (5)  NOT NULL
);
CREATE TABLE BOS_PUR_FPoReceipt_sItemLotQty(
szFPoReceipt_sId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_PUR_FPoReceipt_sItemSn(
szFPoReceipt_sId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_PUR_FRequisition(
szFRequisitionId BOS_DT_szId (30)  NOT NULL,
 dtmRequisition   timestamp  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szDemandType   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bOpen   smallint (3,0)  NOT NULL,
 szFReqReceivedId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PUR_FRequisitionItem(
szFRequisitionId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decQtyRequired   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmRequired   timestamp  NOT NULL,
 szFPoId   BOS_DT_szId (30)  NOT NULL,
 decQtyOrdered   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_PUR_ProductSCProfileCalc(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceSupplyId   BOS_DT_szId (30)  NOT NULL,
 decAvgDemandQty   BOS_DT_decQty (18,2)  NOT NULL,
 decDemandQtyDeviation   BOS_DT_decQty (18,2)  NOT NULL,
 decRollingForecastPercentage   BOS_DT_decAmount (18,2)  NOT NULL,
 decRollingForecastQty   BOS_DT_decQty (18,2)  NOT NULL,
 decReorderPointQty   BOS_DT_decQty (18,2)  NOT NULL,
 decEOQ   BOS_DT_decQty (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_PUR_PurchaseItemType(
szPurchaseItemTypeId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szTrnType   BOS_DT_szSmallId (5)  NOT NULL,
 bTaxable   smallint (3,0)  NOT NULL,
 bBilled   smallint (3,0)  NOT NULL,
 bApplicable4AllSupplier   smallint (3,0)  NOT NULL,
 bApplicable4AllProduct   smallint (3,0)  NOT NULL,
 bApplicable4AllPurchOrg   smallint (3,0)  NOT NULL,
 szBorrowChargeCalcId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 bAllowZeroPrice   smallint (3,0)  NOT NULL,
 bAllowManualPrice   smallint (3,0)  NOT NULL,
 bAllowManualDiscount   smallint (3,0)  NOT NULL,
 szReturPurchaseItemTypeId   BOS_DT_szId (30)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL
);
CREATE TABLE BOS_PUR_PurchaseItemTypeProduct(
szPurchaseItemTypeId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PUR_PurchaseItemTypePurchOrg(
szPurchaseItemTypeId BOS_DT_szId (30)  NOT NULL,
 szPurchOrgId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PUR_PurchaseItemTypeSupplier(
szPurchaseItemTypeId BOS_DT_szId (30)  NOT NULL,
 szSupplierId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PUR_PurchaseType(
szPurchaseTypeId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szFlexiKeyId   BOS_DT_szId (30)  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 bApplicable4AllSupplier   smallint (3,0)  NOT NULL,
 bApplicable4AllProduct   smallint (3,0)  NOT NULL,
 bApplicable4AllPurchaseItemType   smallint (3,0)  NOT NULL,
 bApplicable4AllPurchOrg   smallint (3,0)  NOT NULL,
 bAllowManualPrice   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szReturPurchaseTypeId   BOS_DT_szId (30)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL
);
CREATE TABLE BOS_PUR_PurchaseTypeProduct(
szPurchaseTypeId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PUR_PurchaseTypePurchaseItemType(
szPurchaseTypeId BOS_DT_szId (30)  NOT NULL,
 szPurchaseItemTypeId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PUR_PurchaseTypePurchOrg(
szPurchaseTypeId BOS_DT_szId (30)  NOT NULL,
 szPurchOrgId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_PUR_PurchaseTypeSupplier(
szPurchaseTypeId BOS_DT_szId (30)  NOT NULL,
 szSupplierId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SAM_Branch(
szBranchId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szAddress   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_SCM_PurchGroup(
szPurchGroupId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SCM_PurchOrg(
szPurchOrgId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SCM_SupplierPurchOrg(
szSuppId BOS_DT_szId (30)  NOT NULL,
 szPurchOrgId   BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szPoReceiver   BOS_DT_szName (50)  NOT NULL,
 szBillIssuer   BOS_DT_szName (50)  NOT NULL,
 szLangId   BOS_DT_szSmallId (5)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 szBankId   BOS_DT_szId (30)  NOT NULL,
 szBankAccount   BOS_DT_szName (50)  NOT NULL,
 bAllowToCredit   bit  NOT NULL,
 szInvoiceProcessingId   BOS_DT_szId (30)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_CjrTracking(
szCjrTrackingId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szCollectorId   BOS_DT_szId (30)  NOT NULL,
 szFCjrId   BOS_DT_szId (30)  NOT NULL,
 bFinished   bit  NOT NULL,
 bSuccess   bit  NOT NULL,
 bTasked   bit  NOT NULL,
 dtmNext   timestamp  NOT NULL,
 btTrialCount   smallint (3,0)  NOT NULL,
 szChangeNote   BOS_DT_szId (30)  NOT NULL,
 dtmInvoiceExchangeDate   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 szPaymentRefNo   varchar (50)  NOT NULL
);
CREATE TABLE BOS_SD_CustCollRoutine(
szCustId BOS_DT_szId (30)  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 szDefaultRouteId   BOS_DT_szBigId (50)  NOT NULL,
 dtmCollection   timestamp  NOT NULL,
 dtmLastCollection   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL
);
CREATE TABLE BOS_SD_CustCollRoutine_DRAFT(
szCustId BOS_DT_szId (30)  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 szDefaultRouteId   BOS_DT_szBigId (50)  NOT NULL,
 dtmCollection   timestamp  NOT NULL,
 dtmLastCollection   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL
);
CREATE TABLE BOS_SD_CustFoc(
szCustId BOS_DT_szId (30)  NOT NULL,
 szFocId   BOS_DT_szId (30)  NOT NULL,
 dtmStart   timestamp  NOT NULL,
 dtmEnd   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_CustFocHistory(
szCustId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szFocType   BOS_DT_szSmallId (5)  NOT NULL,
 dtmFoc   timestamp  NOT NULL,
 decAdd   BOS_DT_decAmount (18,2)  NOT NULL,
 decUse   BOS_DT_decAmount (18,2)  NOT NULL,
 decRemain   BOS_DT_decAmount (18,2)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_SD_CustFocItem(
szCustId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szFocType   BOS_DT_szSmallId (5)  NOT NULL,
 bUnlimitedQty   bit  NOT NULL,
 decQtyRemain   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 dtmLastReset   timestamp  NOT NULL
);
CREATE TABLE BOS_SD_CustRoutine(
szCustId BOS_DT_szId (30)  NOT NULL,
 szDefaultTeamId   BOS_DT_szId (30)  NOT NULL,
 szDefaultScheduleId   BOS_DT_szId (30)  NOT NULL,
 decDefaultScheduleValue   BOS_DT_decAmount (18,2)  NOT NULL,
 szDefaultRouteId   BOS_DT_szBigId (50)  NOT NULL,
 szDefaultOrderTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmDelivery   timestamp  NOT NULL,
 szLastFDoId   BOS_DT_szId (30)  NOT NULL,
 szNote   BOS_DT_szDescription (100)  NOT NULL,
 szDOPrintPaperType   BOS_DT_szId (30)  NOT NULL,
 szDOPrintType   BOS_DT_szId (30)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_CustRoutine_DRAFT(
szCustId BOS_DT_szId (30)  NOT NULL,
 szDefaultTeamId   BOS_DT_szId (30)  NOT NULL,
 szDefaultScheduleId   BOS_DT_szId (30)  NOT NULL,
 decDefaultScheduleValue   BOS_DT_decAmount (18,2)  NOT NULL,
 szDefaultRouteId   BOS_DT_szBigId (50)  NOT NULL,
 szDefaultOrderTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmDelivery   timestamp  NOT NULL,
 szLastFDoId   BOS_DT_szId (30)  NOT NULL,
 szNote   BOS_DT_szDescription (100)  NOT NULL,
 szDOPrintPaperType   BOS_DT_szId (30)  NOT NULL,
 szDOPrintType   BOS_DT_szId (30)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_CustRoutineItem(
szCustId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 bPrintPrice   bit  NOT NULL,
 szTeamId   BOS_DT_szId (30)  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 decValue   BOS_DT_decAmount (18,2)  NOT NULL,
 decAvgOrder   BOS_DT_decAmount (18,2)  NOT NULL,
 decMaxDropSize   BOS_DT_decQty (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 szParentNm   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_SD_CustRoutineItem_DRAFT(
szCustId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 bPrintPrice   bit  NOT NULL,
 szTeamId   BOS_DT_szId (30)  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 decValue   BOS_DT_decAmount (18,2)  NOT NULL,
 decAvgOrder   BOS_DT_decAmount (18,2)  NOT NULL,
 decMaxDropSize   BOS_DT_decQty (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 szParentNm   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_SD_CustTORoutine(
szCustId BOS_DT_szId (30)  NOT NULL,
 szDefaultTeamId   BOS_DT_szId (30)  NOT NULL,
 szDefaultScheduleId   BOS_DT_szId (30)  NOT NULL,
 decDefaultScheduleValue   BOS_DT_decAmount (18,2)  NOT NULL,
 szDefaultRouteId   BOS_DT_szBigId (50)  NOT NULL,
 szDefaultOrderTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmTakingOrder   timestamp  NOT NULL,
 szLastFSoId   BOS_DT_szId (30)  NOT NULL,
 szNote   BOS_DT_szDescription (100)  NOT NULL,
 szSOPrintPaperType   BOS_DT_szId (30)  NOT NULL,
 szSOPrintType   BOS_DT_szId (30)  NOT NULL,
 szDeliveryGroupId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_CustTORoutine_DRAFT(
szCustId BOS_DT_szId (30)  NOT NULL,
 szDefaultTeamId   BOS_DT_szId (30)  NOT NULL,
 szDefaultScheduleId   BOS_DT_szId (30)  NOT NULL,
 decDefaultScheduleValue   BOS_DT_decAmount (18,2)  NOT NULL,
 szDefaultRouteId   BOS_DT_szBigId (50)  NOT NULL,
 szDefaultOrderTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmTakingOrder   timestamp  NOT NULL,
 szLastFSoId   BOS_DT_szId (30)  NOT NULL,
 szNote   BOS_DT_szDescription (100)  NOT NULL,
 szSOPrintPaperType   BOS_DT_szId (30)  NOT NULL,
 szSOPrintType   BOS_DT_szId (30)  NOT NULL,
 szDeliveryGroupId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_CustTORoutineItem(
szCustId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 bPrintPrice   bit  NOT NULL,
 szTeamId   BOS_DT_szId (30)  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 decValue   BOS_DT_decAmount (18,2)  NOT NULL,
 decAvgOrder   BOS_DT_decAmount (18,2)  NOT NULL,
 decMaxDropSize   BOS_DT_decQty (18,2)  NOT NULL,
 decMinDropSize   BOS_DT_decQty (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_CustTORoutineItem_DRAFT(
szCustId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 bPrintPrice   bit  NOT NULL,
 szTeamId   BOS_DT_szId (30)  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 decValue   BOS_DT_decAmount (18,2)  NOT NULL,
 decAvgOrder   BOS_DT_decAmount (18,2)  NOT NULL,
 decMaxDropSize   BOS_DT_decQty (18,2)  NOT NULL,
 decMinDropSize   BOS_DT_decQty (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_DeliveryGroup(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szDeliveryGroupId   BOS_DT_szId (30)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_DeliveryGroupRoute(
szDeliveryGroupId BOS_DT_szBigId (50)  NOT NULL,
 szDeliveryGroupDescription   BOS_DT_szBigMessage (1000),
 szWorkplaceId   BOS_DT_szId (30),
 decDays   BOS_DT_decDecimal (18,2),
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_SD_DeliveryGroupRouteItem(
szDeliveryGroupId BOS_DT_szBigId (50),
 szRouteId   BOS_DT_szId (30)  NOT NULL,
 shOrder   BOS_DT_byteLevel (3,0)
);
CREATE TABLE BOS_SD_DistrChannel(
szDistrChannelId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_DjrTracking(
szDjrTrackingId BOS_DT_szId (30)  NOT NULL,
 szType   BOS_DT_szSmallId (5)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szFDoId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szFDjrId   BOS_DT_szId (30)  NOT NULL,
 bFinished   bit  NOT NULL,
 bSuccess   bit  NOT NULL,
 bTasked   bit  NOT NULL,
 dtmNext   timestamp  NOT NULL,
 btTrialCount   smallint (3,0)  NOT NULL,
 szTeamId   BOS_DT_szId (30)  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 decValue   BOS_DT_decAmount (18,2)  NOT NULL,
 szFCallId   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 bDoNotIncrStockToDeliver   smallint (3,0)  NOT NULL,
 decCustSalesTarget   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_SD_DjrTrackingProduct(
szDjrTrackingId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_EmployeeSalesTarget(
szEmployeeId BOS_DT_szId (30)  NOT NULL,
 szPeriodType   BOS_DT_szId (30)  NOT NULL,
 dtmStart   timestamp  NOT NULL,
 dtmEnd   timestamp  NOT NULL,
 decTargetAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FCjr(
szFCjrId BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szBaseRouteId   BOS_DT_szId (30)  NOT NULL,
 dtmFCjr   timestamp  NOT NULL,
 szCollectorId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FCjrItem(
szFCjrId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szCjrTrackingId   BOS_DT_szId (30)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bSuccess   bit  NOT NULL,
 szCollTaskType   varchar (50)  NOT NULL,
 szCollRefNo   varchar (50)  NOT NULL,
 szNextCollTaskType   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_SD_FCustFoc(
szFCustFocId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szFocId   BOS_DT_szId (30)  NOT NULL,
 dtmStart   timestamp  NOT NULL,
 dtmEnd   timestamp  NOT NULL,
 bOverride   bit  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FDistrClosing(
szFDistrClosingId BOS_DT_szId (30)  NOT NULL,
 dtmClosing   timestamp  NOT NULL,
 szWareHouseId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FDistrClosingItem(
szFDistrClosingId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_FDjr(
szFDjrId BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 dtmFDjr   timestamp  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szBaseRouteId   BOS_DT_szId (30)  NOT NULL,
 decStartKM   BOS_DT_decAmount (18,2)  NOT NULL,
 decEndKM   BOS_DT_decAmount (18,2)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmStartTime   timestamp  NOT NULL,
 dtmEndTime   timestamp  NOT NULL,
 decVehicleUsageVolume   BOS_DT_decAmount (18,2)  NOT NULL,
 decVehicleUsageWeight   BOS_DT_decAmount (18,2)  NOT NULL,
 szDeliveryGroupId   BOS_DT_szId (30)  NOT NULL,
 decTonase   BOS_DT_decDecimal (18,2)  NOT NULL,
 decCubication   BOS_DT_decDecimal (18,2)  NOT NULL,
 szHelperId   BOS_DT_szId (30)  NOT NULL,
 szHelperId_2   BOS_DT_szId (30)  NOT NULL,
 szHelperId_3   BOS_DT_szId (30)  NOT NULL,
 decRit   BOS_DT_decDecimal (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_FDjrItem(
szFDjrId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szDjrTrackingId   BOS_DT_szId (30)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bSuccess   bit  NOT NULL,
 bStarted   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmStartVisit   timestamp  NOT NULL,
 dtmEndVisit   timestamp  NOT NULL,
 decVisitSpendTime   numeric (18,0)  NOT NULL,
 szLatitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szLongitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szBarcodeScanFailReasonId   BOS_DT_szId (30)  NOT NULL,
 szGPSScanFailReasonId   BOS_DT_szId (30)  NOT NULL,
 bScanGPSSuccess   smallint (3,0)  NOT NULL,
 bScanBarcodeSuccess   smallint (3,0)  NOT NULL,
 decJourneySpendTime   numeric (18,0)  NOT NULL
);
CREATE TABLE BOS_SD_FDjrProductRequest(
szFDjrId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szWpId1   BOS_DT_szId (30)  NOT NULL,
 szFPrId1   BOS_DT_szId (30)  NOT NULL,
 decQty1   BOS_DT_decAmount (18,2)  NOT NULL,
 szWpId2   BOS_DT_szId (30)  NOT NULL,
 szFPrId2   BOS_DT_szId (30)  NOT NULL,
 decQty2   BOS_DT_decAmount (18,2)  NOT NULL,
 szWpId3   BOS_DT_szId (30)  NOT NULL,
 szFPrId3   BOS_DT_szId (30)  NOT NULL,
 decQty3   BOS_DT_decAmount (18,2)  NOT NULL,
 szWpId4   BOS_DT_szId (30)  NOT NULL,
 szFPrId4   BOS_DT_szId (30)  NOT NULL,
 decQty4   BOS_DT_decAmount (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 szWhId1   BOS_DT_szId (30)  NOT NULL,
 szWhId2   BOS_DT_szId (30)  NOT NULL,
 szWhId3   BOS_DT_szId (30)  NOT NULL,
 szWhId4   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FDo(
szDoId BOS_DT_szId (30)  NOT NULL,
 szApplyNo   BOS_DT_szId (30)  NOT NULL,
 szFSoId   BOS_DT_szId (30)  NOT NULL,
 szFDnId   BOS_DT_szId (30)  NOT NULL,
 bReturnToWarehouse   smallint (3,0)  NOT NULL,
 szReturnFDoId   BOS_DT_szId (30)  NOT NULL,
 szReturnWarehouseId   BOS_DT_szId (30)  NOT NULL,
 szReturnStockTypeId   BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szOrderTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmDelivery   timestamp  NOT NULL,
 dtmPrice   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decTax   BOS_DT_decTax (18,2)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 decCcyRate   BOS_DT_decCcyRate (18,8)  NOT NULL,
 szFInvoiceId   BOS_DT_szId (30)  NOT NULL,
 szFirstFInvoiceId   BOS_DT_szId (30)  NOT NULL,
 bDropShip   bit  NOT NULL,
 bUseThirdPartyCarrier   bit  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szHelperId   BOS_DT_szId (30)  NOT NULL,
 szHelperId_2   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szSalesSupervisorId   BOS_DT_szId (30)  NOT NULL,
 szSalesSupervisorId_2   BOS_DT_szId (30)  NOT NULL,
 szSalesSupervisorId_3   BOS_DT_szId (30)  NOT NULL,
 szSalesDivisionId   BOS_DT_szId (30)  NOT NULL,
 szSalesDepartmentId   BOS_DT_szId (30)  NOT NULL,
 szSalesTeamId   BOS_DT_szId (30)  NOT NULL,
 szCarrierId   BOS_DT_szId (30)  NOT NULL,
 szVehicleNumber   BOS_DT_szMediumId (10)  NOT NULL,
 szDriverName   BOS_DT_szName (50)  NOT NULL,
 szRemark   BOS_DT_szDescription (100)  NOT NULL,
 szLatitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szLongitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szCustPoId   BOS_DT_szId (30)  NOT NULL,
 dtmCustPo   timestamp  NOT NULL,
 szWarehouseId   BOS_DT_szId (30)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 bCash   bit  NOT NULL,
 gdCreditLimitApprovedId   bytea (16)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 DeliveryszContactPerson   BOS_DT_szName (50)  NOT NULL,
 DeliveryszRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 DeliveryszFloor   BOS_DT_szSmallName (10)  NOT NULL,
 DeliveryszBuilding   BOS_DT_szName (50)  NOT NULL,
 DeliveryszAddress_1   BOS_DT_szBigDescription (250)  NOT NULL,
 DeliveryszAddress_2   BOS_DT_szBigDescription (250)  NOT NULL,
 DeliveryszDistrict   BOS_DT_szName (50)  NOT NULL,
 DeliveryszCity   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 DeliveryszState   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszCountry   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszPhoneNo_1   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszPhoneNo_2   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszFaxNo   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszMobileNo   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszEmail   BOS_DT_szMediumName (20)  NOT NULL,
 DeliveryszWebSite   BOS_DT_szMediumName (20)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szManualNo   BOS_DT_szId (30)  NOT NULL,
 szFCustBIId   BOS_DT_szId (30)  NOT NULL,
 decTonase   BOS_DT_decDecimal (18,2)  NOT NULL,
 decCubication   BOS_DT_decDecimal (18,2)  NOT NULL,
 dtmMobileTransaction   timestamp  NOT NULL,
 szHelperId_3   BOS_DT_szId (30)  NOT NULL,
 bUploadedFromMoDis   BOS_DT_bBoolean (3,0)  NOT NULL,
 szLogisticType   BOS_DT_szId (30)  NOT NULL,
 dtmStartVisit   timestamp  NOT NULL,
 dtmEndVisit   timestamp  NOT NULL,
 decVisitSpendTime   BOS_DT_decAmount (18,2)  NOT NULL,
 bScanSuccess   smallint (3,0)  NOT NULL,
 szScanFailReason   BOS_DT_szId (30)  NOT NULL,
 szBarcodeScanFailReason   BOS_DT_szId (30)  NOT NULL,
 bScanBarcodeSuccess   smallint (3,0)  NOT NULL,
 decJourneySpendTime   BOS_DT_decAmount (18,2)  NOT NULL,
 AdcId   BOS_DT_szId (30)  NOT NULL,
 szCustReturnTaxRefNote   BOS_DT_szBigId (50)  NOT NULL,
 szCustReceiptNo   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FDoCorrection(
szFDoCorrectionId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FDoCorrectionItem(
szFDoCorrectionId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szFDoId   BOS_DT_szId (30)  NOT NULL,
 szFDoCustId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FDoDummyCustInfo(
szFDoId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szCustNm   BOS_DT_szName (50)  NOT NULL,
 szCustAddress   BOS_DT_szBigDescription (250)  NOT NULL
);
CREATE TABLE BOS_SD_FDoItem(
szDoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 dtmPriceDate   timestamp  NOT NULL,
 decDiscProcent   BOS_DT_decPrice (18,8)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 decDiscount   BOS_DT_decAmount (18,2)  NOT NULL,
 bTaxable   bit  NOT NULL,
 decTax   BOS_DT_decTax (18,2)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDPP   BOS_DT_decTax (18,2)  NOT NULL,
 szPaymentType   BOS_DT_szSmallId (5)  NOT NULL,
 decCOGS   BOS_DT_decAmount (18,2)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL,
 decTonase   BOS_DT_decDecimal (18,2)  NOT NULL,
 decCubication   BOS_DT_decDecimal (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 szDistProductId   BOS_DT_szId (30)  NOT NULL,
 decDistQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decDistPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 szBudgetId   BOS_DT_szId (30)  NOT NULL,
 decPrincipalCostAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decPrincipalCostQty   BOS_DT_decAmount (18,2)  NOT NULL,
 bBudgetTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FDoItemBonusSource(
szFDoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szPaymentType   BOS_DT_szSmallId (5)  NOT NULL,
 decBonusAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decBonusQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FDoItemCustomerSN(
szDoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL,
 szProductInfo   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_SD_FDoItemLotQty(
szFDoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szLotId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_FDoItemReason(
szFDoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_FDoItemSN(
szDoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 shItemSnNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL
);
CREATE TABLE BOS_SD_FDoPrintingType(
szFDOPrintingTypeId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szProductDefault   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FDoProductDepositBonusItem(
szDoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 bGenByTotal   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FDoProductDepositBonusItemBonusSource(
szFDoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szPaymentType   BOS_DT_szSmallId (5)  NOT NULL,
 decBonusAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decBonusQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_FIncentive(
szFIncentiveId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 dtmFromPeriod   timestamp  NOT NULL,
 dtmToPeriod   timestamp  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FIncentiveItem(
szFIncentiveId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 decIncentive   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_FInvHandOver(
szFInvHandOverId BOS_DT_szId (30)  NOT NULL,
 dtmHandOver   timestamp  NOT NULL,
 szFrOpUserId   BOS_DT_szId (30)  NOT NULL,
 szToOpUserId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FInvHandOverItem(
szFInvHandOverId BOS_DT_szId (30)  NOT NULL,
 szFInvoiceId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FInvItemBonusSource(
szFInvoiceId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szFDoId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szPaymentType   BOS_DT_szSmallId (5)  NOT NULL,
 decBonusAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decBonusQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FInvMoveIn(
szFInvMoveInId BOS_DT_szId (30)  NOT NULL,
 dtmFInvMoveIn   timestamp  NOT NULL,
 szFInvMoveOutId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szFrOpUserId   BOS_DT_szId (30)  NOT NULL,
 szToOpUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FInvMoveOut(
szFInvMoveOutId BOS_DT_szId (30)  NOT NULL,
 dtmFInvMoveOut   timestamp  NOT NULL,
 szToWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmStartInvCreated   timestamp  NOT NULL,
 dtmEndInvCreated   timestamp  NOT NULL,
 szUsedByFInvMoveInId   BOS_DT_szId (30)  NOT NULL,
 szFrOpUserId   BOS_DT_szId (30)  NOT NULL,
 szToOpUserId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FInvMoveOutItem(
szFInvMoveOutId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szFInvoiceId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FInvoice(
szFInvoiceId BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 dtmPeriode   timestamp  NOT NULL,
 szCanceledByInvId   BOS_DT_szId (30)  NOT NULL,
 szCorrectedByInvId   BOS_DT_szId (30)  NOT NULL,
 szCancelToInvId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decTax   BOS_DT_decTax (18,2)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 decCcyRate   BOS_DT_decCcyRate (18,8)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 szFInvoiceStatus   BOS_DT_szSmallId (5)  NOT NULL,
 dtmBad   timestamp  NOT NULL,
 dtmDoubt   timestamp  NOT NULL,
 szFInvoiceUsage   BOS_DT_szSmallId (5)  NOT NULL,
 bCash   bit  NOT NULL,
 bTaxReported   bit  NOT NULL,
 szFakturPajakId   BOS_DT_szId (30)  NOT NULL,
 szFInvoiceType   BOS_DT_szSmallId (5)  NOT NULL,
 szInvoiceCollWpId   BOS_DT_szId (30)  NOT NULL,
 szKeptByOpUserId   BOS_DT_szId (30)  NOT NULL,
 szCurrentLocWpId   BOS_DT_szId (30)  NOT NULL,
 szTransitLocWpId   BOS_DT_szId (30)  NOT NULL,
 szChain_FirstId   BOS_DT_szId (30)  NOT NULL,
 szChain_NextId   BOS_DT_szId (30)  NOT NULL,
 szLastFInvHandOverId   BOS_DT_szId (30)  NOT NULL,
 szLastFInvMoveOutId   BOS_DT_szId (30)  NOT NULL,
 szLastFInvMoveInId   BOS_DT_szId (30)  NOT NULL,
 szLastFInvOpnameId   BOS_DT_szId (30)  NOT NULL,
 szRebateFInvoiceId   BOS_DT_szId (30)  NOT NULL,
 szFirstFDoId_S   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szRemark   BOS_DT_szDescription (100)  NOT NULL,
 cntBonusItem   smallint (5,0)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmFakturPajakCreated   timestamp  NOT NULL,
 dtmInvoiceCorrected   timestamp  NOT NULL,
 dtmInvoiceCanceled   timestamp  NOT NULL,
 AdcId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FInvoiceConvert(
szFInvoiceConvId BOS_DT_szId (30)  NOT NULL,
 dtmDoc   timestamp  NOT NULL,
 szFInvoiceStatus   BOS_DT_szSmallId (5)  NOT NULL,
 bResultFrTransfer   bit  NOT NULL,
 bVoid   bit  NOT NULL,
 bApplied   bit  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   bit  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   bit  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 bApproved   bit  NOT NULL,
 bJournal   bit  NOT NULL,
 bPosted   bit  NOT NULL,
 szApprovalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FInvoiceConvertItem(
szFInvoiceConvId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szFInvoiceId   BOS_DT_szId (30)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FInvoiceItem(
szFInvoiceId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szDoId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 decDiscProcent   BOS_DT_decPrice (18,8)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 decDiscount   BOS_DT_decAmount (18,2)  NOT NULL,
 bTaxable   bit  NOT NULL,
 decTax   BOS_DT_decTax (18,2)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDPP   BOS_DT_decTax (18,2)  NOT NULL,
 szPaymentType   BOS_DT_szSmallId (5)  NOT NULL,
 szInvItemType   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szFInvoiceItemUsage   BOS_DT_szSmallId (5)  NOT NULL,
 decCOGS   BOS_DT_decAmount (18,2)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 szDistProductId   BOS_DT_szId (30)  NOT NULL,
 decDistQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decDistPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 szBudgetId   BOS_DT_szId (30)  NOT NULL,
 decPrincipalCostAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decPrincipalCostQty   BOS_DT_decAmount (18,2)  NOT NULL,
 bBudgetTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FInvoiceProductBonusItem(
szFInvoiceId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szProductBonusType   BOS_DT_szSmallId (5)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FInvOpname(
szFInvOpnameId BOS_DT_szId (30)  NOT NULL,
 dtmOpname   timestamp  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szLocWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szKeptByOpUserId   BOS_DT_szId (30)  NOT NULL,
 bOnlyClosedInv   smallint (3,0)  NOT NULL,
 szOpnameStatus   BOS_DT_szSmallId (5)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FInvOpnameItem(
szFInvOpnameId BOS_DT_szId (30)  NOT NULL,
 szFInvoiceId   BOS_DT_szId (30)  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_SD_FInvProductBonusItemBonusSource(
szFInvoiceId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szFDoId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szPaymentType   BOS_DT_szSmallId (5)  NOT NULL,
 decBonusAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decBonusQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_Foc(
szFocId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FocItem(
szFocId BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szFocType   BOS_DT_szSmallId (5)  NOT NULL,
 bUnlimitedQty   bit  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL
);
CREATE TABLE BOS_SD_FPr(
szFPrId BOS_DT_szId (30)  NOT NULL,
 dtmRequest   timestamp  NOT NULL,
 szRequestToWpId   BOS_DT_szId (30)  NOT NULL,
 szDriverId   BOS_DT_szId (30)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 szHelperId_1   BOS_DT_szId (30)  NOT NULL,
 szHelperId_2   BOS_DT_szId (30)  NOT NULL,
 szHelperId_3   BOS_DT_szId (30)  NOT NULL,
 szRequestToWhId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FPrItem(
szFPrId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decReleased   BOS_DT_decAmount (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FSettlement(
szFSettlementId BOS_DT_szId (30)  NOT NULL,
 dtmSettBegin   timestamp  NOT NULL,
 dtmSettEnd   timestamp  NOT NULL,
 szWpToSettlement   BOS_DT_szId (30)  NOT NULL,
 bCloseInventory   BOS_DT_bBoolean (3,0)  NOT NULL,
 bCloseCashier   BOS_DT_bBoolean (3,0)  NOT NULL,
 bCloseDistribution   BOS_DT_bBoolean (3,0)  NOT NULL,
 bCloseEntry   BOS_DT_bBoolean (3,0)  NOT NULL,
 bCloseDaily   BOS_DT_bBoolean (3,0)  NOT NULL,
 bResultFrTransfer   BOS_DT_bBoolean (3,0)  NOT NULL,
 szOpUserId   BOS_DT_szId (30)  NOT NULL,
 szSettlementType   BOS_DT_szSmallId (5)  NOT NULL,
 bVoid   BOS_DT_bBoolean (3,0)  NOT NULL,
 bApplied   BOS_DT_bBoolean (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   BOS_DT_bBoolean (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   BOS_DT_bBoolean (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FSettlementItem(
szFSettlementId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szSettlementType   BOS_DT_szSmallId (5)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szPartyWpId   BOS_DT_szId (30)  NOT NULL,
 szOpUserId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 decAmount1   BOS_DT_decAmount (18,2)  NOT NULL,
 decAmount2   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szReasonDescription   BOS_DT_szDescription (100)  NOT NULL,
 bMatched   smallint (3,0)  NOT NULL,
 decVehicleQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decBegQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_FSj(
szFSjId BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 dtmFSj   timestamp  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   bit  NOT NULL,
 bVoid   bit  NOT NULL,
 bApplied   bit  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   bit  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   bit  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FSjItem(
szFSjId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szSjTrackingId   BOS_DT_szId (30)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bSuccess   bit  NOT NULL
);
CREATE TABLE BOS_SD_FSnCorrection(
szFSnCorrectionId BOS_DT_szId (30)  NOT NULL,
 dtmDoc   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decAddQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decDeleteQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szRemark   BOS_DT_szDescription (100)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_SD_FSnCorrectionItem(
szFSnCorrectionId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductSn   BOS_DT_szSN (30)  NOT NULL,
 shStatusSn   smallint (5,0)  NOT NULL,
 bTrouble   bit  NOT NULL,
 szTroubleDesc   BOS_DT_szDescription (100)  NOT NULL,
 szStockTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmRentStartDate   timestamp  NOT NULL,
 szRentChargeCalcId   BOS_DT_szId (30)  NOT NULL,
 decRentPrice   BOS_DT_decAmount (18,2)  NOT NULL,
 szCurrencyId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemType   BOS_DT_szId (30)  NOT NULL,
 szStatusId   BOS_DT_szSmallId (5)  NOT NULL,
 bTaxable   bit  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FSo(
szFSoId BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szOrderTypeId   BOS_DT_szId (30)  NOT NULL,
 dtmOrder   timestamp  NOT NULL,
 dtmPrice   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decTax   BOS_DT_decTax (18,2)  NOT NULL,
 decDownPayment   BOS_DT_decAmount (18,2)  NOT NULL,
 szStatus   BOS_DT_szSmallId (5)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szCcyRateId   BOS_DT_szMediumId (10)  NOT NULL,
 decCcyRate   BOS_DT_decCcyRate (18,8)  NOT NULL,
 szFInvoiceId   BOS_DT_szId (30)  NOT NULL,
 szCompletedFInvoiceId   BOS_DT_szId (30)  NOT NULL,
 szFirstCompletedFInvoiceId   BOS_DT_szId (30)  NOT NULL,
 bDropShip   bit  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szSalesSupervisorId   BOS_DT_szId (30)  NOT NULL,
 szSalesSupervisorId_2   BOS_DT_szId (30)  NOT NULL,
 szSalesSupervisorId_3   BOS_DT_szId (30)  NOT NULL,
 szSalesDivisionId   BOS_DT_szId (30)  NOT NULL,
 szSalesDepartmentId   BOS_DT_szId (30)  NOT NULL,
 szSalesTeamId   BOS_DT_szId (30)  NOT NULL,
 szRemark   BOS_DT_szDescription (100)  NOT NULL,
 szLatitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szLongitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szCustPoId   BOS_DT_szId (30)  NOT NULL,
 dtmCustPo   timestamp  NOT NULL,
 bCash   bit  NOT NULL,
 gdCreditLimitApprovedId   bytea (16)  NOT NULL,
 bNeedFInvoice   smallint (3,0)  NOT NULL,
 szPaymentTermId   BOS_DT_szId (30)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 decTonase   BOS_DT_decDecimal (18,2)  NOT NULL,
 decCubication   BOS_DT_decDecimal (18,2)  NOT NULL,
 bUploadedFromMoDis   BOS_DT_bBoolean (3,0)  NOT NULL,
 szFDoReffId   BOS_DT_szId (30)  NOT NULL,
 dtmStartVisit   timestamp  NOT NULL,
 dtmEndVisit   timestamp  NOT NULL,
 decVisitSpendTime   BOS_DT_decAmount (18,2)  NOT NULL,
 bScanSuccess   smallint (3,0)  NOT NULL,
 szScanFailReason   BOS_DT_szId (30)  NOT NULL,
 szBarcodeScanFailReason   BOS_DT_szId (30)  NOT NULL,
 decJourneySpendTime   BOS_DT_decAmount (18,2)  NOT NULL,
 AdcId   BOS_DT_szId (30)  NOT NULL,
 dtmExpiration   timestamp  NOT NULL
);
CREATE TABLE BOS_SD_FSoDummyCustInfo(
szFSoId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szCustNm   BOS_DT_szName (50)  NOT NULL,
 szCustAddress   BOS_DT_szBigDescription (250)  NOT NULL
);
CREATE TABLE BOS_SD_FSoItem(
szFSoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 dtmPriceDate   timestamp  NOT NULL,
 decDiscProcent   BOS_DT_decPrice (18,8)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decUomQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 decPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 decDiscount   BOS_DT_decAmount (18,2)  NOT NULL,
 bTaxable   bit  NOT NULL,
 decTax   BOS_DT_decTax (18,2)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDPP   BOS_DT_decTax (18,2)  NOT NULL,
 szPaymentType   BOS_DT_szSmallId (5)  NOT NULL,
 szPrincipalDiscRefId   BOS_DT_szId (30)  NOT NULL,
 decTonase   BOS_DT_decDecimal (18,2)  NOT NULL,
 decCubication   BOS_DT_decDecimal (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL,
 szDistProductId   BOS_DT_szId (30)  NOT NULL,
 decDistQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decDistPrice   BOS_DT_decPrice (18,8)  NOT NULL,
 szBudgetId   BOS_DT_szId (30)  NOT NULL,
 decPrincipalCostAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decPrincipalCostQty   BOS_DT_decAmount (18,2)  NOT NULL,
 bBudgetTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FSoItemBonusSource(
szFSoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szPaymentType   BOS_DT_szSmallId (5)  NOT NULL,
 decBonusAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decBonusQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_FSoItemDelivery(
szFSoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 dtmDelivery   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szFromWpId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szDjrTrackingId   BOS_DT_szId (30)  NOT NULL,
 szFDoId   BOS_DT_szId (30)  NOT NULL,
 decRemainingQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_FSoItemReason(
szFSoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_FSoProductDepositBonusItem(
szFSoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 bGenByTotal   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_FSoProductDepositBonusItemBonusSource(
szFSoId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szPaymentType   BOS_DT_szSmallId (5)  NOT NULL,
 decBonusAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decBonusQty   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_FTO(
szFTOId BOS_DT_szId (30)  NOT NULL,
 szSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 dtmFTO   timestamp  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szBaseRouteId   BOS_DT_szBigId (50)  NOT NULL,
 bResultFrTransfer   smallint (3,0)  NOT NULL,
 bVoid   smallint (3,0)  NOT NULL,
 bApplied   smallint (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   smallint (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   smallint (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   smallint (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szVehicleId   BOS_DT_szId (30)  NOT NULL,
 decStartKM   BOS_DT_decAmount (18,2)  NOT NULL,
 decEndKM   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmStartTime   timestamp  NOT NULL,
 dtmEndTime   timestamp  NOT NULL
);
CREATE TABLE BOS_SD_FTOItem(
szFTOId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szTOTrackingId   BOS_DT_szId (30)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bSuccess   bit  NOT NULL,
 bStarted   smallint (3,0)  NOT NULL,
 dtmStartVisit   timestamp  NOT NULL,
 dtmEndVisit   timestamp  NOT NULL,
 decVisitSpendTime   BOS_DT_decAmount (18,2)  NOT NULL,
 szLatitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szLongitude   BOS_DT_szGPSCoordinate (20)  NOT NULL,
 szBarcodeScanFailReasonId   BOS_DT_szId (30)  NOT NULL,
 szGPSScanFailReasonId   BOS_DT_szId (30)  NOT NULL,
 bBarcodeScanSuccess   smallint (3,0)  NOT NULL,
 bGPSScanSuccess   smallint (3,0)  NOT NULL,
 decJourneySpendTime   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_InvoiceGroup(
szInvoiceGroupId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_InvoiceProcessing(
szInvoiceProcessingId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bImmediateInvoice   bit  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 szRentScheduleId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szInvoicePrintingType   BOS_DT_szSmallId (5)  NOT NULL,
 bPrintPaymentNote   bit  NOT NULL,
 bPrintSNReport   bit  NOT NULL,
 bPrintAccountStatement   bit  NOT NULL,
 bPrintDeliveryReport   bit  NOT NULL,
 decProcessIfAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decProcessIfDlvCnt   BOS_DT_decAmount (18,2)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_Marketshare(
szYear varchar (20)  NOT NULL,
 szCategoryProduct   varchar (30)  NOT NULL,
 szZipCode   varchar (15)  NOT NULL,
 decConsumtionPerCapita   numeric (18,0)  NOT NULL
);
CREATE TABLE BOS_SD_MGM_ADC(
AdcId BOS_DT_szId (30)  NOT NULL,
 AdcName   BOS_DT_szName (50)  NOT NULL,
 Target   BOS_DT_decAmount (18,2)  NOT NULL,
 Qty   BOS_DT_decAmount (18,2)  NOT NULL,
 qtyFormat   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)
);
CREATE TABLE BOS_SD_MGM_Area(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szAreaId   BOS_DT_szId (30)  NOT NULL,
 szAreaName   BOS_DT_szName (50)  NOT NULL,
 szRouteType   BOS_DT_szSmallId (5)  NOT NULL,
 szOpUserId   BOS_DT_szId (30)  NOT NULL,
 szRefId   BOS_DT_szName (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szTeamId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_MGM_Area_DRAFT(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szAreaId   BOS_DT_szId (30)  NOT NULL,
 szAreaName   BOS_DT_szName (50)  NOT NULL,
 szRouteType   BOS_DT_szSmallId (5)  NOT NULL,
 szOpUserId   BOS_DT_szId (30)  NOT NULL,
 szRefId   BOS_DT_szName (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szTeamId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_MGM_Target(
szTargetId varchar (20)  NOT NULL,
 szDescription   varchar (100)  NOT NULL,
 iMonthFr   integer (10,0)  NOT NULL,
 iYearFr   integer (10,0)  NOT NULL,
 iMonthTo   integer (10,0)  NOT NULL,
 iYearTo   integer (10,0)  NOT NULL,
 szColType1   varchar (50)  NOT NULL,
 szColType2   varchar (50)  NOT NULL,
 szColType3   varchar (50)  NOT NULL,
 szColType4   varchar (50)  NOT NULL,
 szColType5   varchar (50)  NOT NULL,
 dtmActualLastUpdated   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_MGM_TargetItem(
szTargetId varchar (20)  NOT NULL,
 szCol1   varchar (50)  NOT NULL,
 szCol2   varchar (50)  NOT NULL,
 szCol3   varchar (50)  NOT NULL,
 szCol4   varchar (50)  NOT NULL,
 szCol5   varchar (50)  NOT NULL,
 decTarget   numeric (18,2)  NOT NULL,
 decActual   numeric (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_OrgStru_DiscountGroup(
szDiscountGroupId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_OrgStru_PrincipalDiscRef(
szPrincipalDiscRefId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szSupplierId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szAdditionalRefNo   BOS_DT_szId (30)  NOT NULL,
 dtmValidStart   timestamp  NOT NULL,
 dtmValidEnd   timestamp  NOT NULL,
 szBudgetType   BOS_DT_szId (30)  NOT NULL,
 decBudgetValue   BOS_DT_decDecimal (18,2)  NOT NULL,
 decBudgetRemainValue   BOS_DT_decDecimal (18,2)  NOT NULL,
 decBudgetQty   BOS_DT_decDecimal (18,2)  NOT NULL,
 decBudgetRemainQty   BOS_DT_decDecimal (18,2)  NOT NULL,
 decPrincipalPercentage   BOS_DT_decDecimal (18,2)  NOT NULL,
 szStatus   BOS_DT_szId (30)  NOT NULL,
 szBudgetId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_OutletCoverage(
szZipCode varchar (15)  NOT NULL,
 decOutletQty   numeric (18,0),
 dtmLastUpdated   timestamp
);
CREATE TABLE BOS_SD_PriceMatrix(
szPriceMatrixId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szEntity1   BOS_DT_szName (50)  NOT NULL,
 szEntity2   BOS_DT_szName (50)  NOT NULL,
 szEntity3   BOS_DT_szName (50)  NOT NULL,
 szEntity4   BOS_DT_szName (50)  NOT NULL,
 szEntity5   BOS_DT_szName (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_PriceMatrixItem(
szPriceMatrixId BOS_DT_szId (30)  NOT NULL,
 shItemNo   integer (10,0)  NOT NULL,
 szEntity1   BOS_DT_szName (50)  NOT NULL,
 szEntity2   BOS_DT_szName (50)  NOT NULL,
 szEntity3   BOS_DT_szName (50)  NOT NULL,
 szEntity4   BOS_DT_szName (50)  NOT NULL,
 szEntity5   BOS_DT_szName (50)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_RemainStockInCustomer(
szCustId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decUomRemainQty   BOS_DT_decQty (18,2)  NOT NULL,
 decRemainQty   BOS_DT_decQty (18,2)  NOT NULL,
 decUomDisplayQty   BOS_DT_decQty (18,2)  NOT NULL,
 decDisplayQty   BOS_DT_decQty (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szProductCategory   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szRoutineType   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTeamId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_RentalProduct(
szSerNum BOS_DT_szSN (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szOrderItemType   BOS_DT_szId (30)  NOT NULL,
 bTaxable   smallint (3,0)  NOT NULL,
 decCharge   BOS_DT_decAmount (18,2)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 dtmLastInvoiced   timestamp  NOT NULL,
 dtmPrevLastInvoiced   timestamp  NOT NULL,
 szStatusId   BOS_DT_szSmallId (5)  NOT NULL,
 bTrouble   smallint (3,0)  NOT NULL,
 szTroubleDescr   BOS_DT_szDescription (100)  NOT NULL,
 szRentChargeCalcId   BOS_DT_szId (30)  NOT NULL,
 szUrl   BOS_DT_szUrl (100)  NOT NULL,
 szTrnId   BOS_DT_szMediumId (10)  NOT NULL,
 szDocId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 szReasonId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_RentChargeCalc(
szRentChargeCalcId BOS_DT_szId (30)  NOT NULL,
 szChargeCalcType   BOS_DT_szSmallId (5)  NOT NULL,
 decValue1   BOS_DT_decAmount (18,2)  NOT NULL,
 decValue2   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_Report2_PerformanceProduct(
dtmDaily timestamp  NOT NULL,
 szRegional   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szSupervisorId_1   BOS_DT_szId (30)  NOT NULL,
 szSupervisorId_2   BOS_DT_szId (30)  NOT NULL,
 szSupervisorId_3   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 bVisit   bit  NOT NULL,
 decSales   BOS_DT_decQty (18,2)  NOT NULL,
 decAvail_In   BOS_DT_decQty (18,2)  NOT NULL,
 decAvail_Out   BOS_DT_decQty (18,2)  NOT NULL,
 decDist   BOS_DT_decQty (18,2)  NOT NULL,
 decOOS   BOS_DT_decQty (18,2)  NOT NULL,
 decOOSC   BOS_DT_decQty (18,2)  NOT NULL,
 decBNS   BOS_DT_decQty (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_Report2_PerformanceVisit(
dtmDaily timestamp  NOT NULL,
 szRegional   BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szSupervisorId_1   BOS_DT_szId (30)  NOT NULL,
 szSupervisorId_2   BOS_DT_szId (30)  NOT NULL,
 szSupervisorId_3   BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decCover   BOS_DT_decQty (18,2)  NOT NULL,
 decTarget   BOS_DT_decQty (18,2)  NOT NULL,
 decActualVisit   BOS_DT_decQty (18,2)  NOT NULL,
 decOutOfRoute   BOS_DT_decQty (18,2)  NOT NULL,
 decTotalVisit   BOS_DT_decQty (18,2)  NOT NULL,
 decEffectiveVisit   BOS_DT_decQty (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_Route(
szRouteId BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szAreaId   BOS_DT_szId (30)  NOT NULL,
 szRouteType   BOS_DT_szSmallId (5)  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 szOpUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_Route_DRAFT(
szRouteId BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szAreaId   BOS_DT_szId (30)  NOT NULL,
 szRouteType   BOS_DT_szSmallId (5)  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 szOpUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_RouteItem(
szRouteId BOS_DT_szBigId (50)  NOT NULL,
 intItemNumber   integer (10,0)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_RouteItem_DRAFT(
szRouteId BOS_DT_szBigId (50)  NOT NULL,
 intItemNumber   integer (10,0)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_SalesOrganization(
szSalesOrgId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szFullPathId   varchar (255)  NOT NULL,
 byteLevel   smallint (3,0)  NOT NULL,
 szParentSalesOrgId   BOS_DT_szId (30)  NOT NULL,
 szPriceId   BOS_DT_szId (30)  NOT NULL,
 szPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceId   BOS_DT_szId (30)  NOT NULL,
 szPromoPriceOrderId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_SalesTarget(
iYear integer (10,0)  NOT NULL,
 iMonth   integer (10,0)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szProductCategoryId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decQty (18,2)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_SD_SjTracking(
szSjTrackingId BOS_DT_szId (30)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szFCallId   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szFSjId   BOS_DT_szId (30)  NOT NULL,
 bFinished   bit  NOT NULL,
 bSuccess   bit  NOT NULL,
 bTasked   bit  NOT NULL,
 dtmNext   timestamp  NOT NULL,
 btTrialCount   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SD_Target(
decYear integer (10,0)  NOT NULL,
 decMonth   integer (10,0)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decTargetQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decTargetAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_SD_TOTracking(
szTOTrackingId BOS_DT_szId (30)  NOT NULL,
 szType   BOS_DT_szSmallId (5)  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szFSoId   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 szFTOId   BOS_DT_szId (30)  NOT NULL,
 bFinished   bit  NOT NULL,
 bSuccess   bit  NOT NULL,
 bTasked   bit  NOT NULL,
 dtmNext   timestamp  NOT NULL,
 btTrialCount   smallint (3,0)  NOT NULL,
 szTeamId   BOS_DT_szId (30)  NOT NULL,
 szScheduleId   BOS_DT_szId (30)  NOT NULL,
 decValue   BOS_DT_decAmount (18,2)  NOT NULL,
 szFCallId   BOS_DT_szId (30)  NOT NULL,
 decCustSalesTarget   BOS_DT_decAmount (18,2)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_SD_TOTrackingProduct(
szTOTrackingId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 szUomId   BOS_DT_szMediumId (10)  NOT NULL,
 szOrderItemTypeId   BOS_DT_szId (30)  NOT NULL,
 szParentId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_VisibilityInCustomer(
szCustId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szVisibilityId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bVisible   BOS_DT_bBoolean (3,0)  NOT NULL,
 szWorkplaceId   varchar (20),
 szSalesId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SD_VisibilityInCustomerImage(
szCustId BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp  NOT NULL,
 szVisibilityId   BOS_DT_szId (30)  NOT NULL,
 szSalesId   BOS_DT_szId (30)  NOT NULL,
 shItemNumber   integer (10,0)  NOT NULL,
 szImageData   bytea (2147483647)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)
);
CREATE TABLE BOS_SM_BlackListPasswords(
ID bigint (19,0)  NOT NULL,
 szPassword   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_SM_Boq(
szBoqTemplateId BOS_DT_szBigId (50)  NOT NULL,
 szBoqName   BOS_DT_szBigId (50)  NOT NULL,
 szBoqId   BOS_DT_szBigId (50)  NOT NULL,
 szSelectClause   BOS_DT_szMessage (500)  NOT NULL,
 szOrderByClause   BOS_DT_szMessage (500)  NOT NULL,
 szWhereClause   BOS_DT_szMessage (500)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SM_BoqLastUsed(
szBoqTemplateId BOS_DT_szBigId (50)  NOT NULL,
 szBoqName   BOS_DT_szBigId (50)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 szBoqId   BOS_DT_szBigId (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_SM_BoqTemplate(
szBoqTemplateId BOS_DT_szBigId (50)  NOT NULL,
 szBoqName   BOS_DT_szBigId (50)  NOT NULL,
 szFromClause   varchar (750),
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 bSystemBoq   bit  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szWorkplaceFilter   BOS_DT_szBigId (50)  NOT NULL,
 szCompanyFilter   BOS_DT_szBigId (50)  NOT NULL
);
CREATE TABLE BOS_SM_BosObjectTemplate(
szClassName BOS_DT_szName (50)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 szAuthor   BOS_DT_szName (50)  NOT NULL,
 szModuleCode   BOS_DT_szSmallId (5)  NOT NULL,
 bProvideAuditTrail   bit  NOT NULL
);
CREATE TABLE BOS_SM_BosObjectTemplateItem(
szClassName BOS_DT_szName (50)  NOT NULL,
 btLevel   smallint (3,0)  NOT NULL,
 szFieldName   BOS_DT_szName (50)  NOT NULL,
 szFieldType   BOS_DT_szSmallId (5)  NOT NULL,
 sLength   smallint (5,0)  NOT NULL,
 bPrimaryKey   bit  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 btItemNumber   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_SM_BosTxAuditTrail(
gdTxId bytea (16)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmCommitted   timestamp  NOT NULL
);
CREATE TABLE BOS_SM_BosTxAuditTrailItem(
gdTxId bytea (16)  NOT NULL,
 siItemNumber   smallint (5,0)  NOT NULL,
 gdRecordAuditTrailId   bytea (16)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_SM_ConfigInfoItem(
szConfigTemplateId BOS_DT_szBigId (50)  NOT NULL,
 szConfigItemTypeId   BOS_DT_szSmallId (5)  NOT NULL,
 szConfigItemId   BOS_DT_szBigId (50)  NOT NULL,
 szConfigItemTypeValue   BOS_DT_szBigId (50)  NOT NULL,
 szValue   BOS_DT_szName (50)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SM_ConfigItemType(
szConfigItemTypeId BOS_DT_szSmallId (5)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_SM_ConfigTemplate(
szConfigTemplateId BOS_DT_szBigId (50)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SM_ConfigTemplateItem(
szConfigTemplateId BOS_DT_szBigId (50)  NOT NULL,
 szConfigItemTypeId   BOS_DT_szSmallId (5)  NOT NULL,
 szConfigItemId   BOS_DT_szBigId (50)  NOT NULL,
 szDefaultValue   BOS_DT_szName (50)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_SM_ExtensionMaster(
uri BOS_DT_szUri (50)  NOT NULL,
 uriExtension   BOS_DT_szUri (50)  NOT NULL
);
CREATE TABLE BOS_SM_Group(
szGroupId BOS_DT_szId (30)  NOT NULL,
 szFullPathGroupId   varchar (255)  NOT NULL,
 byteLevel   smallint (3,0)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SM_GroupUser(
szGroupId BOS_DT_szId (30)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SM_LangDict(
szDictId BOS_DT_szBigId (50)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_SM_LangDictItem(
szDictId BOS_DT_szBigId (50)  NOT NULL,
 szMsgTypeId   BOS_DT_szSmallId (5)  NOT NULL,
 szLangId   BOS_DT_szSmallId (5)  NOT NULL,
 szTextId   BOS_DT_szSmallId (5)  NOT NULL,
 szText   varchar (250)  NOT NULL,
 bHasChanged   bit  NOT NULL,
 szContentId   varchar (250)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   bit  NOT NULL
);
CREATE TABLE BOS_SM_LangMsgType(
szMsgTypeId BOS_DT_szSmallId (5)  NOT NULL,
 szDesc   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_SM_Language(
szLangId BOS_DT_szSmallId (5)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_SM_LoginLog(
logDate timestamp  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 gdHistoryId   bytea (16)  NOT NULL,
 szActivityType   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_SM_PrinterDriver(
szPrinterId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 szBarcodePrinterId   BOS_DT_szSmallId (5)  NOT NULL,
 szPrinterType   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SM_PrinterDriverItem(
szPrinterId BOS_DT_szId (30)  NOT NULL,
 szCommandName   BOS_DT_szName (50)  NOT NULL,
 szCommandCode   varchar (255)  NOT NULL,
 shCharWidth   smallint (5,0)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL
);
CREATE TABLE BOS_SM_SecInfo(
szGroupId BOS_DT_szId (30)  NOT NULL,
 szSecTplId   BOS_DT_szBigId (50)  NOT NULL,
 bLock   bit  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SM_SecInfoItem(
szGroupId BOS_DT_szId (30)  NOT NULL,
 szSecTplId   BOS_DT_szBigId (50)  NOT NULL,
 szSecInfoItemId   BOS_DT_szBigId (50)  NOT NULL,
 szValue   BOS_DT_szName (50)  NOT NULL,
 StartTime1   timestamp  NOT NULL,
 EndTime1   timestamp  NOT NULL,
 StartTime2   timestamp  NOT NULL,
 EndTime2   timestamp  NOT NULL,
 bTimelyAccess   bit  NOT NULL
);
CREATE TABLE BOS_SM_SecTemplate(
szSecTplId BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SM_SecTemplateItem(
szSecTplId BOS_DT_szBigId (50)  NOT NULL,
 szSecInfoItemId   BOS_DT_szBigId (50)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 szDefaultValue   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_SM_User(
szUserId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szName (50)  NOT NULL,
 decPasswordHash   BOS_DT_decAmount (18,2)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 gdAuditTrailId   bytea (16)  NOT NULL,
 bClearPDC   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmPasswordExpiredDate   timestamp  NOT NULL,
 bFirstTimeLogin   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLockedForLogin   timestamp  NOT NULL,
 iWrongLoginCounter   integer (10,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 dtmLoginExpiredDate   timestamp  NOT NULL,
 szApplicationClass   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SM_UserPasswordHistories(
szUserId BOS_DT_szId (30)  NOT NULL,
 decPasswordHash   BOS_DT_decDecimal (18,2)  NOT NULL,
 intItemNumber   integer (10,0)  NOT NULL
);
CREATE TABLE BOS_SM_WrongLoginAttemptsLog(
ID bigint (19,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmAppServerTime   timestamp  NOT NULL
);
CREATE TABLE BOS_SSE_Prospect(
szProspectId BOS_DT_szId (30)  NOT NULL,
 szName   BOS_DT_szBigDescription (250)  NOT NULL,
 szRemark   BOS_DT_szVeryBigMessage (2000)  NOT NULL,
 szFolder   BOS_DT_szBigPath (250)  NOT NULL,
 szProspectorId   BOS_DT_szId (30)  NOT NULL,
 szCategory_1   BOS_DT_szBigId (50)  NOT NULL,
 szCategory_2   BOS_DT_szBigId (50)  NOT NULL,
 szCategory_3   BOS_DT_szBigId (50)  NOT NULL,
 szCategory_4   BOS_DT_szBigId (50)  NOT NULL,
 szCategory_5   BOS_DT_szBigId (50)  NOT NULL,
 szCategory_6   BOS_DT_szBigId (50)  NOT NULL,
 szCategory_7   BOS_DT_szBigId (50)  NOT NULL,
 szCategory_8   BOS_DT_szBigId (50)  NOT NULL,
 szCategory_9   BOS_DT_szBigId (50)  NOT NULL,
 szCategory_10   BOS_DT_szBigId (50)  NOT NULL,
 dtmTargetDeal   timestamp  NOT NULL,
 decTargetAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 szContactPerson   BOS_DT_szBigDescription (250)  NOT NULL,
 szRoomNo   BOS_DT_szSmallName (10)  NOT NULL,
 szFloor   BOS_DT_szSmallName (10)  NOT NULL,
 szBuilding   BOS_DT_szName (50)  NOT NULL,
 szAddress_1   BOS_DT_szName (50)  NOT NULL,
 szAddress_2   BOS_DT_szName (50)  NOT NULL,
 szDistrict   BOS_DT_szName (50)  NOT NULL,
 szCity   BOS_DT_szName (50)  NOT NULL,
 szZipCode   BOS_DT_szMediumId (10)  NOT NULL,
 szState   BOS_DT_szMediumName (20)  NOT NULL,
 szCountry   BOS_DT_szMediumName (20)  NOT NULL,
 szPhoneNo_1   BOS_DT_szName (50)  NOT NULL,
 szPhoneNo_2   BOS_DT_szName (50)  NOT NULL,
 szFaxNo   BOS_DT_szName (50)  NOT NULL,
 szMobileNo   BOS_DT_szName (50)  NOT NULL,
 szEmail   BOS_DT_szDescription (100)  NOT NULL,
 szWebSite   BOS_DT_szName (50)  NOT NULL
);
CREATE TABLE BOS_SSE_ProspectAction(
szProspectId BOS_DT_szId (30)  NOT NULL,
 dtmAction   timestamp  NOT NULL,
 bLastAction   smallint (3,0)  NOT NULL,
 szAction   BOS_DT_szId (30)  NOT NULL,
 szRemark   BOS_DT_szVeryBigMessage (2000)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 bNextAction   smallint (3,0)  NOT NULL,
 dtmNextAction   timestamp  NOT NULL,
 szNextActionRemark   BOS_DT_szBigMessage (1000)  NOT NULL,
 szNextActionUserId   BOS_DT_szId (30)  NOT NULL,
 cntRemindMe   smallint (5,0)  NOT NULL,
 szMonitoredByUserId   BOS_DT_szId (30)  NOT NULL
);
CREATE TABLE BOS_SYNC_Anchor(
szUri varchar (100)  NOT NULL,
 dtmLastClientAnchor   timestamp,
 dtmLastServerAnchor   timestamp
);
CREATE TABLE BOS_SYNC_DataLogItem(
syncSendDate timestamp  NOT NULL,
 syncType   BOS_DT_szId (30)  NOT NULL,
 syncReported   BOS_DT_szId (30)  NOT NULL,
 workplaceId   BOS_DT_szId (30)  NOT NULL,
 uri   BOS_DT_szUri (50)  NOT NULL,
 docId1   BOS_DT_szId (30)  NOT NULL,
 docId2   BOS_DT_szId (30)  NOT NULL,
 docId3   BOS_DT_szId (30)  NOT NULL,
 docId4   BOS_DT_szId (30)  NOT NULL,
 docId5   BOS_DT_szId (30)  NOT NULL,
 docId6   BOS_DT_szId (30)  NOT NULL,
 bUpdate   smallint (3,0)  NOT NULL,
 bDelete   smallint (3,0)  NOT NULL,
 bSuccess   smallint (3,0)  NOT NULL,
 errorMessage   BOS_DT_szMessage (500)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE bos_sync_deleteobject(
szUri BOS_DT_szUri (50)  NOT NULL,
 szId1   BOS_DT_szBigId (50)  NOT NULL,
 szId2   BOS_DT_szBigId (50)  NOT NULL,
 szId3   BOS_DT_szBigId (50)  NOT NULL,
 szId4   BOS_DT_szBigId (50)  NOT NULL,
 szId5   BOS_DT_szBigId (50)  NOT NULL,
 szId6   BOS_DT_szBigId (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bForSyncClient   bit  NOT NULL
);
CREATE TABLE BOS_SYNC_ErrorLog(
WorkplaceId varchar (30)  NOT NULL,
 ErrorMessage   varchar (-1)  NOT NULL,
 LastUpdated   timestamp  NOT NULL,
 Uri   varchar (50)  NOT NULL,
 CreatedBy   bit  NOT NULL,
 BufferSize   bigint (19,0)  NOT NULL,
 MemoryUsed   bigint (19,0)  NOT NULL
);
CREATE TABLE BOS_SYNC_SuccessLog(
WorkplaceId varchar (30)  NOT NULL,
 Uri   varchar (50)  NOT NULL,
 PreUpdateCount   integer (10,0),
 UpdateCount   integer (10,0),
 PreDeleteCount   integer (10,0),
 DeleteCount   integer (10,0),
 LastUpdated   timestamp  NOT NULL,
 LastAnchor   timestamp,
 CreatedBy   bit  NOT NULL,
 EndParamTime   timestamp  NOT NULL,
 CreateDate   timestamp  NOT NULL,
 BufferSize   bigint (19,0)  NOT NULL,
 MemoryUsed   bigint (19,0)  NOT NULL
);
CREATE TABLE BOS_SYNC_SyncObject(
szUri BOS_DT_szUri (50)  NOT NULL,
 iSyncDirection   integer (10,0)  NOT NULL,
 bSupportDataLog   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SYNC_SyncSchedule(
szURI BOS_DT_szUri (50)  NOT NULL,
 syncDirection   integer (10,0)  NOT NULL,
 iScheduleType   integer (10,0)  NOT NULL,
 dtmScheduleInterval   timestamp  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bSupportDataLog   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_SYNC_SyncServer(
szServerName varchar (50)  NOT NULL,
 szDestAddress   varchar (200),
 szUsername   varchar (50),
 szPassword   varchar (50),
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_SYNC_Transformation(
szClientUri BOS_DT_szBigId (50)  NOT NULL,
 szDestServer   varchar (50)  NOT NULL,
 szServerUri   BOS_DT_szBigId (50),
 szServerId   varchar (50)
);
CREATE TABLE BOS_SYNC_UploadAnchor(
szUri BOS_DT_szUri (50)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 dtmStartAnchor   timestamp  NOT NULL,
 dtmEndAnchor   timestamp  NOT NULL
);
CREATE TABLE BOS_TIN_CustTaxIndConfig(
szCustId BOS_DT_szId (30)  NOT NULL,
 szTaxIndConfigId   BOS_DT_szId (30)  NOT NULL,
 szNPWP   BOS_DT_szTaxId (50)  NOT NULL,
 szPKP   BOS_DT_szTaxId (50)  NOT NULL,
 dtmPKP   timestamp  NOT NULL,
 szTaxTrnId   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_TIN_FakturPajak(
szFakturPajakId BOS_DT_szId (30)  NOT NULL,
 dtmFakturPajak   timestamp  NOT NULL,
 szCustId   BOS_DT_szId (30)  NOT NULL,
 szCustNm   BOS_DT_szName (50)  NOT NULL,
 szCustAddr   BOS_DT_szBigDescription (250)  NOT NULL,
 szCustNpwp   BOS_DT_szTaxId (50)  NOT NULL,
 szCompId   BOS_DT_szId (30)  NOT NULL,
 szCompNm   BOS_DT_szName (50)  NOT NULL,
 szCompAddr   BOS_DT_szBigDescription (250)  NOT NULL,
 szCompNpwp   BOS_DT_szTaxId (50)  NOT NULL,
 szCompPkpNo   BOS_DT_szTaxId (50)  NOT NULL,
 dtmCompPkpTg   timestamp  NOT NULL,
 szTaxIndConfigId   BOS_DT_szId (30)  NOT NULL,
 bIncludeTax   smallint (3,0)  NOT NULL,
 shFakturType   smallint (5,0)  NOT NULL,
 decAmount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDiscount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDPP   BOS_DT_decTax (18,2)  NOT NULL,
 decPPN   BOS_DT_decTax (18,2)  NOT NULL,
 szCcyId   BOS_DT_szSmallId (5)  NOT NULL,
 bResultFrTransfer   BOS_DT_bBoolean (3,0)  NOT NULL,
 bVoid   BOS_DT_bBoolean (3,0)  NOT NULL,
 bApplied   BOS_DT_bBoolean (3,0)  NOT NULL,
 btPrintedCount   smallint (3,0)  NOT NULL,
 bTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 szCompanyId   BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 bNeedApproval   BOS_DT_bBoolean (3,0)  NOT NULL,
 gdApprovedId   bytea (16)  NOT NULL,
 szFJournalId   BOS_DT_szId (30)  NOT NULL,
 dtmCreated   timestamp  NOT NULL,
 bSystemCreated   BOS_DT_bBoolean (3,0)  NOT NULL,
 szUserId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL,
 shTaxIndConfigType   smallint (5,0)  NOT NULL,
 szFakturPajakType   BOS_DT_szId (30)  NOT NULL,
 szReturnRefId   BOS_DT_szBigId (50)  NOT NULL,
 szCustReturnTaxRefNote   BOS_DT_szBigId (50)  NOT NULL
);
CREATE TABLE BOS_TIN_FakturPajakItem(
szFakturPajakId BOS_DT_szId (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szProductId   BOS_DT_szId (30)  NOT NULL,
 szProductNm   BOS_DT_szName (50)  NOT NULL,
 decQty   BOS_DT_decAmount (18,2)  NOT NULL,
 decPrice   BOS_DT_decAmount (18,2)  NOT NULL,
 decSubTotal   BOS_DT_decAmount (18,2)  NOT NULL,
 decDiscount   BOS_DT_decAmount (18,2)  NOT NULL,
 decDPP   BOS_DT_decTax (18,2)  NOT NULL,
 decTax   BOS_DT_decTax (18,2)  NOT NULL,
 decTaxRate   BOS_DT_decAmount (18,2)  NOT NULL,
 decReturnQtyRemaining   BOS_DT_decAmount (18,2)  NOT NULL
);
CREATE TABLE BOS_TIN_FakturPajakItemInvoiceSource(
szFakturPajakId BOS_DT_szBigId (50)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szInvoiceId   BOS_DT_szBigId (50)  NOT NULL
);
CREATE TABLE BOS_TIN_Serial_Registration(
szTaxEntityId BOS_DT_szId (30)  NOT NULL,
 szNoReff   BOS_DT_szBigId (50)  NOT NULL,
 dtmEntryDate   timestamp  NOT NULL,
 dtmExpiredDate   timestamp  NOT NULL,
 szPrefix   varchar (50)  NOT NULL,
 decStartNumber   numeric (18,0)  NOT NULL,
 decEndNumber   numeric (18,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL
);
CREATE TABLE BOS_TIN_TaxAllocation(
szWorkplaceId BOS_DT_szId (30)  NOT NULL,
 szFakturPajakId   BOS_DT_szId (30)  NOT NULL,
 bUseAllocated   smallint (3,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE BOS_TIN_TaxExportLog(
shLogId integer (10,0)  NOT NULL,
 szFakturPajakId   BOS_DT_szBigId (50)  NOT NULL,
 dtmExport   timestamp,
 szFilename   BOS_DT_szName (50),
 szFilelocation   BOS_DT_szBigPath (250),
 szUserId   BOS_DT_szId (30)
);
CREATE TABLE BOS_TIN_TaxIndConfig(
szTaxIndConfigId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 shFakturType   smallint (5,0)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL,
 shTaxIndConfigType   smallint (5,0)  NOT NULL
);
CREATE TABLE BOS_TIN_TaxSerialAllocation(
szTaxEntityId BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szPrefix   BOS_DT_szId (30)  NOT NULL,
 szNoReffId   BOS_DT_szBigId (50)  NOT NULL,
 decStartNumber   numeric (18,0)  NOT NULL,
 decEndNumber   numeric (18,0)  NOT NULL,
 dtmStart   timestamp  NOT NULL,
 dtmExpired   timestamp  NOT NULL,
 szLastAllocated   BOS_DT_szBigId (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bAlreadyTransferred   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_TIN_TaxSerialAllocationItem(
szTaxEntityId BOS_DT_szId (30)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szPrefix   BOS_DT_szId (30)  NOT NULL,
 szNoReffId   BOS_DT_szBigId (50)  NOT NULL,
 decNumber   numeric (18,0)  NOT NULL,
 szFakturPajakId   BOS_DT_szBigId (50)  NOT NULL,
 dtmLastUpdated   timestamp  NOT NULL,
 bUseAllocated   smallint (3,0)  NOT NULL
);
CREATE TABLE BOS_TIN_TaxTrn(
szTaxTrnId BOS_DT_szId (30)  NOT NULL,
 szDescription   BOS_DT_szDescription (100)  NOT NULL,
 dtmLastUpdated   timestamp,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE PADMA_AddOn_ActiveCustomerByBrand(
szCustId varchar (50)  NOT NULL,
 szBrandId   varchar (50)  NOT NULL,
 szActivityStatus   varchar (50),
 dtmLastChangeActivityStatus   timestamp
);
CREATE TABLE PADMA_AddOn_CustPaymentFeedback(
szCustPaymentType varchar (30)  NOT NULL,
 szFCustPaymentId   varchar (30)  NOT NULL,
 shItemNumber   smallint (5,0)  NOT NULL,
 szInvoiceId   varchar (30)  NOT NULL,
 shDetailNumber   smallint (5,0)  NOT NULL,
 szReasonId   varchar (30),
 dtmLastUpdated   timestamp,
 szRemark   varchar (30)
);
CREATE TABLE PADMA_AddOn_CustPaymentFeedbackReason(
szReasonId varchar (30)  NOT NULL,
 szDescription   varchar (100),
 dtmLastUpdated   timestamp
);
CREATE TABLE PADMA_GL_MultiCompCounter(
szCompanyID BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceID   BOS_DT_szId (30)  NOT NULL,
 szFlexiKeyID   BOS_DT_szId (30)  NOT NULL,
 szDOCounterID   BOS_DT_szId (30)  NOT NULL,
 szInvoiceCounterID   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE PADMA_GL_MultiCompProdMapping(
szCompanyID BOS_DT_szMediumId (10)  NOT NULL,
 szProductCategoryID   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);
CREATE TABLE PADMA_SD_MultiCompDocNumbering(
szCompanyId BOS_DT_szMediumId (10)  NOT NULL,
 szWorkplaceId   BOS_DT_szId (30)  NOT NULL,
 szTrnType   BOS_DT_szId (30)  NOT NULL,
 szInternalDocId   BOS_DT_szId (30)  NOT NULL,
 szProductCategoryId   BOS_DT_szId (30)  NOT NULL,
 szTaxEntityId   BOS_DT_szId (30)  NOT NULL,
 dtmDate   timestamp,
 szExternalDocId   BOS_DT_szId (30)  NOT NULL,
 dtmLastUpdated   timestamp,
 bAlreadyTransferred   BOS_DT_bBoolean (3,0)  NOT NULL
);

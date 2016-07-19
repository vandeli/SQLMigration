CREATE TABLE BOS_AP_ApMaster(
szSuppId BOS_DT_szId,
 szCcyId   BOS_DT_szSmallId,
 decAmount   BOS_DT_decAmount,
 bBad   BOS_DT_bBoolean,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_AP_ApMasterClass(
szSuppId BOS_DT_szId,
 szCcyId   BOS_DT_szSmallId,
 szApClassId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_AP_ApTrans(
szTrnId BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szSuppId   BOS_DT_szId,
 shRevNo   ,
 dtmDate   ,
 dtmPeriode   ,
 szCcyId   BOS_DT_szSmallId,
 decAmount   BOS_DT_decAmount,
 decRemain   BOS_DT_decAmount,
 szDescription   BOS_DT_szDescription,
 bClosed   ,
 dtmClosed   ,
 szUrl   BOS_DT_szUrl,
 szFInvoiceStatus   BOS_DT_szSmallId,
 szInvWorkplaceId   BOS_DT_szId,
 szRefTrnId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 szFInvoiceUsage   BOS_DT_szSmallId,
 bCash   ,
 dtmDue   ,
 dtmDue_Printed   ,
 szFInvoiceType   BOS_DT_szSmallId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_AP_ApTransRefDoc(
szTrnId BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szSuppId   BOS_DT_szId,
 shRevNo   ,
 shItemNumber   ,
 szRefTrnId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 szRefSuppId   BOS_DT_szId,
 shRefRevNo   ,
 decAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_AP_ClaimPromoBudget(
szBudgetId BOS_DT_szId,
 dtmClaim   ,
 szBudgetType   BOS_DT_szSmallId,
 decBudgetValue   BOS_DT_decAmount,
 decClaimValue   BOS_DT_decAmount,
 btPrintedCount   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_AP_ClaimPromoBudgetItem(
szBudgetId BOS_DT_szId,
 shItemNumber   ,
 szPrincipalDiscRefId   BOS_DT_szId,
 decBonusAmount   BOS_DT_decAmount,
 decSuppBudgetShare   BOS_DT_decAmount,
 decPrincipalCost   BOS_DT_decAmount,
 szDocumentId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szName   BOS_DT_szId,
 dtmDocument   
);
CREATE TABLE BOS_AP_FApInvoice(
szFApInvoiceId BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 szSuppId   BOS_DT_szId,
 dtmPeriode   ,
 szCanceledByInvId   BOS_DT_szId,
 szCorrectedByInvId   BOS_DT_szId,
 szCancelToInvId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 decTax   BOS_DT_decTax,
 szCcyId   BOS_DT_szSmallId,
 szCcyRateId   BOS_DT_szMediumId,
 decCcyRate   BOS_DT_decCcyRate,
 szPaymentTermId   BOS_DT_szId,
 szInvUsage   BOS_DT_szSmallId,
 bCash   ,
 szFakturPajakId   BOS_DT_szId,
 dtmFakturPajak   ,
 szInvType   BOS_DT_szId,
 szReasonId   BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 szInvoiceRef   BOS_DT_szId,
 szAccountId   BOS_DT_szId,
 szSubAccountId   BOS_DT_szGLAccount,
 decCost   BOS_DT_decCcyRate,
 decRevTax   BOS_DT_decCcyRate,
 decCostTax   BOS_DT_decCcyRate,
 szFPoReceipt_sId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApproved   ,
 bApplied   ,
 bJournal   ,
 bPosted   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szApprovalId   BOS_DT_szId,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 szPurchaseType   BOS_DT_szId
);
CREATE TABLE BOS_AP_FApInvoiceItem(
szFApInvoiceId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decDiscProcent   BOS_DT_decPrice,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 decPrice   BOS_DT_decPrice,
 decDiscount   BOS_DT_decAmount,
 bTaxable   ,
 decTax   BOS_DT_decTax,
 decAmount   BOS_DT_decAmount,
 decDPP   BOS_DT_decTax,
 szInvItemType   BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription,
 szInvItemUsage   BOS_DT_szSmallId,
 szAccountId   BOS_DT_szId,
 szSubAccountId   BOS_DT_szGLAccount,
 szParentId   BOS_DT_szId,
 decOriginalQty   BOS_DT_decAmount,
 decOriginalPrice   BOS_DT_decAmount,
 bBonus   ,
 szPurchaseItemType   BOS_DT_szId,
 szFPoReceipt_sId   BOS_DT_szId
);
CREATE TABLE BOS_AP_FSupplierPayment_s(
szFSupplierPayment_sId BOS_DT_szId,
 dtmFSupplierPayment   ,
 szFCashReceiptId   BOS_DT_szId,
 szDeposanId   BOS_DT_szId,
 szAccountId1   BOS_DT_szId,
 szSubAccountId1   BOS_DT_szGLAccount,
 decAmount1   BOS_DT_decAmount,
 szAccountId2   BOS_DT_szId,
 szSubAccountId2   BOS_DT_szGLAccount,
 decAmount2   BOS_DT_decAmount,
 szAccountId3   BOS_DT_szId,
 szSubAccountId3   BOS_DT_szGLAccount,
 decAmount3   BOS_DT_decAmount,
 szAccountId4   BOS_DT_szId,
 szSubAccountId4   BOS_DT_szGLAccount,
 decAmount4   BOS_DT_decAmount,
 decAmount   BOS_DT_decAmount,
 szCcyId   BOS_DT_szSmallId,
 szCcyRateId   BOS_DT_szMediumId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 szRemark   BOS_DT_szDescription,
 szCashAccountId   BOS_DT_szId,
 szCashGlSubAccountId   BOS_DT_szGLAccount,
 szApAccountId   BOS_DT_szId,
 szApGlSubAccountId   BOS_DT_szGLAccount,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 decControlAmount   BOS_DT_decAmount,
 szChequeId   BOS_DT_szId,
 szFCashTrnId   ,
 szFCashDocId   ,
 szVoucherId   ,
 apInvoiceAmountReturn   ,
 apInvoiceIdReturn   BOS_DT_szId,
 supplierDisbursementId   BOS_DT_szId,
 purchaseTypeId   BOS_DT_szId
);
CREATE TABLE BOS_AP_FSupplierPayment_s_Item(
szFSupplierPayment_sId BOS_DT_szId,
 shItemNumber   ,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szSuppId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 decPaidByCashReceipt   BOS_DT_decAmount,
 szFDoId   BOS_DT_szId,
 remain_s   BOS_DT_decAmount
);
CREATE TABLE BOS_AP_FSupplierPayment_s_ItemDetail(
szFSupplierPayment_sId BOS_DT_szId,
 shItemNumber   ,
 shDetailNumber   ,
 szBankId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 bValue   ,
 decAmount   BOS_DT_decAmount,
 bDeposit   
);
CREATE TABLE BOS_AP_FSupplierPromoBudget(
szFSupplierPromoBudgetId BOS_DT_szId,
 szBudgetId   BOS_DT_szId,
 dtmBudget   ,
 szStatus   BOS_DT_szSmallId,
 szDescription   BOS_DT_szBigDescription,
 szSupplierid   BOS_DT_szId,
 dtmValidStart   ,
 dtmValidEnd   ,
 szBudgetType   BOS_DT_szSmallId,
 szUomCurr   BOS_DT_szMediumId,
 decBudgetValue   BOS_DT_decAmount,
 bEmailNotification   BOS_DT_bBoolean,
 decWarningPercentage   BOS_DT_decAmount,
 bVoid   BOS_DT_bBoolean,
 bApplied   BOS_DT_bBoolean,
 bApproved   BOS_DT_bBoolean,
 szCompanyId   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   BOS_DT_bBoolean,
 gdApprovedId   ,
 dtmCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 bSystemCreated   BOS_DT_bBoolean,
 szFJournalId   BOS_DT_szId,
 szApprovalId   BOS_DT_szId,
 bTransferred   BOS_DT_bBoolean,
 bPosted   BOS_DT_bBoolean,
 bJournal   BOS_DT_bBoolean,
 bRejected   BOS_DT_bBoolean,
 bResultFrTransfer   BOS_DT_bBoolean
);
CREATE TABLE BOS_AP_FSupplierPromoBudgetDiscRef(
szFSupplierPromoBudgetId BOS_DT_szId,
 shItemNumber   ,
 szPrincipalDiscRefId   BOS_DT_szId,
 decSuppBudgetShare   BOS_DT_decAmount
);
CREATE TABLE BOS_AP_Supplier(
szSuppId BOS_DT_szId,
 szName   BOS_DT_szName,
 SuppszContactPerson   BOS_DT_szName,
 SuppszRoomNo   BOS_DT_szSmallName,
 SuppszFloor   BOS_DT_szSmallName,
 SuppszBuilding   BOS_DT_szName,
 SuppszAddress_1   BOS_DT_szName,
 SuppszAddress_2   BOS_DT_szName,
 SuppszDistrict   BOS_DT_szName,
 SuppszCity   BOS_DT_szMediumName,
 SuppszZipCode   BOS_DT_szMediumId,
 SuppszState   BOS_DT_szMediumName,
 SuppszCountry   BOS_DT_szMediumName,
 SuppszPhoneNo_1   BOS_DT_szMediumName,
 SuppszPhoneNo_2   BOS_DT_szMediumName,
 SuppszFaxNo   BOS_DT_szMediumName,
 SuppszMobileNo   BOS_DT_szMediumName,
 SuppszEmail   BOS_DT_szMediumName,
 SuppszWebSite   BOS_DT_szMediumName,
 szSuppCustId   BOS_DT_szId,
 szOurCustId   BOS_DT_szId,
 szSuppUserId   BOS_DT_szId,
 szSuppGroupId   BOS_DT_szId,
 szStatus   BOS_DT_szSmallId,
 szPaymentTermId   BOS_DT_szId,
 decCreditLimit   BOS_DT_decAmount,
 szDefaultCcyId   BOS_DT_szSmallId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szAccId   BOS_DT_szId,
 szGLSubAccId   BOS_DT_szGLAccount,
 szNPWP   BOS_DT_szName,
 szWorkplaceId   BOS_DT_szId
);
CREATE TABLE BOS_AP_SupplierDisbursement(
supplierDisbursementId BOS_DT_szId,
 supplierDisbursementDate   ,
 supplierPaymentId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApproved   ,
 bApplied   ,
 bJournal   ,
 bPosted   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szApprovalId   BOS_DT_szId,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   
);
CREATE TABLE BOS_AP_SupplierDisbursementItem(
supplierDisbursementId BOS_DT_szId,
 itemNumber   ,
 invoiceId   BOS_DT_szId,
 subAmount   BOS_DT_decAmount,
 payAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_AP_SupplierPromoBudget(
szBudgetId BOS_DT_szId,
 dtmBudget   ,
 szStatus   BOS_DT_szSmallId,
 szDescription   BOS_DT_szBigDescription,
 szSupplierid   BOS_DT_szId,
 dtmValidStart   ,
 dtmValidEnd   ,
 szBudgetType   BOS_DT_szSmallId,
 szUomCurr   BOS_DT_szMediumId,
 decBudgetValue   BOS_DT_decAmount,
 decBudgetUsed   BOS_DT_decAmount,
 bEmailNotification   BOS_DT_bBoolean,
 dtmLastNotification   ,
 decWarningPercentage   BOS_DT_decAmount,
 bClaim   BOS_DT_bBoolean,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szCompanyId   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId
);
CREATE TABLE BOS_AP_SupplierPromoBudgetDiscRef(
szBudgetId BOS_DT_szId,
 shItemNumber   ,
 szPrincipalDiscRefId   BOS_DT_szId,
 DecSuppBudgetShare   BOS_DT_decAmount
);
CREATE TABLE BOS_AP_SupplierPromoBudgetHistory(
szBudgetId BOS_DT_szId,
 dtmTransaction   ,
 decValue   BOS_DT_decAmount,
 szUomCurr   BOS_DT_szMediumId,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 dtmLastUpdated   
);
CREATE TABLE BOS_AP_SuppProduct(
szSuppId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szRefProductId   BOS_DT_szId,
 szRefProductName   BOS_DT_szName,
 decQuality   BOS_DT_decAmount,
 decLeadDay   BOS_DT_decAmount,
 decMinOrderQty   BOS_DT_decAmount,
 decMaxOrderQty   BOS_DT_decAmount
);
CREATE TABLE BOS_AR_ArClass(
szArClassId BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_AR_ArMaster(
szCustId BOS_DT_szId,
 szCcyId   BOS_DT_szSmallId,
 decAmount   BOS_DT_decAmount,
 bBad   BOS_DT_bBoolean,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 intNumberOfOpenInvoice   
);
CREATE TABLE BOS_AR_ArMasterClass(
szCustId BOS_DT_szId,
 szCcyId   BOS_DT_szSmallId,
 szArClassId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 intNumberOfOpenInvoice   
);
CREATE TABLE BOS_AR_ArOpname(
szArOpnameId BOS_DT_szId,
 szOpnameStatus   BOS_DT_szMediumId,
 szDescription   BOS_DT_szDescription,
 dtmArOpname   ,
 szEmployeeId   BOS_DT_szId,
 szEmployeeName   BOS_DT_szName,
 intScopeCategory   ,
 szCategoryType   BOS_DT_szId,
 szCustCategory   BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szPrefix   BOS_DT_szBigId,
 bJournal   ,
 bVoid   ,
 bApproved   ,
 bApplied   ,
 bPosted   ,
 bRejected   ,
 bNeedApproval   ,
 szApprovalId   BOS_DT_szId,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 btPrintedCount   ,
 szUserId   BOS_DT_szId,
 szCompanyId   BOS_DT_szMediumId,
 szCompanyNm   BOS_DT_szName,
 szWorkplaceId   BOS_DT_szId,
 szWorkplaceNm   BOS_DT_szName,
 szTaxEntityId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 bTransferred   ,
 bResultFrTransfer   ,
 bAlreadyTransferred   ,
 dtmLastUpdated   ,
 bOpnameConfirm   ,
 bOpnameCanceled   ,
 bOpnameProccess   ,
 szCancelReason   BOS_DT_szBigDescription,
 decAmountSalesLOS   BOS_DT_decQty,
 decAmountReturnLOS   BOS_DT_decQty
);
CREATE TABLE BOS_AR_ArOpnameItem(
szArOpnameId BOS_DT_szId,
 szFInvoiceId   BOS_DT_szBigId,
 szInvOpnameStatus   BOS_DT_szSmallId,
 decRestAmount   BOS_DT_decAmount,
 decRestOutstanding   BOS_DT_decAmount,
 dtmPeriod   ,
 szCustId   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 bReturn   ,
 dtmCreated   ,
 szUserId   BOS_DT_szId,
 bAlreadyTransferred   ,
 dtmLastUpdated   ,
 bInput   ,
 decPDRAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_AR_ArOpnameLost(
szArOpnameId BOS_DT_szId,
 szFInvoiceId   BOS_DT_szBigId,
 dtmPeriod   ,
 decRestOutstanding   BOS_DT_decAmount,
 szCustId   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 decPDRAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_AR_ArTrans(
szTrnId BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 shRevNo   ,
 szArClassId   BOS_DT_szId,
 dtmDate   ,
 dtmPeriode   ,
 szCcyId   BOS_DT_szSmallId,
 decAmount   BOS_DT_decAmount,
 decRemain   BOS_DT_decAmount,
 szDescription   BOS_DT_szDescription,
 bClosed   ,
 dtmClosed   ,
 szUrl   BOS_DT_szUrl,
 szFInvoiceStatus   BOS_DT_szSmallId,
 szInvWorkplaceId   BOS_DT_szId,
 szRefTrnId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 szFInvoiceUsage   BOS_DT_szSmallId,
 bCash   ,
 dtmDue   ,
 dtmDue_Printed   ,
 szFInvoiceType   BOS_DT_szSmallId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 dtmCollectionDoc   ,
 dtmToBeCollected   
);
CREATE TABLE BOS_AR_ArTransItemReason(
szTrnId BOS_DT_szId,
 szDocId   BOS_DT_szId,
 dtmDate   ,
 szReasonId   BOS_DT_szId,
 szEmployeeId   BOS_DT_szId
);
CREATE TABLE BOS_AR_ArTransRefDoc(
szTrnId BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 shRevNo   ,
 shItemNumber   ,
 szRefTrnId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 szRefCustId   BOS_DT_szId,
 shRefRevNo   ,
 decAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_AR_Category(
szCategoryId BOS_DT_szId,
 szCategoryType   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szPriceId   BOS_DT_szId,
 szPromoPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 szPromoPriceOrderId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szParentCategory   BOS_DT_szId
);
CREATE TABLE BOS_AR_CategoryType(
szCategoryType BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szParentCategoryType   BOS_DT_szId
);
CREATE TABLE BOS_AR_CustDeposit(
szCustId BOS_DT_szId,
 szCcyId   BOS_DT_szId,
 decDeposit   BOS_DT_decDecimal,
 dtmLastUpdated   
);
CREATE TABLE BOS_AR_CustDepositItem(
szCustId BOS_DT_szId,
 szCcyId   BOS_DT_szId,
 dtmTransaction   ,
 shitemNo   ,
 decDeposit   BOS_DT_decAmount,
 szRefTrnId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 szReasonId   BOS_DT_szId
);
CREATE TABLE BOS_AR_CustInvoice(
szCustId BOS_DT_szId,
 szCustInvoiceNm   BOS_DT_szName,
 szCustTaxNm   BOS_DT_szName,
 szCustCollectNm   BOS_DT_szName,
 InvoiceszContactPerson   BOS_DT_szName,
 InvoiceszRoomNo   BOS_DT_szSmallName,
 InvoiceszFloor   BOS_DT_szSmallName,
 InvoiceszBuilding   BOS_DT_szName,
 InvoiceszAddress_1   BOS_DT_szBigDescription,
 InvoiceszAddress_2   BOS_DT_szBigDescription,
 InvoiceszDistrict   BOS_DT_szName,
 InvoiceszCity   BOS_DT_szMediumName,
 InvoiceszZipCode   BOS_DT_szMediumId,
 InvoiceszState   BOS_DT_szMediumName,
 InvoiceszCountry   BOS_DT_szMediumName,
 InvoiceszPhoneNo_1   BOS_DT_szMediumName,
 InvoiceszPhoneNo_2   BOS_DT_szMediumName,
 InvoiceszFaxNo   BOS_DT_szMediumName,
 InvoiceszMobileNo   BOS_DT_szMediumName,
 InvoiceszEmail   BOS_DT_szMediumName,
 InvoiceszWebSite   BOS_DT_szMediumName,
 bIsDiffTaxAddress   ,
 TaxszContactPerson   BOS_DT_szName,
 TaxszRoomNo   BOS_DT_szSmallName,
 TaxszFloor   BOS_DT_szSmallName,
 TaxszBuilding   BOS_DT_szName,
 TaxszAddress_1   BOS_DT_szBigDescription,
 TaxszAddress_2   BOS_DT_szBigDescription,
 TaxszDistrict   BOS_DT_szName,
 TaxszCity   BOS_DT_szMediumName,
 TaxszZipCode   BOS_DT_szMediumId,
 TaxszState   BOS_DT_szMediumName,
 TaxszCountry   BOS_DT_szMediumName,
 TaxszPhoneNo_1   BOS_DT_szMediumName,
 TaxszPhoneNo_2   BOS_DT_szMediumName,
 TaxszFaxNo   BOS_DT_szMediumName,
 TaxszMobileNo   BOS_DT_szMediumName,
 TaxszEmail   BOS_DT_szMediumName,
 TaxszWebSite   BOS_DT_szMediumName,
 bIsDiffCollectAddress   ,
 CollectszContactPerson   BOS_DT_szName,
 CollectszRoomNo   BOS_DT_szSmallName,
 CollectszFloor   BOS_DT_szSmallName,
 CollectszBuilding   BOS_DT_szName,
 CollectszAddress_1   BOS_DT_szBigDescription,
 CollectszAddress_2   BOS_DT_szBigDescription,
 CollectszDistrict   BOS_DT_szName,
 CollectszCity   BOS_DT_szMediumName,
 CollectszZipCode   BOS_DT_szMediumId,
 CollectszState   BOS_DT_szMediumName,
 CollectszCountry   BOS_DT_szMediumName,
 CollectszPhoneNo_1   BOS_DT_szMediumName,
 CollectszPhoneNo_2   BOS_DT_szMediumName,
 CollectszFaxNo   BOS_DT_szMediumName,
 CollectszMobileNo   BOS_DT_szMediumName,
 CollectszEmail   BOS_DT_szMediumName,
 CollectszWebSite   BOS_DT_szMediumName,
 bLock   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_AR_CustLocation(
szCustId BOS_DT_szId,
 btLocId   ,
 szCustDeliveryNm   BOS_DT_szName,
 LocationszContactPerson   BOS_DT_szName,
 LocationszRoomNo   BOS_DT_szSmallName,
 LocationszFloor   BOS_DT_szSmallName,
 LocationszBuilding   BOS_DT_szName,
 LocationszAddress_1   BOS_DT_szBigDescription,
 LocationszAddress_2   BOS_DT_szBigDescription,
 LocationszDistrict   BOS_DT_szName,
 LocationszCity   BOS_DT_szMediumName,
 LocationszZipCode   BOS_DT_szMediumId,
 LocationszState   BOS_DT_szMediumName,
 LocationszCountry   BOS_DT_szMediumName,
 LocationszPhoneNo_1   BOS_DT_szMediumName,
 LocationszPhoneNo_2   BOS_DT_szMediumName,
 LocationszFaxNo   BOS_DT_szMediumName,
 LocationszMobileNo   BOS_DT_szMediumName,
 LocationszEmail   BOS_DT_szMediumName,
 LocationszWebSite   BOS_DT_szMediumName,
 dtmLastUpdated   
);
CREATE TABLE BOS_AR_Customer(
szCustId BOS_DT_szId,
 szName   BOS_DT_szName,
 CustszContactPerson   BOS_DT_szName,
 CustszRoomNo   BOS_DT_szSmallName,
 CustszFloor   BOS_DT_szSmallName,
 CustszBuilding   BOS_DT_szName,
 CustszAddress_1   BOS_DT_szBigDescription,
 CustszAddress_2   BOS_DT_szBigDescription,
 CustszDistrict   BOS_DT_szName,
 CustszCity   BOS_DT_szName,
 CustszZipCode   BOS_DT_szMediumId,
 CustszState   BOS_DT_szMediumName,
 CustszCountry   BOS_DT_szMediumName,
 CustszPhoneNo_1   BOS_DT_szMediumName,
 CustszPhoneNo_2   BOS_DT_szMediumName,
 CustszFaxNo   BOS_DT_szMediumName,
 CustszMobileNo   BOS_DT_szMediumName,
 CustszEmail   BOS_DT_szMediumName,
 CustszWebSite   BOS_DT_szMediumName,
 szLatitude   BOS_DT_szGPSCoordinate,
 szLongitude   BOS_DT_szGPSCoordinate,
 szFCallId   BOS_DT_szId,
 bSoldToCust   BOS_DT_bBoolean,
 bDeliverToCust   BOS_DT_bBoolean,
 bInvoiceToCust   BOS_DT_bBoolean,
 bCollectToCust   BOS_DT_bBoolean,
 szSoldToCustId   BOS_DT_szId,
 szDeliverToCustId   BOS_DT_szId,
 szInvoiceToCustId   BOS_DT_szId,
 szCollectToCustId   BOS_DT_szId,
 bIsDiffDeliveryAddress   ,
 bIsDiffInvoiceAddress   ,
 bIsMultiLocation   ,
 szCategory_1   BOS_DT_szId,
 szCategory_2   BOS_DT_szId,
 szCategory_3   BOS_DT_szId,
 szCategory_4   BOS_DT_szId,
 szCategory_5   BOS_DT_szId,
 szCategory_6   BOS_DT_szId,
 szCategory_7   BOS_DT_szId,
 szCategory_8   BOS_DT_szId,
 szCategory_9   BOS_DT_szId,
 szCategory_10   BOS_DT_szId,
 bJoinInvoice   ,
 szStatus   BOS_DT_szSmallId,
 szReasonId   BOS_DT_szId,
 szDlvWorkplaceId   BOS_DT_szId,
 szInvWorkplaceId   BOS_DT_szId,
 szCollWorkplaceId   BOS_DT_szId,
 szSalWorkplaceId   BOS_DT_szId,
 szDistrChannelId   BOS_DT_szId,
 szDefaultCcyId   BOS_DT_szId,
 szStartDoc   BOS_DT_szId,
 dtmStart   ,
 szContractDoc   BOS_DT_szId,
 dtmContract   ,
 szRenewalDoc   BOS_DT_szId,
 dtmRenewal   ,
 szStopDoc   BOS_DT_szId,
 dtmStop   ,
 szSalesId   BOS_DT_szId,
 bICP   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szLastFCustBIId   BOS_DT_szId,
 bNeedInvoiceChange   BOS_DT_bBoolean,
 bInvoiceChangeWithReceipt   BOS_DT_bBoolean,
 bHasSpecialCollectionDay   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Sunday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Monday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Tuesday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Wednesday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Thursday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Friday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Saturday   BOS_DT_bBoolean,
 bPaymentType_Cash   BOS_DT_bBoolean,
 bPaymentType_CurrentAccount   BOS_DT_bBoolean,
 bPaymentType_Transfer   BOS_DT_bBoolean,
 bRequiredDocuments_PO   BOS_DT_bBoolean,
 bRequiredDocuments_Receipt   BOS_DT_bBoolean,
 bRequiredDocuments_StandardTaxInvoice   BOS_DT_bBoolean,
 bRequiredDocuments_Materai   BOS_DT_bBoolean,
 bRequiredDocuments_ReceiptNote   BOS_DT_bBoolean,
 bRequiredDocuments_Other   BOS_DT_bBoolean,
 szRequiredDocuments_Other   BOS_DT_szBigDescription,
 szGuarantee   BOS_DT_szBigDescription,
 szDeliveryGroupId   BOS_DT_szId,
 szBarcodeId   BOS_DT_szId,
 szActivityStatus   BOS_DT_szId,
 dtmLastChangeActivityStatus   
);
CREATE TABLE BOS_AR_CustomerCategoryPayment_Mapping(
szCategoryNo ,
 szCategoryId   BOS_DT_szId,
 szPaymentTermId   BOS_DT_szId,
 dtmLastUpdated   
);
CREATE TABLE BOS_AR_CustomerProductItem(
szCustId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szRefProductId   BOS_DT_szId,
 szRefProductName   BOS_DT_szName
);
CREATE TABLE BOS_AR_CustomerVisitConfig(
szCustId BOS_DT_szDeviceId,
 bGpsActive   BOS_DT_bBoolean,
 bUpdateCoordinate   BOS_DT_bBoolean,
 bValidateCoordinate   BOS_DT_bBoolean,
 bGpsScanSuccess   BOS_DT_bBoolean,
 szLastGpsScanStatus   BOS_DT_szId,
 bUpdateBarcode   BOS_DT_bBoolean,
 bValidateBarcode   BOS_DT_bBoolean,
 bBarcodeScanSuccess   BOS_DT_bBoolean,
 szLastBarcodeScanStatus   BOS_DT_szId,
 dtmLastUpdated   
);
CREATE TABLE BOS_AR_CustPrePayment(
szCustId BOS_DT_szId,
 szCcyId   BOS_DT_szSmallId,
 decPayment   BOS_DT_decAmount,
 dtmLastUpdated   
);
CREATE TABLE BOS_AR_CustPrePaymentHistory(
szCustId BOS_DT_szId,
 szCcyId   BOS_DT_szSmallId,
 dtmPayment   ,
 decPrePayment   BOS_DT_decAmount,
 szTrnId   BOS_DT_szId,
 szDocId   BOS_DT_szId,
 szUrl   BOS_DT_szUrl,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_AR_CustProductDeposit(
szCustId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 dtmLastUpdated   
);
CREATE TABLE BOS_AR_CustProductDepositHistory(
szCustId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 dtmTransaction   ,
 decQty   BOS_DT_decAmount,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szUrl   BOS_DT_szUrl,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_AR_CustSales(
szCustId BOS_DT_szId,
 bAllowToCredit   BOS_DT_bBoolean,
 decCreditLimit   BOS_DT_decAmount,
 szPaymentTermId   BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 szInvoiceProcessingId   BOS_DT_szId,
 bInvoiceNote   ,
 szPromoPriceId   BOS_DT_szId,
 szPromoPriceOrderId   BOS_DT_szId,
 bNoVatApplied   BOS_DT_bBoolean,
 bCheckMaxDropSize   BOS_DT_bBoolean,
 intMaxCountOpenInv   ,
 bCheckMinDropSize   BOS_DT_bBoolean,
 dtmLastUpdated   
);
CREATE TABLE BOS_AR_CustSalesArClass(
szCustId BOS_DT_szId,
 szArClassId   BOS_DT_szId,
 decCreditLimit   BOS_DT_decAmount,
 szPaymentTermId   BOS_DT_szId,
 intMaxCountOpenInv   
);
CREATE TABLE BOS_AR_CustSalesQualification(
szCustId BOS_DT_szId,
 szQualificationId   BOS_DT_szBigId
);
CREATE TABLE BOS_AR_FCustBasicInformation(
szFCustBIId BOS_DT_szId,
 szFCallId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 dtmDoc   ,
 bNewCustomer   ,
 szCustNm   BOS_DT_szName,
 szDistrChannelId   BOS_DT_szId,
 szCategory_1   BOS_DT_szId,
 szCategory_2   BOS_DT_szId,
 szCategory_3   BOS_DT_szId,
 szCategory_4   BOS_DT_szId,
 szCategory_5   BOS_DT_szId,
 szCategory_6   BOS_DT_szId,
 szCategory_7   BOS_DT_szId,
 szCategory_8   BOS_DT_szId,
 szCategory_9   BOS_DT_szId,
 szCategory_10   BOS_DT_szId,
 CustszContactPerson   BOS_DT_szName,
 CustszRoomNo   BOS_DT_szSmallName,
 CustszFloor   BOS_DT_szSmallName,
 CustszBuilding   BOS_DT_szName,
 CustszAddress_1   BOS_DT_szBigDescription,
 CustszAddress_2   BOS_DT_szBigDescription,
 CustszDistrict   BOS_DT_szName,
 CustszCity   BOS_DT_szMediumName,
 CustszZipCode   BOS_DT_szMediumId,
 CustszState   BOS_DT_szMediumName,
 CustszCountry   BOS_DT_szMediumName,
 CustszPhoneNo_1   BOS_DT_szMediumName,
 CustszPhoneNo_2   BOS_DT_szMediumName,
 CustszFaxNo   BOS_DT_szMediumName,
 CustszMobileNo   BOS_DT_szMediumName,
 CustszEmail   BOS_DT_szMediumName,
 CustszWebSite   BOS_DT_szMediumName,
 szLatitude   BOS_DT_szGPSCoordinate,
 szLongitude   BOS_DT_szGPSCoordinate,
 szRemark   BOS_DT_szDescription,
 bSoldToCust   ,
 bDeliverToCust   ,
 bInvoiceToCust   ,
 bCollectToCust   ,
 szSoldToCustId   BOS_DT_szId,
 szDeliverToCustId   BOS_DT_szId,
 szInvoiceToCustId   BOS_DT_szId,
 szCollectToCustId   BOS_DT_szId,
 bJoinInvoice   ,
 bDelCust   ,
 szStatus   BOS_DT_szSmallId,
 szReasonId   BOS_DT_szId,
 szSalWorkplaceId   BOS_DT_szId,
 szDefaultCcyId   BOS_DT_szSmallId,
 szFCustChgSalesCfgId   BOS_DT_szId,
 szStartDoc   BOS_DT_szId,
 dtmStart   ,
 szContractDoc   BOS_DT_szId,
 dtmContract   ,
 szRenewalDoc   BOS_DT_szId,
 dtmRenewal   ,
 szStopDoc   BOS_DT_szId,
 dtmStop   ,
 szSalesId   BOS_DT_szId,
 bICP   ,
 bCheckMaxDropSize   BOS_DT_bBoolean,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szUserId   BOS_DT_szId,
 bCheckMinDropSize   BOS_DT_bBoolean,
 bNeedInvoiceChange   BOS_DT_bBoolean,
 bInvoiceChangeWithReceipt   BOS_DT_bBoolean,
 bHasSpecialCollectionDay   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Sunday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Monday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Tuesday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Wednesday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Thursday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Friday   BOS_DT_bBoolean,
 bHasSpecialCollectionDay_Saturday   BOS_DT_bBoolean,
 bPaymentType_Cash   BOS_DT_bBoolean,
 bPaymentType_CurrentAccount   BOS_DT_bBoolean,
 bPaymentType_Transfer   BOS_DT_bBoolean,
 bRequiredDocuments_PO   BOS_DT_bBoolean,
 bRequiredDocuments_Receipt   BOS_DT_bBoolean,
 bRequiredDocuments_StandardTaxInvoice   BOS_DT_bBoolean,
 bRequiredDocuments_Materai   BOS_DT_bBoolean,
 bRequiredDocuments_ReceiptNote   BOS_DT_bBoolean,
 bRequiredDocuments_Other   BOS_DT_bBoolean,
 szRequiredDocuments_Other   BOS_DT_szBigDescription,
 szGuarantee   BOS_DT_szBigDescription,
 szDeliveryGroupId   BOS_DT_szId,
 szBarcodeId   BOS_DT_szId,
 szActivityStatus   BOS_DT_szId,
 dtmLastChangeActivityStatus   
);
CREATE TABLE BOS_AR_FCustBasicInformationArItem(
szFCustBIId BOS_DT_szId,
 shItemNumber   ,
 szCcyId   BOS_DT_szSmallId,
 decValue   BOS_DT_decAmount
);
CREATE TABLE BOS_AR_FCustBasicInformationDjrTrackingItem(
szFCustBIId BOS_DT_szId,
 shItemNumber   ,
 szDjrTrackingId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustBasicInformationDoItem(
szFCustBIId BOS_DT_szId,
 shItemNumber   ,
 szFDoId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustBasicInformationProductItem(
szFCustBIId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szRefProductId   BOS_DT_szId,
 szRefProductName   BOS_DT_szName
);
CREATE TABLE BOS_AR_FCustBasicInformationStockItem(
szFCustBIId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szStockTypeId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustChgDlvAddress(
szFCustCDAId BOS_DT_szId,
 szFCallId   BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 dtmDoc   ,
 szCustId   BOS_DT_szId,
 szCustDeliveryNm   BOS_DT_szName,
 CustszContactPerson   BOS_DT_szName,
 CustszRoomNo   BOS_DT_szSmallName,
 CustszFloor   BOS_DT_szSmallName,
 CustszBuilding   BOS_DT_szName,
 CustszAddress_1   BOS_DT_szBigDescription,
 CustszAddress_2   BOS_DT_szBigDescription,
 CustszDistrict   BOS_DT_szName,
 CustszCity   BOS_DT_szMediumName,
 CustszZipCode   BOS_DT_szMediumId,
 CustszState   BOS_DT_szMediumName,
 CustszCountry   BOS_DT_szMediumName,
 CustszPhoneNo_1   BOS_DT_szMediumName,
 CustszPhoneNo_2   BOS_DT_szMediumName,
 CustszFaxNo   BOS_DT_szMediumName,
 CustszMobileNo   BOS_DT_szMediumName,
 CustszEmail   BOS_DT_szMediumName,
 CustszWebSite   BOS_DT_szMediumName,
 bIsDiffDeliveryAddress   ,
 DeliveryszContactPerson   BOS_DT_szName,
 DeliveryszRoomNo   BOS_DT_szSmallName,
 DeliveryszFloor   BOS_DT_szSmallName,
 DeliveryszBuilding   BOS_DT_szName,
 DeliveryszAddress_1   BOS_DT_szBigDescription,
 DeliveryszAddress_2   BOS_DT_szBigDescription,
 DeliveryszDistrict   BOS_DT_szName,
 DeliveryszCity   BOS_DT_szMediumName,
 DeliveryszZipCode   BOS_DT_szMediumId,
 DeliveryszState   BOS_DT_szMediumName,
 DeliveryszCountry   BOS_DT_szMediumName,
 DeliveryszPhoneNo_1   BOS_DT_szMediumName,
 DeliveryszPhoneNo_2   BOS_DT_szMediumName,
 DeliveryszFaxNo   BOS_DT_szMediumName,
 DeliveryszMobileNo   BOS_DT_szMediumName,
 DeliveryszEmail   BOS_DT_szMediumName,
 DeliveryszWebSite   BOS_DT_szMediumName,
 szDlvWorkplaceId   BOS_DT_szId,
 szRemark   BOS_DT_szDescription,
 bIsMultiLocation   ,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustChgDlvAddressItem(
szFCustCDAId BOS_DT_szId,
 btItemNumber   ,
 LocationszContactPerson   BOS_DT_szName,
 LocationszRoomNo   BOS_DT_szSmallName,
 LocationszFloor   BOS_DT_szSmallName,
 LocationszBuilding   BOS_DT_szName,
 LocationszAddress_1   BOS_DT_szBigDescription,
 LocationszAddress_2   BOS_DT_szBigDescription,
 LocationszDistrict   BOS_DT_szName,
 LocationszCity   BOS_DT_szMediumName,
 LocationszZipCode   BOS_DT_szMediumId,
 LocationszState   BOS_DT_szMediumName,
 LocationszCountry   BOS_DT_szMediumName,
 LocationszPhoneNo_1   BOS_DT_szMediumName,
 LocationszPhoneNo_2   BOS_DT_szMediumName,
 LocationszFaxNo   BOS_DT_szMediumName,
 LocationszMobileNo   BOS_DT_szMediumName,
 LocationszEmail   BOS_DT_szMediumName,
 LocationszWebSite   BOS_DT_szMediumName
);
CREATE TABLE BOS_AR_FCustChgGpsCoord(
szFCCGId BOS_DT_szId,
 dtmDate   ,
 szOpUserId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustChgGpsCoordItem(
szFCCGId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szLongitude   BOS_DT_szGPSCoordinate,
 szLatitude   BOS_DT_szGPSCoordinate
);
CREATE TABLE BOS_AR_FCustChgInvAddress(
szFCustCIAId BOS_DT_szId,
 szFCallId   BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 dtmDoc   ,
 szCustId   BOS_DT_szId,
 szCustInvoiceNm   BOS_DT_szName,
 szCustTaxNm   BOS_DT_szName,
 szCustCollectNm   BOS_DT_szName,
 bIsDiffInvoiceAddress   ,
 InvoiceszContactPerson   BOS_DT_szName,
 InvoiceszRoomNo   BOS_DT_szSmallName,
 InvoiceszFloor   BOS_DT_szSmallName,
 InvoiceszBuilding   BOS_DT_szName,
 InvoiceszAddress_1   BOS_DT_szBigDescription,
 InvoiceszAddress_2   BOS_DT_szBigDescription,
 InvoiceszDistrict   BOS_DT_szName,
 InvoiceszCity   BOS_DT_szMediumName,
 InvoiceszZipCode   BOS_DT_szMediumId,
 InvoiceszState   BOS_DT_szMediumName,
 InvoiceszCountry   BOS_DT_szMediumName,
 InvoiceszPhoneNo_1   BOS_DT_szMediumName,
 InvoiceszPhoneNo_2   BOS_DT_szMediumName,
 InvoiceszFaxNo   BOS_DT_szMediumName,
 InvoiceszMobileNo   BOS_DT_szMediumName,
 InvoiceszEmail   BOS_DT_szMediumName,
 InvoiceszWebSite   BOS_DT_szMediumName,
 bIsDiffTaxAddress   ,
 TaxszContactPerson   BOS_DT_szName,
 TaxszRoomNo   BOS_DT_szSmallName,
 TaxszFloor   BOS_DT_szSmallName,
 TaxszBuilding   BOS_DT_szName,
 TaxszAddress_1   BOS_DT_szBigDescription,
 TaxszAddress_2   BOS_DT_szBigDescription,
 TaxszDistrict   BOS_DT_szName,
 TaxszCity   BOS_DT_szMediumName,
 TaxszZipCode   BOS_DT_szMediumId,
 TaxszState   BOS_DT_szMediumName,
 TaxszCountry   BOS_DT_szMediumName,
 TaxszPhoneNo_1   BOS_DT_szMediumName,
 TaxszPhoneNo_2   BOS_DT_szMediumName,
 TaxszFaxNo   BOS_DT_szMediumName,
 TaxszMobileNo   BOS_DT_szMediumName,
 TaxszEmail   BOS_DT_szMediumName,
 TaxszWebSite   BOS_DT_szMediumName,
 CustszContactPerson   BOS_DT_szName,
 CustszRoomNo   BOS_DT_szSmallName,
 CustszFloor   BOS_DT_szSmallName,
 CustszBuilding   BOS_DT_szName,
 CustszAddress_1   BOS_DT_szBigDescription,
 CustszAddress_2   BOS_DT_szBigDescription,
 CustszDistrict   BOS_DT_szName,
 CustszCity   BOS_DT_szMediumName,
 CustszZipCode   BOS_DT_szMediumId,
 CustszState   BOS_DT_szMediumName,
 CustszCountry   BOS_DT_szMediumName,
 CustszPhoneNo_1   BOS_DT_szMediumName,
 CustszPhoneNo_2   BOS_DT_szMediumName,
 CustszFaxNo   BOS_DT_szMediumName,
 CustszMobileNo   BOS_DT_szMediumName,
 CustszEmail   BOS_DT_szMediumName,
 CustszWebSite   BOS_DT_szMediumName,
 bIsDiffCollectAddress   ,
 CollectszContactPerson   BOS_DT_szName,
 CollectszRoomNo   BOS_DT_szSmallName,
 CollectszFloor   BOS_DT_szSmallName,
 CollectszBuilding   BOS_DT_szName,
 CollectszAddress_1   BOS_DT_szBigDescription,
 CollectszAddress_2   BOS_DT_szBigDescription,
 CollectszDistrict   BOS_DT_szName,
 CollectszCity   BOS_DT_szMediumName,
 CollectszZipCode   BOS_DT_szMediumId,
 CollectszState   BOS_DT_szMediumName,
 CollectszCountry   BOS_DT_szMediumName,
 CollectszPhoneNo_1   BOS_DT_szMediumName,
 CollectszPhoneNo_2   BOS_DT_szMediumName,
 CollectszFaxNo   BOS_DT_szMediumName,
 CollectszMobileNo   BOS_DT_szMediumName,
 CollectszEmail   BOS_DT_szMediumName,
 CollectszWebSite   BOS_DT_szMediumName,
 szInvWorkplaceId   BOS_DT_szId,
 szCollWorkplaceId   BOS_DT_szId,
 szRemark   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustChgSalesCfg(
szFCustCSCId BOS_DT_szId,
 szFCallId   BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 dtmDoc   ,
 szCustId   BOS_DT_szId,
 bAllowToCredit   ,
 decCreditLimit   BOS_DT_decAmount,
 szPaymentTermId   BOS_DT_szId,
 szInvoicingProcessId   BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 szRemark   BOS_DT_szDescription,
 bInvoiceNote   ,
 szPromoPriceId   BOS_DT_szId,
 szPromoPriceOrderId   BOS_DT_szId,
 bNoVatApplied   BOS_DT_bBoolean,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szUserId   BOS_DT_szId,
 bCheckMaxDropSize   BOS_DT_bBoolean,
 intMaxCountOpenInv   ,
 bCheckMinDropSize   BOS_DT_bBoolean
);
CREATE TABLE BOS_AR_FCustChgSalesCfgArClass(
szFCustCSCId BOS_DT_szId,
 szArClassId   BOS_DT_szId,
 decCreditLimit   BOS_DT_decAmount,
 szPaymentTermId   BOS_DT_szId,
 intMaxCountOpenInv   
);
CREATE TABLE BOS_AR_FCustChgSalesCfgNonVatProd(
szFCustCSCId BOS_DT_szId,
 szProductId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustChgSalesCfgQualification(
szFCustCSCId BOS_DT_szId,
 szQualificationId   BOS_DT_szBigId
);
CREATE TABLE BOS_AR_FCustChgStatus(
szFCustChgStatusId BOS_DT_szId,
 dtmFCustChgStatus   ,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_AR_FCustChgStatusItem(
szFCustChgStatusId BOS_DT_szId,
 shItemNumber   ,
 szCustId   BOS_DT_szId,
 szCcyId   BOS_DT_szId,
 decDueAR   BOS_DT_decAmount,
 decCurrentAR   BOS_DT_decAmount,
 szStatus   BOS_DT_szSmallId
);
CREATE TABLE BOS_AR_FCustDeposit(
szFCustDepositId BOS_DT_szId,
 dtmFCustDeposit   ,
 szCustId   BOS_DT_szId,
 decDeposit   BOS_DT_decAmount,
 szCcyId   BOS_DT_szId,
 szDeposanId   BOS_DT_szId,
 szBankId   BOS_DT_szId,
 szRefId   BOS_DT_szId,
 bValue   ,
 bResultFrTransfer   ,
 bVoid   ,
 bApproved   ,
 bApplied   ,
 bJournal   ,
 bPosted   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szApprovalId   BOS_DT_szId,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szReasonId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustDepoTransferIn(
szDepoTransInId BOS_DT_szId,
 dtmDoc   ,
 szWpTransferFrom   BOS_DT_szId,
 szDepoTransOutId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bJournal   ,
 bVoid   ,
 bApproved   ,
 bApplied   ,
 bPosted   ,
 bRejected   ,
 bNeedApproval   ,
 szApprovalId   BOS_DT_szId,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 btPrintedCount   ,
 szUserId   BOS_DT_szId,
 szCompanyId   BOS_DT_szMediumId,
 szCompanyNm   BOS_DT_szName,
 szWorkplaceId   BOS_DT_szId,
 szWorkplaceNm   BOS_DT_szName,
 szTaxEntityId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 bTransferred   ,
 bResultFrTransfer   ,
 bAlreadyTransferred   ,
 dtmLastUpdated   ,
 szFCustPaymentId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustDepoTransferOut(
szDepoTransOutId BOS_DT_szId,
 dtmDoc   ,
 szWpSource   BOS_DT_szId,
 szWpDestination   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bJournal   ,
 bVoid   ,
 bApproved   ,
 bApplied   ,
 bPosted   ,
 bRejected   ,
 bNeedApproval   ,
 szApprovalId   BOS_DT_szId,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 btPrintedCount   ,
 szUserId   BOS_DT_szId,
 szCompanyId   BOS_DT_szMediumId,
 szCompanyNm   BOS_DT_szName,
 szWorkplaceId   BOS_DT_szId,
 szWorkplaceNm   BOS_DT_szName,
 szTaxEntityId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 bTransferred   ,
 bResultFrTransfer   ,
 bAlreadyTransferred   ,
 dtmLastUpdated   ,
 szFCustPaymentId   BOS_DT_szId,
 bHasTransferIn   
);
CREATE TABLE BOS_AR_FCustDepoTransferOutItemCBAccount(
szDepoTransOutId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szBankId   BOS_DT_szId,
 szCustBankAccountNo   BOS_DT_szId,
 szCustBankAccountNm   BOS_DT_szName
);
CREATE TABLE BOS_AR_FCustDepoTransferOutItemLoc(
szDepoTransOutId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 btLocId   ,
 szCustDeliveryNm   BOS_DT_szName,
 LocationszContactPerson   BOS_DT_szName,
 LocationszRoomNo   BOS_DT_szSmallName,
 LocationszFloor   BOS_DT_szSmallName,
 LocationszBuilding   BOS_DT_szName,
 LocationszAddress_1   BOS_DT_szBigDescription,
 LocationszAddress_2   BOS_DT_szBigDescription,
 LocationszDistrict   BOS_DT_szName,
 LocationszCity   BOS_DT_szMediumName,
 LocationszZipCode   BOS_DT_szMediumId,
 LocationszState   BOS_DT_szMediumName,
 LocationszCountry   BOS_DT_szMediumName,
 LocationszPhoneNo_1   BOS_DT_szMediumName,
 LocationszPhoneNo_2   BOS_DT_szMediumName,
 LocationszFaxNo   BOS_DT_szMediumName,
 LocationszMobileNo   BOS_DT_szMediumName,
 LocationszEmail   BOS_DT_szMediumName,
 LocationszWebSite   BOS_DT_szMediumName
);
CREATE TABLE BOS_AR_FCustDepoTransferOutItemPdr(
szDepoTransOutId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szFInvoiceId   BOS_DT_szBigId,
 szPdrId   BOS_DT_szBigId,
 shItemNumber   ,
 szBankId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 szDescription   BOS_DT_szDescription,
 szStatus   BOS_DT_szSmallId,
 szCcyRateId   BOS_DT_szMediumId,
 szCcyId   BOS_DT_szSmallId,
 dtmDue   ,
 dtmReceipt   ,
 dtmPdr   ,
 szLedgerId   BOS_DT_szId,
 szPayForAccId   BOS_DT_szId,
 szPayForSubAccId   BOS_DT_szGLAccount,
 szFCustPaymentId   BOS_DT_szBigId,
 custBankAccountNo   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustPayment(
szFCustPaymentId BOS_DT_szId,
 dtmFCustPayment   ,
 szFCashReceiptId   BOS_DT_szId,
 szDeposanId   BOS_DT_szId,
 szAccountId1   BOS_DT_szId,
 szSubAccountId1   BOS_DT_szGLAccount,
 decAmount1   BOS_DT_decAmount,
 szAccountId2   BOS_DT_szId,
 szSubAccountId2   BOS_DT_szGLAccount,
 decAmount2   BOS_DT_decAmount,
 szAccountId3   BOS_DT_szId,
 szSubAccountId3   BOS_DT_szGLAccount,
 decAmount3   BOS_DT_decAmount,
 szAccountId4   BOS_DT_szId,
 szSubAccountId4   BOS_DT_szGLAccount,
 decAmount4   BOS_DT_decAmount,
 decAmount   BOS_DT_decAmount,
 szCcyId   BOS_DT_szSmallId,
 szCcyRateId   BOS_DT_szMediumId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_AR_FCustPayment2(
szFCustPaymentId BOS_DT_szId,
 dtmFCustPayment   ,
 szCustId   BOS_DT_szId,
 szCcyId   BOS_DT_szSmallId,
 decInitialCustDeposit   BOS_DT_decAmount,
 bResultFrTransfer   BOS_DT_bBoolean,
 bVoid   BOS_DT_bBoolean,
 bApproved   BOS_DT_bBoolean,
 bApplied   BOS_DT_bBoolean,
 bJournal   BOS_DT_bBoolean,
 bPosted   BOS_DT_bBoolean,
 btPrintedCount   BOS_DT_bBoolean,
 bTransferred   BOS_DT_bBoolean,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   BOS_DT_bBoolean,
 gdApprovedId   ,
 szApprovalId   BOS_DT_szId,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   BOS_DT_bBoolean,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 szPaymentRefNo   
);
CREATE TABLE BOS_AR_FCustPayment2Item(
szFCustPaymentId BOS_DT_szId,
 szInvoiceId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 decPaidByDeposit   BOS_DT_decAmount
);
CREATE TABLE BOS_AR_FCustPaymentItem(
szFCustPaymentId BOS_DT_szId,
 shItemNumber   ,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 decPaidByCashReceipt   BOS_DT_decAmount,
 szFDoId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustPaymentItemDetail(
szFCustPaymentId BOS_DT_szId,
 shItemNumber   ,
 shDetailNumber   ,
 szBankId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 bValue   ,
 decAmount   BOS_DT_decAmount,
 bDeposit   ,
 szReasonId   BOS_DT_szId
);
CREATE TABLE BOS_AR_FCustPaymentPlan(
szFCustPaymentPlanId ,
 dtmFCustPaymentPlan   ,
 szPaymentRefNo   ,
 bVoid   BOS_DT_bBoolean,
 bApplied   BOS_DT_bBoolean,
 bApproved   BOS_DT_bBoolean,
 btPrintedCount   BOS_DT_bBoolean,
 szCompanyId   ,
 szWorkplaceId   ,
 szTaxEntityId   ,
 bNeedApproval   BOS_DT_bBoolean,
 gdApprovedId   ,
 dtmCreated   ,
 szUserId   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 bSystemCreated   BOS_DT_bBoolean,
 szFJournalId   ,
 szApprovalId   ,
 szWorkplaceNm   ,
 szCompanyNm   ,
 bTransferred   BOS_DT_bBoolean,
 bPosted   BOS_DT_bBoolean,
 bJournal   BOS_DT_bBoolean,
 bRejected   BOS_DT_bBoolean,
 bResultFrTransfer   BOS_DT_bBoolean
);
CREATE TABLE BOS_AR_FCustPaymentPlanItem(
szFCustPaymentPlanId ,
 shItemNumber   ,
 szInvoiceId   
);
CREATE TABLE BOS_AR_NonVatCustItem(
szProductId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_AR_PaymentTerm(
szPaymentTermId BOS_DT_szId,
 szFailCheckActionType   BOS_DT_szSmallId,
 szOpenBlockApprovalId   BOS_DT_szId,
 decOverLimitAmount_2   BOS_DT_decAmount,
 szFailCheckActionType_2   BOS_DT_szSmallId,
 szOpenBlockApprovalId_2   BOS_DT_szId,
 decOverLimitAmount_3   BOS_DT_decAmount,
 szFailCheckActionType_3   BOS_DT_szSmallId,
 szOpenBlockApprovalId_3   BOS_DT_szId,
 decOverLimitAmount_4   BOS_DT_decAmount,
 szFailCheckActionType_4   BOS_DT_szSmallId,
 szOpenBlockApprovalId_4   BOS_DT_szId,
 szCcyId   BOS_DT_szSmallId,
 intMaxPaymentDay   ,
 intPrintedMaxPaymentDay   ,
 intDayBeforeDueDateToSendInvoice   ,
 szPaymentDelayPenalty   BOS_DT_szSmallId,
 decPenalty   BOS_DT_decAmount,
 decFixPenalty   BOS_DT_decAmount,
 szPenaltyOrderItemTypeId   BOS_DT_szId,
 szAdvancePaymentIncentive   BOS_DT_szSmallId,
 decIncentive   BOS_DT_decAmount,
 decFixIncentive   BOS_DT_decAmount,
 szIncentiveOrderItemTypeId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 decMultipleFactor   BOS_DT_decDecimal
);
CREATE TABLE BOS_BIZ_PeriodicCalendar(
dtmDate ,
 szYear   BOS_DT_szMediumName,
 szMonth   BOS_DT_szMediumName,
 szYWeek   BOS_DT_szMediumName,
 szQuarter   BOS_DT_szMediumName,
 szTriSemester   BOS_DT_szMediumName,
 szSemester   BOS_DT_szMediumName,
 szDay   BOS_DT_szMediumName,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szYearWeek   BOS_DT_szMediumName
);
CREATE TABLE BOS_BIZ_PostalCode(
szPostalCode BOS_DT_szMediumId,
 szKelurahan   BOS_DT_szName,
 szKecamatan   BOS_DT_szName,
 szKotamadya   BOS_DT_szName,
 szKabupaten   BOS_DT_szName,
 szPropinsi   BOS_DT_szName,
 szCountry   BOS_DT_szName,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 decPopulation   
);
CREATE TABLE BOS_BIZ_Qualification(
szQualificationClassId BOS_DT_szMediumId,
 szQualificationId   BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_BIZ_QualificationClass(
szQualificationClassId BOS_DT_szMediumId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_BIZ_Qualifier(
szQualificationClassId BOS_DT_szMediumId,
 szQualifierId   BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 szQualifierFormula   BOS_DT_szBigMessage,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CAS_AccountMonitoring(
szAccountMonitoringId BOS_DT_szId,
 szAccountMonitoringName   BOS_DT_szName,
 szAccountId_1   BOS_DT_szId,
 szSubAccountId_1   BOS_DT_szId,
 szClearingAccountId   BOS_DT_szId,
 szClearingSubAccountId   BOS_DT_szId,
 decMaxAmountAccount_1   BOS_DT_decAmount,
 decMaxNettInOutClearingAccount   BOS_DT_decAmount,
 dtmLastUpdated   
);
CREATE TABLE BOS_CAS_Bank(
szBankId BOS_DT_szId,
 szName   BOS_DT_szName,
 szAccount   BOS_DT_szBigId,
 BankszContactPerson   BOS_DT_szName,
 BankszRoomNo   BOS_DT_szSmallName,
 BankszFloor   BOS_DT_szSmallName,
 BankszBuilding   BOS_DT_szName,
 BankszAddress_1   BOS_DT_szName,
 BankszAddress_2   BOS_DT_szName,
 BankszDistrict   BOS_DT_szName,
 BankszCity   BOS_DT_szMediumName,
 BankszZipCode   BOS_DT_szMediumId,
 BankszState   BOS_DT_szMediumName,
 BankszCountry   BOS_DT_szMediumName,
 BankszPhoneNo_1   BOS_DT_szMediumName,
 BankszPhoneNo_2   BOS_DT_szMediumName,
 BankszFaxNo   BOS_DT_szMediumName,
 BankszMobileNo   BOS_DT_szMediumName,
 BankszEmail   BOS_DT_szMediumName,
 BankszWebSite   BOS_DT_szMediumName,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CAS_CashAdvanceRequest(
szCashAdvanceRequestId BOS_DT_szId,
 szCashAdvanceType   BOS_DT_szId,
 szStatus   BOS_DT_szName,
 dtmDate   ,
 iMaturity   ,
 dtmMaturity   ,
 szCashAdvanceRecipientId   BOS_DT_szId,
 szCashAdvanceRecipientName   BOS_DT_szName,
 szAccount   BOS_DT_szId,
 szSubAccount   BOS_DT_szId,
 decCashAdvanceAmount   BOS_DT_decAmount,
 szUtilities   BOS_DT_szName,
 bApplied   ,
 bApproved   ,
 bJournal   ,
 bNeedApproval   ,
 bPosted   ,
 bRejected   ,
 bResultFrTransfer   ,
 bSystemCreated   ,
 btPrintedCount   ,
 bTransferred   ,
 bVoid   ,
 dtmCreated   ,
 gdApprovedId   ,
 szApprovalId   BOS_DT_szId,
 szCompanyId   BOS_DT_szId,
 szCompanyNm   BOS_DT_szName,
 szFJournalId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 szUserId   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szWorkplaceNm   BOS_DT_szName,
 bAlreadyTransferred   ,
 dtmLastUpdated   ,
 szSalWorkplaceId   BOS_DT_szId,
 dtmClosing   ,
 bSystem   
);
CREATE TABLE BOS_CAS_CashAdvanceType(
szCashAdvanceTypeId BOS_DT_szId,
 szDescription   BOS_DT_szName,
 szApproval   BOS_DT_szId,
 decNominal   BOS_DT_decAmount,
 iMaxCashAdvance   ,
 iMaturity   ,
 bManualInput   BOS_DT_bBoolean,
 dtmLastUpdated   
);
CREATE TABLE BOS_CAS_Denomination(
szCcyId BOS_DT_szSmallName,
 decNominal   BOS_DT_decDecimal,
 szMoneyType   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_CAS_FBankSettlement(
szFBankSettlementId BOS_DT_szId,
 szAccountId   BOS_DT_szId,
 szSubAccountId   BOS_DT_szGLAccount,
 dtmBankSettlement   ,
 dtmFrom   ,
 dtmTo   ,
 decBankBeginingBalance   BOS_DT_decAmount,
 decReconcileBeginingBalance   BOS_DT_decAmount,
 decBankEndingBalance   BOS_DT_decAmount,
 decBankCreditMutation   BOS_DT_decAmount,
 decBankDebitMutation   BOS_DT_decAmount,
 decReconcileEndingBalance   BOS_DT_decAmount,
 decDeviationBalance   BOS_DT_decAmount,
 szCcyId   BOS_DT_szSmallId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_CAS_FBankSettlementItem(
szFBankSettlementId BOS_DT_szId,
 szFJournalId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szAccountId   BOS_DT_szId,
 szSubAccountId   BOS_DT_szGLAccount,
 szTransactionType   BOS_DT_szId,
 decCreditAmount   BOS_DT_decAmount,
 decDebitAmount   BOS_DT_decAmount,
 dtmBankStatement   ,
 bHasReconsile   ,
 szRefDocId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szUrl   BOS_DT_szUrl,
 iSequentialIndex   ,
 bankId   BOS_DT_szId,
 trnId   BOS_DT_szUrl,
 szRefIdFromClearing   BOS_DT_szId
);
CREATE TABLE BOS_CAS_FCashOpname(
szOpnameId BOS_DT_szId,
 dtmOpname   ,
 dtmLastClosing   ,
 dtmConfirm   ,
 szOpnameToCash   BOS_DT_szId,
 szCurrency   BOS_DT_szId,
 szStatus   BOS_DT_szId,
 szUserIdTreasury   BOS_DT_szId,
 szSettlementDoc   BOS_DT_szId,
 decPhysicalMoney   BOS_DT_decDecimal,
 decLastClosingBalance   BOS_DT_decDecimal,
 decCashTransaction   BOS_DT_decDecimal,
 bLock   ,
 bConfirm   ,
 bApplied   ,
 bApproved   ,
 bJournal   ,
 bNeedApproval   ,
 bPosted   ,
 bRejected   ,
 bResultFrTransfer   ,
 bSystemCreated   ,
 btPrintedCount   ,
 bTransferred   ,
 bVoid   ,
 dtmCreated   ,
 gdApprovedId   ,
 szApprovalId   BOS_DT_szId,
 szCompanyId   BOS_DT_szId,
 szCompanyNm   BOS_DT_szName,
 szFJournalId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 szUserId   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szWorkplaceNm   BOS_DT_szName,
 bAlreadyTransferred   ,
 dtmLastUpdated   ,
 szFCashOutId   BOS_DT_szId,
 szFCashReceiptId   BOS_DT_szId,
 szDifferReason   BOS_DT_szBigDescription
);
CREATE TABLE BOS_CAS_FCashOpnameItemCashTransaction(
szOpnameId BOS_DT_szId,
 decCashTransaction   BOS_DT_decAmount
);
CREATE TABLE BOS_CAS_FCashOpnameItemDenomination(
szOpnameId BOS_DT_szId,
 szMoneyType   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decAmount   BOS_DT_decAmount,
 decNominal   BOS_DT_decAmount
);
CREATE TABLE BOS_CAS_FCashOut(
szCreateId BOS_DT_szId,
 szOfficerId   BOS_DT_szId,
 szFCashOutId   BOS_DT_szId,
 dtmReleased   ,
 szAccountId   BOS_DT_szId,
 szSubAccountId   BOS_DT_szGLAccount,
 szChequeNo   BOS_DT_szId,
 szCcyRateId   BOS_DT_szMediumId,
 szCcyId   BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription,
 decControlAmount   BOS_DT_decAmount,
 szRecUserId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_CAS_FCashOutItem(
szCreateId BOS_DT_szId,
 btItemNumber   ,
 szAccountId   BOS_DT_szId,
 szSubAccountId   BOS_DT_szGLAccount,
 szDescription   BOS_DT_szDescription,
 decAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_CAS_FCashReceipt(
szFCashReceiptId BOS_DT_szId,
 dtmReceipt   ,
 szOfficerId   BOS_DT_szId,
 szAccountId   BOS_DT_szId,
 szSubAccountId   BOS_DT_szGLAccount,
 szCcyRateId   BOS_DT_szMediumId,
 szCcyId   BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription,
 decControlAmount   BOS_DT_decAmount,
 szDeposanId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_CAS_FCashReceiptItem(
szFCashReceiptId BOS_DT_szId,
 btItemNumber   ,
 szAccountId   BOS_DT_szId,
 szSubAccountId   BOS_DT_szGLAccount,
 szDescription   BOS_DT_szDescription,
 decAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_CAS_FCashTemp(
szFCashTempId BOS_DT_szId,
 dtmTransaction   ,
 szOfficerId   BOS_DT_szId,
 szCcyRateId   BOS_DT_szMediumId,
 szCcyId   BOS_DT_szSmallId,
 szEmployeeId   BOS_DT_szId,
 szCashDirection   BOS_DT_szSmallId,
 szFCashTrnId   BOS_DT_szMediumId,
 szFCashId   BOS_DT_szId,
 szFCashURL   BOS_DT_szUrl,
 szChequeNo   BOS_DT_szId,
 szSrcTrnId   BOS_DT_szMediumId,
 szSrcDocId   BOS_DT_szId,
 szSrcURL   BOS_DT_szUrl,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 dtmMobileTransaction   ,
 szJobRoutine   BOS_DT_szId,
 szCashAdvanceRequestId   BOS_DT_szId
);
CREATE TABLE BOS_CAS_FCashTempItem(
szFCashTempId BOS_DT_szId,
 btItemNumber   ,
 szAccountId   BOS_DT_szId,
 szSubAccountId   BOS_DT_szGLAccount,
 szDescription   BOS_DT_szDescription,
 decAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_CAS_FPdrClearing(
szFPdrClearingId BOS_DT_szId,
 dtmClearing   ,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_CAS_FPdrClearingItem(
szFPdrClearingId BOS_DT_szId,
 shItemNumber   ,
 szBankId   BOS_DT_szId,
 szRefId   BOS_DT_szId
);
CREATE TABLE BOS_CAS_FPdrDeposit(
szFPdrDepositId BOS_DT_szId,
 dtmDeposit   ,
 szDescription   BOS_DT_szDescription,
 szDepositBankId   BOS_DT_szId,
 szClearingAccId   BOS_DT_szId,
 szClearingSubAccId   BOS_DT_szGLAccount,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 dtmCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_CAS_FPdrDepositItem(
szFPdrDepositId BOS_DT_szId,
 shItemNumber   ,
 szBankId   BOS_DT_szId,
 szRefId   BOS_DT_szId
);
CREATE TABLE BOS_CAS_FPdrReceipt(
szFPdrReceiptId BOS_DT_szId,
 dtmPdrReceipt   ,
 szDescription   BOS_DT_szDescription,
 decControlAmount   BOS_DT_decAmount,
 bAssumeValuable   ,
 szCcyRateId   BOS_DT_szMediumId,
 szCcyId   BOS_DT_szSmallId,
 szDeposanId   BOS_DT_szId,
 szPayForAccId   BOS_DT_szId,
 szPayForSubAccId   BOS_DT_szGLAccount,
 szUnclearPdrAccId   BOS_DT_szId,
 szUnclearPdrSubAccId   BOS_DT_szGLAccount,
 szFCashTempId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 dtmMobileTransaction   ,
 szOfficerId   BOS_DT_szId
);
CREATE TABLE BOS_CAS_FPdrReceiptItem(
szFPdrReceiptId BOS_DT_szId,
 shItemNumber   ,
 szBankId   BOS_DT_szId,
 szRefId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 dtmDue   ,
 dtmPdr   ,
 szDescription   BOS_DT_szDescription,
 custBankAccountNo   BOS_DT_szId
);
CREATE TABLE BOS_CAS_FPdrReject(
szFPdrRejectId BOS_DT_szId,
 dtmReject   ,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 dtmCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szReasonId   BOS_DT_szId,
 bPDRCancellation   ,
 szOfficerId   BOS_DT_szId
);
CREATE TABLE BOS_CAS_FPdrRejectItem(
szFPdrRejectId BOS_DT_szId,
 shItemNumber   ,
 szBankId   BOS_DT_szId,
 szRefId   BOS_DT_szId
);
CREATE TABLE BOS_CAS_Pdr(
szBankId BOS_DT_szId,
 szRefId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 dtmDue   ,
 szDescription   BOS_DT_szDescription,
 szStatus   BOS_DT_szSmallId,
 dtmClear   ,
 dtmReceipt   ,
 dtmPdr   ,
 dtmDeposit   ,
 szRecWorkplaceId   BOS_DT_szId,
 bAssumeValuable   ,
 szCcyRateId   BOS_DT_szMediumId,
 szCcyId   BOS_DT_szSmallId,
 szDepositBankId   BOS_DT_szId,
 szDeposanId   BOS_DT_szId,
 szCompanyId   BOS_DT_szMediumId,
 szLedgerId   BOS_DT_szId,
 szPayForAccId   BOS_DT_szId,
 szPayForSubAccId   BOS_DT_szGLAccount,
 szUnclearPdrAccId   BOS_DT_szId,
 szUnclearPdrSubAccId   BOS_DT_szGLAccount,
 szClearingAccId   BOS_DT_szId,
 szClearingSubAccId   BOS_DT_szGLAccount,
 decRemain   BOS_DT_decAmount,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szFBankSettlementId   BOS_DT_szId,
 bHasReconcile   ,
 custBankAccountNo   BOS_DT_szId,
 szOfficerId   BOS_DT_szId
);
CREATE TABLE BOS_CAS_PdrOpname(
szDocId BOS_DT_szBigId,
 szStatusOpname   BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 dtmDoc   ,
 bJournal   ,
 bVoid   ,
 bApproved   ,
 bApplied   ,
 bPosted   ,
 bRejected   ,
 bNeedApproval   ,
 szApprovalId   BOS_DT_szBigId,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szBigId,
 btPrintedCount   ,
 szUserId   BOS_DT_szBigId,
 szCompanyId   BOS_DT_szMediumId,
 szCompanyNm   BOS_DT_szName,
 szWorkplaceId   BOS_DT_szBigId,
 szWorkplaceNm   BOS_DT_szName,
 szTaxEntityId   BOS_DT_szBigId,
 dtmCreated   ,
 bSystemCreated   ,
 bTransferred   ,
 bResultFrTransfer   ,
 bAlreadyTransferred   ,
 dtmLastUpdated   ,
 szLOS_Status_Total   ,
 decLOS_Amount   BOS_DT_decAmount,
 szGiroAdminId   BOS_DT_szBigId,
 szGiroAdminName   BOS_DT_szName
);
CREATE TABLE BOS_CAS_PdrOpnameItem(
szDocId BOS_DT_szBigId,
 szGiroId   BOS_DT_szBigId,
 szBank   BOS_DT_szBigId,
 decTotal   BOS_DT_decDecimal,
 szStatusOpname   BOS_DT_szSmallName,
 dtmDueDate   ,
 szOverDueGiro   BOS_DT_szBigId,
 decSystemValue   BOS_DT_decDecimal,
 decDifference   BOS_DT_decDecimal
);
CREATE TABLE BOS_CAS_PdrStatusToYaTidak(
szStatus BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_CRL_CustFUp(
szTrnId BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 dtmDate   ,
 szUrl   BOS_DT_szUrl,
 szCallType   BOS_DT_szSmallId,
 szReasonId   BOS_DT_szId,
 szDocDescription   BOS_DT_szDescription,
 szDescription   BOS_DT_szDescription,
 bProspect   ,
 szCustId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CRL_FCall(
szFCallId BOS_DT_szId,
 dtmDate   ,
 szCallRecipientId   BOS_DT_szId,
 szCallType   BOS_DT_szSmallId,
 szCallReasonId   BOS_DT_szId,
 shCallCount   ,
 szMessage   BOS_DT_szMessage,
 dtmFollowUp   ,
 bNoMoreFollowUp   ,
 dtmFinish   ,
 bSuccess   ,
 szTrackingId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szName   BOS_DT_szName,
 szForwardToWorkplaceId   BOS_DT_szId,
 szForwardToGroupId   BOS_DT_szId,
 bReplyDirectly   ,
 szReply   BOS_DT_szMessage,
 szContactPerson   BOS_DT_szName,
 szRoomNo   BOS_DT_szSmallName,
 szFloor   BOS_DT_szSmallName,
 szBuilding   BOS_DT_szName,
 szAddress_1   BOS_DT_szBigDescription,
 szAddress_2   BOS_DT_szBigDescription,
 szDistrict   BOS_DT_szName,
 szCity   BOS_DT_szMediumName,
 szZipCode   BOS_DT_szMediumId,
 szState   BOS_DT_szMediumName,
 szCountry   BOS_DT_szMediumName,
 szPhoneNo_1   BOS_DT_szMediumName,
 szPhoneNo_2   BOS_DT_szMediumName,
 szFaxNo   BOS_DT_szMediumName,
 szMobileNo   BOS_DT_szMediumName,
 szEmail   BOS_DT_szMediumName,
 szWebSite   BOS_DT_szMediumName,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szUserId   BOS_DT_szId,
 dtmLastReminder   
);
CREATE TABLE BOS_CRL_FCallProduct(
szFCallId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId
);
CREATE TABLE BOS_CRL_FCallReply(
szFCallReplyId BOS_DT_szId,
 dtmDate   ,
 szReplyUserId   BOS_DT_szId,
 szFCallId   BOS_DT_szId,
 bNoMoreFollowUp   ,
 bSuccess   ,
 szFailReasonId   BOS_DT_szId,
 szMessage   BOS_DT_szMessage,
 szRefTrnId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 szRefUrl   BOS_DT_szUrl,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_CRM_Buyer(
szBuyerId BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CRM_CustCrm(
szCustId BOS_DT_szId,
 szNickNm   BOS_DT_szSmallName,
 dtmBirthday   ,
 szGender   BOS_DT_szSmallName,
 szReligionId   BOS_DT_szId,
 szEducationId   BOS_DT_szId,
 szEthnicId   BOS_DT_szId,
 szMaritalStatusId   BOS_DT_szId,
 szSpouseNm   BOS_DT_szName,
 szSpouseNickNm   BOS_DT_szSmallName,
 dtmSpouseBirthday   ,
 szOwnerHobbyId1   BOS_DT_szId,
 szOwnerHobbyId2   BOS_DT_szId,
 szOwnerHobbyId3   BOS_DT_szId,
 szOwnerHobbyId4   BOS_DT_szId,
 szOwnerHobbyId5   BOS_DT_szId,
 szOwnerHobbyId6   BOS_DT_szId,
 szOwnerHobbyId7   BOS_DT_szId,
 szOwnerHobbyId8   BOS_DT_szId,
 szOwnerHobbyId9   BOS_DT_szId,
 szOwnerHobbyId10   BOS_DT_szId,
 szSpouseHobbyId1   BOS_DT_szId,
 szSpouseHobbyId2   BOS_DT_szId,
 szSpouseHobbyId3   BOS_DT_szId,
 szSpouseHobbyId4   BOS_DT_szId,
 szSpouseHobbyId5   BOS_DT_szId,
 szSpouseHobbyId6   BOS_DT_szId,
 szSpouseHobbyId7   BOS_DT_szId,
 szSpouseHobbyId8   BOS_DT_szId,
 szSpouseHobbyId9   BOS_DT_szId,
 szSpouseHobbyId10   BOS_DT_szId,
 iChildrenCount   ,
 szFirstChildNm   BOS_DT_szName,
 szSecondChildNm   BOS_DT_szName,
 szBankId   BOS_DT_szId,
 szBankAccId   BOS_DT_szBigId,
 szOutletTypeId   BOS_DT_szId,
 decOutletSpace   BOS_DT_decAmount,
 szBuyerId1   BOS_DT_szId,
 szBuyerId2   BOS_DT_szId,
 szBuyerId3   BOS_DT_szId,
 szBuyerId4   BOS_DT_szId,
 szBuyerId5   BOS_DT_szId,
 szBuyerId6   BOS_DT_szId,
 szBuyerId7   BOS_DT_szId,
 szBuyerId8   BOS_DT_szId,
 szBuyerId9   BOS_DT_szId,
 szBuyerId10   BOS_DT_szId,
 szSalesFleetId1   BOS_DT_szId,
 szSalesFleetId2   BOS_DT_szId,
 szSalesFleetId3   BOS_DT_szId,
 szSalesFleetId4   BOS_DT_szId,
 szSalesFleetId5   BOS_DT_szId,
 szSalesFleetId6   BOS_DT_szId,
 szSalesFleetId7   BOS_DT_szId,
 szSalesFleetId8   BOS_DT_szId,
 szSalesFleetId9   BOS_DT_szId,
 szSalesFleetId10   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CRM_Education(
szEducationId BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CRM_Ethnic(
szEthnicId BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CRM_Hobby(
szHobbyId BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CRM_MaritalStatus(
szMaritalStatusId BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CRM_OutletType(
szOutletTypeId BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CRM_Religion(
szReligionId BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CRM_SalesFleet(
szSalesFleetId BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CU_Currency(
szCcyId BOS_DT_szSmallId,
 szSymbol   BOS_DT_szSmallId,
 szAmountFormat   BOS_DT_szMediumName,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_CU_CurrencyRate(
szCcyRateId BOS_DT_szMediumId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 dtmTime   
);
CREATE TABLE BOS_CU_CurrencyRate_History(
szCcyRateHistoryId BOS_DT_szMediumId,
 dtmCcyId   ,
 szFromCcyId   BOS_DT_szSmallId,
 szToCcyId   BOS_DT_szSmallId,
 decValue   BOS_DT_decCcyRate
);
CREATE TABLE BOS_CU_CurrencyRateItem(
szCcyRateId BOS_DT_szMediumId,
 szCcyId   BOS_DT_szSmallId,
 szToCcyId   BOS_DT_szSmallId,
 decValue   BOS_DT_decCcyRate
);
CREATE TABLE BOS_DOM_BreakingNews(
gdHistory ,
 szCompanyId   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szEmployeeId   BOS_DT_szId,
 szMessage   BOS_DT_szMessage,
 szLongitude   BOS_DT_szBigDescription,
 szLatitude   BOS_DT_szBigDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_DOM_TickerNews(
gdHistory ,
 szCompanyId   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 dtmShow   ,
 szEmployeeId   BOS_DT_szId,
 szMessage   BOS_DT_szMessage,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_DOM_WHPalletPosition(
szProductId BOS_DT_szId,
 decRacking   BOS_DT_decAmount,
 decNonRacking   BOS_DT_decAmount,
 decRacking_Ctn   BOS_DT_decAmount,
 decNonRacking_Ctn   BOS_DT_decAmount
);
CREATE TABLE BOS_DOM_WHRacking(
szWorkplaceId BOS_DT_szId,
 decPalletCapacity   BOS_DT_decAmount,
 bRackingWH   
);
CREATE TABLE BOS_DOM_WHSafetyStock(
szWorkplaceId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decSafetyStock   BOS_DT_decAmount,
 decSafetyStock_Ctn   BOS_DT_decAmount
);
CREATE TABLE BOS_GEN_Approval(
szApprovalId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bLock   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_ApprovalGroup(
szApprovalId BOS_DT_szId,
 btLevel   ,
 szGroupId   BOS_DT_szId
);
CREATE TABLE BOS_GEN_ApprovalLevel(
szApprovalId BOS_DT_szId,
 btLevel   ,
 bAllowSkipToNext   
);
CREATE TABLE BOS_GEN_Approved(
gdApprovedId ,
 szApprovalId   BOS_DT_szId,
 bApproved   ,
 bRejected   ,
 szUrl   BOS_DT_szUrl,
 szDescription   BOS_DT_szDescription,
 szWorkplaceId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szURI   BOS_DT_szBigId
);
CREATE TABLE BOS_GEN_ApprovedItem(
gdApprovedId ,
 btApprovedLevel   ,
 szUserId   BOS_DT_szId,
 szGroupId   BOS_DT_szId,
 dtmApproved   ,
 bApproved   
);
CREATE TABLE BOS_GEN_Calendar(
szCalendarId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bWorkOnSat   ,
 bWorkOnSun   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_CalendarOverride(
szCalendarId BOS_DT_szId,
 shItemNumber   ,
 dtmOverride   ,
 bWorkingDay   
);
CREATE TABLE BOS_GEN_Closing(
szWorkplaceId BOS_DT_szId,
 szClosingType   BOS_DT_szSmallId,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 dtmClosing   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_Counter(
szCounterId BOS_DT_szId,
 lngLastCounterNumber   ,
 lngMaxNumber   ,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_DataTrf(
szWpId BOS_DT_szId,
 szDataTrfId   BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szFlexiKeyId   BOS_DT_szId
);
CREATE TABLE BOS_GEN_DataTrfItem(
szWpId BOS_DT_szId,
 szDataTrfId   BOS_DT_szBigId,
 shItemNumber   ,
 szUri   BOS_DT_szUri,
 bAllWp   ,
 bDestWp   ,
 szDestWpId   BOS_DT_szId,
 szFromId   BOS_DT_szId,
 szToId   BOS_DT_szId,
 bNotVoidOnly   ,
 bNeedNoApprovalOnly   ,
 bApprovedOnly   ,
 bAppliedOnly   ,
 bToday   ,
 bFromToDate   ,
 dtmFrom   ,
 dtmTo   ,
 bUnexportedDataOnly   ,
 szFromId2   BOS_DT_szId,
 szToId2   BOS_DT_szId
);
CREATE TABLE BOS_GEN_FBackDateClosing(
szFBackDateClosingId BOS_DT_szId,
 dtmDate   ,
 dtmCashierLastClosing   ,
 dtmDistrLastClosing   ,
 dtmInvLastClosing   ,
 dtmBackDate   ,
 bCloseCashier   BOS_DT_bBoolean,
 bCloseDistr   BOS_DT_bBoolean,
 bCloseInv   BOS_DT_bBoolean,
 szReason   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_GEN_FieldClass(
szFieldClass BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_FieldContent(
szFieldClass BOS_DT_szBigId,
 szFieldName   BOS_DT_szBigId,
 szFieldContent   BOS_DT_szBigId,
 szParentFieldName   BOS_DT_szBigId,
 szParentFieldContent   BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_FieldName(
szFieldClass BOS_DT_szBigId,
 szFieldName   BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_FlagCashCredit(
bCash ,
 szDescription   BOS_DT_szMediumId
);
CREATE TABLE BOS_GEN_FlexiKey(
szFlexiKeyId BOS_DT_szId,
 btSegmentCount   ,
 szDescription   BOS_DT_szDescription,
 bAllowDynamicGLAccEntry   BOS_DT_bBoolean,
 szFieldClass   BOS_DT_szBigId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_FlexiKeyItem(
szFlexiKeyId BOS_DT_szId,
 btSegmentNumber   ,
 szKeyType   BOS_DT_szSmallId,
 szContentId   BOS_DT_szId,
 btSegmentLength   ,
 szSeparator   BOS_DT_szSmallId,
 szAlignment   BOS_DT_szSmallId,
 szFillChar   ,
 bBalancingSegment   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_FreezeObject(
szUri BOS_DT_szBigId,
 bFreeze   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_Image(
szDocId BOS_DT_szId,
 szTrnId   BOS_DT_szId,
 shItemNumber   ,
 imgImageData   
);
CREATE TABLE BOS_GEN_Menu(
szMenuId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bLock   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_GEN_MenuItem(
szMenuId BOS_DT_szId,
 shItemNumber   ,
 szItemName   BOS_DT_szName,
 szLinkAddress   BOS_DT_szUrl
);
CREATE TABLE BOS_GEN_Monkey(
decMonth ,
 decQuarter   
);
CREATE TABLE BOS_GEN_Olap(
szOlapTypeId BOS_DT_szBigId,
 szOlapName   BOS_DT_szName,
 szOlapTitle   BOS_DT_szName,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szOlapParameter   BOS_DT_szBigId
);
CREATE TABLE BOS_GEN_OlapItem(
szOlapTypeId BOS_DT_szBigId,
 szOlapName   BOS_DT_szName,
 shItemNumber   ,
 szColumnName   BOS_DT_szName,
 shColumnWidth   ,
 bDetail   ,
 bSummarized   ,
 szPrintText   BOS_DT_szName,
 szSortType   BOS_DT_szSmallId,
 iMaxDisplayedRow   ,
 szRowToDisplay   BOS_DT_szSmallId,
 szProductIdFieldNm   BOS_DT_szName,
 szCompUomIdForTotal   BOS_DT_szId,
 szStyle   BOS_DT_szId,
 bInline   BOS_DT_bBoolean,
 iIndentLength   ,
 bFreeze   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_One(
decOne BOS_DT_decAmount
);
CREATE TABLE BOS_GEN_Reason(
szReasonId BOS_DT_szId,
 szReasonType   BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_RoutineSchedule(
szScheduleId BOS_DT_szId,
 szScheduleUsage   BOS_DT_szSmallId,
 szScheduleType   BOS_DT_szSmallId,
 bIncludeSat   ,
 bIncludeSun   ,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GEN_RoutineScheduleItem(
szScheduleId BOS_DT_szId,
 shScheduleItem   ,
 decValue   BOS_DT_decAmount
);
CREATE TABLE BOS_GEN_TrnMaster(
szUri BOS_DT_szUri,
 szTrnId   BOS_DT_szTrnId,
 szName   BOS_DT_szName,
 szAssemblyNm   BOS_DT_szBigId,
 szFqn   BOS_DT_szBigId,
 bShowAsTransferable   ,
 bSupportDataMaintenance   ,
 bSupportGLPosting   ,
 supportDataMaster   ,
 supportDataExtension   ,
 bSupportExportImport   
);
CREATE TABLE BOS_GEN_YesNo(
bYesNo ,
 szName   BOS_DT_szSmallId
);
CREATE TABLE BOS_GL_AccBalance(
szLedgerId BOS_DT_szId,
 szAccId   BOS_DT_szId,
 szSegment_01   BOS_DT_szGLSegment,
 szSegment_02   BOS_DT_szGLSegment,
 szSegment_03   BOS_DT_szGLSegment,
 szSegment_04   BOS_DT_szGLSegment,
 szSegment_05   BOS_DT_szGLSegment,
 szSegment_06   BOS_DT_szGLSegment,
 szSegment_07   BOS_DT_szGLSegment,
 szSegment_08   BOS_DT_szGLSegment,
 szSegment_09   BOS_DT_szGLSegment,
 szSegment_10   BOS_DT_szGLSegment,
 szGLSubAccId   BOS_DT_szGLAccount,
 decDebit   BOS_DT_decAmount,
 decCredit   BOS_DT_decAmount,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_Account(
szAccountId BOS_DT_szId,
 szName   BOS_DT_szName,
 szAccountType   BOS_DT_szMediumId,
 szOnlyUsedForWorkplaceId   BOS_DT_szId,
 szOnlyUsedForUserId   BOS_DT_szId,
 szFullPathAccId   BOS_DT_szFullPath,
 byteLevel   BOS_DT_byteLevel,
 bGroup   BOS_DT_bBoolean,
 szDefaultBalance   BOS_DT_szOneChar,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_AccountingCalendar(
szAccCalendarId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szAccPeriodTypeId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_AccountingCalendarItem(
szAccCalendarId BOS_DT_szId,
 szAccPeriodNm   BOS_DT_szName,
 intAccPeriodNo   ,
 intAccYear   ,
 dtmStart   ,
 dtmEnd   ,
 bAdjustmentPeriod   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_AccPeriod(
szLedgerId BOS_DT_szId,
 szAccPeriodNm   BOS_DT_szId,
 szAccPeriodStatus   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_AccPeriodType(
szAccPeriodTypeId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 intPeriodCnt   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_AllocBatch(
szAllocBatchId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_AllocBatchItem(
szAllocBatchId BOS_DT_szId,
 shItemNumber   ,
 szAllocCodeId   BOS_DT_szId
);
CREATE TABLE BOS_GL_AllocCode(
szAllocCodeId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szJournalCategoryId   BOS_DT_szId,
 szAccId_CostPool   BOS_DT_szGLSegment,
 szGLSubAccId_CostPool   BOS_DT_szGLAccount,
 decCostPool   BOS_DT_decAmount,
 szAccId_UsageFactor   BOS_DT_szGLSegment,
 szGLSubAccId_UsageFactor   BOS_DT_szGLAccount,
 decUsageFactor   BOS_DT_decAmount,
 szAccId_TotalUsage   BOS_DT_szGLSegment,
 szGLSubAccId_TotalUsage   BOS_DT_szGLAccount,
 decTotalUsage   BOS_DT_decAmount,
 szAccId_Target   BOS_DT_szGLSegment,
 szGLSubAccId_Target   BOS_DT_szGLAccount,
 szAccId_Offset   BOS_DT_szGLSegment,
 szGLSubAccId_Offset   BOS_DT_szGLAccount,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_Company(
szCompanyId BOS_DT_szMediumId,
 szName   BOS_DT_szName,
 szTaxEntityId   BOS_DT_szId,
 szLedgerId   BOS_DT_szId,
 szTaxSerialNumber   BOS_DT_szTaxId,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 szPromoPriceId   BOS_DT_szId,
 szPromoPriceOrderId   BOS_DT_szId,
 szCcyRateId   BOS_DT_szMediumId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_FBatch(
szFBatchId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmPost   ,
 bPosted   BOS_DT_bBoolean,
 bResultFrTransfer   BOS_DT_bBoolean,
 bVoid   BOS_DT_bBoolean,
 bApplied   BOS_DT_bBoolean,
 btPrintedCount   ,
 bTransferred   BOS_DT_bBoolean,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   BOS_DT_bBoolean,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   BOS_DT_bBoolean,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szParamLedgerId   BOS_DT_szId,
 szParamPeriodId   BOS_DT_szId,
 szParamCompanyId   BOS_DT_szId,
 szParamWorkplaceId   BOS_DT_szId
);
CREATE TABLE BOS_GL_FJournalTrans(
szFJournalId BOS_DT_szId,
 dtmPost   ,
 szAccPeriodNm   BOS_DT_szName,
 szFBatchId   BOS_DT_szId,
 szLedgerId   BOS_DT_szId,
 szJournalCategoryId   BOS_DT_szId,
 szCcyRateId   BOS_DT_szMediumId,
 szCcyId   BOS_DT_szSmallId,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szUrl   BOS_DT_szUrl,
 decTotalAmount   BOS_DT_decAmount,
 decDocTotalAmount   BOS_DT_decAmount,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   BOS_DT_bBoolean,
 bVoid   BOS_DT_bBoolean,
 bPosted   BOS_DT_bBoolean,
 btPrintedCount   ,
 bTransferred   BOS_DT_bBoolean,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   BOS_DT_bBoolean,
 gdApprovedId   ,
 dtmCreated   ,
 bSystemCreated   BOS_DT_bBoolean,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 bClosingJournal   BOS_DT_bBoolean,
 szFBankSettlementId   BOS_DT_szId
);
CREATE TABLE BOS_GL_FJournalTransItem(
szFJournalId BOS_DT_szId,
 shItemNumber   ,
 szAccId   BOS_DT_szId,
 szSegment_01   BOS_DT_szGLSegment,
 szSegment_02   BOS_DT_szGLSegment,
 szSegment_03   BOS_DT_szGLSegment,
 szSegment_04   BOS_DT_szGLSegment,
 szSegment_05   BOS_DT_szGLSegment,
 szSegment_06   BOS_DT_szGLSegment,
 szSegment_07   BOS_DT_szGLSegment,
 szSegment_08   BOS_DT_szGLSegment,
 szSegment_09   BOS_DT_szGLSegment,
 szSegment_10   BOS_DT_szGLSegment,
 szGLSubAccId   BOS_DT_szGLAccount,
 decAmount   BOS_DT_decAmount,
 decDocAmount   BOS_DT_decAmount,
 szDescription   BOS_DT_szDescription,
 iSequentialIndexBankSettlement   ,
 dtmBankStatement   ,
 bHasReconcile   
);
CREATE TABLE BOS_GL_GLAcc(
szLedgerId BOS_DT_szId,
 szAccId   BOS_DT_szId,
 szGLSubAccId   BOS_DT_szGLAccount,
 bEnable   ,
 dtmValidStart   ,
 dtmValidEnd   ,
 szDescription   BOS_DT_szDescription,
 bStatAccount   ,
 decStatValue   ,
 szStatUomId   BOS_DT_szId,
 bDefaultSubAcc   BOS_DT_bBoolean,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_GLSubAcc(
szLedgerId BOS_DT_szId,
 szGLSubAccId   BOS_DT_szGLAccount,
 szDescription   BOS_DT_szBigDescription,
 szOnlyUsedForUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szOnlyUsedForGroupId   BOS_DT_szId
);
CREATE TABLE BOS_GL_JournalCategory(
szJournalCategoryId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bAllowManualJournal   ,
 szApprovalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_JournalConfig(
szUri BOS_DT_szUri,
 szLedgerId   BOS_DT_szId,
 bIncludeInPosting   ,
 szJournalCategoryId   BOS_DT_szId,
 gdAuditTrailId   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_GL_JournalConfigItem(
szUri BOS_DT_szUri,
 szLedgerId   BOS_DT_szId,
 szJournalType   BOS_DT_szBigDescription,
 szPostingBase1   BOS_DT_szId,
 szPostingBase2   BOS_DT_szId,
 szPostingBase3   BOS_DT_szId,
 szPostingBase4   BOS_DT_szId,
 szPostingBase5   BOS_DT_szId
);
CREATE TABLE BOS_GL_JournalConfigItemDetail(
szUri BOS_DT_szUri,
 szLedgerId   BOS_DT_szId,
 szJournalType   BOS_DT_szBigDescription,
 shItemNo   ,
 szPostingBaseValue1   BOS_DT_szId,
 szPostingBaseValue2   BOS_DT_szId,
 szPostingBaseValue3   BOS_DT_szId,
 szPostingBaseValue4   BOS_DT_szId,
 szPostingBaseValue5   BOS_DT_szId,
 szAccountNo   BOS_DT_szGLAccount,
 szSubAccountNo   BOS_DT_szGLAccount
);
CREATE TABLE BOS_GL_JournalMaster(
szUri BOS_DT_szUri,
 szDocumentTableName   BOS_DT_szName,
 szDocumentIdFieldName   BOS_DT_szName,
 szDocumentDateFieldName   BOS_DT_szName,
 dtmLastUpdated   
);
CREATE TABLE BOS_GL_JournalMasterItem(
szUri BOS_DT_szUri,
 szJournalType   BOS_DT_szBigDescription,
 bSupportCompany   ,
 bSupportWorkplace   ,
 bSupportSalesOrganization   ,
 bSupportProductCategory   ,
 bSupportCustomerCategory   ,
 bSupportProduct   ,
 bSupportOrderType   ,
 bSupportOrderItemType   ,
 bSupportSupplier   ,
 bSupportPurchaseType   ,
 bSupportPurchaseItemType   
);
CREATE TABLE BOS_GL_Ledger(
szLedgerId BOS_DT_szId,
 szName   BOS_DT_szName,
 szLedgerType   BOS_DT_szMediumId,
 szDescription   BOS_DT_szDescription,
 szCcyId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szAccCalendarId   BOS_DT_szId,
 szCOAId   BOS_DT_szId,
 szRetainedEarningAccId   BOS_DT_szId,
 szRetainedEarningGLSubAccId   BOS_DT_szGLAccount,
 szTranslationAdjustmentAccId   BOS_DT_szId,
 szTranslationAdjustmentGLSubAccId   BOS_DT_szGLAccount
);
CREATE TABLE BOS_GL_SubAccountSegmentMapping(
szFieldClass BOS_DT_szId,
 szFieldName   BOS_DT_szId,
 szPostingBase   BOS_DT_szId,
 gdAuditTrailId   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_GL_SubAccountSegmentMappingItem(
szFieldClass BOS_DT_szId,
 szFieldName   BOS_DT_szId,
 shItemNo   ,
 szFieldContentMapping   BOS_DT_szId,
 szPostingBaseValue   BOS_DT_szGLAccount
);
CREATE TABLE BOS_GL_TaxEntity(
szTaxId BOS_DT_szId,
 szName   BOS_DT_szName,
 szTaxNo   BOS_DT_szTaxId,
 szPKPNo   BOS_DT_szTaxId,
 dtmNPWPDate   ,
 TaxszContactPerson   BOS_DT_szName,
 TaxszRoomNo   BOS_DT_szSmallName,
 TaxszFloor   BOS_DT_szSmallName,
 TaxszBuilding   BOS_DT_szName,
 TaxszAddress_1   BOS_DT_szBigDescription,
 TaxszAddress_2   BOS_DT_szBigDescription,
 TaxszDistrict   BOS_DT_szName,
 TaxszCity   BOS_DT_szMediumName,
 TaxszZipCode   BOS_DT_szMediumId,
 TaxszState   BOS_DT_szMediumName,
 TaxszCountry   BOS_DT_szMediumName,
 TaxszPhoneNo_1   BOS_DT_szMediumName,
 TaxszPhoneNo_2   BOS_DT_szMediumName,
 TaxszFaxNo   BOS_DT_szMediumName,
 TaxszMobileNo   BOS_DT_szMediumName,
 TaxszEmail   BOS_DT_szMediumName,
 TaxszWebSite   BOS_DT_szMediumName,
 CPszContactPerson   BOS_DT_szName,
 CPszRoomNo   BOS_DT_szSmallName,
 CPszFloor   BOS_DT_szSmallName,
 CPszBuilding   BOS_DT_szName,
 CPszAddress_1   BOS_DT_szBigDescription,
 CPszAddress_2   BOS_DT_szBigDescription,
 CPszDistrict   BOS_DT_szName,
 CPszCity   BOS_DT_szMediumName,
 CPszZipCode   BOS_DT_szMediumId,
 CPszState   BOS_DT_szMediumName,
 CPszCountry   BOS_DT_szMediumName,
 CPszPhoneNo_1   BOS_DT_szMediumName,
 CPszPhoneNo_2   BOS_DT_szMediumName,
 CPszFaxNo   BOS_DT_szMediumName,
 CPszMobileNo   BOS_DT_szMediumName,
 CPszEmail   BOS_DT_szMediumName,
 CPszWebSite   BOS_DT_szMediumName,
 TOszContactPerson   BOS_DT_szName,
 TOszRoomNo   BOS_DT_szSmallName,
 TOszFloor   BOS_DT_szSmallName,
 TOszBuilding   BOS_DT_szName,
 TOszAddress_1   BOS_DT_szBigDescription,
 TOszAddress_2   BOS_DT_szBigDescription,
 TOszDistrict   BOS_DT_szName,
 TOszCity   BOS_DT_szMediumName,
 TOszZipCode   BOS_DT_szMediumId,
 TOszState   BOS_DT_szMediumName,
 TOszCountry   BOS_DT_szMediumName,
 TOszPhoneNo_1   BOS_DT_szMediumName,
 TOszPhoneNo_2   BOS_DT_szMediumName,
 TOszFaxNo   BOS_DT_szMediumName,
 TOszMobileNo   BOS_DT_szMediumName,
 TOszEmail   BOS_DT_szMediumName,
 TOszWebSite   BOS_DT_szMediumName,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_TaxType(
szTaxTypeId BOS_DT_szMediumId,
 szName   BOS_DT_szName,
 decRate   BOS_DT_decAmount,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_Workplace(
szWorkplaceId BOS_DT_szId,
 szWorkplaceTypeId   BOS_DT_szSmallId,
 szName   BOS_DT_szName,
 WpszContactPerson   BOS_DT_szName,
 WpszRoomNo   BOS_DT_szSmallName,
 WpszFloor   BOS_DT_szSmallName,
 WpszBuilding   BOS_DT_szName,
 WpszAddress_1   BOS_DT_szName,
 WpszAddress_2   BOS_DT_szName,
 WpszDistrict   BOS_DT_szName,
 WpszCity   BOS_DT_szMediumName,
 WpszZipCode   BOS_DT_szMediumId,
 WpszState   BOS_DT_szMediumName,
 WpszCountry   BOS_DT_szMediumName,
 WpszPhoneNo_1   BOS_DT_szMediumName,
 WpszPhoneNo_2   BOS_DT_szMediumName,
 WpszFaxNo   BOS_DT_szMediumName,
 WpszMobileNo   BOS_DT_szMediumName,
 WpszEmail   BOS_DT_szMediumName,
 WpszWebSite   BOS_DT_szMediumName,
 szCompanyId   BOS_DT_szMediumId,
 szTaxId   BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 szCalenderId   BOS_DT_szId,
 szChiefOfWorkplace   BOS_DT_szName,
 szPaymentBankId   BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 szPromoPriceId   BOS_DT_szId,
 szPromoPriceOrderId   BOS_DT_szId,
 szInvOrgId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 bActive   BOS_DT_bBoolean
);
CREATE TABLE BOS_GL_WorkplaceProduct(
szWorkplaceId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decMinQty   BOS_DT_decAmount,
 decMaxQty   BOS_DT_decAmount,
 szPurchOrgId   BOS_DT_szId,
 szDiscountGroupId   BOS_DT_szId
);
CREATE TABLE BOS_GL_WorkplaceProductCategory(
szWorkplaceId BOS_DT_szId,
 szCategory   BOS_DT_szId,
 szCategoryValue   BOS_DT_szId
);
CREATE TABLE BOS_INV_Carrier(
szCarrierId BOS_DT_szId,
 szName   BOS_DT_szName,
 szContactPerson   BOS_DT_szName,
 szRoomNo   BOS_DT_szSmallName,
 szFloor   BOS_DT_szSmallName,
 szBuilding   BOS_DT_szName,
 szAddress_1   BOS_DT_szName,
 szAddress_2   BOS_DT_szName,
 szDistrict   BOS_DT_szName,
 szCity   BOS_DT_szMediumName,
 szZipCode   BOS_DT_szMediumId,
 szState   BOS_DT_szMediumName,
 szCountry   BOS_DT_szMediumName,
 szPhoneNo_1   BOS_DT_szMediumName,
 szPhoneNo_2   BOS_DT_szMediumName,
 szFaxNo   BOS_DT_szMediumName,
 szMobileNo   BOS_DT_szMediumName,
 szEmail   BOS_DT_szMediumName,
 szWebSite   BOS_DT_szMediumName,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_CompUom(
szUomClassId BOS_DT_szMediumId,
 szCompUomId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szSeparator   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_CompUomItem(
szUomClassId BOS_DT_szMediumId,
 szCompUomId   BOS_DT_szId,
 shItemNumber   ,
 szUomId   BOS_DT_szMediumId
);
CREATE TABLE BOS_INV_ConditionType(
szConditionTypeId BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_INV_CustExpirationDateMapping(
szCustId BOS_DT_szId,
 szProductCategory   BOS_DT_szId,
 intMaxExpDay   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_CustomerCategoryInfo(
szCategoryId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szInfoProduct   BOS_DT_szVeryBigMessage,
 szWorkplaceId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FAdjustment(
szFAdjustmentId BOS_DT_szId,
 dtmAdjustment   ,
 szReffTrnType   BOS_DT_szMediumId,
 szReffTrnId   BOS_DT_szId,
 szReffTrnNewId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_INV_FAdjustmentItem(
szFAdjustmentId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FAdjustmentItemLot(
szFAdjustmentId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FAdjustmentItemSn(
szFAdjustmentId BOS_DT_szId,
 shItemNumber   ,
 shItem2Number   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FChgLotStatus(
szFChgStatusLotId BOS_DT_szId,
 dtmFChgStatusLotId   ,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_INV_FchgLotStatusItem(
szFChgStatusLotId BOS_DT_szId,
 szLotId   BOS_DT_szId,
 szCurrentStatus   BOS_DT_szId,
 szNewStatus   BOS_DT_szId,
 szProductId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FDn(
szFDnId BOS_DT_szId,
 dtmDelivery   ,
 szFDoId   BOS_DT_szId,
 szDestinationType   BOS_DT_szSmallId,
 szDestinationId   BOS_DT_szId,
 DlvszContactPerson   BOS_DT_szName,
 DlvszRoomNo   BOS_DT_szSmallName,
 DlvszFloor   BOS_DT_szSmallName,
 DlvszBuilding   BOS_DT_szName,
 DlvszAddress_1   BOS_DT_szBigDescription,
 DlvszAddress_2   BOS_DT_szBigDescription,
 DlvszDistrict   BOS_DT_szName,
 DlvszCity   BOS_DT_szMediumName,
 DlvszZipCode   BOS_DT_szMediumId,
 DlvszState   BOS_DT_szMediumName,
 DlvszCountry   BOS_DT_szMediumName,
 DlvszPhoneNo_1   BOS_DT_szMediumName,
 DlvszPhoneNo_2   BOS_DT_szMediumName,
 DlvszFaxNo   BOS_DT_szMediumName,
 DlvszMobileNo   BOS_DT_szMediumName,
 DlvszEmail   BOS_DT_szMediumName,
 DlvszWebSite   BOS_DT_szMediumName,
 szCarrierId   BOS_DT_szId,
 szVehicleNumber   BOS_DT_szMediumId,
 szDriverName   BOS_DT_szName,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szCustPoId   BOS_DT_szId,
 dtmCustPo   ,
 szDriverId   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szFStInId   BOS_DT_szId,
 bFromDistribution   ,
 szFAdjustmentId   BOS_DT_szId,
 szAdjustedById   BOS_DT_szId,
 szAdjustToId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkPlaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_INV_FDn2FDnCreated(
szFDn2Id BOS_DT_szId,
 szWpId   BOS_DT_szId,
 szFDnId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FDn2ItemDeliverToLotQty(
szFDn2Id BOS_DT_szId,
 shItemNumber   ,
 shItemNumber_DeliverTo   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FDnItem(
szFDnId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decQty,
 decUomQty   BOS_DT_decQty,
 szUomId   BOS_DT_szMediumId,
 decCOGS   BOS_DT_decAmount,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FDnItemLotQty(
szFDnId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FDnItemSn(
szFDnId BOS_DT_szId,
 shItemNumber   ,
 shItem2Number   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FKitMaintenance(
szFKitMaintenanceId BOS_DT_szId,
 dtmDate   ,
 szSalesOrgId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szProductId   BOS_DT_szId,
 szToProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szId,
 bExplode   BOS_DT_bBoolean,
 bResultFrTransfer   ,
 bVoid   ,
 bApproved   ,
 bApplied   ,
 bJournal   ,
 bPosted   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szApprovalId   BOS_DT_szId,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_INV_FKitMaintenanceItem(
szFKitMaintenanceId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szId,
 szToProductId   BOS_DT_szId,
 decToQty   BOS_DT_decAmount,
 decToUomQty   BOS_DT_decAmount,
 szToUomId   BOS_DT_szId,
 decCOGS   BOS_DT_decAmount,
 decToCOGS   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FSid(
szFSidId BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 dtmIn   ,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szFAdjustmentId   BOS_DT_szId,
 szAdjustedById   BOS_DT_szId,
 szAdjustToId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szHelperId   BOS_DT_szId,
 szHelperId_2   BOS_DT_szId,
 szHelperId_3   BOS_DT_szId,
 szNoBKB   BOS_DT_szId,
 decRitKe   BOS_DT_decDecimal
);
CREATE TABLE BOS_INV_FSidItem(
szFSidId BOS_DT_szId,
 btItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FSidItemLotQty(
szFSidId BOS_DT_szId,
 btItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FSidItemSn(
szFSidId BOS_DT_szId,
 btItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FSod(
szFSodId BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 dtmOut   ,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szFAdjustmentId   BOS_DT_szId,
 szAdjustedById   BOS_DT_szId,
 szAdjustToId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szHelperId   BOS_DT_szId,
 szHelperId_2   BOS_DT_szId,
 szHelperId_3   BOS_DT_szId
);
CREATE TABLE BOS_INV_FSodItem(
szFSodId BOS_DT_szId,
 btItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FSodItemLotQty(
szFSodId BOS_DT_szId,
 btItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FSodItemSn(
szFSodId BOS_DT_szId,
 btItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FSrc(
szFSrcId BOS_DT_szId,
 dtmReceipt   ,
 szPoId   BOS_DT_szId,
 szSupplierId   BOS_DT_szId,
 szWarehouseId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szRefDn   BOS_DT_szId,
 szCarrierId   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szVehicleNumber   BOS_DT_szId,
 szDriverNm   BOS_DT_szName,
 szFAdjustmentId   BOS_DT_szId,
 szAdjustedById   BOS_DT_szId,
 szAdjustToId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szDescription   BOS_DT_szDescription,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 szCcyId   BOS_DT_szSmallId
);
CREATE TABLE BOS_INV_FSrcItem(
szFSrcId BOS_DT_szId,
 shItemNumber   ,
 szRefProductId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 decPrice   BOS_DT_decAmount,
 bTaxable   BOS_DT_bBoolean,
 szParentId   BOS_DT_szId,
 szDistProductId   BOS_DT_szId,
 decDistQty   BOS_DT_decAmount,
 decDistPrice   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FSrcItemLotInfo(
szFSrcId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLotTypeId   BOS_DT_szId,
 szProductionCode   BOS_DT_szId,
 decLotStrength   BOS_DT_decAmount,
 dtmExpired   ,
 szLotStatus   BOS_DT_szSmallId
);
CREATE TABLE BOS_INV_FSrcItemLotQty(
szFSrcId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FSrcItemSn(
szFSrcId BOS_DT_szId,
 shItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FSrt(
szFSrtId BOS_DT_szId,
 dtmReturn   ,
 szStRetType   BOS_DT_szSmallId,
 szPoId   BOS_DT_szId,
 szSupplierId   BOS_DT_szId,
 szWarehouseId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szRefDn   BOS_DT_szId,
 szCarrierId   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szVehicleNo   BOS_DT_szMediumId,
 szDriverNm   BOS_DT_szName,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szFAdjustmentId   BOS_DT_szId,
 szAdjustedById   BOS_DT_szId,
 szAdjustToId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szDescription   BOS_DT_szDescription,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FSrtItem(
szFSrtId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szDistProductId   BOS_DT_szId,
 decDistQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FSrtItemLotQty(
szFSrtId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FSrtItemSn(
szFSrtId BOS_DT_szId,
 shItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FStCor(
szFStCorId BOS_DT_szId,
 dtmCorrection   ,
 szWarehouseId   BOS_DT_szId,
 szReason   BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_INV_FStCorItem(
szFStCorId BOS_DT_szId,
 btItemNumber   ,
 szProductId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 decStockQty   BOS_DT_decAmount,
 decActualQty   BOS_DT_decAmount,
 decUomStockQty   BOS_DT_decAmount,
 decUomActualQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 decCOGS   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FStCorItemLotInfo(
szFStCorId BOS_DT_szId,
 btItemNumber   ,
 szLotId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLotTypeId   BOS_DT_szId,
 szProductionCode   BOS_DT_szId,
 decLotStrength   BOS_DT_decAmount,
 dtmExpired   ,
 szLotStatus   BOS_DT_szSmallId
);
CREATE TABLE BOS_INV_FStCorItemLotQty(
szFStCorId BOS_DT_szId,
 btItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FStCorItemSn(
szFStCorId BOS_DT_szId,
 btItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FStIn(
szFStInId BOS_DT_szId,
 dtmTransfer   ,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szCarrierId   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szDriverNm   BOS_DT_szName,
 szPoliceNo   BOS_DT_szSmallName,
 szRefDoc   BOS_DT_szId,
 szFDnFileName   BOS_DT_szFullPath,
 szFDnId   BOS_DT_szId,
 szSenderWorkplaceId   BOS_DT_szId,
 szFAdjustmentId   BOS_DT_szId,
 szAdjustedById   BOS_DT_szId,
 szAdjustToId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szFDn2Id   BOS_DT_szId
);
CREATE TABLE BOS_INV_FStInItem(
szFStInId BOS_DT_szId,
 btItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 decCOGS   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FStInItemLotInfo(
szFStInId BOS_DT_szId,
 btItemNumber   ,
 szLotId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLotTypeId   BOS_DT_szId,
 szProductionCode   BOS_DT_szId,
 decLotStrength   BOS_DT_decAmount,
 dtmExpired   ,
 szLotStatus   BOS_DT_szSmallId
);
CREATE TABLE BOS_INV_FStInItemLotQty(
szFStInId BOS_DT_szId,
 btItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FStInItemSn(
szFStInId BOS_DT_szId,
 btItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FStIntern(
szFStInternId BOS_DT_szId,
 dtmTransfer   ,
 szRefDocType   BOS_DT_szMediumId,
 szRefDocId   BOS_DT_szId,
 szEmployeeId   BOS_DT_szId,
 szFrWhId   BOS_DT_szId,
 szFrStockTypeId   BOS_DT_szId,
 szToWhId   BOS_DT_szId,
 szToStockTypeId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szDescription   BOS_DT_szDescription,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 bTransportationDetail   BOS_DT_bBoolean,
 szExpedition   BOS_DT_szName,
 szDriverName   BOS_DT_szName,
 szVehicleNumber   BOS_DT_szId,
 szDriver   BOS_DT_szId,
 szVehicle   BOS_DT_szId
);
CREATE TABLE BOS_INV_FStInternItem(
szFStInternId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FStInternItemLotQty(
szFStInternId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FStInternItemReason(
szFStInternId BOS_DT_szId,
 shItemNumber   ,
 szReasonId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FStInternItemSn(
szFStInternId BOS_DT_szId,
 shItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FStMorph(
szFStMorphId BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 dtmMorph   ,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szDescription   BOS_DT_szDescription,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FStMorphItem(
szFStMorphId BOS_DT_szId,
 btItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 bIsSnExist   ,
 szToProductId   BOS_DT_szId,
 szToUomId   BOS_DT_szMediumId
);
CREATE TABLE BOS_INV_FStMorphItemLotInfo(
szFStMorphId BOS_DT_szId,
 btItemNumber   ,
 szLotId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLotTypeId   BOS_DT_szId,
 szProductionCode   BOS_DT_szId,
 decLotStrength   BOS_DT_decAmount,
 dtmExpired   ,
 szLotStatus   BOS_DT_szSmallId
);
CREATE TABLE BOS_INV_FStMorphItemLotQty(
szFStMorphId BOS_DT_szId,
 btItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FStMorphItemSn(
szFStMorphId BOS_DT_szId,
 btItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FStMovingStock(
szFStMovingStockId BOS_DT_szId,
 dtmTransfer   ,
 szDirection   BOS_DT_szSmallId,
 szPartyWpId   BOS_DT_szId,
 szFrVehicleId   BOS_DT_szId,
 szFrDriverId   BOS_DT_szId,
 szToVehicleId   BOS_DT_szId,
 szToDriverId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_INV_FStMovingStockItem(
szFStMovingStockId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 bIsSnExist   
);
CREATE TABLE BOS_INV_FStMovingStockItemLotQty(
szFStMovingStockId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FStMovingStockItemSn(
szFStMovingStockId BOS_DT_szId,
 shItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FStockTransfer(
szFStockTransferId BOS_DT_szId,
 szStockTransferType   BOS_DT_szId,
 dtmStockTransferDate   ,
 szRefDoc   BOS_DT_szBigId,
 szDesc   BOS_DT_szDescription,
 szReceiveDoc   BOS_DT_szId,
 szLocationTypeOrigin   BOS_DT_szId,
 szLocationIdOrigin   BOS_DT_szId,
 szWarehouseIdOrigin   BOS_DT_szId,
 szStockTypeIdOrigin   BOS_DT_szId,
 szLocationTypeDestination   BOS_DT_szId,
 szLocationIdDestination   BOS_DT_szId,
 szWarehouseIdDestination   BOS_DT_szId,
 szStockTypeIdDestination   BOS_DT_szId,
 szPOId   BOS_DT_szId,
 szExpedition   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szVehicleNumber   BOS_DT_szSmallName,
 szDriverId   BOS_DT_szId,
 szDriverName   BOS_DT_szName,
 szDeliveryNote   BOS_DT_szId,
 dtmArriveDepartTime   ,
 dtmLoadUnloadStartTime   ,
 dtmLoadUnloadEndTime   ,
 szSalesOrgId   BOS_DT_szId,
 szAdjustToId   BOS_DT_szId,
 szAdjustedById   BOS_DT_szId,
 szAdjustmentId   BOS_DT_szId,
 szAdjustmentTrnId   BOS_DT_szId,
 szRuleTransferType   BOS_DT_szId,
 iStockTransferStatus   ,
 bApplied   ,
 bApproved   ,
 bJournal   ,
 bNeedApproval   ,
 bPosted   ,
 bRejected   ,
 bResultFrTransfer   ,
 bSystemCreated   ,
 btPrintedCount   ,
 bTransferred   ,
 bVoid   ,
 dtmCreated   ,
 gdApprovedId   ,
 szApprovalId   BOS_DT_szId,
 szCompanyId   BOS_DT_szId,
 szCompanyNm   BOS_DT_szName,
 szFJournalId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 szUserId   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szWorkplaceNm   BOS_DT_szName,
 bAlreadyTransferred   ,
 dtmLastUpdated   ,
 bImportRef   
);
CREATE TABLE BOS_INV_FStockTransferItem(
szFStockTransferId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQtyDeliver   BOS_DT_decQty,
 decQtyReceive   BOS_DT_decQty,
 decUomQtyDeliver   BOS_DT_decQty,
 decUomQtyReceive   BOS_DT_decQty,
 szUomId   BOS_DT_szBigId,
 decCOGSDeliver   BOS_DT_decAmount,
 decCOGSReceive   BOS_DT_decAmount,
 szParentId   BOS_DT_szId,
 shDocLineNumber   BOS_DT_szId,
 shRefPOLineNumber   BOS_DT_szId
);
CREATE TABLE BOS_INV_FStockTransferItemCorrection(
szFStockTransferId BOS_DT_szId,
 shItemNumber   ,
 szReasonId   BOS_DT_szId,
 decQty   BOS_DT_decQty
);
CREATE TABLE BOS_INV_FStockTransferItemLotInfo(
szFStockTransferId BOS_DT_szId,
 btItemNumber   ,
 szLotId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLotTypeId   BOS_DT_szId,
 szProductionCode   BOS_DT_szId,
 decLotStrength   BOS_DT_decAmount,
 dtmExpired   ,
 szLotStatus   BOS_DT_szSmallId
);
CREATE TABLE BOS_INV_FStockTransferItemLotQty(
szFStockTransferId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FStockTransferItemLotSn(
szFStockTransferId BOS_DT_szId,
 shItemNumber   ,
 shItem2Number   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FStockTransferItemReason(
szFStockTransferId BOS_DT_szId,
 shItemNumber   ,
 szReasonId   BOS_DT_szId,
 decQty   BOS_DT_decQty
);
CREATE TABLE BOS_INV_FStOpname(
szFStOpnameId BOS_DT_szId,
 szWarehouseId   BOS_DT_szId,
 szProdCategoryId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FStOpnameItem(
szFStOpnameId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decQtyStInSystem   BOS_DT_decDecimal,
 decQtyStInPhisic   BOS_DT_decDecimal,
 decQtyStDiff   BOS_DT_decDecimal
);
CREATE TABLE BOS_INV_FStReject(
szFStRejectId BOS_DT_szId,
 dtmDocument   ,
 szRefDocType   BOS_DT_szMediumId,
 szRefDoc   BOS_DT_szId,
 szWhId   BOS_DT_szId,
 szDepartmentId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szEmployeeId   BOS_DT_szId,
 szQcDocId   BOS_DT_szId,
 dtmQcDoc   ,
 szDescription   BOS_DT_szDescription,
 szFAdjustmentId   BOS_DT_szId,
 szAdjustedById   BOS_DT_szId,
 szAdjustToId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FStRejectItem(
szFStRejectId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szConditionTypeId   BOS_DT_szSmallId,
 szSuggestionTypeId   BOS_DT_szSmallId,
 szProductIdTobeSold   BOS_DT_szId,
 szStockTypeIdToBeSold   BOS_DT_szId,
 decQtyToBeSold   BOS_DT_decAmount,
 decUomQtyToBeSold   BOS_DT_decAmount,
 decCOGS   BOS_DT_decAmount,
 decNewProductCOGS   BOS_DT_decAmount,
 szUomIdToBeSold   BOS_DT_szMediumId,
 szReasonId   BOS_DT_szId,
 szParentId   BOS_DT_szId,
 szParentIdToBeSold   BOS_DT_szId
);
CREATE TABLE BOS_INV_FStRejectItemLotQty(
szFStRejectId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FStRejectItemSn(
szFStRejectId BOS_DT_szId,
 shItemNumber   ,
 shItem2Number   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FVRema(
szFVRemaId BOS_DT_szId,
 dtmRemain   ,
 szVehicleId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szFAdjustmentId   BOS_DT_szId,
 szAdjustedById   BOS_DT_szId,
 szAdjustToId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FVRemaItem(
szFVRemaId BOS_DT_szId,
 btItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_INV_FVRemaItemLotQty(
szFVRemaId BOS_DT_szId,
 btItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_FVRemaItemSn(
szFVRemaId BOS_DT_szId,
 btItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_INV_FWhClosing(
szFWhClosingId BOS_DT_szId,
 dtmClosing   ,
 szWareHouseId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szDescription   BOS_DT_szDescription,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_INV_InvOrg(
szInvOrgId BOS_DT_szId,
 szCostingMethod   BOS_DT_szSmallId,
 bDisableLotTracking   BOS_DT_bBoolean,
 bDisableSnTracking   BOS_DT_bBoolean,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_KitConversion(
szFromKitProductId BOS_DT_szId,
 szToKitProductId   BOS_DT_szId,
 decQty   ,
 bJoin   BOS_DT_bBoolean,
 bBreak   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_KitConversionItem(
szFromKitProductId BOS_DT_szId,
 szChildFromKitProductId   BOS_DT_szId,
 decQtyChildFromKitProductId   ,
 szToKitProductId   BOS_DT_szId,
 szChildToKitProductId   BOS_DT_szId,
 decQtyChildToKitProductId   ,
 shItemNumber   
);
CREATE TABLE BOS_INV_LotInfo(
szLotId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLotTypeId   BOS_DT_szId,
 szProductionCode   BOS_DT_szId,
 decLotStrength   BOS_DT_decAmount,
 dtmExpired   ,
 szLotStatus   BOS_DT_szSmallId,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_LotStatus(
szLotStatusId BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription,
 bAvailableForSales   BOS_DT_bBoolean,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_OrderItemType(
szOrderItemTypeId BOS_DT_szId,
 bTaxable   ,
 bSubjectToInvoice   ,
 szTrnType   BOS_DT_szSmallId,
 szRentChargeCalcId   BOS_DT_szId,
 szPaymentTermId   BOS_DT_szId,
 bApplicable4AllProduct   ,
 bApplicable4AllDistrChannel   ,
 bApplicable4AllSalesOrg   ,
 bApplicable4AllWorkplace   ,
 bApplicable4AllCust   ,
 gdAuditTrailId   ,
 szInvoiceGroupId   BOS_DT_szId,
 szReturnOrderItemTypeId   BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szPromoPriceId   BOS_DT_szId,
 bMustFillTrnReason   BOS_DT_bBoolean,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 bAllowZeroPrice   BOS_DT_bBoolean,
 bAllowNegativeQty   BOS_DT_bBoolean,
 bAllowPositiveQty   BOS_DT_bBoolean,
 bAllowEmptyTrnReason   BOS_DT_bBoolean,
 bAllowDifferentSignInQty   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_OrderItemTypeCust(
szOrderItemTypeId BOS_DT_szId,
 szCustId   BOS_DT_szId
);
CREATE TABLE BOS_INV_OrderItemTypeDistrChannel(
szOrderItemTypeId BOS_DT_szId,
 btItemNumber   ,
 szDistrChannelId   BOS_DT_szSmallId
);
CREATE TABLE BOS_INV_OrderItemTypeProduct(
szOrderItemTypeId BOS_DT_szId,
 szProductId   BOS_DT_szId
);
CREATE TABLE BOS_INV_OrderItemTypeSalesOrg(
szOrderItemTypeId BOS_DT_szId,
 btItemNumber   ,
 szSalesOrgId   BOS_DT_szId
);
CREATE TABLE BOS_INV_OrderItemTypeWorkplace(
szOrderItemTypeId BOS_DT_szId,
 btItemNumber   ,
 szWorkplaceId   BOS_DT_szId
);
CREATE TABLE BOS_INV_OrderType(
szOrderTypeId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bAllowManualPrice   ,
 bAllowToChangeLinePriceDate   BOS_DT_bBoolean,
 szApprovalId   BOS_DT_szId,
 szFlexiKeyId   BOS_DT_szId,
 bApplicable4AllOrderItemType   ,
 bApplicable4AllProduct   ,
 bApplicable4AllDistrChannel   ,
 bApplicable4AllSalesOrg   ,
 bApplicable4AllWorkplace   ,
 bApplicable4AllCust   ,
 szReturnOrderTypeId   BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 szPromoPriceId   BOS_DT_szId,
 szPromoPriceOrderId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_OrderTypeCust(
szOrderTypeId BOS_DT_szId,
 szCustId   BOS_DT_szId
);
CREATE TABLE BOS_INV_OrderTypeDistrChannel(
szOrderTypeId BOS_DT_szId,
 btItemNumber   ,
 szDistrChannelId   BOS_DT_szSmallId
);
CREATE TABLE BOS_INV_OrderTypeOrderItemType(
szOrderTypeId BOS_DT_szId,
 btItemNumber   ,
 szOrderItemTypeId   BOS_DT_szId
);
CREATE TABLE BOS_INV_OrderTypeProduct(
szOrderTypeId BOS_DT_szId,
 szProductId   BOS_DT_szId
);
CREATE TABLE BOS_INV_OrderTypeSalesOrg(
szOrderTypeId BOS_DT_szId,
 btItemNumber   ,
 szSalesOrgId   BOS_DT_szId
);
CREATE TABLE BOS_INV_OrderTypeWorkplace(
szOrderTypeId BOS_DT_szId,
 btItemNumber   ,
 szWorkplaceId   BOS_DT_szId
);
CREATE TABLE BOS_INV_Price(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceId   BOS_DT_szId,
 gdHistory   ,
 szUsageType   BOS_DT_szSmallId,
 szStatus   BOS_DT_szSmallId,
 szWorkplaceId   BOS_DT_szId,
 szSalesOrgId_1   BOS_DT_szId,
 szSalesOrgId_2   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmValidStart   ,
 bIsSpecificEndDate   ,
 dtmValidEnd   ,
 szNextOwnerTrnId   BOS_DT_szMediumId,
 szNextPriceId   BOS_DT_szId,
 szProductCat_1   BOS_DT_szId,
 szProductCat_2   BOS_DT_szId,
 szProductCat_3   BOS_DT_szId,
 szPriceCombCd   BOS_DT_szMediumId,
 shPriceCombOrder   ,
 szQualifierId   BOS_DT_szBigId,
 szQualifierId_2   BOS_DT_szBigId,
 szQualifierId_3   BOS_DT_szBigId,
 szDiscGroupId   BOS_DT_szId,
 szDiscGroupId_2   BOS_DT_szId,
 szDiscGroupId_3   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_INV_PriceItem(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceId   BOS_DT_szId,
 gdHistory   ,
 szProductId   BOS_DT_szId,
 szCcyId   BOS_DT_szSmallId,
 szUomId   BOS_DT_szMediumId,
 bBaseOnAmount   BOS_DT_bBoolean,
 bUnitBaseOnAmount   BOS_DT_bBoolean,
 bUseForPriceCalculation   BOS_DT_bBoolean,
 bUsePriceWTax   BOS_DT_bBoolean,
 bHasDiscountBonus   BOS_DT_bBoolean,
 bHasProductBonus   BOS_DT_bBoolean,
 dtmItemValidStart   ,
 bIsSpecificEndDate   BOS_DT_bBoolean,
 dtmItemValidEnd   ,
 bProgressive   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_PriceItemDiscBonus(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceId   BOS_DT_szId,
 gdHistory   ,
 szProductId   BOS_DT_szId,
 decMinQty   BOS_DT_decQty,
 decUnitQty   BOS_DT_decQty,
 decBonusDisc   BOS_DT_decPrice,
 szDiscType   BOS_DT_szSmallId,
 szOrderItemType   BOS_DT_szId,
 bSeparateDiscItem   ,
 bCalcFrPrevDiscAmt   ,
 szPrincipalDiscRefId   BOS_DT_szId,
 dtmItemValidStart   ,
 decInitialQty   BOS_DT_decQty
);
CREATE TABLE BOS_INV_PriceItemPricing(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceId   BOS_DT_szId,
 gdHistory   ,
 szProductId   BOS_DT_szId,
 decMinQty   BOS_DT_decAmount,
 decPrice   BOS_DT_decPrice,
 dtmItemValidStart   
);
CREATE TABLE BOS_INV_PriceItemProductBonus(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceId   BOS_DT_szId,
 gdHistory   ,
 szProductId   BOS_DT_szId,
 decMinQty   BOS_DT_decQty,
 decUnitQty   BOS_DT_decQty,
 dtmItemValidStart   
);
CREATE TABLE BOS_INV_PriceItemProductBonusItem(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceId   BOS_DT_szId,
 gdHistory   ,
 szProductId   BOS_DT_szId,
 decMinQty   BOS_DT_decQty,
 szBonusProductId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 decBonusQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szBonusType   BOS_DT_szSmallId,
 szPrincipalDiscRefId   BOS_DT_szId,
 dtmItemValidStart   
);
CREATE TABLE BOS_INV_PriceOrder(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 szUsageType   BOS_DT_szSmallId,
 szStatus   BOS_DT_szSmallId,
 szWorkplaceId   BOS_DT_szId,
 szSalesOrgId_1   BOS_DT_szId,
 szSalesOrgId_2   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bIsSpecificEndDate   BOS_DT_bBoolean,
 dtmValidStart   ,
 dtmValidEnd   ,
 szCcyId   BOS_DT_szSmallId,
 bHasCombinationBonus   BOS_DT_bBoolean,
 bOnlyCalculateFrCombination   BOS_DT_bBoolean,
 bHasAmountDiscBonus   BOS_DT_bBoolean,
 bHasAmountProductBonus   BOS_DT_bBoolean,
 bMinDiscBaseOnAmount   BOS_DT_bBoolean,
 bUnitDiscBaseOnAmount   BOS_DT_bBoolean,
 bMinBonusBaseOnAmount   BOS_DT_bBoolean,
 bUnitBonusBaseOnAmount   BOS_DT_bBoolean,
 szUomId   BOS_DT_szMediumId,
 szNextOwnerTrnId   BOS_DT_szMediumId,
 szNextPriceOrderId   BOS_DT_szId,
 szPriceCombCd   BOS_DT_szMediumId,
 shPriceCombOrder   ,
 szQualifierId   BOS_DT_szBigId,
 szQualifierId_2   BOS_DT_szBigId,
 szQualifierId_3   BOS_DT_szBigId,
 szDiscGroupId   BOS_DT_szId,
 szDiscGroupId_2   BOS_DT_szId,
 szDiscGroupId_3   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 bHasProvisionBonus   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_PriceOrderAmountDiscBonus(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 decMinAmount   BOS_DT_decAmount,
 decUnitAmount   BOS_DT_decAmount,
 decBonusDisc   BOS_DT_decPrice,
 szDiscType   BOS_DT_szSmallId,
 szOrderItemTypeId   BOS_DT_szId,
 bCalcFrPrevDiscAmt   ,
 szPrincipalDiscRefId   BOS_DT_szId
);
CREATE TABLE BOS_INV_PriceOrderAmountProductBonus(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 decMinAmount   BOS_DT_decAmount,
 decUnitAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_PriceOrderAmountProductBonusItem(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 decMinAmount   BOS_DT_decAmount,
 szBonusProductId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 decBonusQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szBonusType   BOS_DT_szSmallId,
 szPrincipalDiscRefId   BOS_DT_szId
);
CREATE TABLE BOS_INV_PriceOrderItem(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 szProductId_1   BOS_DT_szId,
 szProductId_2   BOS_DT_szId,
 szProductId_3   BOS_DT_szId,
 szProductId_4   BOS_DT_szId,
 szProductId_5   BOS_DT_szId,
 decQty_1   BOS_DT_decAmount,
 decQty_2   BOS_DT_decAmount,
 decQty_3   BOS_DT_decAmount,
 decQty_4   BOS_DT_decAmount,
 decQty_5   BOS_DT_decAmount,
 szUomId_1   BOS_DT_szMediumId,
 szUomId_2   BOS_DT_szMediumId,
 szUomId_3   BOS_DT_szMediumId,
 szUomId_4   BOS_DT_szMediumId,
 szUomId_5   BOS_DT_szMediumId,
 bHasDiscountBonus   ,
 bHasProductBonus   
);
CREATE TABLE BOS_INV_PriceOrderItemDiscBonus(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 szProductId_1   BOS_DT_szId,
 szProductId_2   BOS_DT_szId,
 szProductId_3   BOS_DT_szId,
 szProductId_4   BOS_DT_szId,
 szProductId_5   BOS_DT_szId,
 decMinQty   BOS_DT_decQty,
 decUnitQty   BOS_DT_decQty,
 decBonusDisc   BOS_DT_decPrice,
 szDiscType   BOS_DT_szSmallId,
 szOrderItemTypeId   BOS_DT_szId,
 bCalcFrPrevDiscAmt   ,
 szPrincipalDiscRefId   BOS_DT_szId
);
CREATE TABLE BOS_INV_PriceOrderItemProductBonus(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 szProductId_1   BOS_DT_szId,
 szProductId_2   BOS_DT_szId,
 szProductId_3   BOS_DT_szId,
 szProductId_4   BOS_DT_szId,
 szProductId_5   BOS_DT_szId,
 decMinQty   BOS_DT_decQty,
 decUnitQty   BOS_DT_decQty
);
CREATE TABLE BOS_INV_PriceOrderItemProductBonusItem(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 szProductId_1   BOS_DT_szId,
 szProductId_2   BOS_DT_szId,
 szProductId_3   BOS_DT_szId,
 szProductId_4   BOS_DT_szId,
 szProductId_5   BOS_DT_szId,
 decMinQty   BOS_DT_decQty,
 szBonusProductId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 decBonusQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szBonusType   BOS_DT_szSmallId,
 szPrincipalDiscRefId   BOS_DT_szId
);
CREATE TABLE BOS_INV_PriceOrderProvision(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 shProvisionId   ,
 shMinProductOrder   ,
 bBaseOnAmount   ,
 bHasDiscountBonus   ,
 bHasProductBonus   ,
 bHasMinOrderOnAmount   ,
 szUomId   BOS_DT_szId
);
CREATE TABLE BOS_INV_PriceOrderProvisionItem(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 shProvisionId   ,
 shProvisionItemId   ,
 szProductId   BOS_DT_szId,
 decMinOrder   ,
 szUomId   BOS_DT_szId,
 bMustOrder   
);
CREATE TABLE BOS_INV_PriceOrderProvisionItemDiscount(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 shProvisionId   ,
 shProvisionItemId   ,
 decMinQty   ,
 decUnitQty   ,
 szDiscType   BOS_DT_szId,
 decBonusDisc   ,
 szOrderItemTypeId   BOS_DT_szId,
 bCalcFrPrevDiscAmt   ,
 szPrincipalDiscRefId   BOS_DT_szId,
 szProductId   BOS_DT_szId
);
CREATE TABLE BOS_INV_PriceOrderProvisionItemProductBonus(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 shProvisionId   ,
 shProvisionItemId   ,
 decMinQty   ,
 decUnitQty   
);
CREATE TABLE BOS_INV_PriceOrderProvisionItemProductBonusItem(
szOwnerTrnId BOS_DT_szMediumId,
 szPriceOrderId   BOS_DT_szId,
 gdHistory   ,
 shProvisionId   ,
 shProvisionItemId   ,
 shProvisionProductBonusItemId   ,
 szBonusProductId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 decBonusQty   ,
 szUomId   BOS_DT_szId,
 szBonusType   BOS_DT_szId,
 szPrincipalDiscRefId   BOS_DT_szId
);
CREATE TABLE BOS_INV_Product(
szProductId BOS_DT_szId,
 szName   BOS_DT_szName,
 szNickName   BOS_DT_szName,
 bService   ,
 szTrackingType   BOS_DT_szSmallId,
 szUomClassId   BOS_DT_szMediumId,
 szUomId   BOS_DT_szMediumId,
 bKit   ,
 bExplodeKit   ,
 bBreakNonExplodeKit   BOS_DT_bBoolean,
 szCategory_1   BOS_DT_szId,
 szCategory_2   BOS_DT_szId,
 szCategory_3   BOS_DT_szId,
 szCategory_4   BOS_DT_szId,
 szCategory_5   BOS_DT_szId,
 szQtyFormat   BOS_DT_szQtyFormat,
 szOrderItemTypeId   BOS_DT_szId,
 szArClassId   BOS_DT_szId,
 szTaxTypeId   BOS_DT_szId,
 szCompUomId   BOS_DT_szId,
 szSupplyType   BOS_DT_szSmallId,
 bDoNotCheckQtyWhenDoProductBooking   ,
 dtmValidStart   ,
 dtmValidEnd   ,
 szDiscountGroupId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 bUsedByAllWorkplace   BOS_DT_bBoolean,
 szCategory_6   BOS_DT_szId,
 szCategory_7   BOS_DT_szId,
 szCategory_8   BOS_DT_szId,
 szCategory_9   BOS_DT_szId,
 szCategory_10   BOS_DT_szId,
 dtmPromoStart   ,
 dtmPromoEnd   ,
 szBarcode   BOS_DT_szId,
 bPromo   BOS_DT_bBoolean,
 bShowKit   ,
 szBarcodeSekunder   BOS_DT_szId,
 szBarcodeTersier   BOS_DT_szId,
 szApplicationClass   BOS_DT_szId
);
CREATE TABLE BOS_INV_ProductCategory(
szProductCategoryId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szPriceId   BOS_DT_szId,
 szPromoPriceId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szCategoryType   BOS_DT_szId
);
CREATE TABLE BOS_INV_ProductCategoryInfo(
szProductCategoryId BOS_DT_szId,
 szInfoProduct   BOS_DT_szVeryBigMessage
);
CREATE TABLE BOS_INV_ProductCategoryType(
szCategoryType BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_ProductInfo(
szProductId BOS_DT_szId,
 szProductCategoryId   BOS_DT_szId,
 szInfoProduct   BOS_DT_szVeryBigMessage,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_ProductKitItem(
szProductId BOS_DT_szId,
 szKitItemProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId
);
CREATE TABLE BOS_INV_ProductKnowledge(
szProductId BOS_DT_szId,
 szDescription   BOS_DT_szBigDescription
);
CREATE TABLE BOS_INV_ProductPositionInfo(
szProductId BOS_DT_szId,
 szMediaType   BOS_DT_szSmallId,
 szMediaTitle   BOS_DT_szName,
 szMachineBrandId   BOS_DT_szId,
 szMachineType   BOS_DT_szId,
 shYear   ,
 szMachineSN   BOS_DT_szSN,
 szDrawingNumber   BOS_DT_szId,
 szPositionNumber   BOS_DT_szId
);
CREATE TABLE BOS_INV_ProductPrice(
szProductId BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szUomId   BOS_DT_szMediumId,
 bUsePriceWTax   ,
 decPrice   BOS_DT_decPrice,
 szPriceCcyId   BOS_DT_szSmallId,
 szPromoPriceId   BOS_DT_szId
);
CREATE TABLE BOS_INV_ProductPurchaseInfo(
szProductId BOS_DT_szId,
 szUomId   BOS_DT_szMediumId,
 szTaxTypeId   BOS_DT_szId,
 bUsePriceWTax   ,
 decPurchPrice   BOS_DT_decPrice,
 szPriceCcyId   BOS_DT_szId,
 decLastPurchPrice   BOS_DT_decPrice,
 dtmLastPurchDate   ,
 szLastSupplierId   BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szPromoPriceId   BOS_DT_szId,
 szDefaultSuppId   BOS_DT_szId,
 decBasePurchPrice_S   BOS_DT_decPrice
);
CREATE TABLE BOS_INV_ProductSerNum(
szProductId BOS_DT_szId,
 szProductSn   BOS_DT_szSN,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_INV_ProductTechnicalSpecInfo(
szProductId BOS_DT_szId,
 decWeight   ,
 szUomWeight   BOS_DT_szMediumId,
 decVolume   ,
 szUomVolume   BOS_DT_szMediumId,
 decLength   ,
 szUomLength   BOS_DT_szMediumId,
 decWidth   ,
 szUomWidth   BOS_DT_szMediumId,
 decHeight   ,
 szUomHeight   BOS_DT_szMediumId,
 decStoreTemp   ,
 szUomTemp   BOS_DT_szMediumId,
 decStoreHuminity   ,
 szUomHuminity   BOS_DT_szMediumId,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_INV_ProductVariance(
szVarianceId BOS_DT_szId,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_ProductVarianceItem(
szVarianceId BOS_DT_szId,
 szProductId   BOS_DT_szId
);
CREATE TABLE BOS_INV_ShippingNetwork(
szWorkplaceSenderId BOS_DT_szId,
 szWorkplaceReceiverId   BOS_DT_szId,
 shEstimatedDelivery   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_Stock(
szProductId BOS_DT_szId,
 szLocationType   ,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szReportedAsType   ,
 szReportedAsId   BOS_DT_szId,
 decQtyOnHand   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 bFreeze   ,
 szDistProductId   BOS_DT_szId,
 decDistQtyOnHand   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_StockAllocation(
szProductId BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 dtmExpired   ,
 decAllocatedQty   BOS_DT_decAmount,
 dtmLastUpdated   ,
 decWpAllocatedQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_StockCostLayer(
szProductId BOS_DT_szId,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szReportedAsId   BOS_DT_szId,
 decPrice   BOS_DT_decPrice,
 dtmDate   ,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_StockHistory(
szProductId BOS_DT_szId,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 dtmTransaction   ,
 gdHistoryId   ,
 shOrder   ,
 decQty   BOS_DT_decAmount,
 decDocQty   BOS_DT_decAmount,
 szDocUomId   BOS_DT_szMediumId,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szStockTransferReason   BOS_DT_szSmallId,
 szOrderTypeId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 szUrl   BOS_DT_szUrl,
 szReportedAsType   BOS_DT_szSmallId,
 szReportedAsId   BOS_DT_szId,
 szPartyType   BOS_DT_szSmallId,
 szPartyId   BOS_DT_szId,
 szEmployeeId   BOS_DT_szId,
 szRefDocId   BOS_DT_szId,
 szPartyLocType   BOS_DT_szSmallId,
 szPartyLocId   BOS_DT_szId,
 szFakturPajakId   BOS_DT_szId,
 decCOGS   BOS_DT_decAmount,
 dtmLastUpdated   ,
 bFreeze   ,
 szDistProductId   BOS_DT_szId,
 decDistQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_StockLot(
szLotId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 decQtyOnHand   BOS_DT_decAmount,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_StockLotHistory(
szLotId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 dtmTransaction   ,
 gdStockHistoryId   ,
 shOrder   ,
 decQty   BOS_DT_decAmount,
 decDocQty   BOS_DT_decAmount,
 szDocUomId   BOS_DT_szMediumId,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szBigId,
 szStockTransferReason   BOS_DT_szSmallId,
 szUrl   BOS_DT_szUrl,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_StockOpname(
szStockOpnameId BOS_DT_szId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 bApplied   ,
 bVoid   ,
 szStockOpnameStatus   ,
 dtmDocumentDate   ,
 szRemarks   BOS_DT_szBigDescription,
 szPicEmployeeId   BOS_DT_szId,
 szParameter   ,
 szOpnameNotes   BOS_DT_szBigDescription,
 szValidateMessage   BOS_DT_szBigDescription,
 szCorrectionStockDocument   BOS_DT_szBigDescription,
 szFDOTekorDocument   BOS_DT_szBigDescription,
 btPrintedCount   ,
 szWorkplaceId   BOS_DT_szId,
 szCompanyId   BOS_DT_szId,
 btStockOpnameCount   ,
 bLocked   ,
 bConfirmed   ,
 szCancelReason   BOS_DT_szBigDescription
);
CREATE TABLE BOS_INV_StockOpnameItem(
szStockOpnameId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szCompUOMId   BOS_DT_szId,
 decStockOpnameValue   BOS_DT_decAmount,
 decSwapValue   BOS_DT_decAmount,
 decSurplusValue   BOS_DT_decAmount,
 decDefisitValue   BOS_DT_decAmount,
 decQtyOnHand   ,
 bIsProceed   ,
 bIsLocked   ,
 bIsDiffValue   ,
 decPrice   BOS_DT_decPrice,
 szUomId   BOS_DT_szMediumId,
 szPriceCcyId   BOS_DT_szSmallId
);
CREATE TABLE BOS_INV_StockOpnameItemLotInfo(
szStockOpnameId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLotId   BOS_DT_szId,
 szLotTypeId   BOS_DT_szId,
 szProductionCode   BOS_DT_szId,
 decLotStrength   BOS_DT_decAmount,
 dtmExpired   ,
 szLotStatus   BOS_DT_szSmallId
);
CREATE TABLE BOS_INV_StockOpnameItemLotQty(
szStockOpnameId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_INV_StockOpnameProductCategory(
szStockOpnameId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 bIsProduct   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_StockSN(
szProductSn BOS_DT_szSN,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szReportedAsType   BOS_DT_szSmallId,
 szReportedAsId   BOS_DT_szId,
 shQty   ,
 dtmLastUpdated   ,
 iSyncTransferStatus   
);
CREATE TABLE BOS_INV_StockSNHistory(
szProductSn BOS_DT_szSN,
 gdStockHistoryId   ,
 szProductId   BOS_DT_szId,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szReportedAsType   BOS_DT_szSmallId,
 szReportedAsId   BOS_DT_szId,
 shQty   ,
 dtmLastUpdated   ,
 iSyncTransferStatus   
);
CREATE TABLE BOS_INV_StockSnProduct(
szProductSn BOS_DT_szSN,
 szProductId   BOS_DT_szId,
 dtmLastChecked   ,
 szSuppId   BOS_DT_szId,
 szCheckerId   BOS_DT_szId,
 szChassisNumber   BOS_DT_szMediumName,
 dtmLastUpdated   ,
 iSyncTransferStatus   
);
CREATE TABLE BOS_INV_StockToDeliver(
szProductId BOS_DT_szId,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 dtmDelivery   ,
 decQtyToDeliver   BOS_DT_decAmount,
 decQtyDelivered   BOS_DT_decAmount,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_StockToReceive(
szProductId BOS_DT_szId,
 szLocationType   BOS_DT_szSmallId,
 szLocationId   BOS_DT_szId,
 dtmReceive   ,
 decQtyToReceive   BOS_DT_decAmount,
 decQtyReceived   BOS_DT_decAmount,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_StockTransferType(
szStockTransferTypeId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szRuleTransfer   ,
 iStatus   ,
 szReceiveStockTransferType   ,
 szApproval   ,
 bDocRef   BOS_DT_bBoolean,
 bActive   BOS_DT_bBoolean,
 bAllowQtyNol   BOS_DT_bBoolean,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_StockType(
szStockTypeId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bAvailableForSales   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_StockWarehouseAllocation(
szProductId BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szWarehouseId   BOS_DT_szId,
 dtmExpired   ,
 decAllocatedQty   BOS_DT_decAmount,
 dtmLastUpdated   
);
CREATE TABLE BOS_INV_SuggestionType(
szSuggestionTypeId BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_INV_Uom(
szUomClassId BOS_DT_szMediumId,
 szUomId   BOS_DT_szMediumId,
 bLock   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_UomClass(
szUomClassId BOS_DT_szMediumId,
 szDescription   BOS_DT_szBigDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_UomConversion(
szUomClassId BOS_DT_szMediumId,
 szUomId   BOS_DT_szMediumId,
 szToUomClassId   BOS_DT_szMediumId,
 szToUomId   BOS_DT_szMediumId,
 decValue   BOS_DT_decUomConv
);
CREATE TABLE BOS_INV_Vehicle(
szVehicleId BOS_DT_szId,
 szPoliceNo   BOS_DT_szSmallName,
 szChassisNo   BOS_DT_szMediumName,
 szMachineNo   BOS_DT_szMediumName,
 szVehicleCapacityId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 bActive   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_VehicleCapacity(
szVehicleCapacityId BOS_DT_szMediumId,
 decMaxWeight   BOS_DT_decAmount,
 decMaxVolume   BOS_DT_decAmount,
 szWeightUomId   BOS_DT_szId,
 szVolumeUomId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_Warehouse(
szWarehouseId BOS_DT_szId,
 szName   BOS_DT_szName,
 WhszContactPerson   BOS_DT_szName,
 WhszRoomNo   BOS_DT_szSmallName,
 WhszFloor   BOS_DT_szSmallName,
 WhszBuilding   BOS_DT_szName,
 WhszAddress_1   BOS_DT_szName,
 WhszAddress_2   BOS_DT_szName,
 WhszDistrict   BOS_DT_szName,
 WhszCity   BOS_DT_szMediumName,
 WhszZipCode   BOS_DT_szMediumId,
 WhszState   BOS_DT_szMediumName,
 WhszCountry   BOS_DT_szMediumName,
 WhszPhoneNo_1   BOS_DT_szMediumName,
 WhszPhoneNo_2   BOS_DT_szMediumName,
 WhszFaxNo   BOS_DT_szMediumName,
 WhszMobileNo   BOS_DT_szMediumName,
 WhszEmail   BOS_DT_szMediumName,
 WhszWebSite   BOS_DT_szMediumName,
 szWorkplaceId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_INV_WarehouseStockType(
szWarehouseId BOS_DT_szId,
 szStockTypeId   BOS_DT_szId
);
CREATE TABLE BOS_MD_Competitor(
szCompetitorId BOS_DT_szId,
 szCompetitorNm   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_MD_CompetitorActivity(
gdHistoryId ,
 szCompetitorId   BOS_DT_szId,
 dtmDate   ,
 szCompetitorActivityReasonId   BOS_DT_szId,
 szActivity   BOS_DT_szDescription,
 szWorkplaceId   BOS_DT_szDescription,
 szTeamId   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szSalesId   BOS_DT_szId
);
CREATE TABLE BOS_MD_Device(
szDeviceId BOS_DT_szDeviceId,
 szDeviceType   BOS_DT_szId,
 bHasGprs   BOS_DT_bBoolean,
 bHasGps   BOS_DT_bBoolean,
 szGpsType   BOS_DT_szSmallId,
 bHasPrinter   BOS_DT_bBoolean,
 bHasBarcode   BOS_DT_bBoolean,
 szBarcodeReaderType   BOS_DT_szSmallId,
 dtmLastUpdated   
);
CREATE TABLE BOS_MD_DevicePack(
szDeviceId BOS_DT_szDeviceId,
 abtPackData   ,
 szWorkplaceId   BOS_DT_szId
);
CREATE TABLE BOS_MD_DummyCustomer(
szWorkplaceId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szEmployeeId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_MD_EmployeeDevice(
szEmployeeId BOS_DT_szId,
 szDeviceId   BOS_DT_szDeviceId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_MD_ExpenseMapping(
szWpId BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_MD_ExpenseMappingItem(
szWpId BOS_DT_szId,
 szName   BOS_DT_szName,
 szAccId   BOS_DT_szId,
 szSubAccId   BOS_DT_szGLAccount,
 szExpenseType   BOS_DT_szSmallId
);
CREATE TABLE BOS_MD_FPromoActivity(
szDocId BOS_DT_szId,
 dtmDate   ,
 szCustomerId   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 szPromoActivityId   BOS_DT_szId,
 szPromoActivityName   BOS_DT_szName,
 bProductPromo   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decDecimal,
 szAccountId   BOS_DT_szId,
 szAccountDesc   BOS_DT_szDescription,
 decAmount   BOS_DT_decDecimal,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_MD_FSurvey(
szCustId BOS_DT_szId,
 dtmDate   ,
 szSurveyId   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_MD_FSurveyItem(
szCustId BOS_DT_szId,
 dtmDate   ,
 szSurveyId   BOS_DT_szId,
 szSubject   BOS_DT_szDescription,
 szAnswer1   BOS_DT_szDescription,
 szAnswer2   BOS_DT_szDescription,
 szAnswer3   BOS_DT_szDescription,
 szAnswer4   BOS_DT_szDescription,
 szSubjectType   BOS_DT_szName
);
CREATE TABLE BOS_MD_PromoActivity(
szPromoActivityId BOS_DT_szId,
 szPromoActivityName   BOS_DT_szName,
 bProductPromo   ,
 bPromoExpense   ,
 bActive   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_MD_SalesmanTaskList(
szSalesmanId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 lTaskId   ,
 szTask   BOS_DT_szBigDescription,
 szDesc   BOS_DT_szBigDescription,
 szStatus   BOS_DT_szSmallName,
 bNewRow   BOS_DT_bBoolean,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_MD_Survey(
szSurveyId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szTitle1   BOS_DT_szId,
 szTitle2   BOS_DT_szId,
 szTitle3   BOS_DT_szId,
 szTitle4   BOS_DT_szId,
 szEntryType1   BOS_DT_szId,
 szEntryType2   BOS_DT_szId,
 szEntryType3   BOS_DT_szId,
 szEntryType4   BOS_DT_szId,
 szEntryMode1   BOS_DT_szId,
 szEntryMode2   BOS_DT_szId,
 szEntryMode3   BOS_DT_szId,
 szEntryMode4   BOS_DT_szId,
 dtValidFrom   ,
 dtValidTo   ,
 bMustBeFilled   BOS_DT_bBoolean,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_MD_SurveyInputSelection(
szSurveyInputSelectionId BOS_DT_szId,
 szDescription   BOS_DT_szName,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_MD_SurveyInputSelectionItem(
szSurveyInputSelectionId BOS_DT_szId,
 szOption   BOS_DT_szName
);
CREATE TABLE BOS_MD_SurveyItem(
szSurveyId BOS_DT_szId,
 szSubject   BOS_DT_szDescription,
 szSubjectType   BOS_DT_szName
);
CREATE TABLE BOS_MD_SurveyItemWorkPlace(
szSurveyId BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szWorkplaceName   BOS_DT_szName
);
CREATE TABLE BOS_MD_SurveySalesMapping(
szSurveyId BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 szSalesName   BOS_DT_szName
);
CREATE TABLE BOS_MD_UploadHistory(
szUri BOS_DT_szUri,
 szMobileDocId   BOS_DT_szBigId,
 szSalesId   BOS_DT_szId,
 dtmTransaction   ,
 dtmUpload   ,
 szDFsDocId   BOS_DT_szId
);
CREATE TABLE BOS_MKT_FPromo(
szFPromoId BOS_DT_szId,
 dtmStart   ,
 dtmEnd   ,
 szPromoMediaId1   BOS_DT_szId,
 szPromoMediaId2   BOS_DT_szId,
 szPromoMediaId3   BOS_DT_szId,
 szPromoMediaId4   BOS_DT_szId,
 szPromoMediaId5   BOS_DT_szId,
 szPromoTypeId1   BOS_DT_szId,
 szPromoTypeId2   BOS_DT_szId,
 szPromoTypeId3   BOS_DT_szId,
 szPromoTypeId4   BOS_DT_szId,
 szPromoTypeId5   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_MKT_FPromoItem(
szFPromoId BOS_DT_szId,
 shItemNumber   ,
 dtmEvent   ,
 decCountOfPerformance   BOS_DT_decAmount,
 decDuration   BOS_DT_decAmount,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_MKT_PromoViewer(
szPromoViewerId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szDateRange   BOS_DT_szId,
 dtmStart   ,
 dtmEnd   ,
 szTimeGranular   BOS_DT_szId,
 szPromoMediaId1   BOS_DT_szId,
 szPromoMediaId2   BOS_DT_szId,
 szPromoMediaId3   BOS_DT_szId,
 szPromoMediaId4   BOS_DT_szId,
 szPromoMediaId5   BOS_DT_szId,
 szPromoTypeId1   BOS_DT_szId,
 szPromoTypeId2   BOS_DT_szId,
 szPromoTypeId3   BOS_DT_szId,
 szPromoTypeId4   BOS_DT_szId,
 szPromoTypeId5   BOS_DT_szId,
 szSalesOrgId1   BOS_DT_szId,
 szSalesOrgId2   BOS_DT_szId,
 szSalesOrgId3   BOS_DT_szId,
 szSalesOrgId4   BOS_DT_szId,
 szSalesOrgId5   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szDistrChannelId   BOS_DT_szId,
 szCustCategoryId1   BOS_DT_szId,
 szCustCategoryId2   BOS_DT_szId,
 szCustCategoryId3   BOS_DT_szId,
 szCustCategoryId4   BOS_DT_szId,
 szCustCategoryId5   BOS_DT_szId,
 szProductCategoryId1   BOS_DT_szId,
 szProductCategoryId2   BOS_DT_szId,
 szProductCategoryId3   BOS_DT_szId,
 szProductCategoryId4   BOS_DT_szId,
 szProductCategoryId5   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_MSI_FieldMapping(
szType BOS_DT_szSmallId,
 szIdFrom   BOS_DT_szBigId,
 szIdTo   BOS_DT_szBigId
);
CREATE TABLE BOS_PI_Department(
szDepartmentId BOS_DT_szId,
 szName   BOS_DT_szName,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_PI_Division(
szDivisionId BOS_DT_szId,
 szName   BOS_DT_szName,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_PI_Employee(
szEmployeeId BOS_DT_szId,
 szName   BOS_DT_szName,
 szWorkplaceId   BOS_DT_szId,
 szSupervisorId   BOS_DT_szId,
 szDivisionId   BOS_DT_szId,
 szDepartmentId   BOS_DT_szId,
 szTeamId   BOS_DT_szId,
 bIncludeInDailySettlement   BOS_DT_bBoolean,
 szRoutineType   BOS_DT_szSmallId,
 szFVRemaScheduleId   BOS_DT_szId,
 intRoundingLevel_for_distribution   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szSubAccIdForMoDis   BOS_DT_szGLAccount,
 bHasGprs   BOS_DT_bBoolean,
 bHasGps   BOS_DT_bBoolean,
 bHasPrinter   BOS_DT_bBoolean,
 bHasBarcodeCustInfo   BOS_DT_bBoolean,
 bHasBarcodeReaderToReadSn   BOS_DT_bBoolean,
 decPassKey   BOS_DT_decAmount,
 bActive   BOS_DT_bBoolean,
 szGpsType   BOS_DT_szSmallId,
 szBarcodeReaderType   BOS_DT_szSmallId,
 bMustFillAssetMonitoring   BOS_DT_bBoolean,
 szDeliveryGroupId   BOS_DT_szId,
 bCheckInUsingGps   BOS_DT_bBoolean,
 szDeviceType   BOS_DT_szId,
 AdcId   BOS_DT_szId
);
CREATE TABLE BOS_PI_EmployeeDistribution(
szDriverId BOS_DT_szId,
 szHelperId1   BOS_DT_szId,
 szHelperId2   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szHelperId3   BOS_DT_szId
);
CREATE TABLE BOS_PI_ProductFocus(
szProductFocusId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 iPriority   BOS_DT_byteLevel,
 dtmLastUpdated   ,
 iColorArgb   ,
 iMinimumSku   BOS_DT_byteLevel
);
CREATE TABLE BOS_PI_StockLimit(
szSalesId BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_PI_StockLimitItem(
szSalesId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decQtyLimit   BOS_DT_decQty,
 szUomId   BOS_DT_szMediumId
);
CREATE TABLE BOS_PI_Team(
szTeamId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szDoPrintPaperType   BOS_DT_szId,
 szDoPrintType   BOS_DT_szId,
 szDefaultOrderTypeId   BOS_DT_szId,
 bCreateAutoFCjr   BOS_DT_bBoolean
);
CREATE TABLE BOS_PI_TeamArClass(
teamId BOS_DT_szId,
 arClassId   BOS_DT_szId
);
CREATE TABLE BOS_PI_TeamAvailibility(
szTeamId BOS_DT_szId,
 szProductCategory   BOS_DT_szId,
 szProductId   BOS_DT_szId
);
CREATE TABLE BOS_PI_TeamProductTemplate(
szTeamId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decQty   ,
 szUomId   BOS_DT_szMediumId,
 szParentId   BOS_DT_szId,
 szProductFocusId   BOS_DT_szId
);
CREATE TABLE BOS_PI_TeamVisibility(
szTeamId BOS_DT_szId,
 szVisibilityId   BOS_DT_szId,
 szVisibilityType   BOS_DT_szId
);
CREATE TABLE BOS_PI_UserInfo(
szUserId BOS_DT_szId,
 szDivisionId   BOS_DT_szId,
 szDepartmentId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_PI_Visibility(
szVisibilityId BOS_DT_szId,
 szVisibilityName   BOS_DT_szDescription,
 szVisibilityType   BOS_DT_szId,
 bActive   BOS_DT_bBoolean,
 dtmLastUpdated   ,
 bTakePicture   BOS_DT_bBoolean
);
CREATE TABLE BOS_PI_VisibilityType(
szVisibilityTypeId BOS_DT_szId,
 szGuidance   BOS_DT_szBigMessage,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_PI_VisibilityTypeImage(
szVisibilityTypeId BOS_DT_szId,
 shItemNumber   ,
 szImageName   BOS_DT_szFullPath,
 szImageTumb   ,
 szImageData   
);
CREATE TABLE BOS_PUR_FPo_s(
szFPo_sId BOS_DT_szId,
 dtmPO   ,
 bReturn   BOS_DT_bBoolean,
 szSupplierId   BOS_DT_szId,
 szStatus   BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription,
 szCcyId   BOS_DT_szSmallId,
 paymentTermId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApproved   ,
 bApplied   ,
 bJournal   ,
 bPosted   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szApprovalId   BOS_DT_szId,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 purchaseTypeId   BOS_DT_szId
);
CREATE TABLE BOS_PUR_FPo_sItem(
szFPo_sId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decQty,
 szUomId   BOS_DT_szMediumId,
 decPrice   BOS_DT_decPrice,
 bTaxable   ,
 decAmount   BOS_DT_decAmount,
 decDiscount   BOS_DT_decAmount,
 decDiscPercentage   BOS_DT_decPrice,
 decDPP   BOS_DT_decAmount,
 decPPN   BOS_DT_decAmount,
 decBaseQty_S   BOS_DT_decQty,
 decReceiptQty   BOS_DT_decQty,
 purchaseItemTypeId   BOS_DT_szId,
 szDistProductId   BOS_DT_szId,
 decDistQty   BOS_DT_decAmount,
 decDistPrice   BOS_DT_decPrice
);
CREATE TABLE BOS_PUR_FPo_sItemDelivery(
szFPo_sId BOS_DT_szId,
 shItemNumber   ,
 szWorkplaceId   BOS_DT_szId,
 dtmDelivery   ,
 decQty   BOS_DT_decQty,
 decReceiptQty   BOS_DT_decQty,
 dtmLastUpdated   
);
CREATE TABLE BOS_PUR_FPoReceipt_s(
szFPoReceipt_sId BOS_DT_szId,
 dtmReceipt   ,
 bReturn   BOS_DT_bBoolean,
 szPoId   BOS_DT_szId,
 szRefDn   BOS_DT_szId,
 dtmRefDn   ,
 szWarehouseId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 szCarrierId   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szVehicleNumber   BOS_DT_szId,
 szDriverNm   BOS_DT_szName,
 szDescription   BOS_DT_szDescription,
 szCcyId   BOS_DT_szSmallId,
 szFApInvoiceId   BOS_DT_szId,
 paymentTermId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApproved   ,
 bApplied   ,
 bJournal   ,
 bPosted   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szApprovalId   BOS_DT_szId,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 purchaseTypeId   BOS_DT_szId
);
CREATE TABLE BOS_PUR_FPoReceipt_sItem(
szFPoReceipt_sId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decBaseQty_S   BOS_DT_decQty,
 decQty   BOS_DT_decQty,
 szUomId   BOS_DT_szMediumId,
 decPrice   BOS_DT_decPrice,
 bTaxable   ,
 decAmount   BOS_DT_decAmount,
 decDiscount   BOS_DT_decAmount,
 decDiscPercentage   BOS_DT_decPrice,
 decDPP   BOS_DT_decAmount,
 decPPN   BOS_DT_decAmount,
 decRemainingQty   BOS_DT_decQty,
 bBonus   BOS_DT_bBoolean,
 decCOGS   BOS_DT_decAmount,
 purchaseItemTypeId   BOS_DT_szId,
 szDistProductId   BOS_DT_szId,
 decDistQty   BOS_DT_decAmount,
 decDistPrice   BOS_DT_decPrice
);
CREATE TABLE BOS_PUR_FPoReceipt_sItemLotInfo(
szFPoReceipt_sId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szLotTypeId   BOS_DT_szId,
 szProductionCode   BOS_DT_szId,
 decLotStrength   BOS_DT_decAmount,
 dtmExpired   ,
 szLotStatus   BOS_DT_szSmallId
);
CREATE TABLE BOS_PUR_FPoReceipt_sItemLotQty(
szFPoReceipt_sId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_PUR_FPoReceipt_sItemSn(
szFPoReceipt_sId BOS_DT_szId,
 shItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_PUR_FRequisition(
szFRequisitionId BOS_DT_szId,
 dtmRequisition   ,
 szReasonId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szDemandType   BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription,
 bOpen   ,
 szFReqReceivedId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_PUR_FRequisitionItem(
szFRequisitionId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szUomId   BOS_DT_szMediumId,
 decQtyRequired   BOS_DT_decAmount,
 dtmRequired   ,
 szFPoId   BOS_DT_szId,
 decQtyOrdered   BOS_DT_decAmount
);
CREATE TABLE BOS_PUR_ProductSCProfileCalc(
szWorkplaceId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szWorkplaceSupplyId   BOS_DT_szId,
 decAvgDemandQty   BOS_DT_decQty,
 decDemandQtyDeviation   BOS_DT_decQty,
 decRollingForecastPercentage   BOS_DT_decAmount,
 decRollingForecastQty   BOS_DT_decQty,
 decReorderPointQty   BOS_DT_decQty,
 decEOQ   BOS_DT_decQty,
 dtmLastUpdated   
);
CREATE TABLE BOS_PUR_PurchaseItemType(
szPurchaseItemTypeId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szTrnType   BOS_DT_szSmallId,
 bTaxable   ,
 bBilled   ,
 bApplicable4AllSupplier   ,
 bApplicable4AllProduct   ,
 bApplicable4AllPurchOrg   ,
 szBorrowChargeCalcId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 bAllowZeroPrice   ,
 bAllowManualPrice   ,
 bAllowManualDiscount   ,
 szReturPurchaseItemTypeId   BOS_DT_szId,
 gdAuditTrailId   
);
CREATE TABLE BOS_PUR_PurchaseItemTypeProduct(
szPurchaseItemTypeId BOS_DT_szId,
 szProductId   BOS_DT_szId
);
CREATE TABLE BOS_PUR_PurchaseItemTypePurchOrg(
szPurchaseItemTypeId BOS_DT_szId,
 szPurchOrgId   BOS_DT_szId
);
CREATE TABLE BOS_PUR_PurchaseItemTypeSupplier(
szPurchaseItemTypeId BOS_DT_szId,
 szSupplierId   BOS_DT_szId
);
CREATE TABLE BOS_PUR_PurchaseType(
szPurchaseTypeId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szFlexiKeyId   BOS_DT_szId,
 szApprovalId   BOS_DT_szId,
 bApplicable4AllSupplier   ,
 bApplicable4AllProduct   ,
 bApplicable4AllPurchaseItemType   ,
 bApplicable4AllPurchOrg   ,
 bAllowManualPrice   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szReturPurchaseTypeId   BOS_DT_szId,
 gdAuditTrailId   
);
CREATE TABLE BOS_PUR_PurchaseTypeProduct(
szPurchaseTypeId BOS_DT_szId,
 szProductId   BOS_DT_szId
);
CREATE TABLE BOS_PUR_PurchaseTypePurchaseItemType(
szPurchaseTypeId BOS_DT_szId,
 szPurchaseItemTypeId   BOS_DT_szId
);
CREATE TABLE BOS_PUR_PurchaseTypePurchOrg(
szPurchaseTypeId BOS_DT_szId,
 szPurchOrgId   BOS_DT_szId
);
CREATE TABLE BOS_PUR_PurchaseTypeSupplier(
szPurchaseTypeId BOS_DT_szId,
 szSupplierId   BOS_DT_szId
);
CREATE TABLE BOS_SAM_Branch(
szBranchId BOS_DT_szId,
 szName   BOS_DT_szName,
 szAddress   BOS_DT_szDescription
);
CREATE TABLE BOS_SCM_PurchGroup(
szPurchGroupId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SCM_PurchOrg(
szPurchOrgId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szWorkplaceId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SCM_SupplierPurchOrg(
szSuppId BOS_DT_szId,
 szPurchOrgId   BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 szPoReceiver   BOS_DT_szName,
 szBillIssuer   BOS_DT_szName,
 szLangId   BOS_DT_szSmallId,
 szCcyId   BOS_DT_szSmallId,
 szTaxEntityId   BOS_DT_szId,
 szBankId   BOS_DT_szId,
 szBankAccount   BOS_DT_szName,
 bAllowToCredit   ,
 szInvoiceProcessingId   BOS_DT_szId,
 szPaymentTermId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_CjrTracking(
szCjrTrackingId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szCollectorId   BOS_DT_szId,
 szFCjrId   BOS_DT_szId,
 bFinished   ,
 bSuccess   ,
 bTasked   ,
 dtmNext   ,
 btTrialCount   ,
 szChangeNote   BOS_DT_szId,
 dtmInvoiceExchangeDate   ,
 dtmLastUpdated   ,
 szPaymentRefNo   
);
CREATE TABLE BOS_SD_CustCollRoutine(
szCustId BOS_DT_szId,
 szScheduleId   BOS_DT_szId,
 szDefaultRouteId   BOS_DT_szBigId,
 dtmCollection   ,
 dtmLastCollection   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 gdAuditTrailId   
);
CREATE TABLE BOS_SD_CustCollRoutine_DRAFT(
szCustId BOS_DT_szId,
 szScheduleId   BOS_DT_szId,
 szDefaultRouteId   BOS_DT_szBigId,
 dtmCollection   ,
 dtmLastCollection   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 gdAuditTrailId   
);
CREATE TABLE BOS_SD_CustFoc(
szCustId BOS_DT_szId,
 szFocId   BOS_DT_szId,
 dtmStart   ,
 dtmEnd   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_CustFocHistory(
szCustId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szFocType   BOS_DT_szSmallId,
 dtmFoc   ,
 decAdd   BOS_DT_decAmount,
 decUse   BOS_DT_decAmount,
 decRemain   BOS_DT_decAmount,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 szUrl   BOS_DT_szUrl,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_SD_CustFocItem(
szCustId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szFocType   BOS_DT_szSmallId,
 bUnlimitedQty   ,
 decQtyRemain   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 dtmLastReset   
);
CREATE TABLE BOS_SD_CustRoutine(
szCustId BOS_DT_szId,
 szDefaultTeamId   BOS_DT_szId,
 szDefaultScheduleId   BOS_DT_szId,
 decDefaultScheduleValue   BOS_DT_decAmount,
 szDefaultRouteId   BOS_DT_szBigId,
 szDefaultOrderTypeId   BOS_DT_szId,
 dtmDelivery   ,
 szLastFDoId   BOS_DT_szId,
 szNote   BOS_DT_szDescription,
 szDOPrintPaperType   BOS_DT_szId,
 szDOPrintType   BOS_DT_szId,
 gdAuditTrailId   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_CustRoutine_DRAFT(
szCustId BOS_DT_szId,
 szDefaultTeamId   BOS_DT_szId,
 szDefaultScheduleId   BOS_DT_szId,
 decDefaultScheduleValue   BOS_DT_decAmount,
 szDefaultRouteId   BOS_DT_szBigId,
 szDefaultOrderTypeId   BOS_DT_szId,
 dtmDelivery   ,
 szLastFDoId   BOS_DT_szId,
 szNote   BOS_DT_szDescription,
 szDOPrintPaperType   BOS_DT_szId,
 szDOPrintType   BOS_DT_szId,
 gdAuditTrailId   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_CustRoutineItem(
szCustId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 bPrintPrice   ,
 szTeamId   BOS_DT_szId,
 szScheduleId   BOS_DT_szId,
 decValue   BOS_DT_decAmount,
 decAvgOrder   BOS_DT_decAmount,
 decMaxDropSize   BOS_DT_decQty,
 szParentId   BOS_DT_szId,
 szParentNm   BOS_DT_szName
);
CREATE TABLE BOS_SD_CustRoutineItem_DRAFT(
szCustId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 bPrintPrice   ,
 szTeamId   BOS_DT_szId,
 szScheduleId   BOS_DT_szId,
 decValue   BOS_DT_decAmount,
 decAvgOrder   BOS_DT_decAmount,
 decMaxDropSize   BOS_DT_decQty,
 szParentId   BOS_DT_szId,
 szParentNm   BOS_DT_szName
);
CREATE TABLE BOS_SD_CustTORoutine(
szCustId BOS_DT_szId,
 szDefaultTeamId   BOS_DT_szId,
 szDefaultScheduleId   BOS_DT_szId,
 decDefaultScheduleValue   BOS_DT_decAmount,
 szDefaultRouteId   BOS_DT_szBigId,
 szDefaultOrderTypeId   BOS_DT_szId,
 dtmTakingOrder   ,
 szLastFSoId   BOS_DT_szId,
 szNote   BOS_DT_szDescription,
 szSOPrintPaperType   BOS_DT_szId,
 szSOPrintType   BOS_DT_szId,
 szDeliveryGroupId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_CustTORoutine_DRAFT(
szCustId BOS_DT_szId,
 szDefaultTeamId   BOS_DT_szId,
 szDefaultScheduleId   BOS_DT_szId,
 decDefaultScheduleValue   BOS_DT_decAmount,
 szDefaultRouteId   BOS_DT_szBigId,
 szDefaultOrderTypeId   BOS_DT_szId,
 dtmTakingOrder   ,
 szLastFSoId   BOS_DT_szId,
 szNote   BOS_DT_szDescription,
 szSOPrintPaperType   BOS_DT_szId,
 szSOPrintType   BOS_DT_szId,
 szDeliveryGroupId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_CustTORoutineItem(
szCustId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 bPrintPrice   ,
 szTeamId   BOS_DT_szId,
 szScheduleId   BOS_DT_szId,
 decValue   BOS_DT_decAmount,
 decAvgOrder   BOS_DT_decAmount,
 decMaxDropSize   BOS_DT_decQty,
 decMinDropSize   BOS_DT_decQty,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_SD_CustTORoutineItem_DRAFT(
szCustId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 bPrintPrice   ,
 szTeamId   BOS_DT_szId,
 szScheduleId   BOS_DT_szId,
 decValue   BOS_DT_decAmount,
 decAvgOrder   BOS_DT_decAmount,
 decMaxDropSize   BOS_DT_decQty,
 decMinDropSize   BOS_DT_decQty,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_SD_DeliveryGroup(
szWorkplaceId BOS_DT_szId,
 szDeliveryGroupId   BOS_DT_szId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_DeliveryGroupRoute(
szDeliveryGroupId BOS_DT_szBigId,
 szDeliveryGroupDescription   BOS_DT_szBigMessage,
 szWorkplaceId   BOS_DT_szId,
 decDays   BOS_DT_decDecimal,
 dtmLastUpdated   
);
CREATE TABLE BOS_SD_DeliveryGroupRouteItem(
szDeliveryGroupId BOS_DT_szBigId,
 szRouteId   BOS_DT_szId,
 shOrder   BOS_DT_byteLevel
);
CREATE TABLE BOS_SD_DistrChannel(
szDistrChannelId BOS_DT_szId,
 szName   BOS_DT_szName,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_DjrTracking(
szDjrTrackingId BOS_DT_szId,
 szType   BOS_DT_szSmallId,
 szCustId   BOS_DT_szId,
 szFDoId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szFDjrId   BOS_DT_szId,
 bFinished   ,
 bSuccess   ,
 bTasked   ,
 dtmNext   ,
 btTrialCount   ,
 szTeamId   BOS_DT_szId,
 szScheduleId   BOS_DT_szId,
 decValue   BOS_DT_decAmount,
 szFCallId   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 bDoNotIncrStockToDeliver   ,
 decCustSalesTarget   BOS_DT_decAmount,
 dtmLastUpdated   
);
CREATE TABLE BOS_SD_DjrTrackingProduct(
szDjrTrackingId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szOrderItemTypeId   BOS_DT_szId,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_SD_EmployeeSalesTarget(
szEmployeeId BOS_DT_szId,
 szPeriodType   BOS_DT_szId,
 dtmStart   ,
 dtmEnd   ,
 decTargetAmount   BOS_DT_decAmount,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_FCjr(
szFCjrId BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 szBaseRouteId   BOS_DT_szId,
 dtmFCjr   ,
 szCollectorId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_FCjrItem(
szFCjrId BOS_DT_szId,
 shItemNumber   ,
 szCjrTrackingId   BOS_DT_szId,
 szReasonId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bSuccess   ,
 szCollTaskType   ,
 szCollRefNo   ,
 szNextCollTaskType   BOS_DT_szName
);
CREATE TABLE BOS_SD_FCustFoc(
szFCustFocId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szFocId   BOS_DT_szId,
 dtmStart   ,
 dtmEnd   ,
 bOverride   ,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 dtmCreated   ,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FDistrClosing(
szFDistrClosingId BOS_DT_szId,
 dtmClosing   ,
 szWareHouseId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FDistrClosingItem(
szFDistrClosingId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_FDjr(
szFDjrId BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 dtmFDjr   ,
 szDriverId   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szBaseRouteId   BOS_DT_szId,
 decStartKM   BOS_DT_decAmount,
 decEndKM   BOS_DT_decAmount,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 dtmStartTime   ,
 dtmEndTime   ,
 decVehicleUsageVolume   BOS_DT_decAmount,
 decVehicleUsageWeight   BOS_DT_decAmount,
 szDeliveryGroupId   BOS_DT_szId,
 decTonase   BOS_DT_decDecimal,
 decCubication   BOS_DT_decDecimal,
 szHelperId   BOS_DT_szId,
 szHelperId_2   BOS_DT_szId,
 szHelperId_3   BOS_DT_szId,
 decRit   BOS_DT_decDecimal
);
CREATE TABLE BOS_SD_FDjrItem(
szFDjrId BOS_DT_szId,
 shItemNumber   ,
 szDjrTrackingId   BOS_DT_szId,
 szReasonId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bSuccess   ,
 bStarted   BOS_DT_bBoolean,
 dtmStartVisit   ,
 dtmEndVisit   ,
 decVisitSpendTime   ,
 szLatitude   BOS_DT_szGPSCoordinate,
 szLongitude   BOS_DT_szGPSCoordinate,
 szBarcodeScanFailReasonId   BOS_DT_szId,
 szGPSScanFailReasonId   BOS_DT_szId,
 bScanGPSSuccess   ,
 bScanBarcodeSuccess   ,
 decJourneySpendTime   
);
CREATE TABLE BOS_SD_FDjrProductRequest(
szFDjrId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szWpId1   BOS_DT_szId,
 szFPrId1   BOS_DT_szId,
 decQty1   BOS_DT_decAmount,
 szWpId2   BOS_DT_szId,
 szFPrId2   BOS_DT_szId,
 decQty2   BOS_DT_decAmount,
 szWpId3   BOS_DT_szId,
 szFPrId3   BOS_DT_szId,
 decQty3   BOS_DT_decAmount,
 szWpId4   BOS_DT_szId,
 szFPrId4   BOS_DT_szId,
 decQty4   BOS_DT_decAmount,
 szParentId   BOS_DT_szId,
 szWhId1   BOS_DT_szId,
 szWhId2   BOS_DT_szId,
 szWhId3   BOS_DT_szId,
 szWhId4   BOS_DT_szId
);
CREATE TABLE BOS_SD_FDo(
szDoId BOS_DT_szId,
 szApplyNo   BOS_DT_szId,
 szFSoId   BOS_DT_szId,
 szFDnId   BOS_DT_szId,
 bReturnToWarehouse   ,
 szReturnFDoId   BOS_DT_szId,
 szReturnWarehouseId   BOS_DT_szId,
 szReturnStockTypeId   BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 szOrderTypeId   BOS_DT_szId,
 dtmDelivery   ,
 dtmPrice   ,
 szCustId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 decTax   BOS_DT_decTax,
 szCcyId   BOS_DT_szSmallId,
 szCcyRateId   BOS_DT_szMediumId,
 decCcyRate   BOS_DT_decCcyRate,
 szFInvoiceId   BOS_DT_szId,
 szFirstFInvoiceId   BOS_DT_szId,
 bDropShip   ,
 bUseThirdPartyCarrier   ,
 szVehicleId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szHelperId   BOS_DT_szId,
 szHelperId_2   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 szSalesSupervisorId   BOS_DT_szId,
 szSalesSupervisorId_2   BOS_DT_szId,
 szSalesSupervisorId_3   BOS_DT_szId,
 szSalesDivisionId   BOS_DT_szId,
 szSalesDepartmentId   BOS_DT_szId,
 szSalesTeamId   BOS_DT_szId,
 szCarrierId   BOS_DT_szId,
 szVehicleNumber   BOS_DT_szMediumId,
 szDriverName   BOS_DT_szName,
 szRemark   BOS_DT_szDescription,
 szLatitude   BOS_DT_szGPSCoordinate,
 szLongitude   BOS_DT_szGPSCoordinate,
 szCustPoId   BOS_DT_szId,
 dtmCustPo   ,
 szWarehouseId   BOS_DT_szId,
 szStockTypeId   BOS_DT_szId,
 bCash   ,
 gdCreditLimitApprovedId   ,
 szPaymentTermId   BOS_DT_szId,
 DeliveryszContactPerson   BOS_DT_szName,
 DeliveryszRoomNo   BOS_DT_szSmallName,
 DeliveryszFloor   BOS_DT_szSmallName,
 DeliveryszBuilding   BOS_DT_szName,
 DeliveryszAddress_1   BOS_DT_szBigDescription,
 DeliveryszAddress_2   BOS_DT_szBigDescription,
 DeliveryszDistrict   BOS_DT_szName,
 DeliveryszCity   BOS_DT_szMediumName,
 DeliveryszZipCode   BOS_DT_szMediumId,
 DeliveryszState   BOS_DT_szMediumName,
 DeliveryszCountry   BOS_DT_szMediumName,
 DeliveryszPhoneNo_1   BOS_DT_szMediumName,
 DeliveryszPhoneNo_2   BOS_DT_szMediumName,
 DeliveryszFaxNo   BOS_DT_szMediumName,
 DeliveryszMobileNo   BOS_DT_szMediumName,
 DeliveryszEmail   BOS_DT_szMediumName,
 DeliveryszWebSite   BOS_DT_szMediumName,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szManualNo   BOS_DT_szId,
 szFCustBIId   BOS_DT_szId,
 decTonase   BOS_DT_decDecimal,
 decCubication   BOS_DT_decDecimal,
 dtmMobileTransaction   ,
 szHelperId_3   BOS_DT_szId,
 bUploadedFromMoDis   BOS_DT_bBoolean,
 szLogisticType   BOS_DT_szId,
 dtmStartVisit   ,
 dtmEndVisit   ,
 decVisitSpendTime   BOS_DT_decAmount,
 bScanSuccess   ,
 szScanFailReason   BOS_DT_szId,
 szBarcodeScanFailReason   BOS_DT_szId,
 bScanBarcodeSuccess   ,
 decJourneySpendTime   BOS_DT_decAmount,
 AdcId   BOS_DT_szId,
 szCustReturnTaxRefNote   BOS_DT_szBigId,
 szCustReceiptNo   BOS_DT_szId
);
CREATE TABLE BOS_SD_FDoCorrection(
szFDoCorrectionId BOS_DT_szId,
 dtmDate   ,
 szDescription   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_FDoCorrectionItem(
szFDoCorrectionId BOS_DT_szId,
 shItemNumber   ,
 szFDoId   BOS_DT_szId,
 szFDoCustId   BOS_DT_szId,
 szCustId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FDoDummyCustInfo(
szFDoId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szCustNm   BOS_DT_szName,
 szCustAddress   BOS_DT_szBigDescription
);
CREATE TABLE BOS_SD_FDoItem(
szDoId BOS_DT_szId,
 shItemNumber   ,
 szOrderItemTypeId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 dtmPriceDate   ,
 decDiscProcent   BOS_DT_decPrice,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 decPrice   BOS_DT_decPrice,
 decDiscount   BOS_DT_decAmount,
 bTaxable   ,
 decTax   BOS_DT_decTax,
 decAmount   BOS_DT_decAmount,
 decDPP   BOS_DT_decTax,
 szPaymentType   BOS_DT_szSmallId,
 decCOGS   BOS_DT_decAmount,
 szPrincipalDiscRefId   BOS_DT_szId,
 decTonase   BOS_DT_decDecimal,
 decCubication   BOS_DT_decDecimal,
 szParentId   BOS_DT_szId,
 szDistProductId   BOS_DT_szId,
 decDistQty   BOS_DT_decAmount,
 decDistPrice   BOS_DT_decPrice,
 szBudgetId   BOS_DT_szId,
 decPrincipalCostAmount   BOS_DT_decAmount,
 decPrincipalCostQty   BOS_DT_decAmount,
 bBudgetTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_FDoItemBonusSource(
szFDoId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 szPaymentType   BOS_DT_szSmallId,
 decBonusAmount   BOS_DT_decAmount,
 decBonusQty   BOS_DT_decAmount,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FDoItemCustomerSN(
szDoId BOS_DT_szId,
 shItemNumber   ,
 szProductSn   BOS_DT_szSN,
 szProductInfo   BOS_DT_szDescription
);
CREATE TABLE BOS_SD_FDoItemLotQty(
szFDoId BOS_DT_szId,
 shItemNumber   ,
 szLotId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_FDoItemReason(
szFDoId BOS_DT_szId,
 shItemNumber   ,
 szReasonId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_FDoItemSN(
szDoId BOS_DT_szId,
 shItemNumber   ,
 shItemSnNumber   ,
 szProductSn   BOS_DT_szSN
);
CREATE TABLE BOS_SD_FDoPrintingType(
szFDOPrintingTypeId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szProductDefault   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_FDoProductDepositBonusItem(
szDoId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szOrderItemTypeId   BOS_DT_szId,
 bGenByTotal   
);
CREATE TABLE BOS_SD_FDoProductDepositBonusItemBonusSource(
szFDoId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 szPaymentType   BOS_DT_szSmallId,
 decBonusAmount   BOS_DT_decAmount,
 decBonusQty   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_FIncentive(
szFIncentiveId BOS_DT_szId,
 dtmDate   ,
 dtmFromPeriod   ,
 dtmToPeriod   ,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_FIncentiveItem(
szFIncentiveId BOS_DT_szId,
 shItemNumber   ,
 szCustId   BOS_DT_szId,
 decIncentive   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_FInvHandOver(
szFInvHandOverId BOS_DT_szId,
 dtmHandOver   ,
 szFrOpUserId   BOS_DT_szId,
 szToOpUserId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_FInvHandOverItem(
szFInvHandOverId BOS_DT_szId,
 szFInvoiceId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FInvItemBonusSource(
szFInvoiceId BOS_DT_szId,
 shItemNumber   ,
 szFDoId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szProductSn   BOS_DT_szSN,
 szOrderItemTypeId   BOS_DT_szId,
 szPaymentType   BOS_DT_szSmallId,
 decBonusAmount   BOS_DT_decAmount,
 decBonusQty   BOS_DT_decAmount,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FInvMoveIn(
szFInvMoveInId BOS_DT_szId,
 dtmFInvMoveIn   ,
 szFInvMoveOutId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szFrOpUserId   BOS_DT_szId,
 szToOpUserId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FInvMoveOut(
szFInvMoveOutId BOS_DT_szId,
 dtmFInvMoveOut   ,
 szToWorkplaceId   BOS_DT_szId,
 dtmStartInvCreated   ,
 dtmEndInvCreated   ,
 szUsedByFInvMoveInId   BOS_DT_szId,
 szFrOpUserId   BOS_DT_szId,
 szToOpUserId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_FInvMoveOutItem(
szFInvMoveOutId BOS_DT_szId,
 shItemNumber   ,
 szFInvoiceId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FInvoice(
szFInvoiceId BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 dtmPeriode   ,
 szCanceledByInvId   BOS_DT_szId,
 szCorrectedByInvId   BOS_DT_szId,
 szCancelToInvId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 decTax   BOS_DT_decTax,
 szCcyId   BOS_DT_szSmallId,
 szCcyRateId   BOS_DT_szMediumId,
 decCcyRate   BOS_DT_decCcyRate,
 szPaymentTermId   BOS_DT_szId,
 szFInvoiceStatus   BOS_DT_szSmallId,
 dtmBad   ,
 dtmDoubt   ,
 szFInvoiceUsage   BOS_DT_szSmallId,
 bCash   ,
 bTaxReported   ,
 szFakturPajakId   BOS_DT_szId,
 szFInvoiceType   BOS_DT_szSmallId,
 szInvoiceCollWpId   BOS_DT_szId,
 szKeptByOpUserId   BOS_DT_szId,
 szCurrentLocWpId   BOS_DT_szId,
 szTransitLocWpId   BOS_DT_szId,
 szChain_FirstId   BOS_DT_szId,
 szChain_NextId   BOS_DT_szId,
 szLastFInvHandOverId   BOS_DT_szId,
 szLastFInvMoveOutId   BOS_DT_szId,
 szLastFInvMoveInId   BOS_DT_szId,
 szLastFInvOpnameId   BOS_DT_szId,
 szRebateFInvoiceId   BOS_DT_szId,
 szFirstFDoId_S   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 szReasonId   BOS_DT_szId,
 szRemark   BOS_DT_szDescription,
 cntBonusItem   ,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 dtmFakturPajakCreated   ,
 dtmInvoiceCorrected   ,
 dtmInvoiceCanceled   ,
 AdcId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FInvoiceConvert(
szFInvoiceConvId BOS_DT_szId,
 dtmDoc   ,
 szFInvoiceStatus   BOS_DT_szSmallId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 bApproved   ,
 bJournal   ,
 bPosted   ,
 szApprovalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_FInvoiceConvertItem(
szFInvoiceConvId BOS_DT_szId,
 shItemNumber   ,
 szFInvoiceId   BOS_DT_szId,
 szReasonId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FInvoiceItem(
szFInvoiceId BOS_DT_szId,
 shItemNumber   ,
 szDoId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szProductSn   BOS_DT_szSN,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 decDiscProcent   BOS_DT_decPrice,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 decPrice   BOS_DT_decPrice,
 decDiscount   BOS_DT_decAmount,
 bTaxable   ,
 decTax   BOS_DT_decTax,
 decAmount   BOS_DT_decAmount,
 decDPP   BOS_DT_decTax,
 szPaymentType   BOS_DT_szSmallId,
 szInvItemType   BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription,
 szFInvoiceItemUsage   BOS_DT_szSmallId,
 decCOGS   BOS_DT_decAmount,
 szPrincipalDiscRefId   BOS_DT_szId,
 szParentId   BOS_DT_szId,
 szDistProductId   BOS_DT_szId,
 decDistQty   BOS_DT_decAmount,
 decDistPrice   BOS_DT_decPrice,
 szBudgetId   BOS_DT_szId,
 decPrincipalCostAmount   BOS_DT_decAmount,
 decPrincipalCostQty   BOS_DT_decAmount,
 bBudgetTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_FInvoiceProductBonusItem(
szFInvoiceId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szProductBonusType   BOS_DT_szSmallId,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FInvOpname(
szFInvOpnameId BOS_DT_szId,
 dtmOpname   ,
 szDescription   BOS_DT_szDescription,
 szLocWorkplaceId   BOS_DT_szId,
 szKeptByOpUserId   BOS_DT_szId,
 bOnlyClosedInv   ,
 szOpnameStatus   BOS_DT_szSmallId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_FInvOpnameItem(
szFInvOpnameId BOS_DT_szId,
 szFInvoiceId   BOS_DT_szId,
 szStatus   BOS_DT_szSmallId,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_SD_FInvProductBonusItemBonusSource(
szFInvoiceId BOS_DT_szId,
 shItemNumber   ,
 szFDoId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szProductSn   BOS_DT_szSN,
 szOrderItemTypeId   BOS_DT_szId,
 szPaymentType   BOS_DT_szSmallId,
 decBonusAmount   BOS_DT_decAmount,
 decBonusQty   BOS_DT_decAmount,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_SD_Foc(
szFocId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_FocItem(
szFocId BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szFocType   BOS_DT_szSmallId,
 bUnlimitedQty   ,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId
);
CREATE TABLE BOS_SD_FPr(
szFPrId BOS_DT_szId,
 dtmRequest   ,
 szRequestToWpId   BOS_DT_szId,
 szDriverId   BOS_DT_szId,
 szVehicleId   BOS_DT_szId,
 szStatus   BOS_DT_szSmallId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szDescription   BOS_DT_szDescription,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 szHelperId_1   BOS_DT_szId,
 szHelperId_2   BOS_DT_szId,
 szHelperId_3   BOS_DT_szId,
 szRequestToWhId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FPrItem(
szFPrId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 decReleased   BOS_DT_decAmount,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FSettlement(
szFSettlementId BOS_DT_szId,
 dtmSettBegin   ,
 dtmSettEnd   ,
 szWpToSettlement   BOS_DT_szId,
 bCloseInventory   BOS_DT_bBoolean,
 bCloseCashier   BOS_DT_bBoolean,
 bCloseDistribution   BOS_DT_bBoolean,
 bCloseEntry   BOS_DT_bBoolean,
 bCloseDaily   BOS_DT_bBoolean,
 bResultFrTransfer   BOS_DT_bBoolean,
 szOpUserId   BOS_DT_szId,
 szSettlementType   BOS_DT_szSmallId,
 bVoid   BOS_DT_bBoolean,
 bApplied   BOS_DT_bBoolean,
 btPrintedCount   ,
 bTransferred   BOS_DT_bBoolean,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   BOS_DT_bBoolean,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   BOS_DT_bBoolean,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_FSettlementItem(
szFSettlementId BOS_DT_szId,
 shItemNumber   ,
 szSettlementType   BOS_DT_szSmallId,
 szWorkplaceId   BOS_DT_szId,
 szPartyWpId   BOS_DT_szId,
 szOpUserId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szProductSn   BOS_DT_szSN,
 szDescription   BOS_DT_szDescription,
 decAmount1   BOS_DT_decAmount,
 decAmount2   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szCcyId   BOS_DT_szSmallId,
 szReasonId   BOS_DT_szId,
 szReasonDescription   BOS_DT_szDescription,
 bMatched   ,
 decVehicleQty   BOS_DT_decAmount,
 decBegQty   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_FSj(
szFSjId BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 dtmFSj   ,
 szSalesId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_FSjItem(
szFSjId BOS_DT_szId,
 shItemNumber   ,
 szSjTrackingId   BOS_DT_szId,
 szReasonId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bSuccess   
);
CREATE TABLE BOS_SD_FSnCorrection(
szFSnCorrectionId BOS_DT_szId,
 dtmDoc   ,
 szCustId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decAddQty   BOS_DT_decAmount,
 decDeleteQty   BOS_DT_decAmount,
 szRemark   BOS_DT_szDescription,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 bAlreadyTransferred   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_SD_FSnCorrectionItem(
szFSnCorrectionId BOS_DT_szId,
 shItemNumber   ,
 szProductSn   BOS_DT_szSN,
 shStatusSn   ,
 bTrouble   ,
 szTroubleDesc   BOS_DT_szDescription,
 szStockTypeId   BOS_DT_szId,
 dtmRentStartDate   ,
 szRentChargeCalcId   BOS_DT_szId,
 decRentPrice   BOS_DT_decAmount,
 szCurrencyId   BOS_DT_szId,
 szOrderItemType   BOS_DT_szId,
 szStatusId   BOS_DT_szSmallId,
 bTaxable   ,
 szReasonId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FSo(
szFSoId BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 szOrderTypeId   BOS_DT_szId,
 dtmOrder   ,
 dtmPrice   ,
 szCustId   BOS_DT_szId,
 decAmount   BOS_DT_decAmount,
 decTax   BOS_DT_decTax,
 decDownPayment   BOS_DT_decAmount,
 szStatus   BOS_DT_szSmallId,
 szCcyId   BOS_DT_szSmallId,
 szCcyRateId   BOS_DT_szMediumId,
 decCcyRate   BOS_DT_decCcyRate,
 szFInvoiceId   BOS_DT_szId,
 szCompletedFInvoiceId   BOS_DT_szId,
 szFirstCompletedFInvoiceId   BOS_DT_szId,
 bDropShip   ,
 szSalesId   BOS_DT_szId,
 szSalesSupervisorId   BOS_DT_szId,
 szSalesSupervisorId_2   BOS_DT_szId,
 szSalesSupervisorId_3   BOS_DT_szId,
 szSalesDivisionId   BOS_DT_szId,
 szSalesDepartmentId   BOS_DT_szId,
 szSalesTeamId   BOS_DT_szId,
 szRemark   BOS_DT_szDescription,
 szLatitude   BOS_DT_szGPSCoordinate,
 szLongitude   BOS_DT_szGPSCoordinate,
 szCustPoId   BOS_DT_szId,
 dtmCustPo   ,
 bCash   ,
 gdCreditLimitApprovedId   ,
 bNeedFInvoice   ,
 szPaymentTermId   BOS_DT_szId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 decTonase   BOS_DT_decDecimal,
 decCubication   BOS_DT_decDecimal,
 bUploadedFromMoDis   BOS_DT_bBoolean,
 szFDoReffId   BOS_DT_szId,
 dtmStartVisit   ,
 dtmEndVisit   ,
 decVisitSpendTime   BOS_DT_decAmount,
 bScanSuccess   ,
 szScanFailReason   BOS_DT_szId,
 szBarcodeScanFailReason   BOS_DT_szId,
 decJourneySpendTime   BOS_DT_decAmount,
 AdcId   BOS_DT_szId,
 dtmExpiration   
);
CREATE TABLE BOS_SD_FSoDummyCustInfo(
szFSoId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szCustNm   BOS_DT_szName,
 szCustAddress   BOS_DT_szBigDescription
);
CREATE TABLE BOS_SD_FSoItem(
szFSoId BOS_DT_szId,
 shItemNumber   ,
 szOrderItemTypeId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 dtmPriceDate   ,
 decDiscProcent   BOS_DT_decPrice,
 decQty   BOS_DT_decAmount,
 decUomQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 decPrice   BOS_DT_decPrice,
 decDiscount   BOS_DT_decAmount,
 bTaxable   ,
 decTax   BOS_DT_decTax,
 decAmount   BOS_DT_decAmount,
 decDPP   BOS_DT_decTax,
 szPaymentType   BOS_DT_szSmallId,
 szPrincipalDiscRefId   BOS_DT_szId,
 decTonase   BOS_DT_decDecimal,
 decCubication   BOS_DT_decDecimal,
 szParentId   BOS_DT_szId,
 szDistProductId   BOS_DT_szId,
 decDistQty   BOS_DT_decAmount,
 decDistPrice   BOS_DT_decPrice,
 szBudgetId   BOS_DT_szId,
 decPrincipalCostAmount   BOS_DT_decAmount,
 decPrincipalCostQty   BOS_DT_decAmount,
 bBudgetTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_FSoItemBonusSource(
szFSoId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 szPaymentType   BOS_DT_szSmallId,
 decBonusAmount   BOS_DT_decAmount,
 decBonusQty   BOS_DT_decAmount,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_SD_FSoItemDelivery(
szFSoId BOS_DT_szId,
 shItemNumber   ,
 dtmDelivery   ,
 szCustId   BOS_DT_szId,
 szFromWpId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szDjrTrackingId   BOS_DT_szId,
 szFDoId   BOS_DT_szId,
 decRemainingQty   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_FSoItemReason(
szFSoId BOS_DT_szId,
 shItemNumber   ,
 szReasonId   BOS_DT_szId,
 decQty   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_FSoProductDepositBonusItem(
szFSoId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szOrderItemTypeId   BOS_DT_szId,
 bGenByTotal   
);
CREATE TABLE BOS_SD_FSoProductDepositBonusItemBonusSource(
szFSoId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 szOrderItemTypeId   BOS_DT_szId,
 szPaymentType   BOS_DT_szSmallId,
 decBonusAmount   BOS_DT_decAmount,
 decBonusQty   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_FTO(
szFTOId BOS_DT_szId,
 szSalesOrgId   BOS_DT_szId,
 dtmFTO   ,
 szSalesId   BOS_DT_szId,
 szBaseRouteId   BOS_DT_szBigId,
 bResultFrTransfer   ,
 bVoid   ,
 bApplied   ,
 btPrintedCount   ,
 bTransferred   ,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   ,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   ,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szVehicleId   BOS_DT_szId,
 decStartKM   BOS_DT_decAmount,
 decEndKM   BOS_DT_decAmount,
 dtmStartTime   ,
 dtmEndTime   
);
CREATE TABLE BOS_SD_FTOItem(
szFTOId BOS_DT_szId,
 shItemNumber   ,
 szTOTrackingId   BOS_DT_szId,
 szReasonId   BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bSuccess   ,
 bStarted   ,
 dtmStartVisit   ,
 dtmEndVisit   ,
 decVisitSpendTime   BOS_DT_decAmount,
 szLatitude   BOS_DT_szGPSCoordinate,
 szLongitude   BOS_DT_szGPSCoordinate,
 szBarcodeScanFailReasonId   BOS_DT_szId,
 szGPSScanFailReasonId   BOS_DT_szId,
 bBarcodeScanSuccess   ,
 bGPSScanSuccess   ,
 decJourneySpendTime   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_InvoiceGroup(
szInvoiceGroupId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_InvoiceProcessing(
szInvoiceProcessingId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 bImmediateInvoice   ,
 szScheduleId   BOS_DT_szId,
 szRentScheduleId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 szPromoPriceOrderId   BOS_DT_szId,
 szInvoicePrintingType   BOS_DT_szSmallId,
 bPrintPaymentNote   ,
 bPrintSNReport   ,
 bPrintAccountStatement   ,
 bPrintDeliveryReport   ,
 decProcessIfAmount   BOS_DT_decAmount,
 decProcessIfDlvCnt   BOS_DT_decAmount,
 szPriceId   BOS_DT_szId,
 szPromoPriceId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_Marketshare(
szYear ,
 szCategoryProduct   ,
 szZipCode   ,
 decConsumtionPerCapita   
);
CREATE TABLE BOS_SD_MGM_ADC(
AdcId BOS_DT_szId,
 AdcName   BOS_DT_szName,
 Target   BOS_DT_decAmount,
 Qty   BOS_DT_decAmount,
 qtyFormat   BOS_DT_szId,
 dtmLastUpdated   ,
 szWorkplaceId   BOS_DT_szId
);
CREATE TABLE BOS_SD_MGM_Area(
szWorkplaceId BOS_DT_szId,
 szAreaId   BOS_DT_szId,
 szAreaName   BOS_DT_szName,
 szRouteType   BOS_DT_szSmallId,
 szOpUserId   BOS_DT_szId,
 szRefId   BOS_DT_szName,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szTeamId   BOS_DT_szId
);
CREATE TABLE BOS_SD_MGM_Area_DRAFT(
szWorkplaceId BOS_DT_szId,
 szAreaId   BOS_DT_szId,
 szAreaName   BOS_DT_szName,
 szRouteType   BOS_DT_szSmallId,
 szOpUserId   BOS_DT_szId,
 szRefId   BOS_DT_szName,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szTeamId   BOS_DT_szId
);
CREATE TABLE BOS_SD_MGM_Target(
szTargetId ,
 szDescription   ,
 iMonthFr   ,
 iYearFr   ,
 iMonthTo   ,
 iYearTo   ,
 szColType1   ,
 szColType2   ,
 szColType3   ,
 szColType4   ,
 szColType5   ,
 dtmActualLastUpdated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_MGM_TargetItem(
szTargetId ,
 szCol1   ,
 szCol2   ,
 szCol3   ,
 szCol4   ,
 szCol5   ,
 decTarget   ,
 decActual   
);
CREATE TABLE BOS_SD_OrgStru_DiscountGroup(
szDiscountGroupId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_OrgStru_PrincipalDiscRef(
szPrincipalDiscRefId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szSupplierId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szAdditionalRefNo   BOS_DT_szId,
 dtmValidStart   ,
 dtmValidEnd   ,
 szBudgetType   BOS_DT_szId,
 decBudgetValue   BOS_DT_decDecimal,
 decBudgetRemainValue   BOS_DT_decDecimal,
 decBudgetQty   BOS_DT_decDecimal,
 decBudgetRemainQty   BOS_DT_decDecimal,
 decPrincipalPercentage   BOS_DT_decDecimal,
 szStatus   BOS_DT_szId,
 szBudgetId   BOS_DT_szId
);
CREATE TABLE BOS_SD_OutletCoverage(
szZipCode ,
 decOutletQty   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_SD_PriceMatrix(
szPriceMatrixId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 szEntity1   BOS_DT_szName,
 szEntity2   BOS_DT_szName,
 szEntity3   BOS_DT_szName,
 szEntity4   BOS_DT_szName,
 szEntity5   BOS_DT_szName,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_PriceMatrixItem(
szPriceMatrixId BOS_DT_szId,
 shItemNo   ,
 szEntity1   BOS_DT_szName,
 szEntity2   BOS_DT_szName,
 szEntity3   BOS_DT_szName,
 szEntity4   BOS_DT_szName,
 szEntity5   BOS_DT_szName,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId
);
CREATE TABLE BOS_SD_RemainStockInCustomer(
szCustId BOS_DT_szId,
 dtmDate   ,
 szProductId   BOS_DT_szId,
 decUomRemainQty   BOS_DT_decQty,
 decRemainQty   BOS_DT_decQty,
 decUomDisplayQty   BOS_DT_decQty,
 decDisplayQty   BOS_DT_decQty,
 szUomId   BOS_DT_szMediumId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szProductCategory   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 szRoutineType   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szTeamId   BOS_DT_szId
);
CREATE TABLE BOS_SD_RentalProduct(
szSerNum BOS_DT_szSN,
 szCustId   BOS_DT_szId,
 szOrderItemType   BOS_DT_szId,
 bTaxable   ,
 decCharge   BOS_DT_decAmount,
 szCcyId   BOS_DT_szSmallId,
 dtmLastInvoiced   ,
 dtmPrevLastInvoiced   ,
 szStatusId   BOS_DT_szSmallId,
 bTrouble   ,
 szTroubleDescr   BOS_DT_szDescription,
 szRentChargeCalcId   BOS_DT_szId,
 szUrl   BOS_DT_szUrl,
 szTrnId   BOS_DT_szMediumId,
 szDocId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 szReasonId   BOS_DT_szId
);
CREATE TABLE BOS_SD_RentChargeCalc(
szRentChargeCalcId BOS_DT_szId,
 szChargeCalcType   BOS_DT_szSmallId,
 decValue1   BOS_DT_decAmount,
 decValue2   BOS_DT_decAmount,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_Report2_PerformanceProduct(
dtmDaily ,
 szRegional   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 szSupervisorId_1   BOS_DT_szId,
 szSupervisorId_2   BOS_DT_szId,
 szSupervisorId_3   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 bVisit   ,
 decSales   BOS_DT_decQty,
 decAvail_In   BOS_DT_decQty,
 decAvail_Out   BOS_DT_decQty,
 decDist   BOS_DT_decQty,
 decOOS   BOS_DT_decQty,
 decOOSC   BOS_DT_decQty,
 decBNS   BOS_DT_decQty
);
CREATE TABLE BOS_SD_Report2_PerformanceVisit(
dtmDaily ,
 szRegional   BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 szSupervisorId_1   BOS_DT_szId,
 szSupervisorId_2   BOS_DT_szId,
 szSupervisorId_3   BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decCover   BOS_DT_decQty,
 decTarget   BOS_DT_decQty,
 decActualVisit   BOS_DT_decQty,
 decOutOfRoute   BOS_DT_decQty,
 decTotalVisit   BOS_DT_decQty,
 decEffectiveVisit   BOS_DT_decQty
);
CREATE TABLE BOS_SD_Route(
szRouteId BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 szWorkplaceId   BOS_DT_szId,
 szAreaId   BOS_DT_szId,
 szRouteType   BOS_DT_szSmallId,
 szScheduleId   BOS_DT_szId,
 szOpUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_Route_DRAFT(
szRouteId BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 szWorkplaceId   BOS_DT_szId,
 szAreaId   BOS_DT_szId,
 szRouteType   BOS_DT_szSmallId,
 szScheduleId   BOS_DT_szId,
 szOpUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SD_RouteItem(
szRouteId BOS_DT_szBigId,
 intItemNumber   ,
 szCustId   BOS_DT_szId
);
CREATE TABLE BOS_SD_RouteItem_DRAFT(
szRouteId BOS_DT_szBigId,
 intItemNumber   ,
 szCustId   BOS_DT_szId
);
CREATE TABLE BOS_SD_SalesOrganization(
szSalesOrgId BOS_DT_szId,
 szName   BOS_DT_szName,
 szDescription   BOS_DT_szDescription,
 szFullPathId   ,
 byteLevel   ,
 szParentSalesOrgId   BOS_DT_szId,
 szPriceId   BOS_DT_szId,
 szPriceOrderId   BOS_DT_szId,
 szPromoPriceId   BOS_DT_szId,
 szPromoPriceOrderId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SD_SalesTarget(
iYear ,
 iMonth   ,
 szSalesId   BOS_DT_szId,
 szProductCategoryId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decQty,
 decAmount   BOS_DT_decAmount
);
CREATE TABLE BOS_SD_SjTracking(
szSjTrackingId BOS_DT_szId,
 szCustId   BOS_DT_szId,
 szFCallId   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 szFSjId   BOS_DT_szId,
 bFinished   ,
 bSuccess   ,
 bTasked   ,
 dtmNext   ,
 btTrialCount   
);
CREATE TABLE BOS_SD_Target(
decYear ,
 decMonth   ,
 szWorkplaceId   BOS_DT_szId,
 szProductId   BOS_DT_szId,
 decTargetQty   BOS_DT_decAmount,
 decTargetAmount   BOS_DT_decAmount,
 dtmCreated   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_SD_TOTracking(
szTOTrackingId BOS_DT_szId,
 szType   BOS_DT_szSmallId,
 szCustId   BOS_DT_szId,
 szFSoId   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 szFTOId   BOS_DT_szId,
 bFinished   ,
 bSuccess   ,
 bTasked   ,
 dtmNext   ,
 btTrialCount   ,
 szTeamId   BOS_DT_szId,
 szScheduleId   BOS_DT_szId,
 decValue   BOS_DT_decAmount,
 szFCallId   BOS_DT_szId,
 decCustSalesTarget   BOS_DT_decAmount,
 dtmLastUpdated   
);
CREATE TABLE BOS_SD_TOTrackingProduct(
szTOTrackingId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 decQty   BOS_DT_decAmount,
 szUomId   BOS_DT_szMediumId,
 szOrderItemTypeId   BOS_DT_szId,
 szParentId   BOS_DT_szId
);
CREATE TABLE BOS_SD_VisibilityInCustomer(
szCustId BOS_DT_szId,
 dtmDate   ,
 szVisibilityId   BOS_DT_szId,
 dtmLastUpdated   ,
 bVisible   BOS_DT_bBoolean,
 szWorkplaceId   ,
 szSalesId   BOS_DT_szId
);
CREATE TABLE BOS_SD_VisibilityInCustomerImage(
szCustId BOS_DT_szId,
 dtmDate   ,
 szVisibilityId   BOS_DT_szId,
 szSalesId   BOS_DT_szId,
 shItemNumber   ,
 szImageData   ,
 szWorkplaceId   BOS_DT_szId
);
CREATE TABLE BOS_SM_BlackListPasswords(
ID ,
 szPassword   BOS_DT_szName
);
CREATE TABLE BOS_SM_Boq(
szBoqTemplateId BOS_DT_szBigId,
 szBoqName   BOS_DT_szBigId,
 szBoqId   BOS_DT_szBigId,
 szSelectClause   BOS_DT_szMessage,
 szOrderByClause   BOS_DT_szMessage,
 szWhereClause   BOS_DT_szMessage,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SM_BoqLastUsed(
szBoqTemplateId BOS_DT_szBigId,
 szBoqName   BOS_DT_szBigId,
 szUserId   BOS_DT_szId,
 szBoqId   BOS_DT_szBigId,
 dtmLastUpdated   
);
CREATE TABLE BOS_SM_BoqTemplate(
szBoqTemplateId BOS_DT_szBigId,
 szBoqName   BOS_DT_szBigId,
 szFromClause   ,
 szDescription   BOS_DT_szDescription,
 bSystemBoq   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 szWorkplaceFilter   BOS_DT_szBigId,
 szCompanyFilter   BOS_DT_szBigId
);
CREATE TABLE BOS_SM_BosObjectTemplate(
szClassName BOS_DT_szName,
 szDesc   BOS_DT_szDescription,
 szAuthor   BOS_DT_szName,
 szModuleCode   BOS_DT_szSmallId,
 bProvideAuditTrail   
);
CREATE TABLE BOS_SM_BosObjectTemplateItem(
szClassName BOS_DT_szName,
 btLevel   ,
 szFieldName   BOS_DT_szName,
 szFieldType   BOS_DT_szSmallId,
 sLength   ,
 bPrimaryKey   ,
 szDesc   BOS_DT_szDescription,
 btItemNumber   
);
CREATE TABLE BOS_SM_BosTxAuditTrail(
gdTxId ,
 szDescription   BOS_DT_szDescription,
 szUserId   BOS_DT_szId,
 dtmCommitted   
);
CREATE TABLE BOS_SM_BosTxAuditTrailItem(
gdTxId ,
 siItemNumber   ,
 gdRecordAuditTrailId   ,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_SM_ConfigInfoItem(
szConfigTemplateId BOS_DT_szBigId,
 szConfigItemTypeId   BOS_DT_szSmallId,
 szConfigItemId   BOS_DT_szBigId,
 szConfigItemTypeValue   BOS_DT_szBigId,
 szValue   BOS_DT_szName,
 gdAuditTrailId   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SM_ConfigItemType(
szConfigItemTypeId BOS_DT_szSmallId,
 szDesc   BOS_DT_szDescription
);
CREATE TABLE BOS_SM_ConfigTemplate(
szConfigTemplateId BOS_DT_szBigId,
 szDesc   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SM_ConfigTemplateItem(
szConfigTemplateId BOS_DT_szBigId,
 szConfigItemTypeId   BOS_DT_szSmallId,
 szConfigItemId   BOS_DT_szBigId,
 szDefaultValue   BOS_DT_szName,
 szDesc   BOS_DT_szDescription
);
CREATE TABLE BOS_SM_ExtensionMaster(
uri BOS_DT_szUri,
 uriExtension   BOS_DT_szUri
);
CREATE TABLE BOS_SM_Group(
szGroupId BOS_DT_szId,
 szFullPathGroupId   ,
 byteLevel   ,
 szName   BOS_DT_szName,
 gdAuditTrailId   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SM_GroupUser(
szGroupId BOS_DT_szId,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_SM_LangDict(
szDictId BOS_DT_szBigId,
 szDesc   BOS_DT_szDescription
);
CREATE TABLE BOS_SM_LangDictItem(
szDictId BOS_DT_szBigId,
 szMsgTypeId   BOS_DT_szSmallId,
 szLangId   BOS_DT_szSmallId,
 szTextId   BOS_DT_szSmallId,
 szText   ,
 bHasChanged   ,
 szContentId   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_SM_LangMsgType(
szMsgTypeId BOS_DT_szSmallId,
 szDesc   BOS_DT_szDescription
);
CREATE TABLE BOS_SM_Language(
szLangId BOS_DT_szSmallId,
 szName   BOS_DT_szName
);
CREATE TABLE BOS_SM_LoginLog(
logDate ,
 szUserId   BOS_DT_szId,
 gdHistoryId   ,
 szActivityType   BOS_DT_szId,
 dtmLastUpdated   
);
CREATE TABLE BOS_SM_PrinterDriver(
szPrinterId BOS_DT_szId,
 szName   BOS_DT_szName,
 szBarcodePrinterId   BOS_DT_szSmallId,
 szPrinterType   BOS_DT_szId
);
CREATE TABLE BOS_SM_PrinterDriverItem(
szPrinterId BOS_DT_szId,
 szCommandName   BOS_DT_szName,
 szCommandCode   ,
 shCharWidth   ,
 szDescription   BOS_DT_szDescription
);
CREATE TABLE BOS_SM_SecInfo(
szGroupId BOS_DT_szId,
 szSecTplId   BOS_DT_szBigId,
 bLock   ,
 gdAuditTrailId   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SM_SecInfoItem(
szGroupId BOS_DT_szId,
 szSecTplId   BOS_DT_szBigId,
 szSecInfoItemId   BOS_DT_szBigId,
 szValue   BOS_DT_szName,
 StartTime1   ,
 EndTime1   ,
 StartTime2   ,
 EndTime2   ,
 bTimelyAccess   
);
CREATE TABLE BOS_SM_SecTemplate(
szSecTplId BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_SM_SecTemplateItem(
szSecTplId BOS_DT_szBigId,
 szSecInfoItemId   BOS_DT_szBigId,
 szDescription   BOS_DT_szDescription,
 szDefaultValue   BOS_DT_szName
);
CREATE TABLE BOS_SM_User(
szUserId BOS_DT_szId,
 szName   BOS_DT_szName,
 decPasswordHash   BOS_DT_decAmount,
 szWorkplaceId   BOS_DT_szId,
 gdAuditTrailId   ,
 bClearPDC   BOS_DT_bBoolean,
 dtmPasswordExpiredDate   ,
 bFirstTimeLogin   BOS_DT_bBoolean,
 dtmLockedForLogin   ,
 iWrongLoginCounter   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 dtmLoginExpiredDate   ,
 szApplicationClass   BOS_DT_szId
);
CREATE TABLE BOS_SM_UserPasswordHistories(
szUserId BOS_DT_szId,
 decPasswordHash   BOS_DT_decDecimal,
 intItemNumber   
);
CREATE TABLE BOS_SM_WrongLoginAttemptsLog(
ID ,
 szUserId   BOS_DT_szId,
 dtmAppServerTime   
);
CREATE TABLE BOS_SSE_Prospect(
szProspectId BOS_DT_szId,
 szName   BOS_DT_szBigDescription,
 szRemark   BOS_DT_szVeryBigMessage,
 szFolder   BOS_DT_szBigPath,
 szProspectorId   BOS_DT_szId,
 szCategory_1   BOS_DT_szBigId,
 szCategory_2   BOS_DT_szBigId,
 szCategory_3   BOS_DT_szBigId,
 szCategory_4   BOS_DT_szBigId,
 szCategory_5   BOS_DT_szBigId,
 szCategory_6   BOS_DT_szBigId,
 szCategory_7   BOS_DT_szBigId,
 szCategory_8   BOS_DT_szBigId,
 szCategory_9   BOS_DT_szBigId,
 szCategory_10   BOS_DT_szBigId,
 dtmTargetDeal   ,
 decTargetAmount   BOS_DT_decAmount,
 szCcyId   BOS_DT_szSmallId,
 szContactPerson   BOS_DT_szBigDescription,
 szRoomNo   BOS_DT_szSmallName,
 szFloor   BOS_DT_szSmallName,
 szBuilding   BOS_DT_szName,
 szAddress_1   BOS_DT_szName,
 szAddress_2   BOS_DT_szName,
 szDistrict   BOS_DT_szName,
 szCity   BOS_DT_szName,
 szZipCode   BOS_DT_szMediumId,
 szState   BOS_DT_szMediumName,
 szCountry   BOS_DT_szMediumName,
 szPhoneNo_1   BOS_DT_szName,
 szPhoneNo_2   BOS_DT_szName,
 szFaxNo   BOS_DT_szName,
 szMobileNo   BOS_DT_szName,
 szEmail   BOS_DT_szDescription,
 szWebSite   BOS_DT_szName
);
CREATE TABLE BOS_SSE_ProspectAction(
szProspectId BOS_DT_szId,
 dtmAction   ,
 bLastAction   ,
 szAction   BOS_DT_szId,
 szRemark   BOS_DT_szVeryBigMessage,
 szUserId   BOS_DT_szId,
 bNextAction   ,
 dtmNextAction   ,
 szNextActionRemark   BOS_DT_szBigMessage,
 szNextActionUserId   BOS_DT_szId,
 cntRemindMe   ,
 szMonitoredByUserId   BOS_DT_szId
);
CREATE TABLE BOS_SYNC_Anchor(
szUri ,
 dtmLastClientAnchor   ,
 dtmLastServerAnchor   
);
CREATE TABLE BOS_SYNC_DataLogItem(
syncSendDate ,
 syncType   BOS_DT_szId,
 syncReported   BOS_DT_szId,
 workplaceId   BOS_DT_szId,
 uri   BOS_DT_szUri,
 docId1   BOS_DT_szId,
 docId2   BOS_DT_szId,
 docId3   BOS_DT_szId,
 docId4   BOS_DT_szId,
 docId5   BOS_DT_szId,
 docId6   BOS_DT_szId,
 bUpdate   ,
 bDelete   ,
 bSuccess   ,
 errorMessage   BOS_DT_szMessage,
 dtmLastUpdated   
);
CREATE TABLE bos_sync_deleteobject(
szUri BOS_DT_szUri,
 szId1   BOS_DT_szBigId,
 szId2   BOS_DT_szBigId,
 szId3   BOS_DT_szBigId,
 szId4   BOS_DT_szBigId,
 szId5   BOS_DT_szBigId,
 szId6   BOS_DT_szBigId,
 dtmLastUpdated   ,
 bForSyncClient   
);
CREATE TABLE BOS_SYNC_ErrorLog(
WorkplaceId ,
 ErrorMessage   ,
 LastUpdated   ,
 Uri   ,
 CreatedBy   ,
 BufferSize   ,
 MemoryUsed   
);
CREATE TABLE BOS_SYNC_SuccessLog(
WorkplaceId ,
 Uri   ,
 PreUpdateCount   ,
 UpdateCount   ,
 PreDeleteCount   ,
 DeleteCount   ,
 LastUpdated   ,
 LastAnchor   ,
 CreatedBy   ,
 EndParamTime   ,
 CreateDate   ,
 BufferSize   ,
 MemoryUsed   
);
CREATE TABLE BOS_SYNC_SyncObject(
szUri BOS_DT_szUri,
 iSyncDirection   ,
 bSupportDataLog   BOS_DT_bBoolean
);
CREATE TABLE BOS_SYNC_SyncSchedule(
szURI BOS_DT_szUri,
 syncDirection   ,
 iScheduleType   ,
 dtmScheduleInterval   ,
 dtmLastUpdated   ,
 bSupportDataLog   BOS_DT_bBoolean
);
CREATE TABLE BOS_SYNC_SyncServer(
szServerName ,
 szDestAddress   ,
 szUsername   ,
 szPassword   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_SYNC_Transformation(
szClientUri BOS_DT_szBigId,
 szDestServer   ,
 szServerUri   BOS_DT_szBigId,
 szServerId   
);
CREATE TABLE BOS_SYNC_UploadAnchor(
szUri BOS_DT_szUri,
 szWorkplaceId   BOS_DT_szId,
 dtmLastUpdated   ,
 dtmStartAnchor   ,
 dtmEndAnchor   
);
CREATE TABLE BOS_TIN_CustTaxIndConfig(
szCustId BOS_DT_szId,
 szTaxIndConfigId   BOS_DT_szId,
 szNPWP   BOS_DT_szTaxId,
 szPKP   BOS_DT_szTaxId,
 dtmPKP   ,
 szTaxTrnId   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_TIN_FakturPajak(
szFakturPajakId BOS_DT_szId,
 dtmFakturPajak   ,
 szCustId   BOS_DT_szId,
 szCustNm   BOS_DT_szName,
 szCustAddr   BOS_DT_szBigDescription,
 szCustNpwp   BOS_DT_szTaxId,
 szCompId   BOS_DT_szId,
 szCompNm   BOS_DT_szName,
 szCompAddr   BOS_DT_szBigDescription,
 szCompNpwp   BOS_DT_szTaxId,
 szCompPkpNo   BOS_DT_szTaxId,
 dtmCompPkpTg   ,
 szTaxIndConfigId   BOS_DT_szId,
 bIncludeTax   ,
 shFakturType   ,
 decAmount   BOS_DT_decAmount,
 decDiscount   BOS_DT_decAmount,
 decDPP   BOS_DT_decTax,
 decPPN   BOS_DT_decTax,
 szCcyId   BOS_DT_szSmallId,
 bResultFrTransfer   BOS_DT_bBoolean,
 bVoid   BOS_DT_bBoolean,
 bApplied   BOS_DT_bBoolean,
 btPrintedCount   ,
 bTransferred   BOS_DT_bBoolean,
 szCompanyId   BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 bNeedApproval   BOS_DT_bBoolean,
 gdApprovedId   ,
 szFJournalId   BOS_DT_szId,
 dtmCreated   ,
 bSystemCreated   BOS_DT_bBoolean,
 szUserId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   ,
 shTaxIndConfigType   ,
 szFakturPajakType   BOS_DT_szId,
 szReturnRefId   BOS_DT_szBigId,
 szCustReturnTaxRefNote   BOS_DT_szBigId
);
CREATE TABLE BOS_TIN_FakturPajakItem(
szFakturPajakId BOS_DT_szId,
 shItemNumber   ,
 szProductId   BOS_DT_szId,
 szProductNm   BOS_DT_szName,
 decQty   BOS_DT_decAmount,
 decPrice   BOS_DT_decAmount,
 decSubTotal   BOS_DT_decAmount,
 decDiscount   BOS_DT_decAmount,
 decDPP   BOS_DT_decTax,
 decTax   BOS_DT_decTax,
 decTaxRate   BOS_DT_decAmount,
 decReturnQtyRemaining   BOS_DT_decAmount
);
CREATE TABLE BOS_TIN_FakturPajakItemInvoiceSource(
szFakturPajakId BOS_DT_szBigId,
 shItemNumber   ,
 szInvoiceId   BOS_DT_szBigId
);
CREATE TABLE BOS_TIN_Serial_Registration(
szTaxEntityId BOS_DT_szId,
 szNoReff   BOS_DT_szBigId,
 dtmEntryDate   ,
 dtmExpiredDate   ,
 szPrefix   ,
 decStartNumber   ,
 decEndNumber   ,
 dtmLastUpdated   
);
CREATE TABLE BOS_TIN_TaxAllocation(
szWorkplaceId BOS_DT_szId,
 szFakturPajakId   BOS_DT_szId,
 bUseAllocated   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE BOS_TIN_TaxExportLog(
shLogId ,
 szFakturPajakId   BOS_DT_szBigId,
 dtmExport   ,
 szFilename   BOS_DT_szName,
 szFilelocation   BOS_DT_szBigPath,
 szUserId   BOS_DT_szId
);
CREATE TABLE BOS_TIN_TaxIndConfig(
szTaxIndConfigId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 shFakturType   ,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean,
 shTaxIndConfigType   
);
CREATE TABLE BOS_TIN_TaxSerialAllocation(
szTaxEntityId BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szPrefix   BOS_DT_szId,
 szNoReffId   BOS_DT_szBigId,
 decStartNumber   ,
 decEndNumber   ,
 dtmStart   ,
 dtmExpired   ,
 szLastAllocated   BOS_DT_szBigId,
 dtmLastUpdated   ,
 bAlreadyTransferred   
);
CREATE TABLE BOS_TIN_TaxSerialAllocationItem(
szTaxEntityId BOS_DT_szId,
 szWorkplaceId   BOS_DT_szId,
 szPrefix   BOS_DT_szId,
 szNoReffId   BOS_DT_szBigId,
 decNumber   ,
 szFakturPajakId   BOS_DT_szBigId,
 dtmLastUpdated   ,
 bUseAllocated   
);
CREATE TABLE BOS_TIN_TaxTrn(
szTaxTrnId BOS_DT_szId,
 szDescription   BOS_DT_szDescription,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE PADMA_AddOn_ActiveCustomerByBrand(
szCustId ,
 szBrandId   ,
 szActivityStatus   ,
 dtmLastChangeActivityStatus   
);
CREATE TABLE PADMA_AddOn_CustPaymentFeedback(
szCustPaymentType ,
 szFCustPaymentId   ,
 shItemNumber   ,
 szInvoiceId   ,
 shDetailNumber   ,
 szReasonId   ,
 dtmLastUpdated   ,
 szRemark   
);
CREATE TABLE PADMA_AddOn_CustPaymentFeedbackReason(
szReasonId ,
 szDescription   ,
 dtmLastUpdated   
);
CREATE TABLE PADMA_GL_MultiCompCounter(
szCompanyID BOS_DT_szMediumId,
 szWorkplaceID   BOS_DT_szId,
 szFlexiKeyID   BOS_DT_szId,
 szDOCounterID   BOS_DT_szId,
 szInvoiceCounterID   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE PADMA_GL_MultiCompProdMapping(
szCompanyID BOS_DT_szMediumId,
 szProductCategoryID   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);
CREATE TABLE PADMA_SD_MultiCompDocNumbering(
szCompanyId BOS_DT_szMediumId,
 szWorkplaceId   BOS_DT_szId,
 szTrnType   BOS_DT_szId,
 szInternalDocId   BOS_DT_szId,
 szProductCategoryId   BOS_DT_szId,
 szTaxEntityId   BOS_DT_szId,
 dtmDate   ,
 szExternalDocId   BOS_DT_szId,
 dtmLastUpdated   ,
 bAlreadyTransferred   BOS_DT_bBoolean
);

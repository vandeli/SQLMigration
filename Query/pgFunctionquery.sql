--Function = 17 item
--==================================================================
CREATE FUNCTION GetStockTransferTrnId (p_trnId BOS_DT_szId)
RETURNS BOS_DT_szId AS $$
DECLARE d_return BOS_DT_szId;
BEGIN
    SET d_return := (SELECT *,
	CASE
		WHEN (szRuleTransfer = 'INTER') AND (iStatus = 1) THEN 'FDn'
		WHEN (szRuleTransfer = 'INTER') AND (iStatus = 2) THEN 'FStin'
		WHEN (szRuleTransfer = 'INTRA1' OR szRuleTransfer = 'INTRA2') THEN 'FStintern'
		WHEN (szRuleTransfer = 'SUPPLIER') AND (iStatus = 1) THEN 'FSrt'
		WHEN (szRuleTransfer = 'SUPPLIER') AND (iStatus = 2) THEN 'FSrc'
		WHEN (szRuleTransfer = 'RELEASE') THEN 'FDo'
		WHEN (szRuleTransfer = 'REVERSAL') THEN 'FAdj'
		ELSE ''
	END 
    FROM BOS_INV_StockTransferType 
	WHERE szStockTransferTypeId = p_trnId
	LIMIT 1);   
RETURN d_return;
END;
$$  LANGUAGE plpgsql;
--=============================================
CREATE FUNCTION KGenBitApplyToStringApply (p_value smallint)
RETURNS varchar(20) AS $$
DECLARE d_retVal varchar(20);
BEGIN
     IF p_value > 0   THEN
        d_retVal := 'Sudah dilaksanakan';
	ELSE
		d_retVal := 'Belum dilaksanakan';
	END IF;
RETURN d_retVal;
END;
$$  LANGUAGE plpgsql;
--===================================================
CREATE FUNCTION KGenBitTroubleToStringTrouble (p_value bit)
RETURNS varchar(20) AS $$
DECLARE d_retVal varchar(20);
BEGIN
	IF p_value > 0   THEN
        d_retVal := 'Trouble';
	END IF;
RETURN d_retVal;
END;
$$  LANGUAGE plpgsql;
--=========================================================
CREATE FUNCTION KGenEqualIntToYesNo (p_leftOperand integer, p_rightOperand integer)
RETURNS varchar(3) AS $$

BEGIN
	IF p_leftOperand = p_rightOperand   THEN
        RETURN 'YES';
	ELSE
		RETURN 'NO';
	END IF;

END;
$$  LANGUAGE plpgsql;

--========================================================
CREATE FUNCTION KGenFalseBitToZeroOne (p_value bit)
RETURNS numeric AS $$
DECLARE d_retVal numeric;
BEGIN
	IF p_value = 0   THEN
        d_retVal := 1;
	ELSE
		d_retVal := 0;
	END IF;
RETURN d_retVal;
END;
$$  LANGUAGE plpgsql;
--===============================================
CREATE FUNCTION KGenFInvoiceToBeFaktured (p_bTaxReported bit, p_szFakturPajakId BOS_DT_szBigId)
RETURNS BOS_DT_szBigId AS $$
DECLARE d_retVal BOS_DT_szBigId;
BEGIN
	IF p_bTaxReported > 0   THEN
        d_retVal := p_szFakturPajakId;
	ELSE
		d_retVal := '';
	END IF;
RETURN d_retVal;
END;
$$  LANGUAGE plpgsql;

--=============================================================
CREATE FUNCTION KGenGreaterThenEqualIntToYesNo (p_leftOperand integer, p_rightOperand integer)
RETURNS varchar(3) AS $$

BEGIN
	IF p_leftOperand >= p_rightOperand   THEN
        RETURN 'YES';
	ELSE
		RETURN 'NO';
	END IF;

END;
$$  LANGUAGE plpgsql;
--===============================================================
CREATE FUNCTION KGenGreaterThenIntToYesNo (p_leftOperand integer, p_rightOperand integer)
RETURNS varchar(3) AS $$

BEGIN
	IF p_leftOperand > p_rightOperand   THEN
        RETURN 'YES';
	ELSE
		RETURN 'NO';
	END IF;

END;
$$  LANGUAGE plpgsql;
--=====================================================================
CREATE FUNCTION KGenLessThenEqualIntToYesNo (p_leftOperand integer, p_rightOperand integer)
RETURNS varchar(3) AS $$

BEGIN
	IF p_leftOperand <= p_rightOperand   THEN
        RETURN 'YES';
	ELSE
		RETURN 'NO';
	END IF;

END;
$$  LANGUAGE plpgsql;
--============================================================
CREATE FUNCTION KGenLessThenIntToYesNo (p_leftOperand integer, p_rightOperand integer)
RETURNS varchar(3) AS $$

BEGIN
	IF p_leftOperand < p_rightOperand   THEN
        RETURN 'YES';
	ELSE
		RETURN 'NO';
	END IF;

END;
$$  LANGUAGE plpgsql;
--====================================================================
CREATE FUNCTION KGenLocationTypeToName (p_szLocId BOS_DT_szId)
RETURNS varchar(50) AS $$
DECLARE d_szLocNm BOS_DT_szName;
BEGIN
	IF p_szLocId = 'CUS' THEN
		d_szLocNm := 'CUSTOMER';
	elseif p_szLocId = 'WAR' THEN
		d_szLocNm = 'WAREHOUSE';
	elseif p_szLocId = 'SUP' THEN
		d_szLocNm := 'SUPPLIER';
	elseif p_szLocId = 'FAC' THEN
		d_szLocNm := 'FACTORY';
	elseif p_szLocId = 'VEH' THEN
		d_szLocNm := 'VEHICLE';
	elseif p_szLocId = 'CAR' THEN
		d_szLocNm := 'CARRIER';
	elseif p_szLocId = 'EMP' THEN
		d_szLocNm := 'EMPLOYEE';
	END IF;
RETURN d_szLocNm;
END;
$$  LANGUAGE plpgsql;
--==========================================================
CREATE FUNCTION KGenPaymentTypeToName (p_szPayId BOS_DT_szId)
RETURNS varchar(50) AS $$
DECLARE d_szPayNm BOS_DT_szName;
BEGIN
	IF p_szPayId = 'NON' THEN
		d_szPayNm := 'NONE';
	elseif p_szPayId = 'FOC' THEN
		d_szPayNm = 'FREE OF CHARGE';
	elseif p_szPayId = 'PBO' THEN
		d_szPayNm := 'PRODUCT BONUS';
	elseif p_szPayId = 'PDE' THEN
		d_szPayNm := 'PRODUCT DEPOSIT';
	elseif p_szPayId = 'DOB' THEN
		d_szPayNm := 'DO BONUS';
	elseif p_szPayId = 'IBO' THEN
		d_szPayNm := 'INVOICE BONUS';
	END IF;
RETURN d_szPayNm;
END;
$$  LANGUAGE plpgsql;

--==============================================================
CREATE FUNCTION KGenPosNegDecToFactor (p_value numeric)
RETURNS numeric AS $$
DECLARE d_retVal numeric;
BEGIN
	IF p_value >= 0 THEN
		d_retVal := 1;
	ELSE
		d_retVal := -1;
	END IF;
RETURN d_retVal;
END;
$$  LANGUAGE plpgsql;
--==================================================================
CREATE FUNCTION KGenReturnDateNoTime (p_dtmDate timestamp)
RETURNS timestamp AS $$
DECLARE d_dtmDate timestamp;
BEGIN
	d_dtmDate := DateAdd(hour, -(DatePart(hour, p_dtmDate)), p_dtmDate);
	d_dtmDate := DateAdd(minute, -(DatePart(minute, p_dtmDate)), p_dtmDate);
	d_dtmDate = DateAdd(second, -(DatePart(second, p_dtmDate)), p_dtmDate);
	d_dtmDate = DateAdd(millisecond, -(DatePart(millisecond, p_dtmDate)), p_dtmDate);
RETURN d_dtmDate;
END;
$$  LANGUAGE plpgsql;
--====================================================
CREATE FUNCTION KGenStringEmptyToNo (p_szParam varchar(20))
RETURNS varchar(3) AS $$

BEGIN
	IF p_szParam = '' THEN
		RETURN 'NO';
	ELSE
		RETURN 'YES';
	END IF;
END;
$$  LANGUAGE plpgsql;
--===================================================================
CREATE FUNCTION KGenTrnDocTypeToDescription (p_value varchar(20))
RETURNS varchar(20) AS $$
DECLARE d_retVal varchar(20);
BEGIN
	IF p_value = 'FCustPmt' THEN
		d_retVal := 'Pembayaran';
	ELSEIF p_value = 'FInv' THEN
		d_retVal := 'Tagihan';
	END IF;
RETURN d_retVal;	
END;
$$  LANGUAGE plpgsql;

--===================================================================
CREATE FUNCTION KGenTrueBitToZeroOne (p_value bit)
RETURNS numeric AS $$
DECLARE d_retVal numeric;
BEGIN
	IF p_value > 0 THEN
		d_retVal := 1;
	ELSE 
		d_retVal := 0;
	END IF;
RETURN d_retVal;	
END;
$$  LANGUAGE plpgsql;
--==================================================================
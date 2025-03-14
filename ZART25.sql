SELECT 
    ITM.ITMREF_0,
    ITM.ITMDES1_0,
    ITM.TCLCOD_0,
    ITM.XFECOD_0,
    BPS.BPSNUM_0,
    BPS.BPSNAM_0,
    ITM.PUU_0,
    ITMBPS.ITMREFBPS_0,
    ITF.REOMINQTY_0,
    ITF.MFGLOTQTY_0,
    ITM.OFS_0,
    ITF.OFS_0,
    ITF.MFGLTI_0,
    ITF.TOTLTI_0,
    ITF.MIC_0,
    ITF.QUALTI_0,
    ITF.PRPLTI_0,
    ITF.BUY_0,
    ITF.SAFSTO_0,
    ITM.ITMSTA_0,
    ITM.EANCOD_0,
    ITF.REOMGTCOD_0,
    ITM.STU_0,
    ITV.LASRCPPRI_0,
    ITV.AVC_0,
    ITC_S.VLTTOT_0,
    ITC_A.VLTTOT_0
FROM 
    ITMMASTER ITM
INNER JOIN 
    ITMBPS ON ITMBPS.ITMREF_0 = ITM.ITMREF_0
INNER JOIN 
    BPSUPPLIER BPS ON BPS.BPSNUM_0 = ITMBPS.BPSNUM_0
INNER JOIN 
    ITMFACILIT ITF ON ITF.ITMREF_0 = ITM.ITMREF_0 AND ITF.STOFCY_0 = %3%
INNER JOIN 
    ITMMVT ITV ON ITV.ITMREF_0 = ITM.ITMREF_0 AND ITV.STOFCY_0 = ITF.STOFCY_0
INNER JOIN 
    ITMCOST ITC_S ON ITC_S.STOFCY_0 = ITF.STOFCY_0 AND ITC_S.ITMREF_0 = ITM.ITMREF_0 AND %1% >= ITC_S.ITCSTRDAT_0 AND %1% <= ITC_S.ITCENDDAT_0 AND ITC_S.CSTTYP_0 = 1
INNER JOIN 
    ITMCOST ITC_A ON ITC_A.STOFCY_0 = ITF.STOFCY_0 AND ITC_A.ITMREF_0 = ITM.ITMREF_0 AND %1% >= ITC_A.ITCSTRDAT_0 AND %1% <= ITC_A.ITCENDDAT_0 AND ITC_A.CSTTYP_0 = 2
WHERE 
    ITM.ITMSTA_0 = %2%



-- Size in bytes
SELECT 
    SUM(a.total_pages) * 8 * 1024 AS [Total Size in Bytes]
FROM 
    sys.tables t
    INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id
    INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
    INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
WHERE 
    t.name = 'YourTableName';

-- Size in megabytes
SELECT 
    SUM(a.total_pages) * 8 / 1024 AS [Total Size in MB]
FROM 
    sys.tables t
    INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id
    INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
    INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
WHERE 
    t.name = 'YourTableName';

    

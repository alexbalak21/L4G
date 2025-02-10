SELECT 
    zis.itmref_0,
    itm.tclcod_0,
    (SELECT itc.csttot_0 
     FROM itmcost itc 
     WHERE itc.itmref_0 = itm.itmref_0 
       AND itc.stofcy_0 = 'AE1' 
       AND itc.csttyp_0 = 1 
       AND itc.itcseq_0 = zis.seq_0) AS csttot,
    (SELECT itc.labcst_0 
     FROM itmcost itc 
     WHERE itc.itmref_0 = itm.itmref_0 
       AND itc.stofcy_0 = 'AE1' 
       AND itc.csttyp_0 = 1 
       AND itc.itcseq_0 = zis.seq_0) AS labcst,
    (SELECT itc.mattot_0 
     FROM itmcost itc 
     WHERE itc.itmref_0 = itm.itmref_0 
       AND itc.stofcy_0 = 'AE1' 
       AND itc.csttyp_0 = 1 
       AND itc.itcseq_0 = zis.seq_0) AS mattot,
    (SELECT itc.LABLEVCST_0 
     FROM itmcost itc 
     WHERE itc.itmref_0 = itm.itmref_0 
       AND itc.stofcy_0 = 'AE1' 
       AND itc.csttyp_0 = 1 
       AND itc.itcseq_0 = zis.seq_0) AS lablevcst,
    (SELECT itc.MATLEV0_0 
     FROM itmcost itc 
     WHERE itc.itmref_0 = itm.itmref_0 
       AND itc.stofcy_0 = 'AE1' 
       AND itc.csttyp_0 = 1 
       AND itc.itcseq_0 = zis.seq_0) AS matlev
FROM 
    ZITMCSTD ZIS
LEFT OUTER JOIN 
    itmmaster itm ON itm.itmref_0 = zis.itmref_0
WHERE 
    itm.itmref_0 = 'BDC1488AL';


-- [F:ITC]ITC0 = [F:ITF]STOFCY ; [F:ITM]ITMREF ; "" ; "" ; ""
use eFactura
select * from f56BEJFEL
select * from f4201
select * from f560002

select * from DOCUMENTOS
select top 100 cbteTipo, PtoVta,CbteNro, Concepto,DocTipo, DocNro, CbteFech as CbteFch ,bjag/100 as ImpTotal, cast(cast((bjag/100) / (1 + (IVTXR1/100)) as decimal(13,2)) as float) as impNeto, BJCRCD as MonID, MonCotiz, Estado, cast(IVTXR2 as integer) as TipoIva, IVTXR1 as AlicuotaIva, cbtefchvto as cbteFchVto, cbu,  aliascbu  as aliasCbu from proddta.f56BEJFEL inner  join proddta.f4201 on BJDOCO = SHDOCO and BJDCTO = SHDCTO inner  join proddta.f560002 on SHTXA1 = IVTXA1 where TIPO='A' and ESTADO in('N','A','C')




-- actualizacion de los cuatro documetnos que generan movimiento todos los minutos de la vida para que dejen de hacerlo
-- update documentos
-- set estado_ID ='P'
-- where documento_id in ('01-001-0062-00004729', '01-001-0062-00004150', '01-001-0052-00009326', '01-001-0052-00009434')
-- corrido en prodcción el 13 de Septiembre a las 14.40


begin transaction

rollback 

Exec DOCUMENTOS_INS
'PKPKPKPK2', -- @DOCUMENTO_ID char(36), 
1, -- @EMPRESA_ID int, 
1, -- @CbteTipo int, 
1, -- @PtoVta int, 
1, -- @CbteNro int, 
1, -- @Concepto int, 
1, -- @DocTipo int, 
1, -- @DocNro bigint, 
'20111111', -- @CbteFecha char(8), 
1, -- @ImpTotal float(53), 
1, -- @ImpTotConc float(53), 
1, -- @ImpNeto float(53), 
1, -- @ImpOpEx float(53), 
1, -- @ImpIva float(53), 
1, -- @ImpTrib float(53), 
'20111111', -- @FchServDesde char(8), 
'20111111', -- @FchServHasta char(8), 
'20111111', -- @FchVtoPago char(8), 
'PES', -- @MonId char(3), 
1, -- @MonCotiz float(53), 
'A', -- @ESTADO_ID char(1), 
'AA', -- @NOTAS varchar(5000), 
'20111111', -- @FECHA_ALTA datetime, 
'20111111', -- @FECHA_ACTUALIZACION datetime, 
'20111111', -- @ERP_NOMBRE_ARCHIVO varchar(500), 
'20111111', -- @CAE varchar(14), 
'20111111', -- @cbteFchVto char(8) = NULL, 
'20111111', -- @cbu varchar(22) = NULL, 
'20111111', -- @aliasCbu varchar(22) = NULL, 
1, -- @rcbtetipo int = NULL, 
1 -- @rptovta int = NULL


select * from documentos where DOCUMENTO_ID = 'PKPKPKPK2'

  select obj.owner,obj.object_name,com.comments,tab.tablespace_name,obj.LAST_DDL_TIME 
  from all_tables tab 
  inner join all_objects obj
  on tab.table_name=obj.object_name and tab.owner=obj.owner and obj.object_type='TABLE'
  left outer join all_tab_comments com
   on tab.table_name=com.table_name and tab.owner=com.owner 
  where  obj.owner not in ('SCOTT','SYS','OUTLN','SYSTEM','DBSNMP','APPQOSSYS','CTXSYS','RDSADMIN','SYSMAN','APEX_050000','ORDDATA','ORDS_METADATA','C##DBAAS_MONITOR','FLOWS_FILES','OWBSYS','OE',
  'TIMETABLE')
  order by  obj.owner,tab.tablespace_name,obj.object_name
  
 SELECT col.owner,col.table_name,col.COLUMN_NAME ,com.comments,  col.DATA_TYPE,    
  col.DATA_LENGTH ,  col.DATA_PRECISION ,  col.DATA_SCALE ,  col.NULLABLE ,
  col.COLUMN_ID ,  col.DEFAULT_LENGTH ,  col.DATA_DEFAULT ,  
  col.CHARACTER_SET_NAME       
FROM all_tab_columns col 
left outer join ALL_COL_COMMENTS com 
on col.table_name=com.table_name and col.owner=com.owner and col.column_name=com.column_name
--where col.owner='CONFIGURACION' and col.table_name='CON_CURSO_VERSION'
  where  col.owner not in ('SCOTT','SYS','OUTLN','SYSTEM','DBSNMP','APPQOSSYS','CTXSYS','RDSADMIN','SYSMAN','APEX_050000','ORDDATA','ORDS_METADATA','C##DBAAS_MONITOR','FLOWS_FILES','OWBSYS','OE',
  'TIMETABLE')
order by col.owner,col.table_name,col.COLUMN_ID

select * from ALL_INDEXES
 
 select OBJ.OWNER,OBJ.OBJECT_TYPE,COUNT(1) from all_objects obj
 where owner not in ('SCOTT','SYS','OUTLN','SYSTEM','DBSNMP','APPQOSSYS','CTXSYS','RDSADMIN','SYSMAN','APEX_050000','ORDDATA','ORDS_METADATA','C##DBAAS_MONITOR','FLOWS_FILES','OWBSYS','OE',
  'TIMETABLE','PUBLIC','IX','HR','C##DBAAS_BACKUP','APEX_LISTENER')
  and object_type!='SYNONYM'
  GROUP BY OBJ.OWNER,OBJ.OBJECT_TYPE
  ORDER BY OBJ.OWNER,OBJ.OBJECT_TYPE 
  

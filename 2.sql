use robot_integration;
update robot_manufacturer set remark='机器人平台' where id='2';
use webapp;
insert into gray_tenants(grayNameId,tenantId,createDateTime,lastUpdateDateTime)select id,43,now(),now() from gray_name where grayName="thridPartyRobot";
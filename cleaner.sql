create table ticketids SELECT ticketid FROM swtickets WHERE dateline<1546300800;
--Query OK, 246203 rows affected (0.26 sec)
--Records: 246203 Duplicates: 0 Warnings: 0


select max(ticketid) from ticketids limit 5;
--+---------------+
--| max(ticketid) |
--+---------------+
--|       777637 |

create index swticketmessageids_ticketid on swticketmessageids (ticketid);
create index swticketposts_ticketid on swticketposts  (ticketid);


DELETE A FROM swtickets              A where  A.ticketid <= 777637;
DELETE A FROM swticketpostlocks      A where  A.ticketid <= 777637;
DELETE A FROM swticketlocks          A where  A.ticketid <= 777637;
DELETE A FROM swticketlinkchains     A where  A.ticketid <= 777637;
DELETE A FROM swticketfollowups      A where  A.ticketid <= 777637;
DELETE A FROM swticketdrafts         A where  A.ticketid <= 777637;
DELETE A FROM swattachments          A where  A.ticketid <= 777637;
DELETE A FROM swescalationpaths      A where  A.ticketid <= 777637;
DELETE A FROM swticketauditlogs      A where  A.ticketid <= 777637;
DELETE A FROM swticketlinkedtables   A where  A.ticketid <= 777637;
DELETE A FROM swticketmergelog       A where  A.ticketid <= 777637;
DELETE A FROM swticketmessageids     A where  A.ticketid <= 777637;

DELETE A FROM swticketposts          A where  A.ticketid <= 777637;

DELETE A FROM swticketrecipients     A where  A.ticketid <= 777637;
DELETE A FROM swticketwatchers       A where  A.ticketid <= 777637;

DELETE A FROM swtickettimetracks     A where  A.ticketid <= 777637;

DELETE A FROM swticketnotes          A where A.linktypeid <= 777637;
DELETE A FROM swcustomfieldvalues    A where A.typeid <= 777637;

select min(tickettimetrackid),min(ticketid)  from swtickettimetracks ;
--+------------------------+---------------+
--| min(tickettimetrackid) | min(ticketid) |
--+------------------------+---------------+
--|                1290664 |        777638 |
--+------------------------+---------------+


DELETE A FROM swtickettimetracknotes A where A.tickettimetrackid < 1290664;

drop index swticketmessageids_ticketid on swticketmessageids ;
drop index swticketposts_ticketid on swticketposts  ;


drop table ticketids ;

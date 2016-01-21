# createdomain-dbems

The Cookbook for creating a DB/EMS based TIBCO administration domain. The default attributes
can be overriden by passing custom JSON. The cookbook has recipe to create the command file
XML for the commandline domainutility, install the DB client and the JMS client jars and
execute the domainutility to add the machine to the domain. Oracle DB is used. The domain can
be either created using the thin driver or the data direct driver. The DB url can be either
using TNS or contain the hostname, port and SID. The hawkagent for the domain will be started
on successful machine addition to the domain.

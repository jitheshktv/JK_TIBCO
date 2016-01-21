# addmachine-dbems

The Cookbook for adding a TIBCO BW machine to a DB/EMS based tibco administration domain.
The domain should be up and running. The default attributes can be overriden by passing
custom JSON. The cookbook has recipe to create the command file XML for the commandline
domainutility, install the DB client and the JMS client jars and executing the domainutility
to add the machine to the domain. The hawkagent for the domain will be started on successful
machine addition to the domain.

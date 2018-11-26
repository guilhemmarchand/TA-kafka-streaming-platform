Deployment & Upgrades
#####################

Deployment matrix
=================

+----------------------+---------------------+
| Splunk roles         | required            |
+======================+=====================+
| Search head          |   yes               |
+----------------------+---------------------+
| Indexer tiers        |   yes               |
+----------------------+---------------------+
| Heavy Forwarders     |   conditional       |
+----------------------+---------------------+

*If Heavy Forwarders are used as intermediate forwarders, the TA must be deployed*

If Splunk search heads are running in Search Head Cluster (SHC), the Splunk application must be deployed by the SHC deployer.

The deployment and configuration requires the creation of a dedicated event index (by default called **kafka**), see the implementation section.

Initial deployment
==================

- The Splunk application is a tar compressed archive, which content must be placed in the apps directory of the Splunk instance

- If deployed on the Kafka component to be monitored (example: Kafka broker), the default/inputs.conf must be tuned and adapted to your context, and its inputs activated

- For SHC configurations (Search Head Cluster), extract the tgz content in the SHC deployer and publish the SHC bundle

Upgrades
========

Upgrading the Splunk application is pretty much the same operation, use one of the techniques that matches your conditions / requirements.

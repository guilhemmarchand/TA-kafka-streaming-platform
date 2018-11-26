Installation
############

Event time stamp format
=======================

**The Technology addon assumes that you rely on the default logging format provided by both Apache Kafka and Confluent stacks.**

*Example:*

::

    [2018-11-20 22:02:15,435] INFO Registered kafka:type=kafka.Log4jController MBean (kafka.utils.Log4jControllerRegistration$)


This uses the following log4j configuration:

::

    DatePattern='.'yyyy-MM-dd-HH
    layout.ConversionPattern=[%d] %p %m (%c)%n

If you are relying on a different log format, copy the default/props.conf to local/ and achieve the relevant customization.

The JVM garbage collector has its own format that is unlikely to be customized in most installation.

Indexers deployment
===================

Index creation
--------------

**By default, the Technology Addon assumes the usage of a specific index name:**

* kafka

This is optional and you can decide to create and use a different index name.

The addon will **NOT** create the default index for you. (Splunk good practice, indexes shall be configured by administrators)

Installation
------------

Follow standard Splunk deployment rules depending on your environment:

* Standalone indexers: deploy manually or using deployment solution
* Clustered indexers: deploy the TA to the cluster master, and publish the cluster bundle

If you are using Heavy Forwarders as intermediate forwarders before reaching the indexers, it is not required to deploy the TA on the indexers BUT it is required to install it on the heavy forwarders.

Search Heads deployment
=======================

Installation
------------

Follow standard Splunk deployment rules depending on your environment:

* Standalone search heads: deploy manually or using deployment solution
* Search Head Cluster: extract the content of the TA to your deployer, and publish the SHC bundle

Eventtypes customization
------------------------

If you are **NOT** using the default kafka index name, you need to customize the definition of the eventtypes.

The default eventtypes are defined in:

::

    TA-kafka-streaming-platform/default/eventtypes.conf

You can either:

* create a local/eventtypes.conf, customize the searches definition and bundle this file in your deployment
* use Splunk Web UI and achieve the modifications (must be repeated for each search heads if standalone search heads

Universal Forwarder deployment (Kafka components)
=================================================

**Deploy the Technology Addon to your Splunk Universal Forwarders that are running on the Kafka components.**

In most cases, you are using a Splunk Deployment Server (DS) to manage the configuration of Universal Forwarders.

**A default/inputs.conf is provided as an example:**

* Each input is disabled by default
* Create a local/inputs.conf that you use to activate the inputs depending on your needs and the components you are using
* Achieve any modification that would be required, if you are using different paths, different index(es) name(s), etc.

It is acceptable to push the same package to all of your Kafka components even if some inputs will only make sense on specific servers. (aka brokers inputs on zookeeper nodes)

If the inputs is activated but match files that do not exist, Splunk will simply ignore these as long as no files match the monitor definition.

Otherwise, you can as well create a full copy of the Technology Addon on a per category basis (one for Zookeeper, one for Kafla brokers, etc.) and push this package to the relevant servers.

Post-deployment verifications
=============================

**Once you have started to ingest the Kafka components logs, you want to ensure that:**

* log parsing is achieved successfully (line breaking etc) essentially if you have customized the timestamp recognition
* eventtypes are matching the actual data

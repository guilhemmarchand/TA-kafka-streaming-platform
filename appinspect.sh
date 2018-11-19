#!/bin/bash

splunk-appinspect inspect `ls TA-kafka-streaming-platform_*.tgz | head -1` --mode precert --included-tags splunk_appinspect

#!/bin/bash

sudo bash -c "echo 1 > /proc/sys/vm/drop_caches"
sudo bash -c "echo 1 > /proc/sys/vm/compact_memory"
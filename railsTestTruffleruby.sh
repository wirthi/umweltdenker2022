#!/bin/sh

#required as TruffleRuby currently crashes, parallel testing not supported due to bug in Hash implementation

export PARALLEL_WORKERS='1'
export MT_CPU='1'
rails test


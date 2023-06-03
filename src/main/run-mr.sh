#!/bin/bash

go build -buildmode=plugin ../mrapps/wc.go &

wait $!

go run mrcoordinator.go pg-*.txt &

sleep 5s

for i in {1..20}
do
    go run mrworker.go wc.so &
    sleep 1s
done

wait
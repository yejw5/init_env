#!/bin/bash
 
TEST_TIME=5

SYSTEM_TRACE_OUTPUT_FILE="system_ftrace.txt"
 
#############################################################
#       DO NOT CHANGE ANYTHING IN THE SCRIPT BELOW          #
#############################################################
shopt -s expand_aliases
 
# tracefs="/sys/kernel/debug/tracing"
tracefs="/sys/kernel/tracing"
traceEvents="${tracefs}/events/"
 
alias displayTraceBuffer='cat ${tracefs}/trace'
alias flushTraceBuffer='echo > ${tracefs}/trace'
alias turnTracingOn='echo 1 > ${tracefs}/tracing_on'
alias turnTracingOff='echo 0 > ${tracefs}/tracing_on'
alias makeTraceClockMonotonic='echo mono > ${tracefs}/trace_clock'
alias increasePerCoreTraceBufferSize='echo 50000 > ${tracefs}/buffer_size_kb'
alias enableCustomTraceEvents='echo 1 > ${traceEvents}/sched/enable;
                               # echo 1 > ${traceEvents}/syscalls/enable;
                               # echo 1 > ${traceEvents}/raw_syscalls/enable;
                               # echo 1 > ${traceEvents}/kmem/enable;'

 
configureFtrace () {
    echo "[FG-SHELL] Configuring ftrace..."
 
    turnTracingOff
    makeTraceClockMonotonic
    increasePerCoreTraceBufferSize
    enableCustomTraceEvents
}
 
collectSystemTrace () {
    echo "[FG-SHELL] Collecting system trace for ${TEST_TIME} sec..."
    flushTraceBuffer
    turnTracingOn
 
    sleep ${TEST_TIME}
    turnTracingOff
 
    echo "[FG-SHELL] Saving system trace..."
    displayTraceBuffer &> ${SYSTEM_TRACE_OUTPUT_FILE}
    flushTraceBuffer
 
    echo "[FG-SHELL] System trace can be seen here: ${SYSTEM_TRACE_OUTPUT_FILE}"
}
 
configureFtrace
collectSystemTrace

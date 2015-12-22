#!/usr/bin/env bash

source ./traffic.bash

function pause(){
   read -p "$*"
   clear
}

demo () {
    pause "Welcome to the demo. Please create the CloudFormation."
    open https://console.aws.amazon.com/cloudformation
    pause "While that runs, look at the slides."
    open https://docs.google.com/presentation/d/1p35YxWZQy-5g2BgGNcj7HaO4yf7tnv4x6i7MtgY18cE
    echo -n "Enter the ELB name: "
    read ELB
    targetelb 'http://'${ELB}'.us-east-1.elb.amazonaws.com'
    clear
    pause "Make some traffic."
    traffic > /dev/null&
    echo "Demonstrate a dashboard or monitoring service that gives insights into:"
    echo "throughput"
    echo "peak usage"
    echo "usage patterns"
    pause "request failures"
    open 'https://console.aws.amazon.com/cloudwatch/home?region=us-east-1'
    pause "Bump the nodes to max of 2."
    open 'https://console.aws.amazon.com/ec2/autoscaling/home?region=us-east-1'
    pause "Demonstrate failover behavior, what happens if a node goes down, and recovery behavior. (bomb)"
    bomb
    open 'https://console.aws.amazon.com/ec2/autoscaling/home?region=us-east-1'
    pause "Bump the nodes to max of 5."
    open 'https://console.aws.amazon.com/ec2/autoscaling/home?region=us-east-1'
    pause "Demonstrate adding new nodes to respond to request volume. (bakepie)"
    bakepie
    pause "Demo complete!"
}

demo
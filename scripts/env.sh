

# The addresses below would be the addresses we need to access from "jumpbox"
declare -a data_hosts=( "ec2-54-218-55-213.us-west-2.compute.amazonaws.com" "ec2-34-220-104-212.us-west-2.compute.amazonaws.com" "ec2-54-187-249-88.us-west-2.compute.amazonaws.com")
declare -a locator_hosts=( "ec2-54-218-55-213.us-west-2.compute.amazonaws.com"  "ec2-34-220-104-212.us-west-2.compute.amazonaws.com" )

all_hosts=( $(echo "${data_hosts[@]} ${locator_hosts[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' ') )

locators=ip-172-31-45-33.us-west-2.compute.internal[10334],ip-172-31-33-177.us-west-2.compute.internal[10334]

SSH_USER=ubuntu


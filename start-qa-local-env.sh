#!/bin/bash
# User selection
#if [ `whoami` == root ]
#then
#	echo "Please don't run this script as root!"
#	exit 0
#else
#	read -p "Do you want to setup mini local envirnoment [YES/NO]? " answer_1
#	case $answer_1 in
#		YES | yes)
#             read -p "Insert the tag version for Octopus Server: " TAG_OS;
#             read -p "Insert the tag version for Octopus Analytics: " TAG_AS;
#             read -p "Insert the tag version for Octopus Comments: " TAG_CS;
#             read -p "Insert the tag version for Octopus Ecommerce: " TAG_EC;
#             read -p "Insert the tag version for Octopus Octopush: " TAG_OP;
#             read -p "Insert the tag version for Quizz Server: " TAG_QS;
#             read -p "Insert the tag version for Signaling Server: " TAG_SS;
#             read -p "Insert the tag version for Octopus Chat Server: " TAG_OCS;
#             read -p "Insert the tag version for Octopus Subscripiton Server: " TAG_OSS;
#             read -p "Insert the tag version for Octopus Ads Server: " TAG_ADS;
#             read -p "Insert the tag version for UMS server: " TAG_UMS;
#		;;
#        NO | no) exit
#		;;
#esac
#fi
# Uncomment for testing purposes
 TAG_OS=v2.11.0
 TAG_AS=v2.7.2.1
 TAG_CS=v1.13.2
 TAG_EC=v2.3.14
 TAG_OP=v1.3.0
 TAG_QS=v1.1.1.5
 TAG_SS=v1.5.9
 TAG_OCS=v2.32.1
 TAG_OSS=v1.0.4
 TAG_ADS=v0.6.0
 TAG_UMS=v1.8.12

# Define arrays
arrayNexus=("octopus-server" "octopus-analytics" "octopus-comments" "ecommerce" "octopush" "quizz-server" "signaling-server" "octopus-chat-server" "octopus-subscription" "octopus-ads-server" "ums-server")
arrayService=("octopus-server" "octopus-analytics" "octopus-comments" "octopus-ecommerce" "octopus-octopush" "quizz-server" "signaling-server" "chat-server" "octopus-subscription" "ads-server" "ums-server")
arrayTag=("$TAG_OS" "$TAG_AS" "$TAG_CS" "$TAG_EC" "$TAG_OP" "$TAG_QS" "$TAG_SS" "$TAG_OCS" "$TAG_OSS" "$TAG_ADS" "$TAG_UMS")

# Download from Nexus Repository
echo "Downloading required services..."
for i in ${!arrayNexus[@]};
do
    wget http://nexus.carnegietechnologies.rs:8085/repository/${arrayNexus[$i]}/com/carnegietechnologies/${arrayNexus[$i]}/${arrayTag[$i]}/${arrayNexus[$i]}-${arrayTag[$i]}.tar -P ./${arrayService[$i]}
done

# Untar downloaded services into service directory
echo "Extracting files..."
for i in ${!arrayNexus[@]};
do
    tar -xf ./${arrayService[$i]}/${arrayNexus[$i]}-${arrayTag[$i]}.tar -C ./${arrayService[$i]}/
done
echo "Finished with extracting files..."

# Updating service toml files
echo "Updating service configurations..."

./scripts/rename_octopusserver.sh
./scripts/rename_analytics.sh
./scripts/rename_comments.sh
./scripts/rename_ecommerce.sh
./scripts/rename_octopush.sh
./scripts/rename_quizz.sh
./scripts/rename_signaling.sh
./scripts/rename_chat.sh
./scripts/rename_subscription.sh
./scripts/rename_ads.sh
./scripts/rename_ums.sh

echo "Finished updating configurations..."

# Starting environment
echo "QA Local environment is getting ready..please wait 5-10 minutes!"

docker-compose up -d

ticket_id=($(curl -u r8NLp36JxFp28UWLvbT3:X -H "Content-Type: application/json"  -X GET https://copart.freshservice.com/itil/changes/view/95355?format=json | jq '.[] .display_id'))
echo ${ticket_id[*]}

echo ############### We are closing above listed Changes Reuqests #################
COUNT="0"

for i in ${ticket_id[*]}; do
curl -u r8NLp36JxFp28UWLvbT3:X -H "Content-Type: application/json" -X PUT -d '{ "itil_change":{"custom_field_attributes":{"install_results_7402":"No Problems","install_issues_7402":"NA"}}}' https://copart.freshservice.com/itil/changes/$i.json
    curl -u r8NLp36JxFp28UWLvbT3:X -H "Content-Type: application/json" -X PUT -d '{ "itil_change":{"status":6}}' https://copart.freshservice.com/itil/changes/$i.json
    let COUNT++;
done



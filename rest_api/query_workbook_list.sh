#!/bin/bash

workbook_name_file="result_workbook_name.output"
project_name_file="result_project_name.output"
result_file="result_workbook_list.output"
cp /dev/null ${workbook_name_file}
cp /dev/null ${project_name_file}
cp /dev/null ${result_file}

sites=(Data Production Demo WatchMe)
for site in ${sites[@]};
do
	curl "https://tableau.vpadn.com/api/2.3/auth/signin" -X POST -d @signin_${site}.xml > token
	cred=`xmllint --format token | grep "credentials token" | awk -F'"' '{print $2}'`
	siteid=`xmllint --format token | grep "site id" | awk -F'"' '{print $2}'`

	##get workbook name list
	curl "http://tableau.vpadn.com/api/2.3/sites/${siteid}/workbooks" -X GET -H "X-Tableau-Auth:${cred}" > workbook_${site}.output
	xmllint --format workbook_${site}.output > workbook_${site}_format.output
	cat workbook_${site}_format.output | grep 'workbook id' | awk -F'"' '{print $4}' >> ${workbook_name_file}

	##get project name list
	cat workbook_${site}_format.output | grep 'project id' | awk -F'"' '{print $4}' | sed "s/^/${site}$(printf '\t')/" >> ${project_name_file}
done

paste -d'\t' ${project_name_file} ${workbook_name_file} > ${result_file}

rm -rf token
rm -rf workbook*

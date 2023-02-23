*** Variables ***
${ROOT} =    ${CURDIR}
${RESOURCES_DIR} =    ${ROOT}/Resources

${ENVIRONMENT} =    prod
${BROWSER} =    chrome
&{URL}    prod=https://globe-alpha-memo.web.app/
&{CREATOR}    Email=rpa-techno-prod-2@globe.com.ph    Password=Test12345_Pass!
&{APPROVER}    Email=rpa-techno-prod-7@globe.com.ph    Password=Test12345_Pass!
&{WATCHER}    Email=rpa-techno-prod-6@globe.com.p    Password=Test12345_Pass!
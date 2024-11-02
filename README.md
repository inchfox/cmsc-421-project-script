# CMSC 421 Project Initialization Script
Author: AJ (inchfox) <br/>
Version: v1.0.0 <br/>
Contact Email: alvaroa1@umbc.edu <br/>

<br/>

# Prerequisites
1. Accept the corresponding project. Assuming this is project N, accept it from the link your professor sent.
2. You MUST have access to your repository.
3. You have ssh-agent running AND your GitHub key has been added.
4. This script MUST be ran from within the repositories directory. AKA, here!

<br/>

# What You Need
**KNOW THE NAME OF YOUR REPOSITORY AND GROUP (where applicable)!**
<br/>
This script will prompt you for a group name. <br/>
If your repository is named "project-3-myUsername" or "project-3-groupMemberOne-groupMemberTwo",
you **NEED TO ENTER myUsername or groupMemberOne-groupMemberTwo**, <br/>whichever applicable.
<br/><br/>
**DO NOT ENTER ANYTHING ELSE OR THE SCRIPT WILL FAIL.**
<br/>
If you believe you are having unrelated issues, check the console output.
Then consult the class Discord or your Professor.
<br/>

Diagnosing:
- Do you have your ssh key added? If not, add it!
- Unable to open connection to your authentication agent? Start ssh-agent, there's guides online.
- Access Denied? Your ssh key is not configured.
- Repository does not exist? Verify that the URL printed matches your remote name.

# Usage
This script is SUPER easy to use. Trust me, you shouldn't have any sort of issues cloning
this and getting your projects setup.
<br/>
Assuming you are in the `cmsc-421-project-script` directory, run the following:
<br/>
`./clone.sh`
<br/>

Enter your **group/user name when prompted. Refer to Prerequistes if you are not sure how to find that.**
<br/>

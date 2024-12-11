# SystemSecurityScripts

Still new to batch scripting and PowerShell, I wanted to leverage AI to help me create simple scripts to automate my updates and home network security. These batch scripts are (update_windows.bat, SecureShutdown_closePorts.bat, and EnableNetwork.bat), which I developed with the assistance of CLAUDE AI. Learning to use AI to showcase how to enhance system management through scripting is another skill set that helps me keep up with technology trends within the cybersecurity industry. 

**Important Security Note:**

The batch files in this repository (`update_windows.bat`, `SecureShutdown_closePorts.bat`, and `EnableNetwork.bat`) are intended for **personal use only** on personal machines. Please be aware of the following security considerations:

- **Administrator Privileges**: These scripts require administrator rights to execute. Please ensure you have the necessary permissions to perform these actions on your machine.

- **Network Adapter Management**: 
  - `SecureShutdown_closePorts.bat` disables network adapters, potentially disrupting network services or compromising security if used inappropriately. 
  - `EnableNetwork.bat` re-enables network adapters, making the system vulnerable to network attacks if not used carefully. 

- **Process Termination**: 
  - `SecureShutdown_closePorts.bat` terminates specific web browsers. This action should only be performed on your own machine and with your own consent. Using it in a professional or shared environment without proper authority could be problematic.

- **System Shutdown**: 
  - `SecureShutdown_closePorts.bat` initiates a system shutdown, which should only be done when you have the necessary permissions and authority.





---------------------------------
# **Usage Guidelines:**

- These scripts are not intended for use in professional, corporate, or shared environments without explicit approval from system administrators or owners.
- They are provided for educational purposes or personal troubleshooting on personal devices.
- Do not use these scripts in any manner that could cause harm or disruption to systems or networks you do not have the right to manage.

**Disclaimer:**

I am not responsible for any misuse, damage, or disruption caused by these scripts. Use them at your own risk.


**For Educational Purposes:**

These scripts are shared to demonstrate scripting techniques, not to encourage or enable the violation of security measures or system integrity. If you adapt or use these scripts in any way, ensure it aligns with legal and ethical standards.

**GitHub Policy:**

So, as you know, GitHub's terms of service prohibit the distribution of content that violates the law or encourages others to do so. While these scripts are legal for personal use, sharing them on GitHub requires careful consideration of the context, potential misuse, and compliance with platform policies.

*Thank you for understanding and respecting the security implications of these scripts.*

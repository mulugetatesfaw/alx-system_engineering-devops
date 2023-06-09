# Incident report for ssh authentication problem on my ubuntu server:
## summary
On June 8th, 2023, at approximately 10:00 AM, I encountered a problem while trying to log in to my Ubuntu server using SSH. I had previously set up SSH authentication with a public key, and it had been working fine for several months. However, today I received the following error message:


Permissions 0644 for '/root/.ssh/id_rsa.pub' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "/root/.ssh/id_rsa.pub": bad permissions
ubuntu@100.25.163.14: Permission denied (publickey).

# Root Cause and Resolution
This error message indicated that the permissions on my public key file, located at /root/.ssh/id_rsa.pub, were too open. Specifically, the file had permissions of 0644, which meant that the owner had read and write access, but others had read-only access. This was not secure enough for SSH authentication, as anyone who could read the file could potentially use it to impersonate me and gain access to my server.

To fix this issue, I needed to change the permissions on the public key file to 600, which would restrict access to only the owner. To do this, I logged in to the client computer using a password instead of the public key, and then ran the following command:


chmod 600 /root/.ssh/id_rsa.pub


This command changed the permissions on the public key file to 600, which was the recommended setting for SSH authentication. After that, I tried to log in again using the public key, and this time it worked without any errors.

Upon reflection, I realized that the cause of this problem was my own mistake. When I had originally set up SSH authentication, I had accidentally used the wrong command to copy the public key from my local machine to the server. Instead of using ssh-copy-id, which would have set the correct permissions automatically, I had used scp, which had preserved the permissions of the local file. This had resulted in the public key file on the server having the wrong permissions, which had gone unnoticed until today.

To prevent similar issues in the future, I resolved to be more careful when setting up SSH authentication, and to always use ssh-copy-id instead of scp to copy public keys. I also decided to review the permissions of all my SSH-related files on the server, to ensure that they were set up correctly.

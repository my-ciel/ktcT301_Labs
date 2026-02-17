kt cloud Intermediate Course Lab: 3-Tier Architecture
-----------------------------------------------------------------

1. OVERVIEW
This project is a specialized web template designed for the "kt cloud Intermediate Course". This lab focuses on Moving beyond simple web server deployment,  building a robust 3-Tier (Web-WAS-DB) architecture. You will gain hands-on experience in inter-tier communication, Auto-scaling configurations, and the utilization of various kt cloud infrastructure services.

2. ARCHITECTURE
- Web Tier: Utilizes kt cloud Virtual Servers to receive external HTTP requests. 
- App Tier (WAS): Uses kt cloud Virtual Servers to process business logic and acts as a relay between the Web Tier and the DB Tier.
- DB Tier: A managed database layer utilizing kt cloud DBaaS for secure and scalable data storage.

3. DIRECTORY STRUCTURE
- web/: A directory containing all the frontend web assets and static resources.
- default: The Nginx configuration file used for setting up the web server and proxy.
- myapp: The core backend application binary compiled from Go source code.
- setup_was.sh: A shell script to automate the registration of the application as a systemd service.

4. LAB PROCEDURES
- Step 1: Web Server Deployment
- Step 2: Database Setup 
          Provision a kt cloud DBaaS for MySQL instance.
          Configure the database schema and user permissions for application access.
- Step 3: Application Server Setup
          Deploy the Application on the WAS server.
- Step 4: Integration & Testing
          Verify the end-to-end connection through Signup and Login tests.
- Step 5: Perform a Stress Test to validate the Auto-scaling behavior of the Web Tier.


-----------------------------------------------------------------

© kt cloud. All rights reserved.
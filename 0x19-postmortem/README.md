# NGIX Web Application Incident Report

## Issue Summary
- **Duration:** April 13, 2024, 10:00 AM - April 13, 2024, 12:30 PM (UTC)
- **Impact:** The web application experienced intermittent downtime, causing service disruption for approximately 25% of users.
- **Root Cause:** A misconfiguration in NGINX load balancing settings led to excessive resource consumption and server overload.

## Timeline
- **10:00 AM (UTC):** Issue detected by automated monitoring alerts indicating increased latency and elevated error rates.
- **10:15 AM:** Engineering team notified via automated alerting system.
- **10:20 AM:** Initial investigation focused on backend application servers due to suspected database overload.
- **10:45 AM:** Realized NGINX logs indicated unusual load balancing behavior, shifting investigation towards NGINX configuration.
- **11:15 AM:** Escalated incident to senior infrastructure team for further analysis.
- **12:00 PM:** Root cause identified as misconfigured NGINX load balancing settings.
- **12:30 PM:** Issue resolved by reverting NGINX configuration to the last known stable state.

## Root Cause and Resolution
- **Root Cause:** NGINX load balancing configuration incorrectly set to "round-robin" instead of "least connections," causing uneven distribution of traffic and overloading certain backend servers.
- **Resolution:** Reverted NGINX configuration to use "least connections" load balancing algorithm, ensuring more balanced distribution of incoming requests and preventing server overload.

## Corrective and Preventative Measures
- **Improvements/Fixes:**
  - Regular audits of NGINX configurations to identify and rectify any discrepancies.
  - Implement automated testing of NGINX configurations prior to deployment to catch potential misconfigurations.
- **Tasks:**
  1. Update NGINX load balancing settings to utilize "least connections" algorithm.
  2. Schedule regular reviews of NGINX configurations to prevent similar incidents.
  3. Implement automated testing pipeline for NGINX configurations.
  4. Conduct training sessions for engineering teams on NGINX best practices and troubleshooting techniques.

## Conclusion
The brief outage experienced by our web application on April 13, 2024, was the result of a misconfiguration in NGINX load balancing settings. Through prompt detection and collaborative investigation, the root cause was identified and rectified, restoring service stability. Moving forward, we will implement measures to prevent similar incidents, including regular configuration audits and automated testing pipelines. We appreciate the patience and understanding of our users during this disruption and remain committed to delivering a reliable and seamless experience.


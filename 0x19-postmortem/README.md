Postmortem Report: The Case of the Vanishing Web Pages
Issue Summary
Duration:

Outage Start: August 10, 2024, 16:00 SAST (South African Standard Time)
Outage End: August 10, 2024, 17:45 SAST
Impact:
Approximately 60% of users experienced significant latency, while 25% faced complete inaccessibility to our web services, particularly those using the search function. Users reported slow load times or blank pages when trying to access the site.

Root Cause:
A misconfigured caching server led to stale content being served, eventually overwhelming the application servers and causing a cascading failure across the system.

Timeline
16:00 SAST: Issue detected by monitoring alerts indicating a sudden drop in API response times.
16:05 SAST: On-call engineer noticed a spike in the error rate and initiated the incident response protocol.
16:10 SAST: Initial investigation focused on the application layer, suspecting a recent deployment as the cause.
16:20 SAST: Misleading debugging path: The team rolled back the latest deployment, but the issue persisted.
16:30 SAST: Escalated to the infrastructure team, who began investigating potential server or network issues.
16:45 SAST: Realized the caching server was serving outdated content, leading to the discovery of the misconfiguration.
17:00 SAST: The caching server was reconfigured and restarted, which began to stabilize the system.
17:30 SAST: Application servers were rebooted to clear the backlog of requests.
17:45 SAST: Full service restored, and performance metrics returned to normal levels.
Root Cause and Resolution
Root Cause:
The root cause was traced back to a configuration error in the caching server. A recent update had unintentionally altered the cache expiration settings, causing stale content to be served to users. This stale data was incompatible with the application’s recent updates, leading to increased load times and eventually overwhelming the servers.

Resolution:
To resolve the issue, the caching server configuration was corrected to ensure that content expiration matched the application’s update cycle. The caching server was then restarted to purge the stale data, and the application servers were rebooted to clear any remaining problematic requests.

Corrective and Preventative Measures
Improvements:

Improve the monitoring of cache hit/miss ratios to detect stale data being served in real-time.
Implement stricter review processes for configuration changes to the caching server.
Action Items:

 Patch the caching server to ensure it adheres to the correct expiration policies.
 Add an automated test to validate cache configurations before deployment.
 Enhance logging to capture more detailed cache server behavior.
 Conduct a review meeting to discuss the incident and update the incident response plan.
 Provide additional training on cache management to the engineering team.
Closing Thoughts
In the world of web services, where milliseconds matter and data is king, this incident reminded us of the delicate balance between performance and accuracy. A misstep, even in something as seemingly trivial as cache configuration, can ripple through the entire system. By learning from this, we’ll be better prepared to keep our users happily browsing without a hitch—because no one likes waiting for a webpage that never arrives.

Make it Attractive
To make this postmortem engaging, consider adding a humorous yet educational comic strip illustrating the "journey" of a web request encountering the misconfigured cache. Visual aids, such as a simple diagram of the server architecture, could also help clarify how the issue spread and was ultimately resolved.

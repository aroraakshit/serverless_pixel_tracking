# serverless_pixel_tracking
Using Google's StackDriver logging to publish analytics data to PubSub/BigQuery sinks using logging API (through a python based CLI). Also includes UDF for URL decoding and queries using regexp for sample project on BigQuery. 

Based on: [Google Tutorial](https://cloud.google.com/solutions/serverless-pixel-tracking-tutorial) and [Lugassy Blog](https://lugassy.net/how-i-created-better-google-analytics-in-3-hours-5758b3ffd146)

---

Misc:
- Exporting StackDriver Logs in the API [link](https://cloud.google.com/logging/docs/api/tasks/exporting-logs)
- Advanced Log Filters [link](https://cloud.google.com/logging/docs/view/advanced-filters)
- Example website credits: [Xiaoying Riley](https://themes.3rdwavemedia.com/)
- User Defined functions in Legacy SQL [[link](https://cloud.google.com/bigquery/user-defined-functions#adding-the-udf)]
- BigQuert Schema of Exported Logs [[link](https://cloud.google.com/logging/docs/export/bigquery)]
- LogEntry object in StackDriver [[link](https://cloud.google.com/logging/docs/reference/v2/rest/v2/LogEntry)]
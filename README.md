This project took pre-processed data from a client regarding requisition time to fill and candidates per req.

The output is an RShiny dashboard that allows for simple interaction with the information for each req and a breakdown of time to hire per corporate division.

This program requires a CSV file (in this case, titled 'ready.csv') that contains the following columns:

- **Requisition ID**
- **Requisition Display Job Title**
- **Requisition Division**
- Requisition Owner - Name
- Requisition Date Filled
- Applicant Submission Source
- **Requisition Time to Fill**
- **Candidates per req**

*Note:* Only bolded fields are absolutely necessary. The others are intended for future slice and dice analysis

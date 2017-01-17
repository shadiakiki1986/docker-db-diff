PSEUDOCODE

Step 1: List all dates
* list dates, format to Y-m-d, sort descending, unique
* user can select two dates (similar to mediawiki history)

Step 2:
* User provides d1 = 2016-12-13 and d2 = 2016-12-14
* find first commit on date d1
* find last commit on date d2
* GET localhost:8082/MfDbVersioned/tree/Lebanon/TITRE.yml diff commit1 commit2
* returned JSON is formatted according to deep-diff => write angular code to display it
 * can put into a separate angular directive?

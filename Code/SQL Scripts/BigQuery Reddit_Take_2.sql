with base_query as
(select *
  FROM
  (select created_utc,parent_id,score,body FROM `fh-bigquery.reddit_comments.2018_03`
  union all
  select created_utc,parent_id,score,body FROM `fh-bigquery.reddit_comments.2018_04`
  union all
  select created_utc,parent_id,score,body FROM `fh-bigquery.reddit_comments.2018_05`
  union all
  select created_utc,parent_id,score,body FROM `fh-bigquery.reddit_comments.2018_06`
  )
  limit 10
)
,starbucks_mentions as
(select parent_id from base_query
WHERE
   score > 1 AND (body LIKE '%Starbucks%'
       OR body LIKE '%starbucks%'
       OR body LIKE '%starbuck%'))

Select comment_rows.created_utc,comment_rows.body from base_query comment_rows
where (comment_rows.score > 1 AND (comment_rows.body LIKE '%Starbucks%'
                                OR comment_rows.body LIKE '%starbucks%'
                                OR comment_rows.body LIKE '%starbuck%')
      )
union all
Select t2.created_utc,t2.body from base_query t2
inner join starbucks_mentions on t2.parent_id = starbucks_mentions.parent_id
where (t2.score > 1 AND NOT (t2.body LIKE '%Starbucks%'
                                OR t2.body LIKE '%starbucks%'
                                OR t2.body LIKE '%starbuck%')
      )

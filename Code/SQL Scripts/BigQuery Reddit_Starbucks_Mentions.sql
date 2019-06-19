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
  #limit 10000
)
Select * from base_query
where (base_query.score > 1 AND (base_query.body LIKE '%Starbucks%'
                                OR base_query.body LIKE '%starbucks%'
                                OR base_query.body LIKE '%starbuck%')

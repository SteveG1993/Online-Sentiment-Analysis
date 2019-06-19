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


Select t2.created_utc,t2.body,starbucks_mentions.parent_id starbucks_parent from base_query t2
left join starbucks_mentions on t2.parent_id = starbucks_mentions.parent_id

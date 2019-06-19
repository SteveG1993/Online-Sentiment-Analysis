with base_query as
(select *
  FROM
  (select created_utc,subreddit,score,body FROM `fh-bigquery.reddit_comments.2018_03`
  union all
  select created_utc,subreddit,score,body FROM `fh-bigquery.reddit_comments.2018_04`
  union all
  select created_utc,subreddit,score,body FROM `fh-bigquery.reddit_comments.2018_05`
  union all
  select created_utc,subreddit,score,body FROM `fh-bigquery.reddit_comments.2018_06`
  )
  limit 10
)
,starbucks_mentions as
(select parent_id from base_query
WHERE
   score > 1 AND (body LIKE '%Starbucks%'
       OR body LIKE '%starbucks%'
       OR body LIKE '%starbuck%'))

Select final_set.created_utc,final_set.body from base_query final_set
where exists(Select 1 from starbucks_mentions
              where starbucks_mentions.parent_id = final_set.parent_id)
   or (final_set.score > 1 AND (final_set.body LIKE '%Starbucks%'
                                OR final_set.body LIKE '%starbucks%'
                                OR final_set.body LIKE '%starbuck%')
      )

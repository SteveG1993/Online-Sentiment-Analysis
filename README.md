# Brand Reputation Management Using Social Media Monitoring

## INTRODUCTION

Positive public sentiment is one of a company&#39;s most valued assets. Companies should take proactive steps to monitor what people are saying about their company and stay alert for any significant changes in public perception. With the advent of trained machine learning algorithms. It is possible to gauge the feelings that people have regarding a brand or company by interrogating written communications on social media.

## CASE STUDY

On April 12, 2018, two African-American men were arrested in a Starbucks store in Philadelphia. The incident was captured on video and posted to social media. The arrest was reported widely on broadcast media and Starbucks apologized for the incident. Also, all Starbucks stores were close during the afternoon of May 29, 2018.

## Goal

- Is it possible to gauge public sentiment about a company by looking at online discourse on Reddit.com

- What were people&#39;s feelings around the arrest incident?
- Did the arrest incident have an appreciable positive, negative on Starbuck&#39;s reputation?

## Assumptions

1. Sampling from Reddit is an adequate way to measure public sentiment
2. Arrest controversy in April 12th 2018 would have an impact on customer sentiment
3. Most redditors reside in U.S. and would comment on incident. Other scandals around the world would not impact as significantly

## DATA

Comments from Reddit.com where there is any mention of Starbucks in the discussion thread.

As of February 2018, Reddit had 542 million monthly visitors (234 million unique users), ranking as the #3 most visited website in U.S. and #6 in the world, according to [Alexa Internet](https://en.wikipedia.org/wiki/Alexa_Internet), with 57.4% of its user base coming from the [United States](https://en.wikipedia.org/wiki/United_States), followed by the [United Kingdom](https://en.wikipedia.org/wiki/United_Kingdom) at 7.5% and [Canada](https://en.wikipedia.org/wiki/Canada) at 6.3%.[[4]](https://en.wikipedia.org/wiki/Reddit#cite_note-4)

## PROCESS

1. Extracted reddit.com comments from Google BigQuery
  1. Filter on all comments that contained the word &quot;Starbuck&quot;
2. Parsed comments into their sentences
3. Used VADER sentiment analysis tool to determine the sentiment of each sentence.
4. Tallied the total sentiment counts from the comments for each day

#### Sentiment Analysis

The VADER sentiment analysis tool can identify the emotional valence of a sentence(Positive, Negative, Neutral)

EXAMPLES

Starbucks has the best customer service.------------------------- 0.6369 - **Positive**

I hate the long lines at Starbucks.------------------------------ -0.5719 - **Negative**

I went to Starbucks to get a coffee.----------------------------- 0.0. - **Neutral**

## Results

The arrest on April 12th and the generated a noticeable increase in Starbucks mentions.

The number of discussions that mentioned Starbucks jumped from 325/day to over 1800/day (400 % increase)

Neutral comments are the most common during the crisis.

![](/Documentation/starbucks_sentiments_by_date.svg?raw=true "Title")


Negative comments spiked after arrest and the day after Starbucks closed for training. Negative sentiments returned to baseline. Soon after.

![](/Documentation/Negative_Sentiments.svg?raw=true "Title")

Most comments associated with Starbucks are neutral. The percentage of negative comments to positive comments spiked for three days and returned to baseline.

![](/Documentation/Sentiment_Percentages.svg?raw=true "Title")

## CONCLUSION

The incident that occurred during April 2018 had an observable but not lasting impact on people&#39;s feelings about the company based on discussions on reddit.com.

## ADDITIONAL BRAND REPUTATION TASKS

### Continual Monitoring and Alerts

- Set up recurring polling to detect mentions of the company that occur going forward to identify any emergent issues that need a response

The chart plots actual negative comments an expected number of negative comments. The green dots highlight days when the percentage change in negative comments exceeds 50 percent.

![](/Documentation/Reputation_Monitoring2.svg?raw=true "Title")


### Topic Modeling

Topic modeling can be used to identify, group and summarize the subjects of customer discourse.

The Latent Dirichlet Allocation (LDA) algorithm can be used. Below is a graphical representation of LDA output.


 ![](/Documentation/pyLDAvis.png?raw=true "Title")


Once the topics are identified. The online comments can by studied for additional insight.

 ![](/Documentation/Topics_to_Text.png?raw=true "Title")

Thank you.

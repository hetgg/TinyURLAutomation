resource "aws_sns_topic" "week14-sns" {
  name = "week14-sns"
}

resource "aws_sns_topic_subscription" "week14-ssn-topic" {
  topic_arn = aws_sns_topic.week14-sns.arn
  protocol  = "email"
  endpoint  = "hetpatel1599j@gmail.com"
}

